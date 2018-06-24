class MailboxesController < ApplicationController
  before_action :authenticate_user!
  layout :resolve_layout
  def mailbox
  end

  def compose
  end

  def readmail
  end

  def destory
  end
  private
  def resolve_layout
    case action_name
    when "mailbox"
      "mailboxes"
    else
      "mailboxes"
    end
  end
end
