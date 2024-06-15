# Пример модели Product с валидациями
class Product < ApplicationRecord
    include ImageUploader[:image]

    validates :name, presence: true
    validates :description, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    # Возможно, добавить валидации для изображения, если используется
    # include ImageUploader::Attachment.new(:image)
  
    attr_accessor :image_url
    
    has_many :cart_items
end