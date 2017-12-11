class AddNotifiers < ActiveRecord::Migration
  def change
    i = IssueCustomField.create(name: 'Approvers', field_format: 'user', is_for_all: true,
                            editable: false, visible: true, multiple: true,
                            format_store: {"user_role"=>[], "edit_tag_style"=>"check_box"}
    )
    i.trackers<< Tracker.all
    #IssueStatus.create(name: 'approved')
  end
end
