class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :hashname, null:false, uniqueness: true
      t.timestamps
    end
  end
end
