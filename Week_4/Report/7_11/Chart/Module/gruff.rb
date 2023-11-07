# frozen_string_literal: true

# Module Gruff
module Gruff
  def self.draw_chart_pipe(count_male, count_female)
    g = Gruff::Mini::Pie.new
    g.title = 'Good job !'
    g.data 'Male', count_male
    g.data 'Fimale', count_female
    g.write('mini_pie_keynote.png')
  end
end
