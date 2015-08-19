require_relative 'edge_list'

class AdjacencyMatrix

  def initialize(edge_list, num_of_person = 5)

    # default num of people is 5
    @num_of_person = num_of_person

    # create array to print weights as 5x5
    @arr = Array.new(@num_of_person) { Array.new(@num_of_person) }
    
    @people = Array.new(@num_of_person)
    build_array(edge_list)
  end

  def build_array(el)

    # build a table of weights
    el.list.each do |edge|
      row = edge[0].id
      col = edge[1].id
      @arr[row][col] = edge[2]
      @arr[col][row] = edge[2]
      @people[row] ||= edge[0].name
      @people[col] ||= edge[1].name
    end

  end

  # search for individual weights
  def edge_weight(id_1, id_2)
    @arr[id_1][id_2]
  end

  def print_matrix
    # space for formatting
    space = " "
    printf "%-8s", space
    @people.each {|name| printf "%12s", name}
    print "\n"
    @arr.each_with_index do |row, index|
      unless @people[index].nil?

          printf "%-8s", @people[index]

          row.each_with_index do |ele, index| 
            unless @people[index].nil?
              printf "%12s", row[index] ||= "X"
            end
          end
          
          print "\n"
      end

    end

  end
end