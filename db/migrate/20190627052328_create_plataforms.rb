class CreatePlataforms < ActiveRecord::Migration[5.2]
  def change
    create_table :plataforms do |t|
      t.string :description

      t.timestamps
    end
  end
end
