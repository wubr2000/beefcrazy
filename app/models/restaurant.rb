class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :comments

  field :id, type: String
  field :name, type: String  
  field :address, type: String
  field :review, type: String
  
  field :author, type: String

  validates :name, presence: true
  
end