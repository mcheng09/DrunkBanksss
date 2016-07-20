class AddCompletionToVolunteer < ActiveRecord::Migration
  def change
    add_column :volunteers, :complete, :boolean
  end
end
