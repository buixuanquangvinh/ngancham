class Cms::ItemCategoriesController < CmsController
    def index
        @item_categories = ItemCategory.page params[:page]
    end

    def new
        @item_category = ItemCategory.new
    end

    def create
        begin
            ItemCategory.create!(item_category_params)
            flash[:success] = 'Tạo Catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @item_category = ItemCategory.find(params[:id])
    end
    
    def update
        begin
            @item_category = ItemCategory.find(params[:id])
            @item_category.update(item_category_params)
            flash[:success] = 'Lưu catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            puts params[:id]
            ItemCategory.find(params[:id]).destroy
            flash[:success] = 'Xoá catalog thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def item_category_params
        params.require(:item_category).permit(:name,:active,:description,:image,:image_cache)
    end
end