<<<<<<< HEAD
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      new_recording = yield
      record(new_recording)
    end
  end

  def play 
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
=======
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      new_recording = yield
      record(new_recording)
    end
  end

  def play 
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
listener.play # Outputs "Hello World!"