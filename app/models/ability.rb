class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
      can :manage, :all
    else
      can   :read, Day
      can   :create, Order
      can   :manage, Cart, user_id: user.id
      can   :manage, FirstItem
      can   :manage, SecondItem
      can   :manage, DrinkItem
    end
  end
end