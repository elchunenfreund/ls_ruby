require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_f.to_s == num
end

def float?(num)
  num.to_i.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = gets.chomp
loop do
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello my friend #{name}")

loop do
  number1 = ''
  loop do
    prompt('whats the first number')
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt('whats the second number')
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to preform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_op'])
    end
  end

  prompt("#{operation_to_message(operator)} your two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("the result is #{result}")

  prompt(MESSAGES['repeat?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Have a good night #{name}")
