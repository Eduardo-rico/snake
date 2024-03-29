module Actions #en los modulos no se pueden declarar metodos de instancia tienen que ser de clase
    def self.move_snake(state)
        next_direction = state.current_direction
        next_position = calular_next_position(state)
        if position_is_food?(state, next_position)
            grow_snake_to(state,next_position)
            generate_food(state)
        elsif position_is_valid?(state, next_position)
         move_snake_to(state, next_position)
        else
            end_game(state)
        end

        #verificar que la siguiente casilla es valida
        #si no es valida, termiar el juego
        #si si es valida, mover la serpiente
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state, direction)
            state.current_direction = direction
        else
            puts "invalid movement, pandeajo"
        end
        state
    end



    
    private

    def self.generate_food(state)
        #usar un numero aleatorio medoto rand parte del objeto object 
        new_food = Model::Food.new(rand(state.grid.row), rand(state.grid.col))

        state.food = new_food
        state
    end


    def self.grow_snake_to(state,next_position)
        new_snake = [next_position] + state.snake.positions
        state.snake.positions = new_snake
        state 
    end

    def self.position_is_food?(state, next_position)
        state.food.row == next_position.row && state.food.col == next_position.col
    end


    def self.next_direction_is_valid?(state, direction)
        case state.current_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        end

        return false
    end

    def self.position_is_valid?(state, position)
        #true o false depende si esta en la gilla y que no este superponiendose
        is_invalid = ((position.row > state.grid.row ||
            position.row < 0) || (position.col >= state.grid.col ||
            position.col < 0))
        return false if is_invalid


       return !(state.snake.positions.include? position)
    end

   
    def self.calular_next_position(state)
        current_position = state.snake.positions.first
        case state.current_direction
        when Model::Direction::UP 
            #decrementar fila
            #[(poner esta), (1,1), (0,1) <= eliminar esta]
            return Model::Coordenates.new(
                current_position.row - 1,
                current_position.col
            )
        when Model::Direction::RIGHT 
            #incrementar columna
            return Model::Coordenates.new(
                current_position.row ,
                current_position.col + 1
            )
        when Model::Direction::LEFT 
            #incrementar fila
            return Model::Coordenates.new(
                current_position.row,
                current_position.col - 1
            )
        when Model::Direction::DOWN 
            #decrementar columna
            return Model::Coordenates.new(
                current_position.row + 1,
                current_position.col
            )
        end
    end

    def self.move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state

    end

    def self.end_game(state)
        state.game_finished = true
    end

    




end
