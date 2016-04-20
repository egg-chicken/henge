class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :title, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.references :product, null: false, index: true, foreign_key: true

      t.index [:user_id, :product_id], unique: true
      t.timestamps null: false
    end
  end
end
