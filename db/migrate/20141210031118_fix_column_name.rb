class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :image_filename, :image
  end
end
