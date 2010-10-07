# encoding: UTF-8
require File.dirname(__FILE__) + '/acceptance_helper'

feature "Translations management", %q{
  In order to show user app in different translate
  As a app admin
  I want to manage translations
} do

  background do
  end

  scenario "Seeing a list of default translations" do
    visit translate
    page.should have_content "hello"
    page.should have_content "site.name"
  end

  scenario "Entering translations" do
    visit translate
    fill_in "translations[pl.hello]", with: "Witaj, świecie"
    fill_in "translations[de.hello]", with: "Wilkommen!"
    click_button "Save"
    visit homepage("pl")
    page.should have_content("Witaj, świecie")
    visit homepage("de")
    page.should have_content("Wilkommen!")
    visit homepage("cy")
    page.should have_content("Hello world!")
  end
end

