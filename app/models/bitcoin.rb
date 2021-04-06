class Bitcoin < ApplicationRecord
    validates :_hash, :presence => true, :uniqueness => true
    has_many :inputs, dependent: :destroy
    has_many :outputs, dependent: :destroy
    
    def created_at
      attributes['created_at'].strftime("%m/%d/%Y %H:%M")
    end
    def updated_at
      attributes['updated_at'].strftime("%m/%d/%Y %H:%M")
    end
end
