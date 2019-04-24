class SessionsController < ApplicationController
    include ApplicationHelper 

    def new 
    end 

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user
            log_in user
            # remember user
            flash[:success] = "Successfully logged in"
            redirect_to root_url
        else
            flash.now[:danger] = 'No registered user with that email'
            render 'new'
        end
    end 

    def destroy 
        log_out if logged_in?
    end 

end
