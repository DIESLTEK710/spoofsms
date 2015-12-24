# == Schema Information
#
# Table name: spoofs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Spoof < ActiveRecord::Base
  belongs_to :user
  validates_length_of :body, :minimum => 5, :maximum => 160, :presence => true

end
