class EventsController < ApplicationController
    before_action :event_params
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
    end

    def edit
    end

    def show
    end

    private

    def event_params
        params.permit(:name, :date, :location, :game_id)
    end

    def find_event
        @event = Event.find(params[:id])
    end

    def set_games
        @games = Game.order(:name)
    end

end
