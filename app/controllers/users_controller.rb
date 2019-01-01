class UsersController <ApplicationController

  def update
    user = User.find(params[:id])
    if params[:commit] == "Save My Number"
      user[:phone_number] = params[:user][:phone_number]
      current_user[:phone_number] = params[:user][:phone_number]
      user.save
      flash[:success] = "Your phone number is now saved."
      redirect_to home_path
    elsif params[:commit] == "Opt Out Of Notifications"
      user.contact = false
      current_user.contact = false
      user.save
      flash[:success] = "You've opted out of text notifications.\nYou can change that at anytime by visiting the dropdown menu."
      redirect_to home_path
    else
      user.toggle :contact
      current_user.toggle :contact
      user.save
      redirect_to home_path
    end
  end


end
