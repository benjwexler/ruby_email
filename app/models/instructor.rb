class Instructor < ApplicationRecord
    has_many :cohorts, :dependent => :nullify
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :last_name, presence: true
    validates :salary, presence: true
    validates :age, presence: true
    validates :highest_education, presence: true

    def full_name
        "#{first_name} #{last_name} (#{id})"
    end
end
