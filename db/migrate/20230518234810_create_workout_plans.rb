class CreateWorkoutPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_plans do |t|
      t.references :coach, null: false
      t.references :student, null: false
      t.integer :number_of_sessions
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end

    add_foreign_key :workout_plans, :users, column: :coach_id
    add_foreign_key :workout_plans, :users, column: :student_id
  end
end
