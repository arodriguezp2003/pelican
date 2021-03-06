# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  author           :string(255)      not null
#  editorial        :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Book < ActiveRecord::Base
  belongs_to:editorial
  belongs_to:author 
  has_attached_file :cover, :styles => { :medium => "200x200>", :thumb => "64x64>" }, :default_url => "missing.jpg"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates :title, :author, :editorial, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

	def self.search(search)
		if search
		  joins(:author).joins(:editorial).where('title LIKE ? OR edition LIKE ? OR authors.name LIKE ? OR editorials.name LIKE ?',"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		  
		else
		  where(nil)
		end
	end
  
end
