class Html
  attr_reader :page_name

  def initialize (filename)
    @page_name = filename
    if File.owned?("#{@page_name}.html")
     raise "A file named #{@page_name}.html already exist!"
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
    File.open("#{@page_name}.html", "a+") do |file|
      file.each_line do |line|
        if line =~ /<body.*>/i
          i = 1
        elsif line =~ /<\/body.*>/i
          i = 2
        end
      end
      if i == 0
        raise "There is no body tag in #{@page_name}"
      elsif i == 2
        raise "Body has already been closed in #{@page_name}"
      end
      file << "<p>#{str}</p>\n"
    end
  end

  def finish
    File.open("#{@page_name}.html", "a+") do |file|
      file.each_line do |line|
        if line =~ /<\/body.*>/i
          raise "#{@page_name} has already been closed"
        end
      end
      file << "</body>\n"
    end
  end
end


  if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    a.dump("str")
    a.finish
    a.finish
  end

  if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    a.dump("titi")
    a.finish
  end
  if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    a.finish
    a.dump("titi")
  end
  if $PROGRAM_NAME == __FILE__
    a = Html.new("test")
    a.dump("titi")
    a.finish
  end

