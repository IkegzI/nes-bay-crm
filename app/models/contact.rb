class Contact < ApplicationRecord
  has_and_belongs_to_many :companies
  validates :phone, uniqueness: true
end
