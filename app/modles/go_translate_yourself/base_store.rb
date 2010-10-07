require 'yaml'

module GoTranslateYourself
  class BaseStore

    def keys
      if @dev_translations.nil? || Rails.env.development?
        load_dev_translations

        @keys = GoTranslateYourself.locales.collect {|lang| keys_without_prefix.collect {|key| "#{lang}.#{key}"} }.flatten
      end

      @keys 
    end

    def default_translation(key)
      load_dev_translations unless @dev_translations
      @dev_translations[key.to_s.gsub(/^[a-z]*\./, "")]
    end

    def keys_without_prefix 
      load_dev_translations unless @dev_translations
      @dev_translations.keys
    end

    protected

    def load_dev_translations
      dev_translations = YAML.load_file(File.join(Rails.root, "config", "locales", "dev.yml"))
      @dev_translations = {}
      flatten_keys(nil, dev_translations["dev"], @dev_translations)
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
