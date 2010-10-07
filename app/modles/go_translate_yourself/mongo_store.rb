module GoTranslateYourself
  class MongoStore < BaseStore

    def []=(key, value)
      collection.update({_id: key}, {'$set' => {:value => value}}, upsert: true, safe: true)
    end

    def clear_database
      collection.drop
    end

end

