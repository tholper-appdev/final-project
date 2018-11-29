# == Schema Information
#
# Table name: publications
#
#  id               :integer          not null, primary key
#  customer_id      :integer
#  pubmed_date      :date
#  pubmed_title     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pubmed_narrative :string
#

class Publication < ApplicationRecord
    has_many :associations, :dependent => :destroy
end
