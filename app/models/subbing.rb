# == Schema Information
#
# Table name: subbings
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subbing < ApplicationRecord
  belongs_to :post
  belongs_to :sub
end
