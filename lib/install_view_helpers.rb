module InstallViewHelpers
  def header
    <<-HEADER 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Blorgh Install</title>
    <link rel='stylesheet' href='/stylesheets/install.css'>
  </head>
  <body>
HEADER
  end

  def footer
    <<-FOOTER
  </body>
</html>
    FOOTER
  end
  
  def backtrace(trace)
    trace = trace.map { |trace| trace.split(":") }
    @cycle = "odd"
    output = "<table id='stacktrace'>
    <thead>
      <tr>
        <td>File</td>
        <td>Line</td>
        <td>Method</td>
      </tr>
    </thead>
    <tbody>"
    for line in trace
      output << "<tr class='#{@cycle}'>
        <td>#{line[0]}</td>
        <td>#{line[1]}</td>
        <td>#{line[2]}</td>
      </tr>"
      @cycle = (@cycle == "odd" ? "even" : "odd")
    end
    
    output << "</tbody>
    </table>"
    
    output
  end
end