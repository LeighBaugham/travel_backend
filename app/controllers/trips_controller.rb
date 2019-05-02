class TripsController < ApplicationController
      
        def index
          @trips = Trip.all
          render json: @trips, status: :ok
        end
      
        def show
          @trip = Trip.find(params[:id])
          render json: @trip, status: :ok
        end
      
        def create
          @trip = Trip.new(trip_params)
          if @trip.save
            render json: @trip, status: :created
          else
            render json: { errors: @trip.errors.full_messages }, 
            status: :unprocessible_entity
          end
        end

        def update
            @trip = Trip.find(params[:id])
            @trip.update(trip_params)
        end

        def destroy
            @trip = Trip.find(params[:id])
            @trip.destroy
            render json: @trip, status: :ok
        end 
      
        private
      
        def trip_params
          params.permit(:date, :description, :location, :hotel, :schedule, :transportation, :user_id)
        end      
      

end
