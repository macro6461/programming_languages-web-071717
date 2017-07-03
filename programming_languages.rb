
def reformat_languages(languages)
  # your code here
  #add new values to new_hash and then return new_hash
  #you can create new key/value pairs using []=...new_hash[:my_key]= my_value
  #add items using the shovel method <<
  #languages hash level 1: style(hash), level 2: language(hash), level 3: attributes (hash) already has type(hash)
  #new_hash level 1: language (hash), level 2: type (string) and style (array)
  new_hash = {}
  languages.each do |style, name| #iterate over languages hash to get to style hash (:oo, :functional) which contains the languages (name)
    name.each do |name, attribute| #iterate over language(name) hash to attributes (hash)
      attribute.each do |attribute, v| #iterate attributes hash (lowest level) to begin reformatting
        if new_hash[name].nil? #account for undefined method `[]=` for nil
          new_hash[name] = {}
        end
        #begin adding to new_hash
        new_hash[name][:style] ||= [] #adds language to new_hash and give style (within language) an array value, allows for two different values if needed!
        new_hash[name][:style] << style #shovel values into the empty array
        new_hash[name][attribute] = v  #adding value to attributes
        #why didn't we need to create a line new_hash[name][type]?
      end
    end
  end
  new_hash
end
