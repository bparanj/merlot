class User < ActiveRecord::Base
  # Others devise modules available are:
  # :encryptable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable, 
         :rememberable, :registerable, :trackable, :timeoutable, :validatable, :token_authenticatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles
  
  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }  
  # Add new roles to the end of the array
  ROLES = %w[author editor contributor moderator]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map{|r| 2**ROLES.index(r)}.sum
  end
  
  def roles
    ROLES.reject{|r| ((roles_mask || 0) & 2**ROLES.index(r)).zero?}
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end
  
  def role?(role)
    roles.include? role.to_s
  end
end

# TODO : After admin logins in redirect_to admin dashboard