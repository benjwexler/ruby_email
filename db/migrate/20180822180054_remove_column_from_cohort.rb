class RemoveColumnFromCohort < ActiveRecord::Migration[5.2]
  def change
        remove_column(:cohorts, :instructor_id)
  end

  
end
