class CreateBorrowingHistories < ActiveRecord::Migration
  def change
    create_table :borrowing_histories do |t|
      t.references :borrower, index: true
      t.references :product, index: true
      t.datetime :borrowed_at
      t.datetime :return_untill
      t.datetime :returned_at

      t.timestamps null: false
    end
  end
end
