class RemoveCohortIdFromInstructor < ActiveRecord::Migration[5.2]
  def change
    remove_column(:instructors, :cohort_id)
  end
end
