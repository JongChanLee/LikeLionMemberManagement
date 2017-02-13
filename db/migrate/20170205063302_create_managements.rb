class CreateManagements < ActiveRecord::Migration[5.0]
  def change
    create_table :managements do |t|
      t.references :member,   null: false, foreign_key: true
      t.references :user,     null: false, foreign_key: true
      t.text :content,        null: false

      t.timestamps
    end
  end
end
