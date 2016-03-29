# FinOptions

A financial Options evaluation package. The code and the formulas are heavily borrowed from Haug's book "Option Pricing Formulas", and others. So far implemented:

* Black76, General Black Scholes(GBlackScholes), Kirk's Spread Option (KirkSpreadOption) and a pricer for Geometric Average Rate Options
* Greeks, as Delta, Gamma, Elasticity, DGammaDVol, DDeltaDVol, Vega, Vomma,DVegaDVol, Theta and others.
* The Vanna Volga Method (Castagna, Mercurio, Risk January 2007) with which one can infer from RR, BF and ATM Volatility to a given exotic strike implied volatility.

# Format

GBlackScholes(CallPutFlag, F, X, T, r, b, v)
Black76(CallPutFlag, F, X, T, r, v)
KirkSpreadOption(CallPutFlag, S1, S2, X, T, r, b1, b2, v1, v2, cor)

where

* CallPutFlag = "c" or "p"
* F, S1, S2 are asset prices
* X is the strike
* T is the time to maturity
* r is the risk free interest rate  
* b is the dividend
* v, v1, v2 are volatilities
* cor is the correlation of asset one and two



VannaVolga(putStrike, ATMStrike, callStrike, kStrike, kFlag, T, r, b, putVol, ATMVol, callVol)

* putStrike, ATMStrike, callStrike are the known strikes for the RR, BF and ATM
* kStrike is the exotic strikes
* kFlag "c" or "p"
* T, r, b as above
* putVol, ATMVol and callVol are the known standard strike volatilities, usually one would use 25 delta Calls, 25 delta Puts and ATM Volatility.



The above mentioned Greeks simply require the same inputs as the GBlackScholes function.

[![Build Status](https://travis-ci.org/SvenDuve/FinOptions.jl.svg?branch=master)](https://travis-ci.org/SvenDuve/FinOptions.jl)
