# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :child_comments,
  primary_key: :id,
  foreign_key: :parent_comment_id,
  class_name: :Comment,
  inverse_of: :parent

  belongs_to :parent,
  primary_key: :id,
  foreign_key: :parent_comment_id,
  class_name: :Comment,
  optional: true,
  inverse_of: :child_comments



end
