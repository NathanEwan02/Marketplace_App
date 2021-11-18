class AddCreatorToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :creator, null: true, foreign_key: { tn_table: :users }
  end
end
