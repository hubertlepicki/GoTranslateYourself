module GoTranslateYourself
  class MongoStore < BaseStore
    def initialize(collection)
      @collection = collection
    end

    def []=(key, value)
      collection.update({_id: key}, {'$set' => {:value => value}}, upsert: true, safe: true)
    end

    def [](key)
      if document = collection.find_one(_id: key)
        document["value"]
      else
        default_translation(key)
      end
    end

    def clear_database
      collection.drop
    end

    private

    def collection; @collection; end
  end
end

