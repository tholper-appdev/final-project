# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  req_date    :date
#  req_title   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Request < ApplicationRecord
    belongs_to :customer
    has_many :associations, :dependent => :destroy
end
