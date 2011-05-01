class User < ActiveRecord::Base
  # Others devise modules available are:
  # :encryptable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable, 
         :rememberable, :registerable, :trackable, :timeoutable, :validatable, :token_authenticatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
