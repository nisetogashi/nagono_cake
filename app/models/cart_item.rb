class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    def self.total_price #単数の場合はselfを省略しないといけない
        sum = 0
        self.all.each do |cart| #ここのselfは書いても書かなくてもいい（.allは必要）
            sum += cart.item.price * cart.amount #sum = sum + cart.item.price * cart.amountの省略形
        end
        return sum #returnは記述省略できる。省略した場合、処理の最後の文がreturnになる
    end
end
