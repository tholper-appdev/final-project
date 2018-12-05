# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

class Customer < ApplicationRecord
    has_many :requests, :dependent => :destroy
    has_many :publications, :dependent => :destroy
end
