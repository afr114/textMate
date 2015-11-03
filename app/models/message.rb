class Message < ActiveRecord::Base
  before_create :send_sms

  validates_presence_of :to, :from, :body 

  private

  def send_sms
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/AC05ab324daa7bfaf8c04bd6fb31414ac9/Messages.json',
    :user => ENV['TWILIO_ACCOUNT_SID'],
    :password => ENV['TWILIO_AUTH_TOKEN'],
    :payload => { :Body => body,
                  :To => to,
                  :From => from }
    ).execute
  end
end
