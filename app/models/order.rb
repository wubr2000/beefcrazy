class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  # belongs_to :user

  field :id
  field :amount, type: Integer

end
