# config/initializers/shrine.rb

require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # для временного хранения файлов
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'), # для постоянного хранения файлов
}


