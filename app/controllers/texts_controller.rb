class TextsController <ApplicationController

  def create
    time = parse_time(params["date"])
    warning = (time - 900)
    twilio = TwilioFacade.new(current_user,time)
    expiration_time = twilio.expiration_time
    twilio.initial_text
    twilio.delay(run_at: warning).expiration_text
    redirect_to home_path
  end

  private

  def parse_time(t)
    time = "#{t["time(1i)"]}-#{t["time(2i)"]}-#{t["time(3i)"]} #{t["time(4i)"]}:#{t["time(5i)"]}"
    Time.parse(time)
  end


end
