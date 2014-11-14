class AddLogoTitleAndSignatureToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :logo_title, :string
    add_column :settings, :signature, :string
  end
end
