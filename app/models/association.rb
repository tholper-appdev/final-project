# == Schema Information
#
# Table name: associations
#
#  id             :integer          not null, primary key
#  request_id     :integer
#  publication_id :integer
#  similar_score  :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  confirm        :boolean          default(FALSE)
#

class Association < ApplicationRecord
    belongs_to :publication
    belongs_to :request
end
