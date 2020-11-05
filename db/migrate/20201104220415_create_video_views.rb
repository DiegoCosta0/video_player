class CreateVideoViews < ActiveRecord::Migration[6.0]
  def change
    create_table :video_views do |t|
      t.references :video, index: true, foreign_key: { to_table: 'videos' }
      t.integer :views, default: 0, null: false
      t.timestamps
    end
  end
end
