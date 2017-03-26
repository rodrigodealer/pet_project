class RemoveValueAndChangePeriodFromPlans < ActiveRecord::Migration[5.0]
  def change
    change_column :plans, :period, :string
    remove_column :plans, :value
  end
end
