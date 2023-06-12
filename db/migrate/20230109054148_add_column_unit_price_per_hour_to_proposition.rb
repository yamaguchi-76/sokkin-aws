class AddColumnUnitPricePerHourToProposition < ActiveRecord::Migration[6.1]
  def up
    add_column :propositions, :unit_price_per_hour, :integer, comment: '時給単価'
  end

  def down
    remove_column :propositions, :unit_price_per_hour
  end
end
