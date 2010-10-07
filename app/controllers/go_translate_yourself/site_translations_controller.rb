module GoTranslateYourself
  class SiteTranslationsController < ApplicationController
    def edit
      @keys = GoTranslateYourself.current_store.keys_without_prefix
      @locales = GoTranslateYourself.locales
    end

    def update
      if params[:translations] && !params[:translations].empty?
        params[:translations].each do |key, value|
          GoTranslateYourself.current_store[key] = value
        end
      end
      redirect_to site_translations_path
    end
  end
end
