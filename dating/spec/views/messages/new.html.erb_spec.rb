require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :sender_id => 1,
      :recipient_id => 1,
      :time => "",
      :read => false,
      :type => "",
      :message => "MyText"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_sender_id", :name => "message[sender_id]"
      assert_select "input#message_recipient_id", :name => "message[recipient_id]"
      assert_select "input#message_time", :name => "message[time]"
      assert_select "input#message_read", :name => "message[read]"
      assert_select "input#message_type", :name => "message[type]"
      assert_select "textarea#message_message", :name => "message[message]"
    end
  end
end
