class Role < ActiveRecord::Base
    belongs_to :actor
    belongs_to :movie

    #is working correctly
    def credit
        "#{character_name}: Played by #{actor.name}"
    end
end