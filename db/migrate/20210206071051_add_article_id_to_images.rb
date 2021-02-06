class AddArticleIdToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :article, null: false, foreign_key: true
  end
end
