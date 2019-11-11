class Company < ApplicationRecord
  has_and_belongs_to_many :contacts
  belongs_to  :region
  belongs_to  :user
  validates :phone, uniqueness: true

end
