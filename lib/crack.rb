require_relative 'enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], 'r')
incoming_text = handle.read
handle.close

decrypted_message = enigma.crack(incoming_text, *ARGV[2..3])

writer = File.open(ARGV[1], 'w')
writer.write(decrypted_message[:decryption])
writer.close

p "Created #{ARGV[1]} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"