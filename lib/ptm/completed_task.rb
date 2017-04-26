# decorator class
module Ptm
  class CompletedTask < TaskDecorator
    BG_COLOR = :on_white
    COLOR = :turquoise
    BOLD = true

    def title
      super.color(COLOR).italic
    end
  end
end

