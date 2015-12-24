# == Schema Information
#
# Table name: spoofs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  number     :string
#

require 'test_helper'

class SpoofTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
