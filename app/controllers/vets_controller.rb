class VetsController < ApplicationController
	def new
		@vet = Vet.new
		@vet.build_address

	end
end