class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.belongs_to :doctor, index: true, foreign_key: false

      t.timestamps
    end
  end
end
