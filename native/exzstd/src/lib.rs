#[macro_use]
extern crate rustler;
#[macro_use]
extern crate rustler_codegen;
#[macro_use]
extern crate lazy_static;
extern crate zstd;
use rustler::types::binary::Binary;
use rustler::types::OwnedBinary;
use rustler::{Encoder, Env, NifResult, Term};
use std::io::Write;

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.ExZstd",
    [("compress", 2, compress),
    ("decompress", 1, decompress)],
    None
}

fn compress<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let buffer: Binary = try!(args[0].decode());
    let level: i32 = try!(args[1].decode());

    let result = zstd::block::compress(buffer.as_slice(), level).unwrap();

    let mut binary = OwnedBinary::new(result.len()).unwrap();
    let _ = binary.as_mut_slice().write_all(&result);
    Ok(binary.release(env).encode(env))
}

fn decompress<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let buffer: Binary = try!(args[0].decode());

    // for some reason I can't send a empty vec buffer as the compress method, since it will panic
    // also I can't send the normal buffer length, since on large strings will fail
    // so the only solution is to multiply it by 2
    let result = zstd::block::decompress(buffer.as_slice(), buffer.len() * 2).unwrap();

    let mut binary = OwnedBinary::new(result.len()).unwrap();
    let _ = binary.as_mut_slice().write_all(&result);
    Ok(binary.release(env).encode(env))
}
