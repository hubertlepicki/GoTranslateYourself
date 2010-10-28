module GoTranslateYourself
  module SiteTranslationsHelper
    def translation_text_field(locale, key, default_translation)
      text_field_tag("translations[#{locale}.#{key}]", 
                     ActiveSupport::JSON.decode(GoTranslateYourself.current_store["#{locale}.#{key}"] || ""), 
                     :size => (default_translation.size + 20)) 
    end
  end
end
