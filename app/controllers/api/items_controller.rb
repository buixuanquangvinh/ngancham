class Api::ItemsController < ApiController
    
    def index
        @items = Item.page params[:page]
        return render json: @items
    end

    def create
        @item = Item.create!(item_params)
        return render json: @item
    end

    def show
        @item = Item.find(params[:id])
        return render json: @item, include: ['item_prices']
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update!(item_params)
        return render json: @item
    end

    def destroy
        @item = Item.find(params[:id]).destroy!
        return render json: @item
    end

    def item_params
        params.permit(:name,:item_category_id,:description,:active,:highlight,:image)
    end

end