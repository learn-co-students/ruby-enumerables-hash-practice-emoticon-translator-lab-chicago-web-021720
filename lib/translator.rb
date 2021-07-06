# require modules here
require "yaml"

def load_library(lib)
  # code goes here
  library = YAML.load_file(lib)
  
  #pp library
  # the keys inside get_meaning hash should be japanese emoticons
  get_meaning = library.reduce({}) do |memo, (meaning, emoji_arr)| 
  memo.store(emoji_arr[1], meaning)
  memo
end
get_emoticon = library.reduce({}) do |memo, (meaning, emoji_arr)| 
  memo.store(emoji_arr[0], emoji_arr[1])
  memo
end
  hash = {"get_meaning":  get_meaning, "get_emoticon": get_emoticon}
  pp hash
  return hash
end

def get_japanese_emoticon(lib, emoji)
  # code goes here
  hash = load_library(lib)
  result = hash[:get_emoticon][emoji]
  if(result)
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(lib, emoji)
  # code goes here
  hash = load_library(lib)
  result = hash[:get_meaning][emoji]
  if(result)
    return result
  else
    return "Sorry, that emoticon was not found"
  end
end