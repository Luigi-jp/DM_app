class User < ApplicationRecord
  has_many :messages
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
