class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :sms_number
      t.string :password_digest
      t.integer :active, :default => 0
      t.string :box_auth_token

      t.timestamps
    end
  end
end
