class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  has_many :comments

  field :id, type: String
  field :name, type: String  
  field :address, type: String

  RESTAURANT_LOCATIONS = ["Aberdeen","Admiralty","Ap Lei Chau","Causeway Bay","Central","Chai Wan","Cyberport"]

  field :review, type: String
  
  field :author, type: String

  validates :name, presence: true
  validates :address, inclusion: { in: RESTAURANT_LOCATIONS }
  
end