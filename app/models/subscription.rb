class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :teas

  enum status: {
    active: 0,
    cancelled: 1
  }
end
