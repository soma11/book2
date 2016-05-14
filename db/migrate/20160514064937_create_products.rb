class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :m_book_id
      t.integer :status
      t.datetime :requested_date
      t.integer :request_user_id
      t.integer :rental_user_id

      t.timestamps null: false
    end
  end
end
