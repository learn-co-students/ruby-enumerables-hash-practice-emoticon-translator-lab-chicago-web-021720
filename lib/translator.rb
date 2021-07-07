# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  new_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  #creates key/value pairs where Japanese emoticon is key, meaning is value
  emoticons.each_pair do |meaning, e_array|
    new_hash[:get_meaning][e_array[1]] = meaning
  end
  #creates key/value pairs where English emoticon is key, Japanese is value
  emoticons.each_pair do |meaning, e_array|
    new_hash[:get_emoticon][e_array[0]] = e_array[1]
  end
  
  new_hash
end


def get_japanese_emoticon(file, eng_emoticon)
  library = load_library(file)
  library[:get_emoticon].fetch(eng_emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning(file, j_emoticon)
  library = load_library(file)
  library[:get_meaning].fetch(j_emoticon, "Sorry, that emoticon was not found")
end