class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.text :image
      t.text :hover_image

      t.timestamps
    end
  end
end
