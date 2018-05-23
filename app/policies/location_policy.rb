class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def true
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def users_new?
    true
  end

  def users_create?
    record.user == user
  end

  def users_edit?
    true
  end

  def users_update?
    record.user == user
  end

  def users_destroy?
    record.user == user
  end
end
