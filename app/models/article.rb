# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  author_id  :integer
#

class Article < ActiveRecord::Base
	belongs_to :author
	has_many :tags
	has_many :comments
end
