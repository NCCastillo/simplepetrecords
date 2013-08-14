class Immunization < ActiveRecord::Base
  belongs_to :pet

  attr_accessible :type, :date, :next_due  
end