# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  loaded_file = YAML.load_file(file_path)
  meanings = {}
  loaded_file.each do |meaning|
    meanings[meaning[1][1]] = meaning[0]
    #binding.pry
  end

  emoticons = {}
  loaded_file.each do |meaning|
    #binding.pry
    emoticons[meaning[1][0]] = meaning[1][1]
  end
  {:get_meaning => meanings, :get_emoticon => emoticons}
end

def get_japanese_emoticon(yaml_file, emoticon)
  # code goes here
  data = load_library(yaml_file)
  newemoticon = data[:get_emoticon][emoticon]
  returnvalue = newemoticon ? newemoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  # code goes here
  data = load_library(yaml_file)
  returndata = data[:get_meaning][emoticon]
  returndata = returndata ? returndata : "Sorry, that meaning was not found"
end
