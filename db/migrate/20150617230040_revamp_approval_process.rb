class RevampApprovalProcess < ActiveRecord::Migration
  def change
    remove_column :courses, :approved
    remove_column :courses, :published
  end
end
