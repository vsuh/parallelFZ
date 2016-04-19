//
Procedure run() Экспорт
   exe1c = obj._["exe1c"];

  For Each prm In obj._["ib_connStr"] Do
    For Each ttt In prm.Value Do
      prms = New Array;
    //  For Each sss In ttt Do
        prms.Add(ttt["name"]);
    //  EndDo;
      // prms.Add(obj._["log_dir"]);
      lunch(exe1c, prms);
    EndDo;
  EndDo;

EndProcedure // run()


Procedure lunch(exe, arr)
  cmd = """"+obj._["oscript"]+""" -encoding=utf-8  " + obj._["tsk_dir"] + "\_unload.os """+exe+"""";
  For Each prm In arr Do
    cmd = cmd + " " + prm;
  EndDo;
  // message(cmd);
  prc = CreateProcess(cmd, , false, false);
  prc.Start();
EndProcedure
