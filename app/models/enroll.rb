class Enroll < ApplicationRecord
    validates :student_id, presence: true
    validates_uniqueness_of :student_id, :scope => :cohort_id
    validates :cohort_id, presence: true
end
