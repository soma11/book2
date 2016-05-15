class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.string :description
      t.references :sender, index: true
      t.references :receiver, index: true
      t.timestamps null: false
    end
  end
end
