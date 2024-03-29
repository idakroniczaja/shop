class RegistrationsController < ApplicationController 
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "You have successfully created an account!"
        else
            flash.now[:alert] = "An error has occured. Please, try again."
            render :new, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end