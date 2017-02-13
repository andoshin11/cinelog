class ConfigureUserAgain < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :sign_in_count, :integer, null: true
  end
end
