class EventsController < ApplicationController


    def index 
        @events = Event.all 
    end 

    def new 
        @event = Event.new
    end 

    def create 
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:success] = "Event created!"
            redirect_to root_url
        else
            render 'new'
        end
    end 

    def show
        @event = Event.find(params[:id])
        @creator = @event.creator
    end 

    private 

        def event_params
            params.require(:event).permit(:name, :description, :dateofevent, :location)
        end


end
