// use resize::Pixel::RGB8;

use std::io::Cursor;

use anyhow::Ok;

use image::{self, imageops::FilterType};

// #[flutter_rust_bridge::frb(init)]
// pub fn init_app() {
//     // Default utilities - feel free to customize
//     flutter_rust_bridge::setup_default_user_utils();
// }

pub fn generate_thumbnail(image_bytes: Vec<u8>) -> anyhow::Result<Vec<u8>>{

    const NEW_HEIGHT: u32 = 250;
    const NEW_WIDTH: u32 = 250;

      // Load the image from bytes
  let image = image::load_from_memory(&image_bytes)?;

  // Resize the image
  let resized_image = image.thumbnail(NEW_WIDTH, NEW_HEIGHT);

  // Convert the resized image back to bytes
  let mut resized_bytes : std::io::Cursor<Vec<u8>> = Cursor::new(Vec::new());
  resized_image.write_to(&mut resized_bytes, image::ImageFormat::Jpeg)?;

  Ok(resized_bytes.into_inner())

}