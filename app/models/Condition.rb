class Condition < ActiveRecord::Base
  belongs_to :pet

  attr_accessible :name, :description
end