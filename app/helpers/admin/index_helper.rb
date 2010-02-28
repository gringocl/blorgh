module Admin::IndexHelper
  def is(count)
    count == 1 ? "is" : "are"
  end
end