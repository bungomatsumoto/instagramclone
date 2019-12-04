class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  process resize_to_limit: [70, 70]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # アップロードされたファイルを保存するディレクトリをデフォルトに設定する

end
