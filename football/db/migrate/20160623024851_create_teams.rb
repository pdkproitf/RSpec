class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :location

      t.timestamps null: false
    end
    add_index :teams, :name
  end
end
