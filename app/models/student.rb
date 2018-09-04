class Student < ApplicationRecord
    has_many :enrollments, :dependent => :destroy
    has_many :cohorts, through: :enrollments 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birthday, presence: true
    

    def full_name
        "#{first_name} #{last_name} (#{id})"
    end

    def age(dob)
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
        # puts now.to_time.to_i
        # puts dob.to_time.to_i

        # "1-1-2012".to_date 
    end

      def validate_age
        if birthday.present? && birthday > 18.years.ago.to_d
            errors.add(:birthday, 'You should be over 18 years old.')
        end
    end

    



end
