class UsersController < ApplicationController

      
        def index
          @users = User.all
          render json: @users, status: :ok
        end
      
        def show
          @user = User.find(params[:id])
          render json: @user, status: :ok
        end
      
        def create
          @user = User.new(user_params)
          if @user.save
            render json: @user, status: :created
          else
            render json: { errors: @user.errors.full_messages }, 
            status: :unprocessible_entity
          end
        end

        def update
            @user = User.find(params[:id])
            @user.update(user_params)
        end

        def destroy
            @user = User.find(params[:id])
            @user.destroy
        end 
      
        private
      
        def user_params
          params.permit(:name, :image_url, :password, :email, :phone, :location)
        end      
      
end
