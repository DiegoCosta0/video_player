class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :url
      t.references :user, index: true, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
