class View
 
  def print_add(task)
    puts "Agregaste la tarea: #{task.string}"
  end

  def print_index(list_array)
    list_array.each_with_index do |task, index|
      if task[1] == "false"
        x = " "
      else
        x = "X"
      end
      puts "#{index + 1}. [#{x}] #{task[0]}"
    end
  end

  def print_delete(task)
    puts "Eliminaste la tarea: #{task[0]}"
  end

end 