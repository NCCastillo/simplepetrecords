NCC_ADDRESS = { line1: "516 SE Nome Drive", city: "Port St.Lucie", state: "FL",
				zip: "34984" }

ncc = User.create!(first_name: "Nestor", last_name: "Castillo",
				   email: "nes_23@yahoo.com", password: "simplepet",
				   password_confirmation: "simplepet")

ncc.address = Address.new(NCC_ADDRESS)
ncc.address.save!

lilo = Pet.new(name: "Lilo Castillo", gender: "Female", breed: "Mixed", color: "Black",
				   weight: "55",license: "1234", microchip: "ABC123", species: "Dog",rabies_id: "123BC",
				   neutered: "Yes")
lilo.user = ncc
lilo.save!

