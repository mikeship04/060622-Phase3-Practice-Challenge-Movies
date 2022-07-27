class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles

    #working correctly
    def total_salary
        total_money = self.roles.map { |r| r.salary }
        total_money.sum
    end

    #not working correctly
    def blockbusters
        self.movies.map do |m|
            m.where("box_office_earnings" > 50000000)
        end
    end

    #not working correctly
    def most_successful
        self.roles.map do |r|
            r.salary.sum
        end
    end

end