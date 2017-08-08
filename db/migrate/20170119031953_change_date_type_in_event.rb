class ChangeDateTypeInEvent < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :started_at, :datetime
    change_column :events, :ended_at, :datetime
    change_column :events, :enroll_started_at, :datetime
    change_column :events, :enroll_ended_at, :datetime
  end
end
