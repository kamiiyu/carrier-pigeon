class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  scope :from_admin, -> {where(department_id: 3)}
  scope :active, -> {where(status: 1)}

  def display_name
    "[#{self.department.name}]#{self.first_name}" rescue self.first_name
  end
end
