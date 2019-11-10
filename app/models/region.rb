class Region < ApplicationRecord
  has_many :companies
  has_many :users
  validates :name, uniqueness: true
end
