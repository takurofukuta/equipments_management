class LendingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lendings = Lending.all
  end

  def lendings_history
  end
end
