class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   :name               , null: false
      t.string   :user_id_name       , unique: true
      t.string   :email              , index: true
      t.string   :password_digest
      t.string   :remember_digest
      t.string   :activation_digest 
      t.boolean  :activated          , default: false
      t.datetime :activated_at
      t.string   :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
