function Black76(CallPutFlag, F, X, T, r, v)

  require("/Users/svenduve/Google Drive/Derivatives/HaugsBook/Distributions/CND.jl")

  d1 = (log(F / X) + (v^2 / 2) * T) / (v * sqrt(T))
  d2 = d1 - v * sqrt(T)

  if CallPutFlag == "c"
    BS = exp(-r * T) * (F * CND(d1) - X * CND(d2))
  elseif CallPutFlag == "p"
    BS = exp(-r * T) * (X * CND(-d2) - F * CND(-d1))
  end

end
