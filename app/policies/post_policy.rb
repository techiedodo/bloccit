class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      if !user.blank? && (user.admin? || user.moderator?)
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

end
