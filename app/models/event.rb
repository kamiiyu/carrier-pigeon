class Event < ApplicationRecord
  attribute :status, :string, default: 'draft'
  alias_attribute :start_date, :started_at
  alias_attribute :end_date, :ended_at
  after_update :send_event_announcement

  belongs_to :user
  belongs_to :owner, class_name: :User
  has_many :departments_events
  has_many :departments, through: :departments_events
  has_many :enrollments
  has_many :enrolled_users, through: :enrollments, source: :user

  validates :name, :event_type, :started_at, :ended_at, :enrollment_ended_at, :status, :departments, presence: true
  validate :enrollment_started_at_cant_not_greater_than_enrollment_ended_at

  def contacts
    self.user.display_name
  end

  def department_names
    self.departments.pluck(:name).join(', ')
  end

  def converted_description
    self.description.gsub(/\#{contacts}|\#{start_date}|\#{end_date}|\#{event_type}|\#{organizer}|\#{department_names}/) do |s|
        self.send(s.gsub(/[\#{}]/, '').to_sym) rescue s
    end
  end

  def mail_to
    Settings.test_email || self.departments.map{|d| (d.users.to_a << self.owner).map(&:full_email_address)}.flatten.uniq
  end

  def send_event_announcement
    UserMailer.event_announcement(self).deliver_later if self.changed_attributes[:status] && self.published?
  end

  def method_missing(method, *args, &block)
    _status = method.to_s.gsub(/\?$/, "")
    if Settings.event.status.include?(_status)
      self.status == _status
    else
      super
    end
  end

  def enrollment_started_at_cant_not_greater_than_enrollment_ended_at
    if enrollment_started_at && enrollment_started_at > enrollment_ended_at
      errors.add(:enrollment_started_at, "can't greater than enrollment end date")
    end
  end

end
