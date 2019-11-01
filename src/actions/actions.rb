module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calular_next_position(state)
        if position_is_valid?(state, next_position)
         move_snake_to(state, next_position)
        else
            end_game(state)
        end

        #verificar que la siguiente casilla es valida
        #si no es valida, termiar el juego
        #si si es valida, mover la serpiente
    end

    private

    def position_is_valid?(state, position)
        #true o false depende si esta en la gilla y que no este superponiendose
        is_invalid = ((position.row > state.grid.row ||
            position.row < 0) || (position.col >= state.grid.cols ||
            position.col < 0))
        return false if is_invalid


       return !(state.snake.positions.include? position)
    end


    def calular_next_position(state)
        current_position = state.snake.positions.first
        case state.next_direction
        when UP 
            #decrementar fila
            #[(poner esta), (1,1), (0,1) <= eliminar esta]
            return Model::Coordinates.new(
                current_position.row -1,
                current_position.col 
            )
        when RIGHT 
            #incrementar columna
            return Model::Coordinates.new(
                current_position.row ,
                current_position.col + 1
            )
        when LEFT 
            #incrementar fila
            return Model::Coordinates.new(
                current_position.row,
                current_position.col - 1
            )
        when DOWN 
            #decrementar columna
            return Model::Coordinates.new(
                current_position.row +1,
                current_position.col 
            )
        end
    end

    def move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state

    end

    def end_game(state)
        state.game_finished = true
    end




end
