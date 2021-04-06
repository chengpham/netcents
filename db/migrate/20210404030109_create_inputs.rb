class CreateInputs < ActiveRecord::Migration[6.1]
  def change
    create_table :inputs do |t|
      t.string :prev_hash
      t.bigint :output_value
      t.string :addresses, array: true
      t.references :bitcoin, foreign_key: true

      t.timestamps
    end
  end
end
