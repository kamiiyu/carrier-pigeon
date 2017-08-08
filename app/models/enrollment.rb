class Enrollment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates_uniqueness_of :event, scope: :user, message: 'You have already enrolled!'
  validate :current_date_should_not_greater_than_enrollment_date

  private
    def current_date_should_not_greater_than_enrollment_date
      if Time.now > event.enrollment_ended_at
        errors.add(:created_at, "Enrollment is outdated!")
      end
    end
end
