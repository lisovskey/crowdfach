class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    elsif user.confirmed_at
      can :create, Donation, user_id: user.id
      if user.validated?
        can :manage, Project, finished: false, user_id: user.id
      else
        can :create, Validation, user_id: user.id      
      end
    end
    can :read, :all
  end
end
