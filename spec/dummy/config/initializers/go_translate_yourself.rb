GoTranslateYourself.current_store = GoTranslateYourself::MongoStore.new(Mongo::Connection.new.db("go_translate_yourself_test").collection("translations"))
GoTranslateYourself.locales = [:pl, :de]
