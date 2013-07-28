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

	it "is invalid without an email" do 
		@user.email = " "
		expect(@user.errors_on(:email)).to include("can't be blank")
	end

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

	it "responds to authentication" do 
		expect(@user).to respond_to(:authenticate)
	end

	describe "when password not present" do 
		before(:each) do
		@jane = User.new(first_name: "Jane", last_name: "Marley", email: "janemarley@example.com", password: " ", password_confirmation: " ")
		end

		it "is invalid when password not present" do
			expect(@jane).to have(1).errors_on(:password)
		end
	end

	describe "when password do not match" do 
		before(:each) do
		@john = User.new(first_name: "John", last_name: "Marley", email: "johnmarley@example.com", password: "awesomesongs", password_confirmation: "wrongpassword")
		end

		it "is invalid when passwords do not match" do 
			expect(@john).not_to be_valid
		end
	end

	describe "return value of authenticate method" do 
		before(:each) do 
			@user = User.new(first_name: "Danny", last_name: "Awesome", email: "awesome@example.com", password: "onlygreatness", password_confirmation: "onlygreatness")
			@user.save
		end
		let(:found_user) { User.find_by_email(@user.email) }

		describe "with valid password" do 
			it "should equal found user" do 
				expect(@user).to eq found_user.authenticate(@user.password)
			end
		end

		describe "with invalid password" do 
			let(:invalid_user) { found_user.authenticate("invalid") }
			it "should not equal invalid user" do 
				expect(@user).not_to eq invalid_user
				expect(invalid_user).to be_false
			end
		end

	end

end

