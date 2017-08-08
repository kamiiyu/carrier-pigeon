class User < ApplicationRecord
  include Gravtastic
  gravtastic secure: true, size: 30, default: :wavatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many :own_events, class_name: :Event, foreign_key: :owner_id
  has_many :enrollments
  has_many :enrolled_events, through: :enrollments, source: :event
  scope :from_admin, -> { where(department_id: 3) }
  scope :active, -> { where(status: 1) }

  def display_name
    "[#{self.department.name}]#{self.first_name}" rescue self.first_name
  end

  def admin?
    ['Admin', 'Email Test Group'].include? self.department.name
  end

  def full_email_address
    "#{self.first_name} #{self.last_name} <#{self.email}>"
  end

  def can_enroll?(event)
    event.published? && (self.admin? || event.departments.include?(self.department))
  end

  def enroll_token(event)
    JWT.encode({ event_id: event.id, user_id: self.id }, Rails.application.secrets.secret_key_base)
  end

end
