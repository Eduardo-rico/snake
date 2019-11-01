#clases necesarias
#agrupar todo referente al modelo 

module Model
  class Coordenates < Struct.new(:row, :col)
  end
  class Food < Coordenates
  end
  class Snake < Struct.new(:positions)
  end
  class Grid < Struct.new(:row, :col)
  end
  class State < Struct.new(:snake, :food, :grid)
  end
  def self.initial_state
    Model::State.new(
        Model::Snake.new([
            Model::Coordenates.new(1,1),
            Model::Coordenates.new(0,1)
        ])
        Model::Food.new(4,4)
        Model::Grid.new(8,12)

    )
end