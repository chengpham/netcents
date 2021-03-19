require 'rails_helper'

RSpec.describe Bitcoin, type: :model do
  describe "validates" do
    describe "_hash" do
      it "requires a _hash" do
        bitcoin = Bitcoin.create(_hash: "", total: 1232413, fees: 123, inputs: [{}], outputs: [{}])
        bitcoin.valid?
        expect(bitcoin.errors.messages).to(have_key(:_hash))
      end
      it '_hash is unique' do
        bitcoin = Bitcoin.create(_hash: "32lkj23lk3", total: 1232413, fees: 123, inputs: [{}], outputs: [{}])
        bitcoin = Bitcoin.create(_hash: "32lkj23lk3", total: 1232413, fees: 123, inputs: [{}], outputs: [{}])
        bitcoin.valid?
        expect(bitcoin.errors.messages).to(have_key(:_hash))
      end
    end
  end
end
