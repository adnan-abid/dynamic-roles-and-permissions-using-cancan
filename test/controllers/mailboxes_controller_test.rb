require 'test_helper'

class MailboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get mailbox" do
    get mailboxes_mailbox_url
    assert_response :success
  end

  test "should get compose" do
    get mailboxes_compose_url
    assert_response :success
  end

  test "should get readmail" do
    get mailboxes_readmail_url
    assert_response :success
  end

  test "should get destory" do
    get mailboxes_destory_url
    assert_response :success
  end

end
