class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :create, Collection unless user.new_record?
    can :read, Collection, :public => true
    can [:read, :update, :destroy], Collection, :user_id => user.id
    
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
