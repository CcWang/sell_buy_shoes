class User < ActiveRecord::Base
  has_secure_password
  has_many :purchases, :class_name =>'Product', :foreign_key =>'buyer_id'
  has_many :sales, :class_name =>'Product', :foreign_key =>'seller_id'
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name,:email,:password, presence: true
  validates :password, length: {minimum:8}
  validates :email, format: { with: EMAIL_REGEX }
end
