class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :comment
      t.references :user, index: true
      t.references :movie, index: true
      t.references :theater, index: true

      t.timestamps
    end
  end
end
