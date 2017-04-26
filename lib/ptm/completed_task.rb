# decorator class
module Ptm
  class CompletedTask < TaskDecorator
    #
    # include
    #

    include DecoratorHelper

    #
    # instance method
    #

    def font_color
      :cyan
    end

    def bg_color
      nil
    end

    def underline?
      false
    end
  end
end

