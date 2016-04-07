require 'csv'

class Task
    attr_reader :string
    attr_accessor :status

    def initialize(string, status = false)
      @string = string
      @status = status
    end#initialize


end#class Task

class List

    def initialize(list_name = "Lista.csv")
        @list_name = list_name
        @elements = [] 
    end#initialize 
    
    def read
        @elements = CSV.read(@list_name)
    end#read

    def create_csv
        CSV.open(@list_name, "wb") do |csv|
          @elements.each do |task|
            csv << [task[0], task[1]]
          end#each
        end#CSV
    end#mtd create_csv

    def add(task)
        CSV.open(@list_name, "a+") do |csv|
          csv << [task.string, task.status]
        end#CSV
    end#mtd list_add

    def delete(index)
        elements = read
        @elements = []
        string = []
        elements.each_with_index do |task, i|
          if i != index
            @elements << task
          else
            string = task
          end
        end
        create_csv
        string
    end#mtd list_delete

    def complete(index)
        read
        @elements.each_with_index do |task, i|
          if index == i
              task[1] = true
          end#if
        end#elements
        create_csv
    end#complete


end#class List


