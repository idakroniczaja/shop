class PasswordResetController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(email:params[:email])
        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_later
        end

        redirect_to root_path, notice: "If an accoutn it that email was found, we will send link to reset your password."
    end

    def edit 
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
    rescue ActiveSupport::MessageVerifier::InvalidSignature 
        redirect_to sign_in_path, alert: 'Your token has expired, please try again.'
    end

    def update 
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
            redirect_to sign_in_path, notice: 'Your password was reset successfully.'
        else 
            render :edit, status: :unprocessable_entity 
        end
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end