Rails.application.routes.draw do 
  match 'site_translations' => 'GoTranslateYourself::SiteTranslations#edit', :as => :site_translations, :method => :get
  match 'site_translations/save' => 'GoTranslateYourself::SiteTranslations#update', :as => :update_site_translations, :method => :post
end
