class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.text :description

      t.timestamps
    end
  end
end
