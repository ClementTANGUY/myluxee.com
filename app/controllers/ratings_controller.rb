class RatingsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_sales_associate
  def new
    @rating = Rating.new
  end

  def create
    @rating = @sales_associate.ratings.build(rating_params)
    @rating.account = current_account

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @sales_associate }
      else
        format.html { render :new }
      end
    end
  end

  private
  def set_sales_associate
    @sales_associate = SalesAssociate.find(params[:sales_associate_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:grader_id, :graded_id, :welcome_score, :appearance_score, :knowledge_score,
                                    :listening_score, :global_score, :description)
  end
end
