class PosterUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [50, 50]
  end

  version :home do
    process :resize_to_limit => [300, 500]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    original_filename.gsub(/[^a-zA-Z0-9_\.]/, '-') unless original_filename.nil?
  end
end
