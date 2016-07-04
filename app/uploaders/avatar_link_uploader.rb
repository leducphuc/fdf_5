class AvatarLinkUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "avatar/#{mounted_as}/#{model.id}"
  end
end
