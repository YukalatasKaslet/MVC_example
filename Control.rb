require_relative 'model'
require_relative 'view'

class Control

  def initialize(argv_copy)
    @command = argv_copy[0]
    @string = argv_copy[1..-1].join(" ")
    @list = List.new
    @view = View.new
    master
  end#initialize

  def master
    case @command.downcase
    when "index"    then index
    when "delete"   then delete(@string)
    when "add"      then add
    when "complete" then complete(@string)
    end    
  end#master 

  def add
    task = Task.new(@string)
    @list.add(task)
    @view.print_add(task)
  end#add

  def delete(id)
    id = id.to_i - 1
    task = @list.delete(id)
    @view.print_delete(task)
  end#delete

  def index
    @view.print_index(@list.read)
  end#index

  def complete(id)
    id = id.to_i - 1
    @list.complete(id)
    index
  end

 



end#class Control

x = ARGV.map(&:dup)
Control.new(x)