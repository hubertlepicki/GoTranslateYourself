# encoding: UTF-8
require 'spec_helper'

describe GoTranslateYourself::MongoStore do
  before :each do
    @store = GoTranslateYourself.current_store
    @store.clear_database
  end

  it "should list all used translation keys, as defined in dev.yml" do
    @store.keys.should include("pl.hello")
    @store.keys.should include("de.hello")
    @store.keys.should include("pl.site.name")
    @store.keys.should include("de.site.name")
  end

  it "should get default values from dev.yml when not provided translations yet" do
    @store["pl.hello"].should eql("Hello world!") 
  end

  it "should be possible to set translation value" do
    @store["pl.hello"] = "Witaj, świecie!"
    @store["pl.hello"].should eql("Witaj, świecie!")
  end
end
