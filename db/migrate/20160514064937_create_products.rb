class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :m_book_id

      t.timestamps null: false
    end
  end
end
