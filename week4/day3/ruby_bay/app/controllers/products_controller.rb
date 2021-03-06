class ProductsController < ApplicationController
	def index
		# if params[:user_id]
			@user = User.by_id params[:user_id]
			@products = @user.products.order(title: :desc).limit(10)
		# else
		# 	@products = Product.order(title: :desc).limit(10)
		# end

	end

	def new
		@user = User.by_id params[:user_id]
		@product = @user.products.new
	end

	def create
		@user = User.by_id params[:user_id]
		@product = @user.products.new(product_params)
		if @product.save
			flash[:notice] = "Product created successfully"
			redirect_to user_products_path
		else
			flash[:alert] = "Error creating product"
			render "new"
		end
	end

	def show
		@user = User.by_id params[:user_id]
		@product = @user.products.find params[:id]
		@bids = @product.bids.order(created_at: :desc).limit(10)
	end

	def destroy
		Product.destroy params[:id]
		redirect_to :action => "index"
	end

	def edit
		@user = User.by_id params[:user_id]
		@product = @user.products.find params[:id]
	end

	def update
		@user = User.by_id params[:user_id]
		@product = @user.products.find params[:id]

		if @product.update(product_params)
			flash[:notice] = "Product updated successfully"
			redirect_to user_product_path
		else
			flash[:alert] = "Error updating product"
			render "edit"
		end
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end
end
