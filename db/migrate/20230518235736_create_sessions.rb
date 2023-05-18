class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :workout_routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
