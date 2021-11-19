class TeamsController < ApplicationController
    before_action :authenticate_user!
    #before_action :check_auth
    before_action :set_games, only: [:new, :create, :edit]
    before_action :users_without_team, only: [:new, :create]
    before_action :users_in_or_without_team, only: [:edit]
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
        @team = Team.new(team_params)
        begin
            @team.save!
            redirect_to @team
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
        params.require(:team).permit(:name, :manager_id, user_ids: [], game_ids: [])
    end

    def check_auth
        authorize Team
    end

    def find_team
        @team = Team.find(params[:id])
        authorize @team
    end

    def set_games
        @games = Game.order(:name)
    end

    def users_without_team
        @users = User.where(team_id: nil).order(:email)
    end

    def users_in_or_without_team
        find_team
        @users = User.where(team_id: nil).or(User.where(team_id: @team)).order(:email)
    end
end
