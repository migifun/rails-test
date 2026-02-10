class CreateReceptions < ActiveRecord::Migration[8.1]
  def change
    create_table :receptions do |t|
      t.string :name
      t.string :company
      t.string :purpose

      t.timestamps
    end
  end
end
