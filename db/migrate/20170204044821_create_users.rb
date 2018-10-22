class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.string :profile_pic
      t.string :city

      t.timestamps
    end
  end
end
