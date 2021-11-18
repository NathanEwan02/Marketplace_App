class AddManagerToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :manager, null: true, foreign_key: { to_table: :users }
  end
end
