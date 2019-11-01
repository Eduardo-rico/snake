require "ruby2d"
require_relative "../model/state"

module View
    class Ruby2dView
        def initialize(app)
            @pixel_size = 50 #el tamaño de los pixeles
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL #domain specific lenguage
            set(title: "Snake", 
                width: @pixel_size * state.grid.col, 
                height: @pixel_size * state.grid.row) #se configura la ventada de la app
            on :key_down do |event|
                handle_key_event(event)  
            end


            show
        end

        
        def render(state)
            extend Ruby2D::DSL
            close if state.game_finished
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

        def handle_key_event(event)
            case event.key 
            when "up"
                @app.send_action(:change_direction, Model::Direction::UP)
            when "down"
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when "left"
                @app.send_action(:change_direction, Model::Direction::LEFT)
            when "right"
                @app.send_action(:change_direction, Model::Direction::RIGHT)
            end

        end

    end
end