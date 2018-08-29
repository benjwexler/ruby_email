class RemoveColumsToCohort < ActiveRecord::Migration[5.2]
  def change
    remove_column(:cohorts, :start_day)
    remove_column(:cohorts, :start_month)
    remove_column(:cohorts, :start_year)
    remove_column(:cohorts, :end_day)
    remove_column(:cohorts, :end_month)
    remove_column(:cohorts, :end_year)
  end
end
