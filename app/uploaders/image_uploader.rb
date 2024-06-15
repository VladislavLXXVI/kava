# app/uploaders/image_uploader.rb

require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  # Выберите способ хранения
  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :derivatives

  # Определите обработку загружаемых файлов, например, валидацию и максимальный размер
  Attacher.validate do
    validate_max_size 10 * 1024 * 1024, message: 'is too large (max is 10 MB)'
    validate_mime_type_inclusion ['image/jpeg', 'image/png', 'image/gif']
  end

  # Определение версий изображений (например, миниатюр)
  plugin :versions do
    version :thumb do
      process resize_to_fit: [200, 200]
    end
  end
end
