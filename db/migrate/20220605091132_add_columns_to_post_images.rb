class AddColumnsToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :user_name, :string
    add_column :post_images, :caption, :text
    
  end
end
