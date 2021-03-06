class PassportsController < ApplicationController

    def index
        @passports = Passport.all
        render json: @passports, status: :ok
      end
    
      def show
        @passport = Passport.find(params[:id])
        render json: @passport, status: :ok
      end
    
      def create
        @passport = Passport.new(passport_params)
        if @passport.save
          render json: @passport, status: :created
        else
          render json: { errors: @passport.errors.full_messages }, 
          status: :unprocessible_entity
        end
      end

      def update
          @passport = Passport.find(params[:id])
          @passport.update(passport_params)
      end

      def destroy
          @passport = Passport.find(params[:id])
          @passport.destroy
      end 

      def mypassports
        @user = current_user
        # @passports = Passport.all.select {|p| p.user_id == @user.id}
        @passports= @user.passports.collect(&:trip_id).collect { |id| Trip.find(id) }
        render json: @passports, status: :ok
      end
    
      private
    
      def passport_params
        params.permit(:user_id, :trip_id)
      end 
end
