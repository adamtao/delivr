class AddPasswordResetToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :password_reset_digest, :string
  end
end
