module GoTranslateYourself
  class SiteTranslationsController < ApplicationController
    def edit
      @keys = GoTranslateYourself.current_store.keys_without_prefix
      @locales = GoTranslateYourself.locales
    end
  end
end
