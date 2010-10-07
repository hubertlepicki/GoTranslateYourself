GoTranslateYourself.current_store = GoTranslateYourself::MongoStore.new(Mongo::Connection.new.db("go_translate_yourself_test").collection("translations"))
GoTranslateYourself.locales = [:pl, :de]

I18n.backend = I18n::Backend::KeyValue.new GoTranslateYourself.current_store
