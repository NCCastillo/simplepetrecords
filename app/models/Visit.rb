class Visit < ActiveRecord::Base
  belongs_to :pet

  attr_accessible :date, :description, :veterinarian, :diagnosis, :notes
end