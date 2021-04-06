class SessionsController < ApplicationController

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user
            login!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ["Invalid credentails"]
            render :new
        end
    end

    def new
        render :new
    end

    def destroy
        logout!
        flash[:success] = ["Successfully logged out."]
        redirect_to new_session_url
    end

end