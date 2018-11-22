class CreateSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :salaries do |t|
      t.float :monthly_wage
      t.float :monthly_benefits
      t.integer :month_id

      t.timestamps
    end
  end
end
