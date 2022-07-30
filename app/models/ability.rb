# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    if user.manager?
      can :index, RealEstate
      can :new, RealEstate
      can :create, RealEstate
      can :show, RealEstate
    end
    if user.user?
      can :index, RealEstate
      can :buy, RealEstate
      can :show, RealEstate
    end
  end

end
