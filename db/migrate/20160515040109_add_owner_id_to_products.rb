class AddOwnerIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :owner, index: true
  end
end
