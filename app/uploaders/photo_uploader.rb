class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    "#{Rails.configuration.photo_upload_prefix}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  version :thumb do
    process :resize_and_pad => [90, 90, '#ffffff']
  end
  
  version :browser do
    process :resize_to_limit => [760, 760]
  end
  
  version :full do
    process :resize_to_limit => [940, 940]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    @name ||= "#{secure_token}.#{file.extension}" if original_filename.present?
  end
  
  def exif_info_hash
    exif = MiniExiftool.new(current_path)
    exif.to_hash
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
