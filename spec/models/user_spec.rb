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

require 'spec_helper'

describe User, :type => :model do

  let(:email) { "jmperez@example.com" }
  let(:name) { "Juan" }
  let(:password) { "1234"}

  describe "Validations" do

    it "should not be valid without a name" do
      user = User.new email:email

      expect(user).not_to be_valid
      expect(user.errors[:name]).not_to be_empty
    end

    it "should not be valid without a mail" do
      user = User.new name:name
      
      expect(user).not_to be_valid
      expect(user.errors[:email]).not_to be_empty    
    end

    it "should not be valid without a password" do
      user = User.new name:name, email:email

      expect(user).not_to be_valid
      expect(user.errors[:password]).not_to be_empty
    end
    
    it "should not be valid without a password confirmation" do
      user = User.new name:name, email:email, password:password

      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).not_to be_empty
    end
  end

  describe "password" do

    subject {  User.create! name:name, email:email, password:password, password_confirmation:password }

    it "should not be saved in plaintext" do
      user = User.find(subject.id)
      expect(user.password).not_to eq(password)
    end

  end

end
