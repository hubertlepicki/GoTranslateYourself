require 'go_translate_yourself/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

module GoTranslateYourself
  class << self
    attr_accessor :layout_name, :locales, :auth_handler, :current_store
  end
end

