# require modules here
require 'yaml'

def load_library(library)
#  pp YAML.load_file(library)

    answer={:get_meaning => {}, :get_emoticon => {}} 
    for i in YAML.load_file(library).keys
      answer[:get_meaning][YAML.load_file(library).values[YAML.load_file(library).keys.index(i)][1]] = i
      answer[:get_emoticon][YAML.load_file(library).values[YAML.load_file(library).keys.index(i)][0]] = YAML.load_file(library).values[YAML.load_file(library).keys.index(i)][1]
      
      #reminder for when I try to decipher my own code later: YAML.load_file(library).values and .keys are both arrays, so YAML.load_file(library).values.index(i) is saying to find the index of i in said array. Since each element in YAML.load_file(library).keys is an array of 2, and the second element is the japanese emoticon, I need to select that one. Hence the [1] at the end.
      
      
    end
    return answer
#   pp answer
end


def get_japanese_emoticon(library, emoticon)
  library=load_library(library)
  answer=library[:get_emoticon][emoticon]
  pp answer
  if answer==nil 
    return "Sorry, that emoticon was not found"
  else
    return answer
  end
end

def get_english_meaning(library, emoticon)
  library=load_library(library)
  answer=library[:get_meaning][emoticon]
  if answer==nil
    return "Sorry, that emoticon was not found"
  else
    return answer
  end
  # code goes here
end





 ########junkyard of once promising code########
 
#  answer={:get_meaning => {}, :get_emoticon => {}} 
#    for i in YAML.load_file(library).keys
#      answer[:get_meaning][i]=YAML.load_file(library).values[YAML.load_file(library).keys[index(i)]]



  # answer={:get_meaning => {}, :get_emoticon => {}} 
  #  for i in YAML.load_file(library).keys
  #    answer[:get_meaning][i]=YAML.load_file(library).values[YAML.load_file(library).keys.index(i)][1]
      
      #reminder for when I try to decipher my own code later: YAML.load_file(library).values and .keys are both arrays, so YAML.load_file(library).values.index(i) is saying to find the index of i in said array. Since each element in YAML.load_file(library).keys is an array of 2, and the second element is the japanese emoticon, I need to select that one. Hence the [1] at the end.
      