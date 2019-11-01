#clases necesarias
#agrupar todo referente al modelo 

module Model #modularizar todo, se crean las clases para representar los estados
    module Direction
        UP = :up 
        RIGHT = :right
        LEFT = :left 
        DOWN = :down
    end



  class Coordenates < Struct.new(:row, :col) #las propiedades, las variables son simbolos (o strings), para que el Struct declare propiedades
  end

  class Food < Coordenates #es una subespecializacion de coordenadas, se usa herencia
  end

  class Snake < Struct.new(:positions)
  end

  class Grid < Struct.new(:row, :col)
  end

  class State < Struct.new(:snake, :food, :grid, :next_direction, :game_finished)
  end

  def self.initial_state #devuelve el estado inicial de la aplicacion, para darselo a render para que lo pinte
    Model::State.new(
        #la clase State tiene 3 propiedades Snake, Coordenates y grid
        Model::Snake.new([
            Model::Coordenates.new(1,1),
            Model::Coordenates.new(0,1)
            #la clase snake tiene dos coordenadas, porque 2D...
        ]),
        Model::Food.new(4,4), #comida hereda de coordenada
        Model::Grid.new(8,12), #solo tiene filas y columnas
        Direction:: DOWN,
        false 

    )
  end
end