class Api::ItemsController < ApiController
    
    def index
        @items = Item.page params[:page]
        return render json: @items
    end

    def create
        begin
            @item = Item.create!(item_params)
            if(@item && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @item.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Tạo bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def show
        @item = Item.find(params[:id])
        return render json: @item
    end
    
    def update
        begin
            @news = Item.find(params[:id])
            @news.update(news_params)
            @news.update(updated_by_id: current_user.id)
            if(@news && params[:photos])
                params[:photos]['image'].each do |a|
                    @photo = @news.photos.create!(:image => a)
                end
            end
            flash[:success] = 'Lưu bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def destroy
        begin
            @news = Item.find(params[:id]).destroy
            flash[:success] = 'Xoá bài đăng thành công'
            redirect_to action: :index
        rescue => ex
            flash[:error] = ex.message
            redirect_back fallback_location: root_path
        end
    end

    def news_params
        params.require(:item).permit(
            :name,
            :item_category_id,
            :description,
            :content,
            :active,
            :highlight,
            :image,
            :image_cache,
            photos_attributes: [:id, :image, :item_id])
    end

end