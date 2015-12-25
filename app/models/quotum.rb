# == Schema Information
#
# Table name: quota
#
#  id         :integer          not null, primary key
#  sum        :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quotum < ActiveRecord::Base
  belongs_to :user
end
