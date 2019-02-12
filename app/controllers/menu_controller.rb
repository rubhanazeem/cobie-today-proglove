class MenuController < ApplicationController
  include MenuHelper

  def today
    response = get_todays_menu
    if response[:success]
      @html = response[:html].to_html
    else
      @html = response[:error]
    end

    respond_to do |format|
      format.html do
        @html = @html
      end

      format.json do
        if response[:success]
          h = {}
          h[:day] = response[:html][0].text
          h[:products] = []
          response[:html][1..-1].each do |node|
            product = {}
            product[:name] = node.search('.cobie-product-name').text
            product[:sup] = node.search('sup').text
            product[:price] = node.search('.price').text
            product[:description] = node.search('.cobie-product-description').text
            h[:products] << product
          end
          render status: :ok, json: h.to_json
        else
          render status: :conflict, json: response[:error].to_json
        end
      end
    end
  end
end
