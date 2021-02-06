class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.text :main_image

      t.timestamps
    end
  end
end
