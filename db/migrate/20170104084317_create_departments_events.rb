class CreateDepartmentsEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :departments_events do |t|
      t.references :department, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
