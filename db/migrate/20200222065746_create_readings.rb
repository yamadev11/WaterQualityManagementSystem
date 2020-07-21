class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.datetime :date
      t.float :dissolved_oxygen
      t.float :turbidity
      t.float :ph
      t.float :temprature
      t.float :flow
      t.references :node
      t.timestamps
    end
  end
end
