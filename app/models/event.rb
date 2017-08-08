class Event < ApplicationRecord
  attribute :status, :string, default: 'Draft'

  belongs_to :user
  has_many :departments_events
  has_many :departments, through: :departments_events

  validates :name, :event_type, :started_at, :ended_at, :status, :departments, presence: true
end
