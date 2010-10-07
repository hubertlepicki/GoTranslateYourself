module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage(locale = nil)
    "/#{"?locale=#{locale}" if locale}" 
  end

  def translate
    "/site_translations"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
