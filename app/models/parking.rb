class Parking < ApplicationRecord

  validates_presence_of :coord, :street_name, :start_cross_street, :end_cross_street, :side_of_street
  belongs_to :user

end
