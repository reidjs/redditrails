# == Schema Information
#
# Table name: subs
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sub < ApplicationRecord
  validates :name, :user_id, presence: true
  belongs_to :user
  has_many :subbings
  has_many :posts, through: :subbings
  # has_many :posts,
  # through:
end
