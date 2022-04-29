class CreateLoyalties < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalties do |t|
      t.float :points
      t.references :spending, null: false, foreign_key: true
      t.datetime :expiry
      t.integer :reward_title

      t.timestamps
    end
  end
end
