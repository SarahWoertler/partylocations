class AvailabilityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def display?
    true
  end

  def users_destroy?
    record.user == user
  end

  def users_book?
    true
  end
end
