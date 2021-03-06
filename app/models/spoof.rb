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
#  status     :string
#  message_id :string
#  ip_addr    :string
#

class Spoof < ActiveRecord::Base
  belongs_to :user
  validates_length_of :body, :minimum => 5, :maximum => 140, :presence => true
  validates :number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "should be a US number and formatted xxx-xxx-xxxx" }
  validates :body, :presence => true
  scope :today, -> { where("created_at BETWEEN ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day) }
  before_create :generate_message_id

  def generate_message_id
    self.message_id = SecureRandom.hex(7)[0..9]
  end
end
