Rails.application.routes.draw do 
  match 'site_translations' => 'GoTranslateYourself::SiteTranslations#edit', :as => :site_translations
end
