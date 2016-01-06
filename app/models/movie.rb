class Movie < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, message: "Jest już taka nazwa"
end
