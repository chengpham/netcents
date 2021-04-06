require 'rails_helper'

RSpec.describe Output, type: :model do
  before do
    @bitcoin = Bitcoin.create(_hash: "32lkj23lk3", total: 1232413, fees: 123)
  end
  describe 'valid output ' do
    it 'has bitcoin key' do
      output = Output.create(value: 121334, addresses: ['lakjfl3jlkdjf'], bitcoin_id: @bitcoin.id)
      output.valid?
      expect(output).to eql(Output.first)
    end
  end
  describe 'invalid output ' do
    it 'has bitcoin key' do
      output = Output.create()
      output.valid?
      expect(output.errors.messages).to have_key(:bitcoin)
    end
  end
end
