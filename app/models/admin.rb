class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :timeoutable, :validatable, 
         :lockable, :trackable, :timeout_in => 240.minutes
end