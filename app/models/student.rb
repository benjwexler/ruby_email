class Student < ApplicationRecord
    has_many :enrollments, :dependent => :destroy
    has_many :cohorts, through: :enrollments 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :age, presence: true, :inclusion => 0..150

    def full_name
        "#{first_name} #{last_name} (#{id})"
    end

end
