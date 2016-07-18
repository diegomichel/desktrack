class Desktop
  def windows_ids
    windows = `xprop -root _NET_CLIENT_LIST`.split(' ')
    windows = windows[4, windows.size]
    windows.each do |window|
      window.gsub!(',','')
    end
  end
  def open_windows
    names = []
    windows_ids.each do |window_id|
      window_info = `xprop -id #{window_id}`.split("\n")
      window_info.select! do |info|
        info.include?('NET_WM_NAME')
      end
      separator_index = window_info.first.index('=') + 2
      name = window_info.first[separator_index, window_info.first.size].strip
      name.gsub!("\"",'')
      names << clean_name(window_info.first)
    end
    names
  end
  def clean_name(name)
    separator_index = name.index('=') + 2
    name = name[separator_index, name.size].strip
    name.gsub!("\"",'')
    name
  end
  def focused_window
    name = `xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) _NET_WM_NAME`
    clean_name(name) if name
  end
end
while true do
  desktop = Desktop.new
  other_windows = desktop.open_windows
  focused_window = desktop.focused_window
  other_windows.delete(focused_window)
  windows = [focused_window] + other_windows
  `mkdir -p ~/data`
  `echo "$(date +'%D'),$(date +'%T'),#{windows.join(',')}" >> ~/data/desktrack.csv`
  sleep 15
end
