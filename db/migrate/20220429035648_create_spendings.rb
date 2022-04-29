class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.float :amount
      t.datetime :expiry
      t.references :user, null: false, foreign_key: true
      t.boolean :foreign_spending

      t.timestamps
    end
  end
end
