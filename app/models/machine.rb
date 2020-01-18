class Machine < ApplicationRecord
  belongs_to :type_machine
  belongs_to :instrument
end
