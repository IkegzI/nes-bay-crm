class Company < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :sphereworks, uniq: true
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :machines
  belongs_to  :region
  belongs_to  :user
  belongs_to :status
  has_many :talks
  has_many :equipments
  has_many :jurfaces
end
