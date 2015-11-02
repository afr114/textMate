class Message < ActiveRecord::Base
  before_create :send_sms

  private

  def send_sms
    response = RestClient::Request.new(
    :method => :post,
    :url =>
    :user =>
    :password =>
    :payload => { :Body => body,
                  :From => from,
                  :To => to }
    ).execute
  end
end
