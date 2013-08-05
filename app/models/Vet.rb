class Vet < ActiveRecord::Base
	has_one  :address, :as => :addressable
	belongs_to :pet 

	#note to self - tried everything in the book to get nested attributes
	#and still no cigar! The address part of the form doesn't render in the view.
	#will have to come up with another way for now.
	
	accepts_nested_attributes_for :address

	attr_accessible :name, :phone1, :phone2 , :address_attributes
end