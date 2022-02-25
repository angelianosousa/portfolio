class CreateProfessionalCarreers < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_carreers do |t|
      t.date :start_date
      t.date :end_date
      t.string :occupation
      t.text :description

      t.timestamps
    end
  end
end
