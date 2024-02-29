class CreateEightballs < ActiveRecord::Migration[7.1]
  def change
    create_table :eightballs do |t|
      t.number :hat_type
      t.number :color_id
      t.references :user, null: false, foreign_key: true
    end
  end
end
