class CreateJoinTablePlataformsGames < ActiveRecord::Migration[5.2]
  def change
    create_join_table :plataforms, :games do |t|
      # t.index [:plataform_id, :game_id]
      # t.index [:game_id, :plataform_id]
    end
  end
end
