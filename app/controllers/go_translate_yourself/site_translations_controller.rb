module GoTranslateYourself
  class SiteTranslationsController < ApplicationController
    before_filter :auth

    def edit
      @translations = hash_class[
        *GoTranslateYourself.current_store.keys_without_prefix.collect do |key| 
          [key, GoTranslateYourself.current_store.default_translation("dev.#{key}")]
        end.flatten
      ]
      @locales = GoTranslateYourself.locales
      render :layout => GoTranslateYourself.layout_name
    end

    def update
      if params[:translations] && !params[:translations].empty?
        params[:translations].each do |key, value|
          GoTranslateYourself.current_store[key] = value
        end
      end
      redirect_to site_translations_path
    end

    private

    def auth
      GoTranslateYourself.auth_handler.bind(self).call if GoTranslateYourself.auth_handler.is_a? Proc
    end

    def hash_class
      RUBY_VERSION < '1.9' ? ActiveSupport::OrderedHash : Hash
    end
  end
end

