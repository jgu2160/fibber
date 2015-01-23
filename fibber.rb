class Fibber
  def initialize(printer_type)
    @printer_type = printer_type
    @fib_array = self.fibonacci
  end

	def fibonacci
		i = 1
		f = [0,1]
		for i in (i..10)
			current = f[-2] + f[-1]
			f << current
		end
		f
	end

  def print
    @printer_type.print(@fib_array)
  end
end

class ScreenPrinter
  def print(array)
    puts array.join(" ")
  end
end

class FilePrinter
  def print(array)
    fib_file = File.open("output.txt", "w")
    array.each {|x, index| fib_file << x.to_s + " "}
    fib_file.close
  end
end

screen_printer = ScreenPrinter.new
fibber = Fibber.new(screen_printer)
fibber.print

file_printer = FilePrinter.new
fibber = Fibber.new(file_printer)
fibber.print


