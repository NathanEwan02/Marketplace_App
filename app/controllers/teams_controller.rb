class TeamsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_auth
    before_action :set_users, only: [:new, :create, :edit]
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

    end

    def edit
    end

    def update
    end

    private

    def team_params
        params.require(:team).permit(:name, user_ids: [])
    end

    def check_auth
        authorize Team
    end

    def find_team
        @team = Team.find(params[:id])
    end

    def set_users
        @users = User.order(:email)
    end

end
