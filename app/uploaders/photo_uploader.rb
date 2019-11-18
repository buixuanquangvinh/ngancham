class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave    

  process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    process :resize_to_fill => [300, 100, :north]
  end

  version :thumbnail do
    resize_to_fit(300, 100)
  end
end
