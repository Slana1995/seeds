# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  city       :string
#  address    :string
#  born       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ActiveRecord::Base
	has_many :articles
	has_many :comments
end
