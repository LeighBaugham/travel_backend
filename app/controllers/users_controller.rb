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
        
          @user = User.create(user_params)
          if @user
              # render json: @user, status: :ok
              token = JWT.encode(@user.id.to_s, 's3cr3t', 'HS512')
              render json: {token: token, user: @user }, status: :ok
          else
              render json: {errors: @user.errors.full_messages},
              status: :unprocessable_entity
          end 
      end 

      def profile
        render json: current_user.to_custom_json
      end

    #   def login
    #     @user = User.find_by(name: params[:name])
    #     if @user && @user.authenticate(params[:password])
    #         token = JWT.encode(@user.id.to_s, 's3cr3t', 'HS512')
    #         render json: {token: token, user: @user, id: @user.id }, status: :ok
    #     else 
    #         render json: {error: "User name or password not valid"}, status: :unauthorized
    #     end
    # end

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
