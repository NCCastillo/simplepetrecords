require 'spec_helper'

describe "StaticPages" do
  
  describe "GET /static_pages" do
  	it "should have the content 'Simple Pet Records'" do 
  		visit '/static_pages/home'
  		expect(page).to have_content('Simple Pet Records')
  	end  
  end
end
