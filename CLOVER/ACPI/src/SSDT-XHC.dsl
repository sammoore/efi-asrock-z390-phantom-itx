// Automatic injection of XHC properties

DefinitionBlock("", "SSDT", 2, "hack", "_XHC", 0)
{
    External(_SB.PCI0.XHC, DeviceObj)

    // inject properties for XHCI
    Method(_SB.PCI0.XHC._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "RM,disable_FakePCIID", 1,
            "subsystem-id", Buffer() { 0x6d, 0xa3, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x49, 0x18, 0x00, 0x00 },
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "AAPL,current-available", Buffer() { 0x34, 0x08, 0, 0 },
            "AAPL,current-extra", Buffer() { 0x98, 0x08, 0, 0, },
            "AAPL,current-extra-in-sleep", Buffer() { 0x40, 0x06, 0, 0, },
            "AAPL,max-port-current-in-sleep", Buffer() { 0x34, 0x08, 0, 0 },
        })
    }
}
//EOF
