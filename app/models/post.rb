# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  subject    :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
end
