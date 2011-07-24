class AddAttrToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :suit, :integer
    add_column :portfolios, :inseam, :integer
  end
end
