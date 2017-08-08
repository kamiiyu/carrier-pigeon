class DepartmentsEvent < ApplicationRecord
  belongs_to :department
  belongs_to :event
end
