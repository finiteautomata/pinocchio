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
  pending "add some examples to (or delete) #{__FILE__}"
end
