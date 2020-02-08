require "yaml"
require 'pp'
def load_library(emoticons_file)
  result = {}
  emoticons = YAML.load_file(emoticons_file)
  emoticons_reduce = emoticons.reduce({}) do |memo, (meaning,emojis)|
    english_emoji = emojis[0] 
    japanese_emoji = emojis[1] 
    if !result[:get_meaning]
      result[:get_meaning] = {}
    end
    if !result[:get_emoticon]
      result[:get_emoticon] = {}
    end
    result[:get_meaning][japanese_emoji] = meaning
    result[:get_emoticon][english_emoji] = japanese_emoji
    memo
  end
  result
end

 
def get_japanese_emoticon(file_path, english_emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash[:get_emoticon][english_emoticon]
    return emoticons_hash[:get_emoticon][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
#accepts two arguments
#one is the file path and other is the english emoji
#calls on the load_library method
#returns japanese emoji 
#if english emoji provided doesnt match anything, return "Sorry, that emoticon was not found"

def get_english_meaning(file_path, japanese_emoticon)
  emoticons_hash = load_library(file_path)
  if emoticons_hash[:get_meaning][japanese_emoticon]
    return emoticons_hash[:get_meaning][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end