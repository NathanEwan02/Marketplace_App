class EventsController < ApplicationController
    before_action :authenticate_user!
    #before_action :check_auth
    before_action :set_games, only: [:new, :create, :edit]
    before_action :find_event, only: [:show, :edit, :destroy, :update]

    def index 
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create 
        @event = Event.new(event_params)
        begin
            @event.save!
            redirect_to @event
        rescue 
            flash.now[:errors] = @event.errors.messages.values.flatten
            render 'new'
        end
    end

    def update
        @event.update!(event_params)
        redirect_to @event
    end

    def edit
    end

    def show
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:name, :image, :creator_id, :date, :location, :game_id)
    end

    def find_event
        @event = Event.find(params[:id])
        authorize @event
    end

    def set_games
        @games = Game.order(:name)
    end

    def check_auth
        authorize Event
    end
end
