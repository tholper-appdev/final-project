# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  pubmed_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publication < ApplicationRecord
    has_many :associations, :dependent => :destroy
end
