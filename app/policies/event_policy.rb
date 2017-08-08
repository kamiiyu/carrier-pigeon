class EventPolicy < ApplicationPolicy

  def create?
    user.try(:admin?)
  end

  def update?
    user.try(:admin?) || event_owner?
  end

  def send_email?
    update? || event_owner?
  end

  def enroll?
    user.try(:can_enroll?, record)
  end

  class Scope < Scope
    def resolve
      if user.try(:admin?)
        scope
      else
        scope.where(status: :published).or(scope.where(owner_id: user.try(:id)))
      end
    end
  end

  def event_owner?
    record.try(:owner) == user
  end
end
