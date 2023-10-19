class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repository_url
      t.string :hosting_url
      t.text :description
      t.string :image_url
      t.boolean :enabled

      t.timestamps
    end
  end
end
