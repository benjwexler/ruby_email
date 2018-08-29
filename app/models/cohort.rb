class Cohort < ApplicationRecord
    has_many :enrollments, :dependent => :destroy
    belongs_to :course
    has_many :students, through: :enrollments
    belongs_to :instructor
    # validates :name, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :course_id, presence: true

 
end
