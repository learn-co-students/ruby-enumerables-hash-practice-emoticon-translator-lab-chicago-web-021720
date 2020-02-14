require "yaml"
require "pry"


def load_library(yml_file)
  emoticons = YAML.load_file(yml_file)
  list = {get_meaning: {}, get_emoticon: {}}
   emoticons.each do |meaning, emoticon|
     list[:get_meaning][emoticon[1]] = meaning
     list[:get_emoticon][emoticon[0]] = emoticon[1]
   end
list
end

def get_japanese_emoticon(file_path, english_emoticon)
  list = load_library(file_path)
    # binding.pry
   if list[:get_emoticon][english_emoticon] 
      return list[:get_emoticon][english_emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
 end
 

def get_english_meaning(file_path, japanese_emoticon)
  list = load_library(file_path)
  if list[:get_meaning][japanese_emoticon]
      return list[:get_meaning][japanese_emoticon]
  else
      return "Sorry, that emoticon was not found"
    end
end


