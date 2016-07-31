#=
CenterStrike
Number Of Strikes up and down
expiry

gender

market,

Vanna Volga Parameters

=#


function StrikeLadder(CallPutFlag, MarketPrice, CenterStrike, T, VVInput)

LowerStrike = CenterStrike - 5
UpperStrike = CenterStrike + 5
StrikePrices = [LowerStrike:0.5:UpperStrike]


SensitivityMatrix = zeros(Float64, length(StrikePrices), 7)


SensitivityMatrix[:,1] = StrikePrices
SensitivityMatrix[:,2] = 0.25

for i in 1:length(StrikePrices) SensitivityMatrix[i,3] = Black76("c", MarketPrice, StrikePrices[i], 1/12, 0.05, SensitivityMatrix[i,2]) end

for i in 1:length(StrikePrices) SensitivityMatrix[i,4] = VannaVolga(VVInput.putStrike, VVInput.ATMStrike, VVInput.callStrike, StrikePrices[i], CallPutFlag, 1, 0.05, 0, VVInput.putVol, VVInput.ATMVol, VVInput.callVol)[2] end

for i in 1:length(StrikePrices) SensitivityMatrix[i,5] = Black76("c", MarketPrice, StrikePrices[i], 1/12, 0.05, SensitivityMatrix[i,4]) end

for i in 1:length(StrikePrices) SensitivityMatrix[i,6] = Delta("c", MarketPrice, StrikePrices[i], 1/12, 0.05, 0, SensitivityMatrix[i,4]) end

for i in 1:length(StrikePrices) SensitivityMatrix[i,7] = Gamma("c", MarketPrice, StrikePrices[i], 1/12, 0.05, 0, SensitivityMatrix[i,4]) end


SensitivityMatrix = DataFrame(SensitivityMatrix)
names!(SensitivityMatrix, [:Strike, :HVol, :ThPrice, :implVol, :implPrem, :implDelta, :implGamma])

SensitivityMatrix

end

#VVSep = VVParams(10, 11, 12, 0.25, 0.21, 0.3)

#StrikeLadder("c", 11, 11, 1/12, VVSep)
