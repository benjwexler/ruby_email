class Course < ApplicationRecord
    has_many :cohorts
    
    validates :name, presence: true
    validates :class_hours, presence: true
end
