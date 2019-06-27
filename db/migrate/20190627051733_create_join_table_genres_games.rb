class CreateJoinTableGenresGames < ActiveRecord::Migration[5.2]
  def change
    create_join_table :genres, :games do |t|
      # t.index [:genre_id, :game_id]
      # t.index [:game_id, :genre_id]
    end
  end
end
