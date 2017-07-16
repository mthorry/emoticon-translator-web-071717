# require modules here
require "yaml"
require "pry"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  new_library = {"get_meaning" => {}, "get_emoticon" => {}} #creates new hash with two keys

  emoticons.each do |meaning, emoticon| #iterates through emoticon library
    new_library["get_meaning"][emoticon[1]] = meaning #adds the japanese emoticon as a key into the "get_meaning" hash with the value of its meaning
    new_library["get_emoticon"][emoticon[0]] = emoticon[1] #adds the english emoticon as a key into the "get_emoticon" hash with the value of the japanese emoticon
  end

  new_library
end


def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)

  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
# binding.pry
end


def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)

  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end

end