require 'open3'

def download_video(url, output_path)
  # Use youtube-dl to download the video
  command = "youtube-dl --verbose -o '#{output_path}' '#{url}'"

  # Open3.popen3 allows capturing stdout and stderr in real-time
  Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
    # Read stdout and stderr in real-time
    stdout_thread = Thread.new { stdout.each_line { |line| puts line } }
    stderr_thread = Thread.new { stderr.each_line { |line| puts line } }

    # Wait for the command to finish
    exit_status = wait_thr.value

    # Join threads to ensure all output is printed
    stdout_thread.join
    stderr_thread.join

    if exit_status.success?
      puts "Video downloaded successfully!"
    else
      puts "Error downloading video."
    end
  end
end

# Example usage
url = "https://www.youtube.com/watch?v=F-fKvM6kTHI"
output_path = "/Users/elchu/Downloads/downloaded_video(1).mp4"

download_video(url, output_path)
