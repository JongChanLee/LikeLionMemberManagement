class AddManagementsCountToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :managements_count, :integer, default: 0
  end
end
