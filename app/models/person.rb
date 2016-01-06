class Person < ActiveRecord::Base

  def full_name
    "#{first_name} #{last_name}"
  end

  def introduce
    "#{first_name} #{last_name} is #{age} and has #{hair_color}"
  end
end
