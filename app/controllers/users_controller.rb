class UsersController < ApplicationController

    # POST method to create a new user
    def create 
        @user = User.new(user_params, has_changed_username: false)
        if @user.save
            render json: {user: @user, token: token}, status: 201
        else 
            render json: { error: "Username already taken." }, status: 422
        end
    end

    # PUT method to update username
    def update_username
        @user = User.find(params[:id])
        if !user.has_changed_username
            @user.has_changed_username = true;
            @user.username = user_params[:username]
            @user.save
            render status: 200
        else
            render json: { error: "Username already changed once." }, status: 422
        end
    end

    # PUT method to update password
    def update_password
        @user = User.find(params[:id])
        @user.password = user_params[:password];
        @user.save
        render status: 200
    end

    # DELETE method to delete user
    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        render status: 200
    end

    private 

    # User params consisting of a username and a password
    def user_params
        params.require(:user).permit(:username, :password)
    end

end