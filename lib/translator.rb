# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  loaded_file = YAML.load_file(file_path)
  binding.pry
  loaded_file
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
