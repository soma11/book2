class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :github_url, :string
    add_column :users, :blog_url, :string
  end
end
