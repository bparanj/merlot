class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :timeoutable, :validatable, 
         :lockable, :trackable, :timeout_in => 20.minutes
end