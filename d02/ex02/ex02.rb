class Dup_file < StandardError
  def show_state(filename)
    puts "A file named #{filename}.html already exist there: #{File.expand_path(filename)}.html"

  end

  def correct(filename)
    begin
      raise Dup_file
    rescue
      if !File.owned?("#{filename}.html")
        return filename
      else
        show_state(filename)
        return correct(filename + ".new")
      end
    end
  end


  def explain(filename)
    puts ".new added to the name of the file: #{File.expand_path(filename)}.html"
  end
end

class Body_closed < StandardError
  def show_state(filename)
    puts "In #{filename}.html body was closed: "
  end

  def correct(filename, str)
    begin
      raise Body_closed
    rescue
      data = File.read("#{filename}.html")
      filtered_data = data.gsub("</body>", "<p>#{str}</p>")
      File.open("#{filename}.html", "w") do |f|
        f.write(filtered_data)
        f.write("</body>\n")
      end
    end
  end

  def explain(index)
    puts "> ln: #{index} </body> : text has been inserted and tag moved at the end of it."
  end
end

class Html
  attr_reader :page_name

  def initialize (filename)
    @page_name = filename
    if File.owned?("#{@page_name}.html") || File.owned?("#{@page_name}.new.hmtl")
      dup_file = Dup_file.new
      @page_name = dup_file.correct(filename)
      dup_file.explain(@page_name)
    end
    head
  end

  def head
    File.open("#{@page_name}.html", "w") do |file|
      file << "<!DOCTYPE html>\n<html>\n<head>\n<title>#{@page_name}</title>\n</head>\n<body>\n"
    end
  end

  def dump(str)
    i = 0
    index = 0
    File.open("#{@page_name}.html", "a+") do |file|
      file.each_line do |line|
        index += 1
        if line =~ /<body.*>/i
          i = 1
        elsif line =~ /<\/body>/
          i = 2
          body_closed = Body_closed.new
          body_closed.show_state(@page_name)
          body_closed.correct(@page_name, str)
          body_closed.explain(index)
          return
        end
      end
      if i == 0
        raise "There is no body tag in #{@page_name}"
      end
      file << "<p>#{str}</p>\n"
    end
  end

  def finish
    File.open("#{@page_name}.html", "a+") do |file|
      file.each_line do |line|
        if line =~ /<\/body>/
          raise "#{@page_name} has already been closed"
        end
      end
      file << "</body>\n"
    end
  end
end


if $PROGRAM_NAME == __FILE__
  a = Html.new("test")
  a.dump("je marche")
  a.finish
  a.dump("je marche")
end

