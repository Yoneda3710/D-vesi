class ProducersController < ApplicationController
  def show
    @name = "#{current_producer.family_name}"+"#{current_producer.first_name}"
    @items = current_producer.items
    @producer = current_producer
  end
end
