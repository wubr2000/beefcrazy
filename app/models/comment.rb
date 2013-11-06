class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :restaurant

  field :id, type: String
  field :remark, type: String
  field :user, type: String

  validates :remark, presence: true
  
end