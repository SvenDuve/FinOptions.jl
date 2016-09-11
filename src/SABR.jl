function SABRVolatility(F, X, T, ATMVol, Beta, VolVol, rho)

        alphaSABR(F, X, T, FindAlpha(F, X, T, ATMVol, Beta, VolVol, rho), Beta, VolVol, rho)

end




function CRoot(cubic, quadratic, linear, constant)

        roots = zeros(Float64, 3)
        a, b, C, r, Q, capA, capB, theta = 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0


        a = quadratic / cubic
        b = linear / cubic
        C = constant / cubic
        Q = (a^2 -3*b) / 9
        r = (2*a^3 - 9*a*b + 27*C) / 54

        if r^2 - Q^3 >= 0
                capA = -sign(r) * (abs(r) + sqrt(r^2 - Q^3))^(1/3)
                if capA == 0
                        capB = 0
                else
                        capB = Q/capA
                end

                croot = capA + capB - a/3

        else
                theta = acos(r/Q^1.5)

                roots[1] = -2 * sqrt(Q) * cos(theta / 3) - a / 3
                roots[2] = -2 * sqrt(Q) * cos(theta / 3 + 2.0943951023932) - a / 3
                roots[3] = -2 * sqrt(Q) * cos(theta / 3 - 2.0943951023932) - a / 3

                if roots[1] > 0
                        croot = roots[1]
                elseif roots[2] > 0
                        croot = roots[2]
                elseif roots[3] > 0
                        croot = roots[3]
                end

                if roots[2] > 0 && roots[2] < croot
                        croot = roots[2]
                end

                if roots[3] > 0 && roots[3] < croot
                        croot = roots[3]
                end

        end

return croot

end


function FindAlpha(F, X, T, ATMVol, Beta, VolVol, rho)

        cubic = (1-Beta)^2 * T / (24 * F^(2 - 2 * Beta))
        quadratic = 0.25 * rho * VolVol * Beta * T / F^(1 - Beta)
        linear = 1 + (2 - 3 * rho^2) / 24 * VolVol^2 * T
        constant = -ATMVol * F^(1 - Beta)


        CRoot(cubic, quadratic, linear, constant)

end


function alphaSABR(F, X, T, Alpha, Beta, VolVol, rho)

        dSABR = zeros(Float64, 3)
        #sabrz, y

        dSABR[1] = Alpha / ((F * X)^((1 - Beta) / 2) * (1 + (((1 - Beta)^2) / 24) * (log(F/X)^2) + ((1 - Beta)^4 / 1920) * (log(F / X)^4)))

        if abs(F - X)^2 > 10.0^(-8)
                sabrz = (VolVol / Alpha) * (F * X)^((1 - Beta) / 2) * log(F / X)
                y = (sqrt(1 - 2 * rho * sabrz + sabrz^2) + sabrz - rho) / (1 - rho)

                if abs(y - 1) < 10.0^(-8)
                        dSABR[2] = 1
                elseif y > 0
                        dSABR[2] = sabrz / log(y)
                else
                        dSABR[2] = 1
                end

        else
                dSABR[2] = 1

        end


        dSABR[3] = 1 + ((((1 - Beta)^2 / 24) * Alpha^2 / ((F * X)^(1 - Beta))) +
        0.25 * rho * Beta * VolVol * Alpha / ((F * X)^((1 - Beta) / 2)) +
        (2 - 3 * rho^2) * VolVol^2 / 24) * T

        dSABR[1] * dSABR[2] * dSABR[3]

end
