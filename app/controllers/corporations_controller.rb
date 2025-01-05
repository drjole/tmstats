class CorporationsController < ApplicationController
  def show
    @corporation = Corporation.find(params[:id])
    authorize @corporation
  end
end
