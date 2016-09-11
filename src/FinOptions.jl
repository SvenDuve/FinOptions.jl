module FinOptions

## Dependencies

using DataArrays
using DataFrames
using Base.Dates

export

        Black76,
        BlackScholes,
        BlackScholesDP,
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
        SABRVolatility,
        RNDensity,
        PutCallParity,
        VannaVolga,
        SwingOptionPricer,
        StrikeLadder,
        VVParams,
        Aug16, Sep16, Oct16, Nov16, Dec16,
        Jan17, Feb17, Mar17, Apr17, May17, Jun17,
        Jul17, Aug17, Sep17, Oct17, Nov17, Dec17,
        Jan18, Feb18, Mar18, Apr18, May18, Jun18,
        Jul18, Aug18, Sep18, Oct18, Nov18, Dec18,
        Q416, Q117, Q217, Q317, Q417, Q118, Q218, Q318, Q418,
        W16, S17, W17, S18,
        CND



include("Black76.jl")
include("BlackScholes.jl")
include("BlackScholesDP.jl")
include("CND.jl")
#include("CNDEV.jl"),
include("GBlackScholes.jl")
include("GDelta.jl")
include("Greeks.jl")
include("PutCallParity.jl")
include("SABR.jl")
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
