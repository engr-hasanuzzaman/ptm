# decorator class
module Ptm
  class PendingTask < TaskDecorator
    #
    # include
    #

    include DecoratorHelper

    #
    # instance method
    #

    def font_color
      :yellow
    end

    def bg_color
      nil
    end

    def underline?
      false
    end
  end
end

