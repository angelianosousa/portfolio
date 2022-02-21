class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :production_link
      t.string :repository_link

      t.timestamps
    end
  end
end
