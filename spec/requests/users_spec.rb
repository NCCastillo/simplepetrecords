require 'spec_helper'

describe "Users" do
    
    context "GET /users/new" do 
    	it "displays the sign up page" do 
    		visit new_user_path

    		page.should have_content "First name"
    		page.should have_content "Last name"
    		page.should have_content "Email"
    		page.should have_content "Password"
    		page.should have_content "Password confirmation"
    		page.has_field?("first_name")
    		page.has_field?("last_name")
    		page.has_field?("email")
    		page.has_field?("password")
    		page.has_field?("password_confirmation")
    		page.has_button?("Create User")
    	end
    end

    context "POST /users" do
    	it "creates and saves a valid user" do 
    		visit new_user_path

    		fill_in "First name", with: "Alex"
    		fill_in "Last name", with: "Awesome"
    		fill_in "Email", with: "aawesome@example.com"
    		fill_in "Password", with: "onlyAwesome123"
    		fill_in "Password confirmation", with: "onlyAwesome123"
    		click_button "Create User"

    		current_path.should == root_path
    		page.should have_content "The User is successfully saved!"
    	end

    end
end
