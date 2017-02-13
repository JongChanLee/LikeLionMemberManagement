class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name,        null:false
      t.string :cellphone
      t.string :email
      t.references :school,  null: false,     foreign_key: true
      t.string :major,       null: false

      t.timestamps
    end
  end
end
