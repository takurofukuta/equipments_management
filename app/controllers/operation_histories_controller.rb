class OperationHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @operation_histories = OperationHistory.all
  end
end
