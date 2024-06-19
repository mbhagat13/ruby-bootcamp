class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Password.subject
  #
  def Password
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset.subject
  #
  def reset
    @token = [params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)]
    params[:user]
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
