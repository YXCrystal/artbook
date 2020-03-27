class AddSiteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :site, :string
  end
end
