module GoTranslateYourself
  class SiteTranslationsController < ApplicationController
    before_filter :auth

    def edit
      @keys = GoTranslateYourself.current_store.keys_without_prefix
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
  end
end

