class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :url
      t.string :caption
      t.string :tag
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
