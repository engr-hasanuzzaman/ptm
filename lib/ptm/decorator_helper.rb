module Ptm
  # help to decorate task decorator
  module DecoratorHelper
    def title
      apply_color(super.to_s)
    end

    def category
      apply_color(super.to_s)
    end

    def created_at
      apply_color(super.to_s)
    end

    def complete
      apply_color(super.to_s)
    end

    def completed_at
      apply_color(super.to_s)
    end

    def id
      apply_color(super.to_s)
    end

    def attrs_val
      [
        id,
        title,
        category,
        created_at,
        complete,
        completed_at
      ]
    end

    private

    def apply_color(temp_val)
      temp_val = temp_val.color(font_color) if font_color
      temp_val = temp_val.background(bg_color) if bg_color
      temp_val = temp_val.underline if underline?

      # make sure return title
      temp_val
    end
  end
end
