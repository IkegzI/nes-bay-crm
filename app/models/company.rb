class Company < ApplicationRecord
  has_and_belongs_to_many :contacts
  belongs_to  :region
  validates :phone, uniqueness: true
end
