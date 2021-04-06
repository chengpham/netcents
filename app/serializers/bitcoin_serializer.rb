class BitcoinSerializer < ActiveModel::Serializer
  attributes :_hash, :total, :fees, :created_at
  has_many :inputs
  has_many :outputs
  
end
