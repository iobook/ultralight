class Item
  
  include MongoMapper::Document

  key :name,        String
  key :object_class,  String
  key :added_at, Time
  timestamps!
  
  belongs_to :application

end