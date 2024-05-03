

use anyhow::Result;
use ring::{
    aead::{Aad, LessSafeKey, Nonce, UnboundKey, AES_256_GCM},
    rand,
};

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

/// AES-256 has 256-bit keys
// type Key = [u8; 256 / 8];

/// we need an encryption key
// #[flutter_rust_bridge::frb(async)] // Synchronous mode for simplicity of the demo
pub fn make_key() -> Result<Vec<u8>> {
    // we need an UnboundKey for doing crypto
    let rng = rand::SystemRandom::new(); // this has SecureRandom, which rand::generate wants
    let s : Vec<u8> = rand::generate::<[u8; 32]>(&rng).unwrap().expose().to_vec();
    Ok(s)
}


// #[flutter_rust_bridge::frb(async)] // Synchronous mode for simplicity of the demo
pub fn encrypt(key: Vec<u8>, data: Vec<u8>) -> Result<Vec<u8>> {
    let key = LessSafeKey::new(UnboundKey::new(&AES_256_GCM, &key).unwrap()); // not sure why it's less safe but it has a simpler API
    let nonce = Nonce::assume_unique_for_key([0u8; 12]); // this is probably a bad idea
                                                         // create a mut vec of u8
    let mut encrypted_data: Vec<u8> = Vec::new();
    encrypted_data.extend_from_slice(&data);
    key.seal_in_place_append_tag(nonce, Aad::empty(), &mut encrypted_data)
        .unwrap();
    // I think this does encryption

    return Ok(encrypted_data);
}


// #[flutter_rust_bridge::frb(async)] // Synchronous mode for simplicity of the demo
pub fn decrypt(key: Vec<u8>, data: Vec<u8>) -> Result<Vec<u8>> {
    let key = LessSafeKey::new(UnboundKey::new(&AES_256_GCM, &key).unwrap());
    let nonce = Nonce::assume_unique_for_key([0u8; 12]);
    let mut decrypted_data: Vec<u8> = Vec::new();
    decrypted_data.extend_from_slice(&data);
    key.open_in_place(nonce, Aad::empty(), &mut decrypted_data)
        .unwrap(); // I think this does decryption
    decrypted_data.truncate(data.len() - AES_256_GCM.tag_len()); // remove the garbage on the end
    return Ok(decrypted_data);
}


// use ring::cipher::{
//     BlockCipher, NewBlockCipher, NewStreamCipher, StreamCipher
// };

// pub fn encrypt_bytes(data_bytes: Vec<u8>, passpharse: &str ) -> Result<(), dyn Error> {

//     // let passphrase = "Test Passphrase";

//     // Generate key pair
//     let (public_key, secret_key) = KeyControKyber1024::keypair().expect("Failed to generate keypair");

//     let simple_enc_key = KeyControKyb

//     // Instantiate Kyber for encryption with Kyber1024
//     let mut encryptor = Kyber::<Encryption, Kyber1024, Message, AES>::new(public_key.clone(), None)?;

//     // Encrypt message
//     let (encrypt_message, cipher) = crypt_guard::encrypt!(encryptor, message, passphrase)?;

//     // Instantiate Kyber for decryption with Kyber1024
//     let mut decryptor = Kyber::<Decryption, Kyber1024, Message, AES>::new(secret_key, None)?;

//     // Decrypt message
//     let decrypt_message = crypt_guard::decrypt!(decryptor, encrypt_message, passphrase, cipher);
//     println!("{}", String::from_utf8(decrypt_message?).expect("Failed to convert decrypted message to string"));
//     // Ok(())
//     // return empty
//     return Err(());
// }

// fn encrypt_file(input_path: &str, output_path: &str) -> Result<(), ring::error> {
//     let mut input_file = File::open(input_path)?;
//     let mut output_file = File::create(output_path)?;

//     // Read the entire file into a buffer
//     let mut buffer = Vec::new();
//     input_file.read_to_end(&mut buffer)?;

//     // Get a new AES-GCM cipher (authenticated encryption)
//     // let aes = ring::aead::NewAeadDecrypter(&ring::aead::AES_256_GCM(KEY))?;
//     let aes = ring::aead::

//     // Generate a random authentication tag
//     let mut tag = vec![0; aes.tag_len()];
//     ring::rand::random_fill(&mut tag);

//     // Encrypt the file contents and store the authentication tag
//     let sealed = aes.seal_in_place(&Some(&tag), NONCE, &buffer)?;
//     output_file.write_all(&sealed)?;

//     Ok(())
// }
