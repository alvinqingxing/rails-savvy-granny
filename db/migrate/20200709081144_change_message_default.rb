class ChangeMessageDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :messages, :read, false
  end
end
