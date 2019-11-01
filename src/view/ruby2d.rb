require "ruby2d"

module View
    class Ruby2dView
        def initialize
            @pixel_size = 50 #el tamaño de los pixeles
        end
        
        def render(state)
            extend Ruby2D::DSL #domain specific lenguage
            set(title: "Snake", 
                width: @pixel_size * state.grid.col, 
                height: @pixel_size * state.grid.row) #se configura la ventada de la app
            render_snake(state)
            render_food(state)
            show
        end

        private
        def render_food(state)
            extend Ruby2D::DSL
            food = state.food
            Square.new(
                x: food.col * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size,
                color: "yellow"
            )
        end
        
        def render_snake(state)
            extend Ruby2D::DSL
            snake = state.snake
            snake.positions.each do |position|
            Square.new(
                x: position.col * @pixel_size,
                y: position.row * @pixel_size,
                size: @pixel_size,
                color: "green"
            )
            end #se cierra el each do
        end

    end
end