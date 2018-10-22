class AddProviderToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string   :provider
      t.string   :uid
      t.string   :nickname
      t.string   :image_url
    end
  end
end
