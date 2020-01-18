class Instrument < ApplicationRecord
  has_and_belongs_to_many :companies
  has_many :machines
end
