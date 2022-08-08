class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :reference
      t.integer :access, limit: 1, default: 0

      t.timestamps
    end
  end
end
