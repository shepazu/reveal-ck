require 'ostruct'
require 'json'

module RevealCK
  # A Config represents core configuration options within
  # reveal-ck. It has defaults. It is mutable.
  class Config < OpenStruct
    def initialize
      super DEFAULTS
    end

    def merge!(hash)
      hash.each_pair do |key, value|
        self[key.to_sym] = value
      end
    end

    DEFAULTS = {
      'title'      => 'Slides',
      'author'     => '',
      'theme'      => 'default',
      'transition' => 'default',
      'reveal_js' => {
        'controls' => true,
        'progress' => true,
        'history' => true,
        'center' => true
      }
    }

    def reveal_js_as_json
      require 'json'
      JSON.pretty_generate(@table[:reveal_js])
    end
  end
end
