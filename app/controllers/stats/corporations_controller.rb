class Stats::CorporationsController < ApplicationController
  def show
    authorize [:stats, :corporations]
    @corporations = Corporation.all
    @service = CorporationStatsService.new(@corporations)
    @corporations = @corporations.to_a
    @corporations.sort_by!(&:name) if params[:sort] == "name"
    @corporations.sort_by!(&@service.send(params[:sort])) if params[:sort].present? && CorporationStatsService.instance_methods.include?(params[:sort].to_sym)
    @corporations.reverse! if params[:dir] == "desc"
  end
end
