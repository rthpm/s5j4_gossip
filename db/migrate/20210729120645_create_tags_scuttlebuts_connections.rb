class CreateTagsScuttlebutsConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_scuttlebuts_connections do |t|
      t.belongs_to :scuttlebutt, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
