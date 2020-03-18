# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, Schedule, public: true
    #
    # if user.present?
    #   can :read, Schedule
    # end

    # alias_action :create, :read, :update, :destroy, to: :crud
    # if user.present?
    #   can :crud, User
    #   can :invite, User
    # end

    # users (head_admin teacher manager executive_admin director_admin mentor student)
    #

    user ||= User.new # guest user (not logged in)

    if user.head_admin?
      can :manage, :all

    elsif user.teacher?
      can :create, User
      can :update, User
      can :read, User
      can :read, Schedule
      can :read, StudentApplication

    elsif user.manager?
      can :create, User
      can :update, User
      can :read, User
      can :read, Schedule
      can :read, StudentApplication

    elsif user.executive_admin?
      can :read, User
      can :update, User
      can :create, User
      can :read, Schedule
      can :read, StudentApplication

    elsif user.director_admin?
      can :read, User
      can :create, User
      can :read, Schedule
      can :read, StudentApplication

    elsif user.mentor?
      can :read, User
      can :manage, Schedule
      can :manage, StudentApplication

    elsif user.student?
      can :read, User
      can :update, User
      can :read, Country
      can :read, Schedule
      can :update, Schedule

      can :create, StudentApplication
      can :read, StudentApplication

    else
    end
  end
end
