class CreateWorkoutSetExecutions < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_set_executions do |t|
      t.integer :set_sequence_number
      t.float :weight
      t.integer :plates
      t.references :workout_set_details, null: false, foreign_key: true

      t.timestamps
    end
  end
end
