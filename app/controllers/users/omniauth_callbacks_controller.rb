module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def google_oauth2
      user = GoogleUserAuthorizer.find_or_create!(omniauth_data)
      flash.clear
      sign_in_and_redirect(user, :event => :authentication)
    rescue GoogleUserAuthorizer::UnacceptableDomainError => e
      flash[:alert] = "You must log in from an @appfolio.com address"
      redirect_to new_user_session_path
    end

    private

    def omniauth_data
      request.env["omniauth.auth"]
    end

    class UnacceptableDomainError < StandardError; end
  end
end
