class CreatePokes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokes do |t|

      t.timestamps
    end
  end
end
