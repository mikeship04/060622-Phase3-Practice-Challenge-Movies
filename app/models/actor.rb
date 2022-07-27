class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles

    #working correctly
    def total_salary
        total_money = self.roles.map { |r| r.salary }
        total_money.sum
    end

    #working correctly
    def blockbusters
        movies.filter { |m| m.box_office_earnings > 50000000 }
    end

    #not working correctly
    def self.most_successful
        net = Actor.all.map { |a| a.total_salary }.max
        self.find {|a| a.total_salary == net}
    end

end