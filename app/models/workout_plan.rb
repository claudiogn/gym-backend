class WorkoutPlan < ApplicationRecord
  belongs_to :coach_id
  belongs_to :student_id
end
