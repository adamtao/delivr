class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user.has_role? :admin
        can :manage, :all
        cannot :create, Item if Category.count < 1
    else
        can :read, Category, active: true
        can :read, Item, active: true
        can :read, ItemDocument do |i|
            i.item.active? || user.items.include?(i.item)
        end
        can :read, ItemImage do |i|
            i.item.active? || user.items.include?(i.item)
        end
        cannot :download, Download

        # Users who purchased something:
        can :download, Download do |d|
            user.items.include?(d.item)
        end
    end
  end
end
