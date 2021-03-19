class User < ApplicationRecord
  include Digest

  belongs_to :role
  belongs_to :region
  has_many :companies

  before_save :password_encrypt

  def password_encrypt
    self.pass = Digest::SHA1.hexdigest(pass || '')
  end

end
