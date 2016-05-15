class CreatePurchaseRequests < ActiveRecord::Migration
  def change
    create_table :purchase_requests do |t|
      t.integer :m_book_id
      t.integer :state, default: 0, null: false
      t.integer :request_user_id

      t.timestamps null: false
    end
  end
end
