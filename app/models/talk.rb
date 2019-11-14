class Talk < ApplicationRecord
  belongs_to :typetalk
  belongs_to :user
  belongs_to :company
  belongs_to :contact
end
