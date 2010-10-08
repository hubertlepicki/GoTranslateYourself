conn = Mongo::Connection.new.db("go_translate_yourself_test").collection("translations")
GoTranslateYourself.current_store = GoTranslateYourself::MongoStore.new(conn)
GoTranslateYourself.locales = [:pl, :de]

I18n.backend = I18n::Backend::KeyValue.new GoTranslateYourself.current_store

#GoTranslateYourself.auth_handler = proc {
#  authenticate_or_request_with_http_basic do |user_name, password|
#    user_name == 'some' && password == 'user'
#  end
#}

GoTranslateYourself.layout_name = "dummy_admin"
