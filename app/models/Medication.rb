class Medication < ActiveRecord::Base
  belongs_to :pet

  attr_accessible :name, :description, :dosage
end