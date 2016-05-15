class CreateMBranches < ActiveRecord::Migration
  def change
    create_table :m_branches do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
