class VetsController < ApplicationController
	def new
		@vet = Vet.new
		#@vet.build_address
		@address = Address.new
	end
end