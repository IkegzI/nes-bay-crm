class Company < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :sphereworks, uniq: true
  has_and_belongs_to_many :contacts
  belongs_to  :region
  belongs_to  :user
  belongs_to :status
  has_many :talks
end
