class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :reserved_user, index: true
      t.references :product, index: true

      t.timestamps null: false
    end
  end
end
