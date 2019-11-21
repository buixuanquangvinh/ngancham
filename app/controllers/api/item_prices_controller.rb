class Api::ItemPricesController < ApiController

    def create
        @item_price = ItemPrice.create!(item_price_params)
        return render json: @item_price
    end
    
    def update
        @item_price = ItemPrice.find(params[:id])
        @item_price.update!(item_price_params)
        return render json: @item_price
    end

    def destroy
        @item_price = Item.find(params[:id]).destroy!
        return render json: @item_price
    end

    def item_price_params
        params.permit(:name,:item_id,:price)
    end

end