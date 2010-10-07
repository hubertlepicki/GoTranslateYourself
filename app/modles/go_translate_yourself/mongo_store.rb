require 'yaml'

module GoTranslateYourself
  class MongoStore

    def initialize(database)
      @db = database
    end

    def keys
      dev_translations = YAML.load_file(File.join(Rails.root, "config", "locales", "dev.yml"))
      if @dev_translations.nil? || Rails.env.development?
        @dev_translations = {}
        flatten_keys(nil, dev_translations["dev"], @dev_translations)
        @keys = GoTranslateYourself.locales.collect {|lang| @dev_translations.keys.collect {|key| "#{lang}.#{key}"} }.flatten
      end

      @keys 
    end

    def [](key)
      if document = collection.find_one(_id: key)
        document["value"]
      else
        @dev_translations[key.to_s.gsub(/^[a-z]*\./, "")]
      end
    end

    def []=(key, value)
      collection.update({_id: key}, {'$set' => {:value => value}}, upsert: true, safe: true)
    end

    def clear_database
      collection.drop
    end

    private

    def collection
      @db["go_translate_yourself_translations"]
    end

    def flatten_keys(current_key, hash, dest_hash)
      hash.each do |key, value|
        full_key = [current_key, key].compact.join('.')
        if value.kind_of?(Hash)
          flatten_keys full_key, value, dest_hash
        else
          dest_hash[full_key] = value
        end
      end
    end
  end
end

