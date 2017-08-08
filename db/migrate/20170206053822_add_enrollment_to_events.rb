class AddEnrollmentToEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :enroll_started_at, :enrollment_started_at
    rename_column :events, :enroll_ended_at, :enrollment_ended_at
  end
end
