module Api
  module V1
    class CommentsController < ApplicationController

      before_action :set_comment, only: [:show, :update, :destroy]      

      # GET /api/v1/comments
      def index
        @post_id = params[:post_id]
        @comments = Comment.where(post_id: @post_id)
        render json: @comments
      end

      # GET /api/v1/comments/1
      def show
        render json: @comment
      end

      # POST /api/v1/comments
      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/comments/1
      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
	  
	    # DELETE /api/v1/comments/1
      def destroy
        @comment.destroy      
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_comment
          @comment = Comment.find(params[:id])
        end
      
        # Only allow a trusted parameter "white list" through.
        def comment_params
          params.require(:comment).permit(:comment, :post_id)
        end

    end
  end
end