class Api::ItemCategoriesController < ApiController
    def index
        @item_categories = ItemCategory.page params[:page]
        return render json: @item_categories
    end

    def create
        @item_category = ItemCategory.create!(item_category_params)
        return render json: @item_category
    end

    def show
        @item_category = ItemCategory.find(params[:id])
        return render json: @item_category 
    end
    
    def update
        @item_category = ItemCategory.find(params[:id])
        @item_category.update!(item_category_params)
        return render json: @item_category
    end

    def destroy
        @item_category = ItemCategory.find(params[:id]).destroy!
        return render json: @item_category 
    end

    def item_category_params
        params.permit(:name,:active,:description,:image)
    end
end