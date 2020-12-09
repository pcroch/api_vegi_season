class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :kind
      t.string :months_available

      t.timestamps
    end
  end
end
