class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.integer :start_day
      t.integer :start_month
      t.integer :start_year
      t.integer :end_day
      t.integer :end_month
      t.integer :end_year
      t.integer :instructor_id
      t.integer :course_id

      t.timestamps
    end
  end
end
