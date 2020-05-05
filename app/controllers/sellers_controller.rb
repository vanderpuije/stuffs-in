class SellersController < ApplicationController
		before_action :require_admin, only: [:destroy]
	
	def index
		@sellers = Seller.paginate(page: params[:page],per_page: 5)
	end

	def show
		@seller = Seller.find(params[:id])
		@seller_products = @seller.products.paginate(page: params[:page],per_page: 5)
	end 

	def destroy
		@seller = Seller.find(params[:id])
		@seller.destroy
		flash[:danger] = "Seller and all products created by the seller have been deleted"
		redirect_to sellers_path
	end

	def require_admin
		if seller_signed_in? and !current_seller.admin?
		flash[:danger] = "Only admin users can perform that action"
		redirect_to root_path
	end
	end

end
