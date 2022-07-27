class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    #is working correct
    def cast_role(actor, character_name, salary)
        Role.create(actor: actor, character_name: character_name, salary: salary, movie: self)
    end

    #is working correct
    def all_credits
        self.roles.map do |r|
            "#{r.character_name} Played by #{r.actor.name}"
        end
    end

    #is working correct
    def fire_actor(actor)
        role = Role.find(actor)
        role.destroy
    end

end