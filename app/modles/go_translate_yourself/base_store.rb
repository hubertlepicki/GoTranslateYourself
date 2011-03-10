require 'yaml'

module GoTranslateYourself
  class BaseStore

    def keys
      if @keys.nil? || Rails.env.development?
        load_default_translations

        @keys = GoTranslateYourself.locales.collect {|lang| keys_without_prefix.collect {|key| "#{lang}.#{key}"} }.flatten
      end

      @keys
    end

    def default_translation(key)
      load_default_translations unless @default_translations
      @default_translations[key] || @default_translations[key.to_s.gsub(/^[a-z]*\./, "dev.")]
    end

    def default_translation?(key)
      !@default_translations[key].nil?
    end

    def keys_without_prefix
      load_default_translations unless @default_translations
      @default_translations.keys.map {|k| k.sub(/^[a-z]*\./, "") }.uniq
    end

    protected

    def load_default_translations
      @default_translations = {}
      Dir.glob(File.join(Rails.root, "config", "locales", "*.yml")).each do |locale_file|
        translations = YAML.load_file(locale_file)
        code = File.basename(locale_file).sub(".yml", "")
        flatten_keys(code, translations[code], @default_translations)
      end
    end

    def flatten_keys(current_key, hash, dest_hash)
      hash.each do |key, value|
        full_key = [current_key, key].compact.join('.')
        if value.kind_of?(Hash)
          flatten_keys full_key, value, dest_hash
        else
          dest_hash[full_key] = ActiveSupport::JSON.encode(value)
        end
      end
    end
  end
end
