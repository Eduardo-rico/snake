#clases necesarias
#agrupar todo referente al modelo 

module Model #modularizar todo, se crean las clases para representar los estados
  class Coordenates < Struct.new(:row, :col)
  end

  class Food < Coordenates #es una subespecializacion de coordenadas, se usa herencia
  end

  class Snake < Struct.new(:positions)
  end

  class Grid < Struct.new(:row, :col)
  end

  class State < Struct.new(:snake, :food, :grid)
  end

  def self.initial_state
    Model::State.new(
        #la clase State tiene 3 propiedades Snake, Coordenates y grid
        Model::Snake.new([
        Model::Food.new(1,1),
        Model::Coordenates.new(0,1)
        ])
        Model::Food.new(4,4)
        Model::Grid.new(8,12)

    )
end