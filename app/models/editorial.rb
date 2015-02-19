# == Schema Information
#
# Table name: Editorials
#
#  id               :integer          not null, primary key
#  name            :string(255)      not null


class Editorial < ActiveRecord::Base
	has_many :book
	accepts_nested_attributes_for :book, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	
end
