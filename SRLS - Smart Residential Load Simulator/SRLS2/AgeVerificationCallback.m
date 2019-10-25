function AgeVerificationCallback(o, e)
   if (e.Indices(2) == 2 && ...
       (e.NewData < -30 || e.NewData > 50))
       tableData = get(o, 'data');
       tableData{e.Indices(1), e.Indices(2)} = e.PreviousData;
       set(o, 'data', tableData);
       errordlg('Typical temperature must be between -30 and 50 o^C');
       return
   end
   
