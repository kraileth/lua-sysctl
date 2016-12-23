--[[---------------------------------------------------------------------------
--
--  NOTE:
--      sysctl.get() and sysctl.set() raise an error if any problem occur. If
--      you don't control the key you're passing to these function you might
--      want to use lua's protected calls (pcall).
-------------------------------------------------------------------------------
--
--  sysctl.get(key)
--      returns two values. The first returned value is the sysctl(3) value,
--      the second value is the format.
--          - "I" int
--          - "UI" unsigned int
--          - "IK" int, in (kelv * 10) (used to get temperature)
--          - "L" long
--          - "UL" unsigned long
--          - "A" char *
--          - "S,clockinfo" struct clockinfo
--          - "S,loadavg" struct loadavg
--          - "S,timeval" struct timeval
--          - "S,vmtotal" struct vmtotal
--
--      In lua land, it means that:
--          - "I", "UI", "IK", "L", "UL", are numbers.
--          - "A" is a string
--          - "S,clockinfo" is a table of integers
--                  { hz, tick, profhz, stathz }
--          - "S,loadavg" is an array of numbers (double)
--                  { 1, 2, 3 }
--          - "S,timeval" is a table of integers
--                  { sec, sec }
--          - "S,vmtotal" is a table of integers
--                  { rq, dw, pw, sl, vm, avm, rm, arm, vmshr, avmshr,
--                      rmshr, armshr, free }
-------------------------------------------------------------------------------
--
--  sysctl.set(key, newval)
--      set the sysctl's key to newval. return nothing and throw lua
--      error if any problem occur. Note that some sysctl's key are read only
--      or read only tunable and can not be set at runtime.
-------------------------------------------------------------------------------
--
--  sysctl.IK2celsius(kelv)
--       convert a sysctl's IK value into celsius and return it.
-------------------------------------------------------------------------------
--
--  sysctl.IK2farenheit(kelv)
--      convert a sysctl's IK value into farenheit and return it.
-----------------------------------------------------------------------------]]
require('sysctl.core')
