class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps
      t.index :email, unique: true
      t.index :code, unique: true
    end

  end
end
