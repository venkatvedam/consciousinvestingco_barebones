class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.text :ticker
      t.string :description
      t.float :total_esg
      t.float :e
      t.float :s
      t.float :g

      t.timestamps null: false
    end
  end
end
