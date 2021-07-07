# require modules here
require "yaml"
require "pp"

def load_library(path)
  reche = YAML.load_file(path)
  result = {:get_emoticon => {}, :get_meaning => {}}
  reche.each{ |k, v|
    result[:get_emoticon][v[0]] = v[1].to_s
    result[:get_meaning][v[1]] = k.to_s
  }
  result
end

def get_japanese_emoticon(path, ho)
  # code goes here
  reche = load_library(path)[:get_emoticon]
  reche.default = "Sorry, that emoticon was not found"
  reche[ho]
end

def get_english_meaning(path, ho)
  # code goes here
  reche = load_library(path)[:get_meaning]
  reche.default = "Sorry, that emoticon was not found"
  reche[ho]
end

# reche = load_library("emoticons.yml")
# pp reche