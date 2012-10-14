class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :state
      t.string :county
      t.string :district

      t.timestamps
    end
  end
end
