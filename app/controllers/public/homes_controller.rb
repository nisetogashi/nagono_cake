class Public::HomesController < ApplicationController

   def top
     @items = Item.limit(5)
   end

   def about
   end
end
