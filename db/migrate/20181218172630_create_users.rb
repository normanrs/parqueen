class CreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :email
      t.string :google_token
      t.string :uid
      t.string :name

     t.timestamps
   end
 end
end
