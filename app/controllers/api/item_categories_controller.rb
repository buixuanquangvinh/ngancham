class Api::ItemCategoriesController < ApiController
    def index
        @item_categories = ItemCategory.page params[:page]
        return render json: @item_categories 
    end

    def create
        begin
            @item_category = ItemCategory.create!(item_category_params)
            return render json: @item_category
        rescue => ex
            return render json: ex.message
        end
    end

    def show
        @item_category = ItemCategory.find(params[:id])
        return render json: @item_category 
    end
    
    def update
        begin
            @item_category = ItemCategory.find(params[:id])
            @item_category.update(item_category_params)
            return render json: @item_category
        rescue => ex
            return render json: ex.message
        end
    end

    def destroy
        begin
            @item_category = ItemCategory.find(params[:id]).destroy
            return render json: @item_category 
        rescue => ex
            return render json: ex.message
        end
    end

    def item_category_params
        params.permit(:name,:active,:description,:image)
    end
end