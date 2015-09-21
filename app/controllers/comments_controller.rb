class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # def create
  #   @comment = Comment.new(comment_params)

  #   respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to @comment, notice: 'comment was successfully created.' }
  #       format.json { render :show, status: :created, location: @comment }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    target_id = @comment.target.id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to report_path(target_id), notice: 'comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def comment_params
    #   params.require(:comment).permit(:content)
    # end
end
