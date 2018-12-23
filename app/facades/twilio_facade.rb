class TwilioFacade
  def initialize(current_user,time)
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @name = current_user.name
    @number = current_user.phone_number
    @time = time
  end

  def initial_text
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: @number,
      body: initial_message)
  end

  def expiration_text
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: @number,
      body: expiration_message)
  end

  def initial_message
    "#{@name}, thank you for using ParQueen. We will notify you fifteen minutes before your parking expires."
  end

  def expiration_message
    "Your parking will expire in 15 minutes. You have until #{expiration_time} to move your vehicle."
  end

  def expiration_time
    @time.strftime("%I:%M%p")
  end
end
