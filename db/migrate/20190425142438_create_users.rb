class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_url
      t.string :password_digest
      t.string :email
      t.integer :phone
      t.string :location

      t.timestamps
    end
  end
end
