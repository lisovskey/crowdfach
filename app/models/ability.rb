class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    user ||= User.new
    if user.admin
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    elsif user.confirmed_at
      can :create, Donation, user_id: user.id
      if user.validated
        can :crud, Project, finished: false, user_id: user.id
      else
        can :create, Validation, user_id: user.id      
      end
    end
    can :read, :all

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
