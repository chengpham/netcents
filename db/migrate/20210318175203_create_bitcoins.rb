class CreateBitcoins < ActiveRecord::Migration[6.1]
  def change
    create_table :bitcoins do |t|
      t.string :_hash, index: {unique: true}
      t.bigint :total
      t.bigint :fees

      t.timestamps
    end
  end
end
