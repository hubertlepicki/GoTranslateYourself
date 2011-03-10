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
    @store["pl.hello"].should eql("\"Hello world!\"") 
  end

  it "should be possible to set translation value" do
    @store["pl.hello"] = "Witaj, świecie!"
    @store["pl.hello"].should eql("\"Witaj, \\u015bwiecie!\"")
  end

  it "should encode JSON and decode on storing/getting, without throwing exceptions" do
    @store["pl.hello"] = "Witaj, świec{{elo}}ie!"
    @store["pl.hello"].should eql("\"Witaj, \\u015bwiec{{elo}}ie!\"")
  end

  it "should load read-only translations from all *.yml files in config directory, other than dev.yml" do
    @store["pl.errors.blank"].should == "\"nie mo\\u017ce by\\u0107 puste\""
    @store["pl.errors.required"].should == "\"jest wymagany\""
    @store["de.errors.required"].should == "\"erforderlich ist\""
    @store["de.errors.blank"].should == "\"come on, enter something\""
  end
end
