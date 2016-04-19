#use v8runner

//
Procedure run() Экспорт
  exe1c = obj._["ib_connStr"]["exe1c"];

  For Each prm In obj._["ib_connStr"] Do
    For Each ttt In prm.Value Do
      prms = New Array;
      For Each sss In ttt Do
        prms.Add(sss.Value);
      EndDo;
      lunch(exe1c, prms);
      // Message(""+ttt["conn"]+" = "+ttt["regl"]+" = "+ttt["dt"]);
    EndDo;
  EndDo;

// Message("+++++++++++++++++++++++++++++++++++++");
// For Each ppp In obj._["ib_connStr"] Do
//   Message(""+ppp.Key);
// EndDo;
// Message("+++++++++++++++++++++++++++++++++++++");

EndProcedure // run()


Procedure lunch(exe, arr)
  cmd = """"+obj._["oscript"]+""" " + obj._["tsk_dir"] + "\_unload.os """+exe+"""";
  For Each prm In arr Do
    cmd = cmd + " " + prm;
  EndDo;
   Message(cmd);
  prc = CreateProcess(cmd, , False, False);
  prc.Start();
EndProcedure
