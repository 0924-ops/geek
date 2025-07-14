class AddCategoryAndSizeToTags < ActiveRecord::Migration[7.2]
  def change
    add_column :tags, :category, :string
    add_column :tags, :size, :string
  end
end
