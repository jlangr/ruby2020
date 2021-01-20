class X

  def do_stuff
    # code here
  end
end

class DiagError < StandardError
  def initialize(msg="")
    super
  end
end

class TargetClass
  def ugly_method
    # stuff a
    # ...

    # stuff b
    # ...

    # some smaller behavior
    x = X.new
    x.do_stuff

    # stuff c
    # ...
  end

  def do_diag_op
    raise DiagError.new("because")
  end

  def log(msg)
    puts(msg)
  end

  System = "ABC-Orders"
  Module = "PrintMod"

  def handle_something
    begin
      do_diag_op
    rescue DiagError => e
      errMsg = "#{Time.now}: #{System}-#{Module} ERROR #{e.msg.truncate(80)}"
      log(errMsg)
      raise StandardError.new(errMsg)
    end
  end

  def handle_something_else
    begin
      do_diag_op
    rescue DiagError => e
      errMsg = formatted_error_message(e)
      log(errMsg)
      raise StandardError.new(errMsg)
    end
  end

  def handle_repetition
    begin
      do_diag_op
    rescue DiagError => e
      puts "RESCUE"
      log_and_rethrow(e, self.method(:log_to_file))
    end
  end

  def log_to_file(msg)
    "#{Time.now}: #{System}-#{Module} ERROR #{msg.truncate(80)}"
  end

  def log_to_console(msg)
    "#{Time.now}: #{System}-#{Module} ERROR #{msg}"
  end

  private

  def log_and_rethrow(e, format)
    puts "LOG AND RETHROW >#{e.msg}<"
    err_msg = format.call(e.msg)

    puts "LOGGING"
    log(err_msg)
    raise StandardError.new(err_msg)
  end

  def formatted_error_message(e)
    "#{Time.now}: #{System}-#{Module} ERROR #{e.msg.truncate(80)}"
  end
end

class TargetClassRefactored
  def ugly_method
    # stuff a
    # ...

    # stuff b
    # ...

    do_some_smaller_behavior

    # stuff c
    # ...
  end

  def do_some_smaller_behavior
    x = X.new
    x.do_stuff
  end
end