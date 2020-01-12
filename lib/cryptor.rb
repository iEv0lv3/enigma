class Cryptor
  attr_reader :message,
              :cipher_text,
              :key,
              :offset,
              :date,
              :enigma_shift

  def initialize
    @message = nil
    @cipher_text = nil
    @key = nil
    @offset = nil
    @date = nil
    @enigma_shift = nil
  end
end
