require 'open3'

module HelperMethods
  def text_with_color_code(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
  end

  def red_text(text)
    text_with_color_code(text, 31)
  end

  def yellow_text(text)
    text_with_color_code(text, 33)
  end

  def green_text(text)
    text_with_color_code(text, 32)
  end
  
  def blue_text(text)
    text_with_color_code(text, 34)
  end

  def colored_system(command)
    return_value = nil
    Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
      print "\e[97;44m"
      output = stdout.read.chomp
      print output
      print "\e[0m"
      puts if output.length > 0
       
      return_value = wait_thr.value
    end

    return_value.success?
  end
  
  def notify(message)
    system %{osascript -e 'display notification "#{message}" with title "Oscar iOS"'}
  end
end
