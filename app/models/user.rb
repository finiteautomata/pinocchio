# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(128)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  # TODO: Validate this is an email!
  validates :email, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence:true
  
  has_secure_password

end
