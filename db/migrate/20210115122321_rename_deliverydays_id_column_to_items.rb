class RenameDeliverydaysIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :deliverydays_id, :deliveryday_id
  end
end
