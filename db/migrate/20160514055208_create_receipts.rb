class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :name
      t.references :product
      t.string :original_filename
      t.string :content_type
      t.binary :image, limit: 3.megabyte
      t.timestamps null: false
    end
  end
end
