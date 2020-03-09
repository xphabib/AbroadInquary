# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, Schedule, public: true
    #
    # if user.present?
    #   can :read, Schedule
    # end


    user ||= User.new # guest user (not logged in)
    if user.head_admin?
      can :manage, :all
    elsif user.mentor?
      can :manage, Schedule
      can :read, User
      can :manage, StudentApplication
    elsif user.student?
      can :read, Country
      can :read, Schedule
      can :create, StudentApplication
    else
      can :read, :all
    end
  end
end
