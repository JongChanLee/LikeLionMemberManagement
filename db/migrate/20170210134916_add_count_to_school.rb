class AddCountToSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :users_count, :integer, default: 0
    add_column :schools, :members_count, :integer, default: 0
  end
end
