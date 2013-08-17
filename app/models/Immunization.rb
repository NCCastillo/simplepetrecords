class Immunization < ActiveRecord::Base
  belongs_to :pet

  attr_accessible :itype, :date, :next_due  
end