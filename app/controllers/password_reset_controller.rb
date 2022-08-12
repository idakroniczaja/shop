class PasswordResetController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email:params[:email])
        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_later
        end

        redirect_to root_path, notice: "If an accoutnw it that email was found, we will send link to reset your password."
    end
    
end