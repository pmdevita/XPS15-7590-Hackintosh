// Move ACPI _PTS -> ZPTS and _WAK to ZWAK
// Insert these methods in their place that call GPU off during sleep/wake

DefinitionBlock("", "SSDT", 2, "hack", "PTSWAK", 0)
{
    External(ZPTS, MethodObj)
    External(ZWAK, MethodObj)

    External(_SB.PCI0.PEG0.PEGP._ON, MethodObj)
    External(_SB.PCI0.PEG0.PEGP._OFF, MethodObj)

    Method(_PTS, 1, NotSerialized)
    {

        If (_OSI ("Darwin"))
        {
           // disable discrete graphics (Nvidia/Radeon) if it is present
           If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
                
        // call into original _PTS method
        ZPTS(Arg0)
    }
    
    Method(_WAK, 1, NotSerialized)
    {
        Local0 = ZWAK(Arg0)
        
        If (_OSI ("Darwin"))
        {
           // disable discrete graphics (Nvidia/Radeon) if it is present
           If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
        
        Return (Local0)
    }

}