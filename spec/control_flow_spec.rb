require_relative 'spec_helper'
require_relative '../control_flow'

describe '#admin_login' do
  
  it 'returns "Access granted" if the username is "admin" and the password is "12345"' do
    expect(admin_login('admin', '12345')).to eq('Access granted')
  end
  
  it 'returns "Access granted" if the username is "ADMIN" and the password is "12345"' do
    expect(admin_login('ADMIN', '12345')).to eq('Access granted')
  end
  
  it 'returns "Access denied" for all other username/password combinations' do
    expect(admin_login('sudo', '12345')).to eq('Access denied')
    expect(admin_login('admin', 'sudo')).to eq('Access denied')
    expect(admin_login('sudo', 'pls')).to eq('Access denied')
  end

end

def admin_login (username, password)
  if (username ==  "admin" || "ADMIN") && password == "12345"
    return "Access granted"
  else
    return "Access denied"
  end
end
puts admin_login('admin','12345')
puts admin_login('ADMIN', '12345')
puts admin_login('sudo', '12345')

describe '#hows_the_weather' do
  
  it 'returns "It\'s brisk out there!" if the temperature is below 40' do
    expect(hows_the_weather(33)).to eq("It\'s brisk out there!")
  end

  it 'returns "It\'s a little chilly out there!" if the temperature is between 40 and 65' do
    expect(hows_the_weather(55)).to eq("It\'s a little chilly out there!")
  end

  it 'returns "It\'s too dang hot out there!" if the temperature is above 85' do
    expect(hows_the_weather(99)).to eq("It\'s too dang hot out there!")
  end

  it 'returns "It\'s perfect out there!" for all other temperatures' do
    expect(hows_the_weather(77)).to eq("It\'s perfect out there!")
  end

end

def hows_the_weather temperature
  if temperature < 40
    return "It\'s brisk out there!"
  elsif temperature >=40 && temperature<= 65
    return "It\'s a little chilly out there!"
  elsif temperature > 85
    return "It\'s too dang hot out there!"
  else 
    return "It\'s perfect out there!"
  end
end

puts hows_the_weather(33)
puts hows_the_weather(55)
puts hows_the_weather(90)
puts hows_the_weather(75)

describe '#fizzbuzz' do
  
  it 'returns "FizzBuzz" when the input is a multiple of 3 and 5' do
    expect(fizzbuzz(15)).to eq('FizzBuzz')
    expect(fizzbuzz(45)).to eq('FizzBuzz')
  end
  
  it 'returns "Fizz" when the input is a multiple of 3' do
    expect(fizzbuzz(3)).to eq('Fizz')
    expect(fizzbuzz(9)).to eq('Fizz')
  end
  
  it 'returns "Buzz" when the input is a multiple of 5' do
    expect(fizzbuzz(5)).to eq('Buzz')
    expect(fizzbuzz(10)).to eq('Buzz')
  end
  
  it 'returns the number when the input not is a multiple of 3 or 5' do
    expect(fizzbuzz(4)).to eq(4)
    expect(fizzbuzz(7)).to eq(7)
  end

end

def fizzbuzz number
  if number % 3 == 0 && number % 5 == 0 
    return "FizzBuzz"
  elsif number % 3 == 0 
    return "Fizz"
  elsif number % 5 == 0
    return "Buzz"
  else 
    return number
  end
end

puts fizzbuzz(15)
puts fizzbuzz(9)
puts fizzbuzz(5)
puts fizzbuzz(11)

describe '#calculator' do
  
  it 'adds two numbers' do
    expect(calculator('+', 1, 1)).to eq(2)
  end
  
  it 'subtracts two numbers' do
    expect(calculator('-', 3, 1)).to eq(2)
  end
  
  it 'multiplies two numbers' do
    expect(calculator('*', 3, 2)).to eq(6)
  end
  
  it 'divides two numbers' do
    expect(calculator('/', 4, 2)).to eq(2)
  end
  
  it 'outputs an error message for invalid operators' do
    expect { calculator('nope', 4, 2) }.to output(a_string_including('Invalid operation!')).to_stdout
  end

  it 'returns nil for invalid operators' do
    expect(calculator('nope', 4, 2)).to eq(nil)
  end
  
end

def calculator (operation, num1, num2)
  case operation
  when "+"
    return num1 + num2
  when "*"
    return num1 * num2
  when "-"
    return num1 - num2
  when "/"
    return num1 / num2.to_f
  else
    puts "Invalid operation!"
    return nil
  end
end

puts calculator("+", 1,1)
puts calculator("*", 2,2)
puts calculator("-", 4,2)
puts calculator("/", 4,2)
puts calculator("#", 99,4)