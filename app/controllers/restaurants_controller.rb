class RestaurantsController < ApplicationController
        def index
                @restaurants = Restaurant.all
        end

        def show
                @restaurant = Restaurant.find(params[:id])
                gmap(@restaurant.address)
        end

        def new
                @restaurant = Restaurant.new
        end

        def create
                @restaurant = Restaurant.new(restaurant_params)
                if @restaurant.save
                        flash[:notice] = 'Your restaurant has created'
                        redirect_to @restaurant
                else
                        render action: 'new'
                end
        end

        def edit
                @restaurant = Restaurant.find(params[:id])
        end

        def update
                @restaurant = Restaurant.find(params[:id])
                if @restaurant.update_attributes(restaurant_params)
                        flash[:notice] = 'Your restaurant was updated'
                        redirect_to @restaurant
                else
                        render action: 'new'
                end
        end

        def destroy
                @restaurant = Restaurant.find(params[:id])
                @restaurant.destroy
                redirect_to restaurants_path
                flash[:notice] = 'Your restaurant was deleted'
        end

        def gmap(address)
                formattedAddress = address.gsub(/\s/,'+')
                @gmap = "http://maps.googleapis.com/maps/api/staticmap?center=" + formattedAddress + "&zoom=13&scale=false&size=600x300&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7Ccolor:red%7Clabel:1%7C" + formattedAddress
        end


        private

        def restaurant_params
                params.require(:restaurant).permit(:id, :address, :description, :name, :phone)
        end
end
