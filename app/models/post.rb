# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sub_ids    :integer
#

class Post < ApplicationRecord
  has_many :comments
  # belongs_to :subs
  # has_many :subs, through:
end
