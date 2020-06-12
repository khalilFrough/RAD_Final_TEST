class AddAttributeToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :value, :string
    add_column :cities, :abbr, :string
    add_column :cities, :isdst, :boolean
    add_column :cities, :text, :string
    add_column :cities, :utc, :string
  end
end
