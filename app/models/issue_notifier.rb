class IssueNotifier < ActiveRecord::Base
  unloadable
  validates_uniqueness_of :user_id, scope: :user_id
end
