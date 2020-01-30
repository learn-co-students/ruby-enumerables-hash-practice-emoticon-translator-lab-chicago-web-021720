require 'yaml'

def load_library(file_path)
  emoticon_hash = YAML.load_file(file_path)

  result = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticon_hash.each do |meaning, emoticons|
    result['get_meaning'][emoticons[1]] = meaning  # Add Japanese emoticons
    result['get_emoticon'][emoticons[0]] = emoticons[1]  # Add American emoticons
  end

  result
end


def get_japanese_emoticon(file_path, american_emoticon)

  conversion_hash = load_library(file_path)

  japanese_emoticon = conversion_hash['get_emoticon'][american_emoticon]

  if not japanese_emoticon
    return "Sorry, that emoticon was not found"
  end

  japanese_emoticon
end


def get_english_meaning(file_path, japanese_emoticon)
  
  conversion_hash = load_library(file_path)

  english_meaning = conversion_hash['get_meaning'][japanese_emoticon]

  if not english_meaning
    return "Sorry, that emoticon was not found"
  end  

  english_meaning
end
