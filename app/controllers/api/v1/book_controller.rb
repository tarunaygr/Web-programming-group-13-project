module Api
    module V1
        class BookController < ApplicationController
            def index
               book=Book.order('created_at DESC') 
               render json: {status: "SUCCESS",message:"Loaded Books",data:book},status: :ok
            end

            def show
                book=Book.find(params[:id])
                render json: {status: "SUCCESS",message:"Loaded Book",data:book},status: :ok
            end

            def create
                book=Book.new(book_params)

                if book.save
                    render json: {status: "SUCCESS",message:"Saved Book",data:book},status: :ok

                else
                    render json: {status: "ERROR",message:"Not Saved",data:book.errors},status: :unprocessable_entry
                end
            end

            def destroy
                book=Book.find(params[:id])
                book.destroy
                render json: {status: "SUCCESS",message:"Deleted Book",data:book},status: :ok

            end

            def update
                book=Book.find(params[:id])
                if book.update(book_params)
                    render json: {status: "SUCCESS",message:"Updated Book",data:book},status: :ok
                else
                    render json: {status: "ERROR",message:"Not Updated",data:book},status: :unprocessable_entity
                end

            end
            private

            def book_params
                params.permit(:B_id,:B_title,:Author,:Publisher,:Year)
            end
        end
    end
end