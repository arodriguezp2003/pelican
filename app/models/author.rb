
# == Schema Information
#
# Table name: Authors
#
#  id               :integer          not null, primary key
#  name            :string(255)      not null




class Author < ActiveRecord::Base
	has_many :book

end
