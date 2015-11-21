require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_and_belongs_to_many :answers

  validates :username, :password,presence:true
  validates :username, length:{in: 2..30}
  validates :username, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
