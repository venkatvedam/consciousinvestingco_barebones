class AddScoresToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :e, :float
    add_column :profiles, :s, :float
    add_column :profiles, :g, :float
  end
end
