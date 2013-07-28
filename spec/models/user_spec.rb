require 'spec_helper'

describe User do
	before(:each) do
		@user = User.new(first_name: "Bob", last_name: "Marley", email: "bobmarley@example.com", password: "everythingisgoingtobeok")
	end

	it "is valid with a firstname, lastname,email and password" do 
		expect(@user).to be_valid
	end

	it "is invalid without a firstname" do
		@user.first_name = " "
		expect(@user).to have(1).errors_on(:first_name)
	end

	it "is invalid without a lastname" do 
		@user.last_name = " "
		expect(@user).to have(1).errors_on(:last_name)
	end

	it "is invalid without a email" do 
		@user.email = " "
		expect(@user.errors_on(:email)).to include("can't be blank")
	end

	# it "is invalid without a password" do 
	# 	@user.password = " "
	# 	expect(@user).to have(1).errors_on(:password_digest)
	# end

	it "is invalid with a duplicate email address" do 
		User.create(first_name: "Damien", last_name: "Marley", email: "ziggymarley@example.com", password: "bufflosoldierAgain")
		ziggy = User.new(first_name: "Ziggy", last_name: "Marley", email: "ziggymarley@example.com", password: "bufflosoldier")
			
		expect(ziggy).to have(1).errors_on(:email)
	end

	it "is invalid without the right email format" do 
		emails = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      	emails.each do |invalid_address|
        @user.email = invalid_address
		expect(@user).to have(1).errors_on(:email)
		end
	end

	it "is invalid if password is too short" do 
		@user.password = "123"
		expect(@user).to have(1).errors_on(:password, :message =>"Password must be at least 6 characers")
	end

end

