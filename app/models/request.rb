# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rtc_req_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Request < ApplicationRecord
    belongs_to :user
    has_many :associations, :dependent => :destroy
end
