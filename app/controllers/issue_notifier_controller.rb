class IssueNotifierController < ApplicationController
  before_filter :require_login

  unloadable

  def create
    @issue = Issue.find params[:issue_id]
    cfv = @issue.custom_field_values.detect{|cfv| cfv.custom_field.name == 'Approvers'}
    if cfv.values.includes?(User.current.id.to_s)
      IssueNotifier.create(issue_id: @issue.id,
                           user_id: User.current.id,
                           choice: params[:choice])
    else
      render_403
    end

  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
