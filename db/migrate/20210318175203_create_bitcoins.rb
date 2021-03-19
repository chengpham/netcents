class CreateBitcoins < ActiveRecord::Migration[6.1]
  def change
    create_table :bitcoins do |t|
      t.string :_hash
      t.bigint :total
      t.bigint :fees
      t.json :inputs, array: true
      t.json :outputs, array: true

      t.timestamps
    end
  end
end
