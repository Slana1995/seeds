# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  name_author :string
#  comment     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  article_id  :integer
#

class Comment < ActiveRecord::Base
	belongs_to :article
end
