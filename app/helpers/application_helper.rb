module ApplicationHelper

  def relative_time(start_time)
    diff_seconds = Time.now - start_time
    case diff_seconds
      when 0 .. 59
        puts "#{diff_seconds} seconds ago"
      when 60 .. (3600-1)
        puts "#{diff_seconds/60} minutes ago"
      when 3600 .. (3600*24-1)
        puts "#{diff_seconds/3600} hours ago"
      when (3600*24) .. (3600*24*30)
        puts "#{diff_seconds/(3600*24)} days ago"
      else
        puts start_time.strftime("%m/%d/%Y")
    end
  end

    def summarize(body, length)
      return simple_format(truncate(body.gsub(/<\/?.*?>/,  ""), :length => length)).gsub(/<\/?.*?>/,  "")
    end

    def status_tag(boolean, options={})
      options[:true_text]  ||= ''
      options[:false_text] ||= ''

      if boolean
        content_tag(:span, options[:true_text], :class => 'status true')
      else
        content_tag(:span, options[:false_text], :class => 'status false')
      end
    end

end
