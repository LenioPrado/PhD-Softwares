function [Rate_Elec] = Price_electricity(Rate_season,Ele_off,Ele_mid,Ele_peak,time)

for a1=1:length(time)
    if Rate_season==1  %Summer Rate
        if time(a1) <= 7  || time(a1) >= 19
            Rate_Elec(a1) = Ele_off ;
        elseif (time(a1) >= 7  && time(a1) <= 11) || (time(a1) >= 17  && time(a1) <= 19)
            Rate_Elec(a1) = Ele_mid ;
        else
            Rate_Elec(a1) = Ele_peak;
        end
    elseif Rate_season==2 %Winter Rate
            if time(a1) <= 7  || time(a1) >= 19
            Rate_Elec(a1) = Ele_off ;
        elseif (time(a1) >= 7  && time(a1) <= 11) || (time(a1) >= 17  && time(a1) <= 19)
            Rate_Elec(a1) = Ele_peak;
            else
            Rate_Elec(a1) = Ele_mid ;
            end
    end
end