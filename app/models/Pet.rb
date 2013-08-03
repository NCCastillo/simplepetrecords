class Pet < ActiveRecord::Base
	belongs_to :user
	has_many :vets

	attr_accessible :name, :gender, :breed, :color, :weight, :license,
				    :microchip, :species, :rabies_id, :neutered, :user_id

	validates_presence_of :name, :gender, :breed, :color, :weight, :license,
						  :microchip, :species, :neutered #:rabies
end