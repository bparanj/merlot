class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # Guest user
    
    # if admin_signed_in?
    #   can :manage, :all
    # else
    #   can :read, :all

      # if user.role?(:author)
      #   # can :create, Article
      #   # can :update, Article do |article|
      #   #   article.try(:user) == user # WTF ?
      #   # end
      # end
    # end     
  end
end