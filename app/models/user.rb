class User < ApplicationRecord
  has_many :messages
  has_many :entries
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
