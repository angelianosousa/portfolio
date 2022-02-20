class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :production_link
      t.string :repository
      t.text :objectives
      t.text :decisions
      t.text :learns

      t.timestamps
    end
  end
end
