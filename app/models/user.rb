class User < ActiveRecord::Base
  # Others devise modules available are:
  # :encryptable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable, 
         :rememberable, :registerable, :trackable, :timeoutable, :token_authenticatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :roles
  

end
