class CreateBoxFiles < ActiveRecord::Migration
  def change
    create_table :box_files do |t|
      t.integer :user_id
      t.string :name
      t.string :file_id
      t.string :url_code
      t.integer :watched, :default => 1
      t.integer :notify, :default => 1
      
      t.integer :download_count
      t.integer :max_downloads

      t.timestamps
    end
  end
end
