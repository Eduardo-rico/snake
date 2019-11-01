require "ruby2d"

module View
    class Ruby2dView
        def initialize
            @pixel_size = 50 #el tamaño de los pixeles
        end

        def start(state)
            extend Ruby2D::DSL #domain specific lenguage
            set(title: "Snake", 
                width: @pixel_size * state.grid.col, 
                height: @pixel_size * state.grid.row) #se configura la ventada de la app
            show
        end

        
        def render(state)
            render_snake(state)
            render_food(state)
        end

        private
        def render_food(state)
            @food.remove if @food
            extend Ruby2D::DSL
            food = state.food
            @food = Square.new(
                x: food.col * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size,
                color: "yellow"
            )
        end
        
        def render_snake(state)
            @snake_positions.each(&:remove) if @snake_positions  #(&: referencia a un metodo de la variable)
            extend Ruby2D::DSL
            snake = state.snake
            @snake_positions = snake.positions.map do |position|
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