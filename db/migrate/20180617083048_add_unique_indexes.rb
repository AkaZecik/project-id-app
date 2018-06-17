class AddUniqueIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :event_performances, [:performance_id, :appearance_id], unique: true
    add_index :featuring, [:artist_id, :song_id], unique: true
    add_index :genre_dependencies, [:genre_id, :super_genre_id], unique: true
    add_index :member_functions, [:member_id, :function, :since], unique: true
    add_index :radio_performances, [:performance_id, :radio, :time], unique: true
    add_index :soundtracks, [:song_id, :production_id], unique: true
    add_index :genres, :genre_id, unique: true

  end
end
