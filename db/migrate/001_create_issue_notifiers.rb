class CreateIssueNotifiers < ActiveRecord::Migration
  def change
    create_table :issue_notifiers do |t|
      t.integer :user_id
      t.integer :issue_id
      t.integer :choice

      t.timestamp
    end
  end
end
