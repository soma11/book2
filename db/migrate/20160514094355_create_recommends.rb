class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.references :sender, index: true
      t.references :product, index: true
      t.references :receiver, index: true

      t.timestamps null: false
    end
  end
end
