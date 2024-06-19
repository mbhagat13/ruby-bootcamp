class PasswordResetsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            UserMailer.with(user: @user).reset.deliver_later
        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
    end

    def edit
        token = params[:token]
        token = token.first if token.is_a?(Array) # Handle case where token might be an array
        @user = User.find_signed!(token, purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again"
    end

    def update
        token = params[:token]
        token = token.first if token.is_a?(Array) # Handle case where token might be an array
        @user = User.find_signed!(token, purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "User password was reset successfully. Please sign in"
        else
            render :edit
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
