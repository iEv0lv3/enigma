class Cryptor
  attr_reader :message,
              :cipher_text,
              :key,
              :offset,
              :date,
              :enigma_shift

  def initialize(text, key = '', date = '')
    @message = text
    @cipher_text = nil
    @key = key
    @offset = nil
    @date = date
    @enigma_shift = nil
  end
end
