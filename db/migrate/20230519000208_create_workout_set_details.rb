class CreateWorkoutSetDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_set_details do |t|
      t.integer :set_sequence_number
      t.integer :number_of_sets
      t.integer :min_number_of_repetitions
      t.integer :max_number_of_repetitions
      t.integer :rest_duration_in_seconds
      t.text :description
      t.references :workout_routine_exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
