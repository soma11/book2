class CreateMBooks < ActiveRecord::Migration
  def change
    create_table :m_books do |t|
      t.string :name
      t.string :isbn
      t.timestamps null: false
    end
  end
end
