class Output < ApplicationRecord
    belongs_to :bitcoin
    
    def created_at
        attributes['created_at'].strftime("%m/%d/%Y %H:%M")
    end
    def updated_at
        attributes['updated_at'].strftime("%m/%d/%Y %H:%M")
    end
end
