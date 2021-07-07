# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = {
    "get_meaning"=>{},
    "get_emoticon"=>{}
           }
YAML.load_file(file_path).each do |meaning, describe|
  eng,jan = describe
  emoticons["get_meaning"][jan] = meaning
  emoticons["get_emoticon"][eng] = jan
end
emoticons
end
#  file = File.read(file_path)
#  emoticons = YAML.load(file)
#  new_hash = {
#   "get_meaning" => {},
#   "get_emoticon" => {}
# }
#emoticons.each do |name,emojis|
  #new_hash["get_meaning"][emojis[1]] = name
#  new_hash["get_emoticon"][emojis[0]] = emojis[1]
#end
#return new_hash
#end



def get_japanese_emoticon(file_path, emoticon)
  #binding.pry
  #library = load_library(file_path)
  #library["get_emoticon"].each do |name, emojis|
    #result =
    def get_japanese_emoticon(file_path, emoticon)
      emoticons = load_library(file_path)
      result = emoticons["get_emoticon"][emoticon]
      if result
        result
      else
        "Sorry, that emoticon was not found"
      end
  end


def get_english_meaning(file_path, emoticon)

emoticons = load_library(file_path)
result = emoticons["get_meaning"][emoticon]
if result
  result
else
  "Sorry, that emoticon was not found"
end
end
end
