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
#

class Customer < ApplicationRecord
end
