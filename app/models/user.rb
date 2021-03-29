class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    before_save :admin?
    
    def admin?
        self.admin ||= false 
    end 

    def mood 
        if self.happiness && self.nausea
            if self.happiness > self.nausea
                mood = "happy"
            else 
                mood = "sad"
            end 
        end 
    end 
end
