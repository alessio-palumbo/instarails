class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_photo

  # GET /comments
  # GET /comments.json
  def index
    # comments = Comments.where(photo: @photo)
    @comments = @photo.comments
    @new_comment = Comment.new
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comments = Comment.all
    @new_comment = Comment.new(comment_params)
    @new_comment.user = current_user
    @new_comment.photo = @photo

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to photo_comments_url(@photo), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @new_comment }
      else # Validation error
        format.html { render :index }
        format.json { render json: @new_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to photo_comments_url(@photo), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to photo_comments_url(@photo), notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:photo_id, :user_id, :content)
    end
end
