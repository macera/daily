class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :copy_new, :destroy, :comments, :good]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @no_comments = @report.comments.any?
    if @no_comments
      @report.comments.order('created_at DESC')
    end
    @comment = @report.comments.build
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
    2.times do
      @report.timereports.build
    end
    @report.public = false
  end

  def copy_new
    @report = @report.copy
    @report.public = false
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_update_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comments
    parameters = comment_params.merge(user_id: current_user.id)
    @comment = @report.comments.new(parameters)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to action: :show, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :show }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /reports/1/good
  def good
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:daily_date, :body, :public, :confidentiality, :rank, :user_id, timereports_attributes: [ :report_id, :time_from, :time_to, :occupation, :remark, :_destroy])
    end

    def report_update_params
      params.require(:report).permit(:daily_date, :body, :public, :confidentiality, :rank, :user_id, timereports_attributes: [ :id, :report_id, :time_from, :time_to, :occupation, :remark, :_destroy])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
