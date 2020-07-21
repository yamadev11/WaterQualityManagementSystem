class ReadingController < ApplicationController
  def new
    encrypted_readings = Array.new
    decrypted_readings = Array.new
    node_id = params['node_id']
    time = params['time']
    readings = params['reading'].split(',')

    readings.each do |num|
     encrypted_readings << num.to_i
    end

    encrypted_readings.each_slice(8) do |encrypted_reading|
      decrypted_readings << decrypt(encrypted_reading)
    end

   new_reading = Reading.new(node_id: node_id, date: time, turbidity: decrypted_readings[0],
      ph: decrypted_readings[1], temprature: decrypted_readings[2], dissolved_oxygen: decrypted_readings[3])

    if new_reading.save!
      render json:{status: true}
    end
  end

  def gcd(a,b)
      if b==0
          return a
      else
          return gcd(b,a%b)
      end
  end

  def decrypt(cipher)
    # p = 7
    # q = 11
    n = 77
    d = 43
    # t = (p-1)*(q-1)
    #
    # for e in 2..t
    #   if gcd(e,t)== 1
    #       break
    #   end
    # end
    #
    # for i in 1..10
    #   x = 1 + i*t
    #   if x % e == 0
    #       d = Integer(x/e)
    #       break
    #   end
    # end

    # cipher = Array.new
    # hex.each_byte do |c|
    #   ctt = c**e
    #   ct = ctt % n
    #   cipher << ct
    # end

    decipher = Array.new
    cipher.each do |ct|
      dtt = ct**d
      dt = dtt % n
    	decipher << dt
    end
    str = decipher.pack("cccccccc")
    reading = [str.to_i(16)].pack('L').unpack('F')[0]
    #puts"cipher text = #{cipher} \n decrypted text = #{str} \n reading = #{reading}\n"
  end
end
