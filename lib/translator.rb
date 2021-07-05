require 'YAML'
require 'pry'



def load_library(address)
  emoticon = YAML.load_file(address)

  new_hash = {}
  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}

  emoticon.each do |key, value|
    new_hash["get_meaning"][value.last] = key
    new_hash["get_emoticon"][value.first] = value.last
  end
  new_hash
end

def get_japanese_emoticon(address, emoticon)
  load_library(address).each do |key, value|
    value.each do |english, japanese|
      if emoticon == english
        return japanese
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(address, emoticon)
  load_library(address)["get_meaning"].each do |key, value|
    if emoticon == key
      return value
    end
  end
  "Sorry, that emoticon was not found"
end
