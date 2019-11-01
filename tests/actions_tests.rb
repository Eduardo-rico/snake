require "minitest/autorun"
require_relative "../src/actions/actions"
require_relative "../src/model/state"

class ActionTest < Minitest::Test
    def test_move_snake
        initial_state = Model::State.new(
            #la clase State tiene 3 propiedades Snake, Coordenates y grid
            Model::Snake.new([
                Model::Coordenates.new(1,1),
                Model::Coordenates.new(0,1)
                #la clase snake tiene dos coordenadas, porque 2D...
            ]),
            Model::Food.new(4,4), #comida hereda de coordenada
            Model::Grid.new(8,12), #solo tiene filas y columnas
            Model::Direction:: DOWN,
            false 
    
        )

        expectet_state = Model::State.new(
            #la clase State tiene 3 propiedades Snake, Coordenates y grid
            Model::Snake.new([
                Model::Coordenates.new(2,1),
                Model::Coordenates.new(1,1)
                #la clase snake tiene dos coordenadas, porque 2D...
            ]),
            Model::Food.new(4,4), #comida hereda de coordenada
            Model::Grid.new(8,12), #solo tiene filas y columnas
            Model::Direction:: DOWN,
            false 
    
        )

        actual_state = Actions::move_snake(initial_state)
        assert_equal actual_state, expectet_state
    end


end
