GoTranslateYourself.current_store = GoTranslateYourself::MongoStore.new(Mongo::Connection.new.db("go_translate_yourself_test"))
GoTranslateYourself.locales = [:pl, :de]
