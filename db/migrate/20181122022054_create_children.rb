class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.integer :children_id
      t.datetime :children_date

      t.timestamps
    end
  end
end
