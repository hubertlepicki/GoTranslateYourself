module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage(lang = nil)
    "/#{"?lang=#{lang}" if lang}" 
  end

  def translate
    "/translate_site"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
