function BlackScholesDP(CallPutFlag, S, X, t1, T2, T1, r1, r2, b, v)


  d1 = (log(S / X) + (b + v^2 / 2) * T1) / (v * sqrt(T1))
  d2 = d1 - v * sqrt(T1)

  if CallPutFlag == "c"
    BS = exp(r1 * t1)*exp(-r2* T2) * (S * exp(b * T1) * CND(d1) - X * CND(d2))
  elseif CallPutFlag == "p"
    BS = X * exp(-r * T) * CND(-d2) - S * CND(-d1)
  end

end
