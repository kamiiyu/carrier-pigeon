class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type, index:true
      t.text :description
      t.string :organizer, default: 'XO Group'
      t.date :started_at
      t.date :ended_at
      t.date :enroll_started_at
      t.date :enroll_ended_at
      t.integer :capacity, default: -1
      t.boolean :public, default: true
      t.text :remarks
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
