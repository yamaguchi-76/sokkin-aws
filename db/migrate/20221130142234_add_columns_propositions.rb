class AddColumnsPropositions < ActiveRecord::Migration[6.1]
  def up
    add_column :propositions, :unit_price, :integer, comment: '単価/単位month', after: :note
    add_column :propositions, :application_deadline, :datetime, comment: '応募締切', after: :note
  end

  def down
    remove_column :propositions, :unit_price, :integer
    remove_column :propositions, :application_deadline, :datetime
  end
end
