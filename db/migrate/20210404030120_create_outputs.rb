class CreateOutputs < ActiveRecord::Migration[6.1]
  def change
    create_table :outputs do |t|
      t.bigint :value
      t.string :addresses, array: true
      t.references :bitcoin, foreign_key: true

      t.timestamps
    end
  end
end
