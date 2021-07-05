# require modules here
require "yaml"

def load_library( file_path )
  # code goes here
  #require "yaml"
  
  return_hash={
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  

  emoticons=YAML.load_file( file_path )


    emoticons.each do | k, v|
    
    #assuming key is meaning, 0 is emoticon and 1 is japanese in an array
      uk_emot=emoticons[k][0]
      jap_emot=emoticons[k][1]
      return_hash["get_emoticon"][uk_emot]=jap_emot
      return_hash["get_meaning"][jap_emot]=k
    end
  
  return_hash

end

def get_japanese_emoticon( file_path, emoticon )
  # code goes here
  emot_hash=load_library( file_path )
  if emot_hash["get_emoticon"][emoticon]
    return_v=emot_hash["get_emoticon"][emoticon]
  else
    return_v="Sorry, that emoticon was not found"
  end
  return_v
end

def get_english_meaning( file_path, emoticon )
  # code goes here
  emot_hash=load_library( file_path )
  if emot_hash["get_meaning"][emoticon]
    return_v=emot_hash["get_meaning"][emoticon]      
  else
     return_v="Sorry, that emoticon was not found"
  end
  return_v
end