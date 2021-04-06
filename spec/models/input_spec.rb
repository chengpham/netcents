require 'rails_helper'

RSpec.describe Input, type: :model do
  before do
    @bitcoin = Bitcoin.create(_hash: "32lkj23lk3", total: 1232413, fees: 123)
  end
  describe 'valid input ' do
    it 'has bitcoin key' do
      input = Input.create(prev_hash: '12kljlfj32', output_value: 121334, addresses: ['lakjfl3jlkdjf'], bitcoin_id: @bitcoin.id)
      input.valid?
      expect(input).to eql(Input.first)
    end
  end
  describe 'invalid input ' do
    it 'has bitcoin key' do
      input = Input.create()
      input.valid?
      expect(input.errors.messages).to have_key(:bitcoin)
    end
  end
end
