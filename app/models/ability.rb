class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, Collection, :public => true
    can :manage, Collection, :user_id => user.id unless user.new_record?
    
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
