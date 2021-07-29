class CreateScuttlebutts < ActiveRecord::Migration[5.2]
  def change
    create_table :scuttlebutts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
