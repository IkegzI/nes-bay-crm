class User < ApplicationRecord
  belongs_to :role
  belongs_to :region
end
