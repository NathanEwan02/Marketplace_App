class TeamsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_auth
    before_action :set_users_and_games, only: [:new, :create, :edit]
    before_action :find_team, only: [:show, :edit, :destroy, :update]

    def index 
        @teams = Team.all
    end

    def show
    end

    def new
        @team = Team.new
    end

    def create 
        p team_params
        @team = Team.new(team_params)
        begin
            @team.save!
            redirect_to @teams
        rescue 
            flash.now[:errors] = @team.errors.messages.values.flatten
            render 'new'
        end
    end

    def edit
    end

    def update
        @team.update!(team_params)
        redirect_to @team
    end

    def destroy
        @team.destroy 
        redirect_to teams_path
    end

    private

    def team_params
        params.require(:team).permit(:name, user_ids: [], game_ids: [])
    end

    def check_auth
        authorize Team
    end

    def find_team
        @team = Team.find(params[:id])
    end

    def set_users_and_games
        @users = User.order(:email)
        @games = Game.order(:name)
    end

end
