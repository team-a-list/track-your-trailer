class AddPhoneVerificationToUser < ActiveRecord::Migration
  def change
    add_column :users, :text_token, :integer
    add_column :users, :phone_verified, :boolean
  end
end
