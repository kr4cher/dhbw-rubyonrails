class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.belongs_to :laboratory, index: true, foreign_key: false

      t.timestamps
    end
  end
end
