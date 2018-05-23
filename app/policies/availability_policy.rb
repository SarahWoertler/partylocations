class AvailabilityPolicy < ApplicationPolicy
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

  def display?
    true
  end

  def users_create_availability?
    true
  end

  def users_manage?
    record.user == user
  end

  def users_destroy?
    true
  end

  def users_book?
    true
  end

  def accept?
    record.location.user == user
  end

  def decline?
    record.location.user == user
  end
end
