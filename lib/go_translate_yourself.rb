require 'go_translate_yourself/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

module GoTranslateYourself
  def self.current_store=(store)
    @store = store
  end

  def self.current_store; @store; end

  def self.locales=(array_of_locales)
    @locales = array_of_locales
  end

  def self.locales; @locales; end

end
