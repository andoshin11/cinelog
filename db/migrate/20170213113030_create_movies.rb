class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ""
      t.string :poster_path
      t.text :overview
      t.integer :mvdb_id, index: true
      t.string :original_title
      t.string :original_language
      t.string :backdrop_path
      t.references :user, index: true

      t.timestamps
    end
  end
end
