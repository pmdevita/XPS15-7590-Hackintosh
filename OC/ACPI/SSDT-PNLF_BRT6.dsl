/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASL09wd7J.aml, Mon Apr 12 13:41:27 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000152 (338)
 *     Revision         0x02
 *     Checksum         0x58
 *     OEM ID           "hack"
 *     OEM Table ID     "BCKM"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BCKM", 0x00000000)
{
    External (_SB_.ACOS, IntObj)    // (from opcode)
    External (_SB_.ACSE, IntObj)    // (from opcode)
    External (_SB_.PCI0.GFX0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.GFX0.BRTX, MethodObj)    // 2 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)

    Scope (_SB)
    {
        Device (PNLF)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            Store (0x80, \_SB.ACOS)
            Store (0x02, \_SB.ACSE)
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If (LEqual (Arg0, One))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                }

                If (And (Arg0, 0x02))
                {
                    Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                }
            }
            Else
            {
                BRTX (Arg0, Arg1)
            }
        }
    }
}

