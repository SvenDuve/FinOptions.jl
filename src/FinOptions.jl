module FinOptions

## Dependencies

using DataArrays
using DataFrames
using Base.Dates

export

        Black76,
        BlackScholes,
        GBlackScholes,
        KirkSpreadOption,
        GeoAveRate,
        GDelta,
        Delta,
        Elasticity,
        Gamma,
        DGammaDVol,
        GammaP,
        DDeltaDVol,
        Vega,
        Vomma,
        VegaP,
        DVegaDVol,
        Theta,
        Rho,
        RhoFut,
        Rho2,
        Carry,
        Speed,
        StrikeDelta,
        RNDensity,
        PutCallParity,
        VannaVolga,
        SwingOptionPricer,
        StrikeLadder,
        VVParams



include("Black76.jl")
include("BlackScholes.jl")
include("CND.jl")
#include("CNDEV.jl"),
include("GBlackScholes.jl")
include("GDelta.jl")
include("Greeks.jl")
include("PutCallParity.jl")
include("VannaVolga.jl")
include("SwingOptionPricer.jl")
include("StrikeLadder.jl")
include("Expiry.jl")

# package code goes here

type VVParams
        putStrike
        ATMStrike
        callStrike
        putVol
        ATMVol
        callVol
end



end # module
