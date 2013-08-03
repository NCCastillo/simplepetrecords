class Vet < ActiveRecord::Base
	has_one  :address, :as => :addressable
	belongs_to :pet 

	accepts_nested_attributes_for :address

	attr_accessible :name, :phone1, :phone2
end