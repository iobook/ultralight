class Application
  
  include MongoMapper::Document

  key :name,        String
  key :added_at, Time
  timestamps!

  many :items  
  belongs_to :user
  
  validates_presence_of :name, :on => :create

  def class_count
  	object_class_names = items.map(&:object_class)
  	object_class_names.uniq!
  	object_class_names.count
  end

end