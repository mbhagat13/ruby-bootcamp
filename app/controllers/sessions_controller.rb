class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else 
            flash.now[:alert] = "Invalid email or passsword"
            render :new     
        end 
    end
end