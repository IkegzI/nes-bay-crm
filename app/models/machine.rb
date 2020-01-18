class Machine < ApplicationRecord
  belongs_to :type_machine
  belongs_to :instrument
  has_and_belongs_to_many :companies
end
