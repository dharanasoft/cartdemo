class Category
  include Mongoid::Document
  include Mongoid::Timestamps # for updated_at and created_at
  field :name, :type => String
  validates_uniqueness_of :name
end
