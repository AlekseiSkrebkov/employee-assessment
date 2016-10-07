class CompetenciesController < ApplicationController
  respond_to :json

  def index
    Competency.all
  end
end
