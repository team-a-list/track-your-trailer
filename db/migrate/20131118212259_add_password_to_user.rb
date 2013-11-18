class AddPasswordToUser < ActiveRecord::Migration
  def change
    add_column :user, :password, :string
  end
end
