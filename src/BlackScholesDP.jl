function BlackScholesDP(CallPutFlag, S, X, t1, T2, T1, r1, r2, b, v)

#=
considers later payment especially for OTC derivatives
Usage:

t1 is the time elapsing from t to payment, 2 days is 2/365
T2 is the time to expiration plus t1
r1 is the shorter term rate
r2 is the longer term rate
BlackScholesDP("c", 130, 120, 2/365, 0.5 + 2/365, 0.5, 0.5, 0.1, 0.1, 0.12)

=#


  d1 = (log(S / X) + (b + v^2 / 2) * T1) / (v * sqrt(T1))
  d2 = d1 - v * sqrt(T1)

  if CallPutFlag == "c"
    BS = exp(r1 * t1) * exp(-r2* T2) * (S * exp(b * T1) * CND(d1) - X * CND(d2))
  elseif CallPutFlag == "p"
    BS = exp(r1 * t1) * exp(-r2* T2) * (X * CND(-d2) - S* exp(-r * T) * CND(-d1))
  end

end
