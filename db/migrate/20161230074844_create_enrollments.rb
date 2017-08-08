class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :attended, default: false
      t.text :feedback

      t.timestamps
    end
  end
end
