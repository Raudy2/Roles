class AddImageToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :images, :string 
  end
end
