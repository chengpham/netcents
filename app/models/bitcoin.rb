class Bitcoin < ApplicationRecord
    validates :_hash, :presence => true, :uniqueness => true
end
