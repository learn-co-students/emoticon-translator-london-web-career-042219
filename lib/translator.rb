require "yaml"# require modules here

def load_library(path)

   hash = { "get_meaning" => {}, "get_emoticon" => {} }

   YAML.load_file(path).each do | meaning, data |
    hash["get_meaning"][data[1]] = meaning
    hash["get_emoticon"][data[0]] = data[1]
  end

   hash
 end

def get_japanese_emoticon(path, emoticon)

   dictionary = load_library(path)

   response = dictionary["get_emoticon"][emoticon]

   response ||= "Sorry, that emoticon was not found"

   response
end

def get_english_meaning(path, emoticon)

   dictionary = load_library(path)

   response = dictionary["get_meaning"][emoticon]

   response ||= "Sorry, that emoticon was not found"

   response
end
