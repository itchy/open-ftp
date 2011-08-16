class CreateDownloadCodes < ActiveRecord::Migration
  def change
    create_table :download_codes do |t|
      t.integer :box_file_id
      t.string :code
      t.integer :download_count

      t.timestamps
    end
  end
end
