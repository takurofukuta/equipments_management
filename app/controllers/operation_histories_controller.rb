class OperationHistoriesController < ApplicationController
  before_action :authenticate_user!

  PER_PAGE = 20

  def index
    @q = OperationHistory.ransack(params[:q])
    @operation_histories = @q.result.page(params[:page]).per(PER_PAGE).includes(:operated_user).order(created_at: "DESC")
  end
end
