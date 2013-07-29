require 'spec_helper'

describe "StaticPages" do
  
  describe "GET /static_pages" do
  	it "should have the content 'Simple Pet Records'" do 
  		visit '/static_pages/home'
  		expect(page).to have_content('Simple Pet Records')
  	end

  	it "should have the content 'About us'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About us')
  	end

  	it "should have the content 'Contact us'" do 
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact us')
  	end
  end


end
