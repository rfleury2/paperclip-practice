class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
  end

  def create
    team = Team.create(team_params)
    if team.valid?
      redirect_to teams_path
    else
      @errors = team.errors
      render 'new'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :city, :country, :coach, :shield)
  end
end
