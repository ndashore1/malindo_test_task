# frozen_string_literal: true

# Manages display/search operation related to User Information.
class UserInformationsController < ApplicationController
  # Renders user information.
  #
  # @verb Get
  #
  # @accepts HTML
  def show
    @user_information = UserInformation.find_by(id: params[:user_information_id])
  end

  # Searches <tt>Email</tt> for with combination of name and url.
  #
  # @verb Post
  #
  # @accepts HTML
  def search
    user_information = EmailFinder.call(user_information_params)
    if user_information.persisted?
      redirect_to(root_path(user_information_id: user_information.id))
    else
      redirect_to(root_path, alert: user_information.errors.full_messages.join(', '))
    end
  end

  private

  # Whitelisting params of <tt>UserInformation</tt>.
  def user_information_params
    params.require(:user_information).permit(:first_name, :last_name, :url)
  end
end
