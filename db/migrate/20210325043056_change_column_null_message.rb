class ChangeColumnNullMessage < ActiveRecord::Migration[6.0]
  def change
    change_column_null :messages, :text, false
  end
end
