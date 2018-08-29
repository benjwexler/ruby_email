json.extract! cohort, :id, :name, :start_day, :start_month, :start_year, :end_day, :end_month, :end_year, :instructor_id, :course_id, :created_at, :updated_at
json.url cohort_url(cohort, format: :json)
