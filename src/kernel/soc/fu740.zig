const mmio = @import("./mmio.zig");

pub const devices = struct {
    /// From sifive,hifive-unmatched-a00,model device generator
    pub const sifive_hifive_unmatched_a00 = struct {
        pub const vendor = "sifive";
        pub const series = "";
        pub const width = 32;
        pub const peripherals = struct {
            /// From sifive,ccache0,control peripheral generator
            pub const sifive_ccache0_0 = struct {
            
                /// Information about the Cache Configuration
                pub const config = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Number of banks in the cache
                    banks: u8 = 0,
                
                    /// [8:15] Number of ways per bank
                    ways: u8 = 0,
                
                    /// [16:23] Base-2 logarithm of the sets per bank
                    lgsets: u8 = 0,
                
                    /// [24:31] Base-2 logarithm of the bytes per cache block
                    lgblockbytes: u8 = 0,
                
                }), @ptrFromInt(0x2010000));
            
                /// The index of the largest way which has been enabled. May only be increased.
                pub const wayenable = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2010008));
            
                /// The L2 performance event0 control register.
                pub const l2perfevent0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2012000));
            
                /// The L2 performance event1 control register.
                pub const l2perfevent1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2012008));
            
                /// The L2 Client Filterregister.
                pub const l2clientfilter = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2012800));
            
                /// The L2 performance monitor counter0 register.
                pub const l2pmcounter0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2013000));
            
                /// The L2 performance monitor counter1 register.
                pub const l2pmcounter1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2013008));
            
                /// The L2 performance monitor counter63 register.
                pub const l2pmcounter63 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x20131f8));
            
            };
            /// From riscv,clint0,control peripheral generator
            pub const riscv_clint0_0 = struct {
            
                /// MSIP Register for hart 0
                pub const msip_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2000000));
            
                /// MSIP Register for hart 1
                pub const msip_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2000004));
            
                /// MSIP Register for hart 2
                pub const msip_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2000008));
            
                /// MSIP Register for hart 3
                pub const msip_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x200000c));
            
                /// MSIP Register for hart 4
                pub const msip_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x2000010));
            
                /// MTIMECMP Register for hart 0
                pub const mtimecmp_0 = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x2004000));
            
                /// MTIMECMP Register for hart 1
                pub const mtimecmp_1 = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x2004008));
            
                /// MTIMECMP Register for hart 2
                pub const mtimecmp_2 = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x2004010));
            
                /// MTIMECMP Register for hart 3
                pub const mtimecmp_3 = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x2004018));
            
                /// MTIMECMP Register for hart 4
                pub const mtimecmp_4 = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x2004020));
            
                /// MTIME Register
                pub const mtime = @as(*volatile mmio.Mmio(packed struct(u64) {
                
                    /// [0:63] 
                    raw: u64 = 0,
                
                }), @ptrFromInt(0x200bff8));
            
            };
            /// From sifive,gpio0,control peripheral generator
            pub const sifive_gpio0_0 = struct {
            
                /// Pin value
                pub const input_val = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060000));
            
                /// Pin input enable
                pub const input_en = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060004));
            
                /// Pin output enable
                pub const output_en = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060008));
            
                /// Output value
                pub const output_val = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1006000c));
            
                /// Internal pull-up enable
                pub const pue = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060010));
            
                /// Pin drive strength
                pub const ds = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060014));
            
                /// Rise interrupt enable
                pub const rise_ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060018));
            
                /// Rise interrupt pending
                pub const rise_ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1006001c));
            
                /// Fall interrupt enable
                pub const fall_ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060020));
            
                /// Fall interrupt pending
                pub const fall_ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060024));
            
                /// High interrupt enable
                pub const high_ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060028));
            
                /// High interrupt pending
                pub const high_ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1006002c));
            
                /// Low interrupt enable
                pub const low_ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060030));
            
                /// Low interrupt pending
                pub const low_ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060034));
            
                /// I/O function enable
                pub const iof_en = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060038));
            
                /// I/O function select
                pub const iof_sel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1006003c));
            
                /// Output XOR (invert)
                pub const out_xor = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10060040));
            
            };
            /// From sifive,i2c0,control peripheral generator
            pub const sifive_i2c0_0 = struct {
            
                /// Clock Prescale register lo-byte
                pub const prescale_low = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10030000));
            
                /// Clock Prescale register hi-byte
                pub const prescale_high = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10030004));
            
                /// Control register
                pub const control = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:5] 
                    res0: u6 = 0,
                
                    /// [6:6] I2C core enable bit
                    en: u1 = 0,
                
                    /// [7:7] I2C core interrupt enable bit
                    ien: u1 = 0,
                
                    /// [8:31] 
                    res1: u24 = 0,
                
                }), @ptrFromInt(0x10030008));
            
                /// Transmit and receive data byte register
                pub const transmit__receive = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1003000c));
            
                /// Command write and status read register
                pub const command__status = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Clear interrupt and Interrupt pending
                    wr_iack__rd_if: u1 = 0,
                
                    /// [1:1] Reserved and Transfer in progress
                    wr_res__rd_tip: u1 = 0,
                
                    /// [2:2] Reserved and Reserved
                    wr_res__rd_res: u1 = 0,
                
                    /// [3:3] Send ACK/NACK and Reserved
                    wr_ack__rd_res: u1 = 0,
                
                    /// [4:4] Transmit data and Reserved
                    wr_txd__rd_res: u1 = 0,
                
                    /// [5:5] Receive data and Arbitration lost
                    wr_rxd__rd_al: u1 = 0,
                
                    /// [6:6] Generate stop and I2C bus busy
                    wr_sto__rd_busy: u1 = 0,
                
                    /// [7:7] Generate start and Got ACK/NACK
                    wr_sta__rd_rxack: u1 = 0,
                
                    /// [8:31] 
                    res0: u24 = 0,
                
                }), @ptrFromInt(0x10030010));
            
            };
            /// From sifive,i2c0,control peripheral generator
            pub const sifive_i2c0_1 = struct {
            
                /// Clock Prescale register lo-byte
                pub const prescale_low = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10031000));
            
                /// Clock Prescale register hi-byte
                pub const prescale_high = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x10031004));
            
                /// Control register
                pub const control = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:5] 
                    res0: u6 = 0,
                
                    /// [6:6] I2C core enable bit
                    en: u1 = 0,
                
                    /// [7:7] I2C core interrupt enable bit
                    ien: u1 = 0,
                
                    /// [8:31] 
                    res1: u24 = 0,
                
                }), @ptrFromInt(0x10031008));
            
                /// Transmit and receive data byte register
                pub const transmit__receive = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0x1003100c));
            
                /// Command write and status read register
                pub const command__status = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Clear interrupt and Interrupt pending
                    wr_iack__rd_if: u1 = 0,
                
                    /// [1:1] Reserved and Transfer in progress
                    wr_res__rd_tip: u1 = 0,
                
                    /// [2:2] Reserved and Reserved
                    wr_res__rd_res: u1 = 0,
                
                    /// [3:3] Send ACK/NACK and Reserved
                    wr_ack__rd_res: u1 = 0,
                
                    /// [4:4] Transmit data and Reserved
                    wr_txd__rd_res: u1 = 0,
                
                    /// [5:5] Receive data and Arbitration lost
                    wr_rxd__rd_al: u1 = 0,
                
                    /// [6:6] Generate stop and I2C bus busy
                    wr_sto__rd_busy: u1 = 0,
                
                    /// [7:7] Generate start and Got ACK/NACK
                    wr_sta__rd_rxack: u1 = 0,
                
                    /// [8:31] 
                    res0: u24 = 0,
                
                }), @ptrFromInt(0x10031010));
            
            };
            /// From riscv,plic0,control peripheral generator
            pub const riscv_plic0_0 = struct {
            
                /// PRIORITY Register for interrupt id 1
                pub const priority_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000004));
            
                /// PRIORITY Register for interrupt id 2
                pub const priority_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000008));
            
                /// PRIORITY Register for interrupt id 3
                pub const priority_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00000c));
            
                /// PRIORITY Register for interrupt id 4
                pub const priority_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000010));
            
                /// PRIORITY Register for interrupt id 5
                pub const priority_5 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000014));
            
                /// PRIORITY Register for interrupt id 6
                pub const priority_6 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000018));
            
                /// PRIORITY Register for interrupt id 7
                pub const priority_7 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00001c));
            
                /// PRIORITY Register for interrupt id 8
                pub const priority_8 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000020));
            
                /// PRIORITY Register for interrupt id 9
                pub const priority_9 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000024));
            
                /// PRIORITY Register for interrupt id 10
                pub const priority_10 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000028));
            
                /// PRIORITY Register for interrupt id 11
                pub const priority_11 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00002c));
            
                /// PRIORITY Register for interrupt id 12
                pub const priority_12 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000030));
            
                /// PRIORITY Register for interrupt id 13
                pub const priority_13 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000034));
            
                /// PRIORITY Register for interrupt id 14
                pub const priority_14 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000038));
            
                /// PRIORITY Register for interrupt id 15
                pub const priority_15 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00003c));
            
                /// PRIORITY Register for interrupt id 16
                pub const priority_16 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000040));
            
                /// PRIORITY Register for interrupt id 17
                pub const priority_17 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000044));
            
                /// PRIORITY Register for interrupt id 18
                pub const priority_18 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000048));
            
                /// PRIORITY Register for interrupt id 19
                pub const priority_19 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00004c));
            
                /// PRIORITY Register for interrupt id 20
                pub const priority_20 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000050));
            
                /// PRIORITY Register for interrupt id 21
                pub const priority_21 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000054));
            
                /// PRIORITY Register for interrupt id 22
                pub const priority_22 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000058));
            
                /// PRIORITY Register for interrupt id 23
                pub const priority_23 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00005c));
            
                /// PRIORITY Register for interrupt id 24
                pub const priority_24 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000060));
            
                /// PRIORITY Register for interrupt id 25
                pub const priority_25 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000064));
            
                /// PRIORITY Register for interrupt id 26
                pub const priority_26 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000068));
            
                /// PRIORITY Register for interrupt id 27
                pub const priority_27 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00006c));
            
                /// PRIORITY Register for interrupt id 28
                pub const priority_28 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000070));
            
                /// PRIORITY Register for interrupt id 29
                pub const priority_29 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000074));
            
                /// PRIORITY Register for interrupt id 30
                pub const priority_30 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000078));
            
                /// PRIORITY Register for interrupt id 31
                pub const priority_31 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00007c));
            
                /// PRIORITY Register for interrupt id 32
                pub const priority_32 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000080));
            
                /// PRIORITY Register for interrupt id 33
                pub const priority_33 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000084));
            
                /// PRIORITY Register for interrupt id 34
                pub const priority_34 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000088));
            
                /// PRIORITY Register for interrupt id 35
                pub const priority_35 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00008c));
            
                /// PRIORITY Register for interrupt id 36
                pub const priority_36 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000090));
            
                /// PRIORITY Register for interrupt id 37
                pub const priority_37 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000094));
            
                /// PRIORITY Register for interrupt id 38
                pub const priority_38 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000098));
            
                /// PRIORITY Register for interrupt id 39
                pub const priority_39 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00009c));
            
                /// PRIORITY Register for interrupt id 40
                pub const priority_40 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000a0));
            
                /// PRIORITY Register for interrupt id 41
                pub const priority_41 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000a4));
            
                /// PRIORITY Register for interrupt id 42
                pub const priority_42 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000a8));
            
                /// PRIORITY Register for interrupt id 43
                pub const priority_43 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000ac));
            
                /// PRIORITY Register for interrupt id 44
                pub const priority_44 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000b0));
            
                /// PRIORITY Register for interrupt id 45
                pub const priority_45 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000b4));
            
                /// PRIORITY Register for interrupt id 46
                pub const priority_46 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000b8));
            
                /// PRIORITY Register for interrupt id 47
                pub const priority_47 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000bc));
            
                /// PRIORITY Register for interrupt id 48
                pub const priority_48 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000c0));
            
                /// PRIORITY Register for interrupt id 49
                pub const priority_49 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000c4));
            
                /// PRIORITY Register for interrupt id 50
                pub const priority_50 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000c8));
            
                /// PRIORITY Register for interrupt id 51
                pub const priority_51 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000cc));
            
                /// PRIORITY Register for interrupt id 52
                pub const priority_52 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000d0));
            
                /// PRIORITY Register for interrupt id 53
                pub const priority_53 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000d4));
            
                /// PRIORITY Register for interrupt id 54
                pub const priority_54 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000d8));
            
                /// PRIORITY Register for interrupt id 55
                pub const priority_55 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000dc));
            
                /// PRIORITY Register for interrupt id 56
                pub const priority_56 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000e0));
            
                /// PRIORITY Register for interrupt id 57
                pub const priority_57 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000e4));
            
                /// PRIORITY Register for interrupt id 58
                pub const priority_58 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000e8));
            
                /// PRIORITY Register for interrupt id 59
                pub const priority_59 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000ec));
            
                /// PRIORITY Register for interrupt id 60
                pub const priority_60 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000f0));
            
                /// PRIORITY Register for interrupt id 61
                pub const priority_61 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000f4));
            
                /// PRIORITY Register for interrupt id 62
                pub const priority_62 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000f8));
            
                /// PRIORITY Register for interrupt id 63
                pub const priority_63 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc0000fc));
            
                /// PRIORITY Register for interrupt id 64
                pub const priority_64 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000100));
            
                /// PRIORITY Register for interrupt id 65
                pub const priority_65 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000104));
            
                /// PRIORITY Register for interrupt id 66
                pub const priority_66 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000108));
            
                /// PRIORITY Register for interrupt id 67
                pub const priority_67 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc00010c));
            
                /// PRIORITY Register for interrupt id 68
                pub const priority_68 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000110));
            
                /// PRIORITY Register for interrupt id 69
                pub const priority_69 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc000114));
            
                /// PENDING Register for interrupt ids 31 to 0
                pub const pending_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc001000));
            
                /// PENDING Register for interrupt ids 63 to 32
                pub const pending_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc001004));
            
                /// PENDING Register for interrupt ids 69 to 64
                pub const pending_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc001008));
            
                /// ENABLE Register for interrupt ids 31 to 0 for hart 0
                pub const enable_0_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002000));
            
                /// ENABLE Register for interrupt ids 63 to 32 for hart 0
                pub const enable_1_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002004));
            
                /// ENABLE Register for interrupt ids 69 to 64 for hart 0
                pub const enable_2_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002008));
            
                /// ENABLE Register for interrupt ids 31 to 0 for hart 1
                pub const enable_0_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002080));
            
                /// ENABLE Register for interrupt ids 63 to 32 for hart 1
                pub const enable_1_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002084));
            
                /// ENABLE Register for interrupt ids 69 to 64 for hart 1
                pub const enable_2_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002088));
            
                /// ENABLE Register for interrupt ids 31 to 0 for hart 2
                pub const enable_0_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002100));
            
                /// ENABLE Register for interrupt ids 63 to 32 for hart 2
                pub const enable_1_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002104));
            
                /// ENABLE Register for interrupt ids 69 to 64 for hart 2
                pub const enable_2_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002108));
            
                /// ENABLE Register for interrupt ids 31 to 0 for hart 3
                pub const enable_0_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002180));
            
                /// ENABLE Register for interrupt ids 63 to 32 for hart 3
                pub const enable_1_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002184));
            
                /// ENABLE Register for interrupt ids 69 to 64 for hart 3
                pub const enable_2_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002188));
            
                /// ENABLE Register for interrupt ids 31 to 0 for hart 4
                pub const enable_0_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002200));
            
                /// ENABLE Register for interrupt ids 63 to 32 for hart 4
                pub const enable_1_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002204));
            
                /// ENABLE Register for interrupt ids 69 to 64 for hart 4
                pub const enable_2_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc002208));
            
                /// PRIORITY THRESHOLD Register for hart 0
                pub const threshold_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc200000));
            
                /// CLAIM and COMPLETE Register for hart 0
                pub const claimplete_0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc200004));
            
                /// PRIORITY THRESHOLD Register for hart 1
                pub const threshold_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc201000));
            
                /// CLAIM and COMPLETE Register for hart 1
                pub const claimplete_1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc201004));
            
                /// PRIORITY THRESHOLD Register for hart 2
                pub const threshold_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc202000));
            
                /// CLAIM and COMPLETE Register for hart 2
                pub const claimplete_2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc202004));
            
                /// PRIORITY THRESHOLD Register for hart 3
                pub const threshold_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc203000));
            
                /// CLAIM and COMPLETE Register for hart 3
                pub const claimplete_3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc203004));
            
                /// PRIORITY THRESHOLD Register for hart 4
                pub const threshold_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc204000));
            
                /// CLAIM and COMPLETE Register for hart 4
                pub const claimplete_4 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] 
                    raw: u32 = 0,
                
                }), @ptrFromInt(0xc204004));
            
            };
            /// From sifive,pwm0,control peripheral generator
            pub const sifive_pwm0_0 = struct {
            
                /// PWM configuration register
                pub const pwmcfg = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:3] PWM Counter scale
                    pwmscale: u4 = 0,
                
                    /// [4:7] 
                    res0: u4 = 0,
                
                    /// [8:8] PWM Sticky - disallow clearing pwmcmpXip bits
                    pwmsticky: u1 = 0,
                
                    /// [9:9] PWM Zero - counter resets to zero after match
                    pwmzerocmp: u1 = 0,
                
                    /// [10:10] PWM Deglitch - latch pwmcmpXip within same cycle
                    pwmdeglitch: u1 = 0,
                
                    /// [11:11] 
                    res1: u1 = 0,
                
                    /// [12:12] PWM enable always - run continuously
                    pwmenalways: u1 = 0,
                
                    /// [13:13] PWM enable one shot - run one cycle
                    pwmenoneshot: u1 = 0,
                
                    /// [14:15] 
                    res2: u2 = 0,
                
                    /// [16:16] PWM0 Compare Center
                    pwmcmp0center: u1 = 0,
                
                    /// [17:17] PWM1 Compare Center
                    pwmcmp1center: u1 = 0,
                
                    /// [18:18] PWM2 Compare Center
                    pwmcmp2center: u1 = 0,
                
                    /// [19:19] PWM3 Compare Center
                    pwmcmp3center: u1 = 0,
                
                    /// [20:20] PWM0 Invert
                    pwmcmp0invert: u1 = 0,
                
                    /// [21:21] PWM1 Invert
                    pwmcmp1invert: u1 = 0,
                
                    /// [22:22] PWM2 Invert
                    pwmcmp2invert: u1 = 0,
                
                    /// [23:23] PWM3 Invert
                    pwmcmp3invert: u1 = 0,
                
                    /// [24:24] PWM0/PWM1 Compare Gang
                    pwmcmp0gang: u1 = 0,
                
                    /// [25:25] PWM1/PWM2 Compare Gang
                    pwmcmp1gang: u1 = 0,
                
                    /// [26:26] PWM2/PWM3 Compare Gang
                    pwmcmp2gang: u1 = 0,
                
                    /// [27:27] PWM3/PWM0 Compare Gang
                    pwmcmp3gang: u1 = 0,
                
                    /// [28:28] PWM0 Interrupt Pending
                    pwmcmp0ip: u1 = 0,
                
                    /// [29:29] PWM1 Interrupt Pending
                    pwmcmp1ip: u1 = 0,
                
                    /// [30:30] PWM2 Interrupt Pending
                    pwmcmp2ip: u1 = 0,
                
                    /// [31:31] PWM3 Interrupt Pending
                    pwmcmp3ip: u1 = 0,
                
                }), @ptrFromInt(0x10020000));
            
                /// PWM count register
                pub const pwmcount = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:30] PWM count register.
                    pwmcount: u31 = 0,
                
                    /// [31:31] 
                    res0: u1 = 0,
                
                }), @ptrFromInt(0x10020008));
            
                /// Scaled PWM count register
                pub const pwms = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] Scaled PWM count register.
                    pwms: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10020010));
            
                /// PWM 0 compare register
                pub const pwmcmp0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 0 Compare Value
                    pwmcmp0: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10020020));
            
                /// PWM 1 compare register
                pub const pwmcmp1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 1 Compare Value
                    pwmcmp1: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10020024));
            
                /// PWM 2 compare register
                pub const pwmcmp2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 2 Compare Value
                    pwmcmp2: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10020028));
            
                /// PWM 3 compare register
                pub const pwmcmp3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 3 Compare Value
                    pwmcmp3: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x1002002c));
            
            };
            /// From sifive,pwm0,control peripheral generator
            pub const sifive_pwm0_1 = struct {
            
                /// PWM configuration register
                pub const pwmcfg = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:3] PWM Counter scale
                    pwmscale: u4 = 0,
                
                    /// [4:7] 
                    res0: u4 = 0,
                
                    /// [8:8] PWM Sticky - disallow clearing pwmcmpXip bits
                    pwmsticky: u1 = 0,
                
                    /// [9:9] PWM Zero - counter resets to zero after match
                    pwmzerocmp: u1 = 0,
                
                    /// [10:10] PWM Deglitch - latch pwmcmpXip within same cycle
                    pwmdeglitch: u1 = 0,
                
                    /// [11:11] 
                    res1: u1 = 0,
                
                    /// [12:12] PWM enable always - run continuously
                    pwmenalways: u1 = 0,
                
                    /// [13:13] PWM enable one shot - run one cycle
                    pwmenoneshot: u1 = 0,
                
                    /// [14:15] 
                    res2: u2 = 0,
                
                    /// [16:16] PWM0 Compare Center
                    pwmcmp0center: u1 = 0,
                
                    /// [17:17] PWM1 Compare Center
                    pwmcmp1center: u1 = 0,
                
                    /// [18:18] PWM2 Compare Center
                    pwmcmp2center: u1 = 0,
                
                    /// [19:19] PWM3 Compare Center
                    pwmcmp3center: u1 = 0,
                
                    /// [20:20] PWM0 Invert
                    pwmcmp0invert: u1 = 0,
                
                    /// [21:21] PWM1 Invert
                    pwmcmp1invert: u1 = 0,
                
                    /// [22:22] PWM2 Invert
                    pwmcmp2invert: u1 = 0,
                
                    /// [23:23] PWM3 Invert
                    pwmcmp3invert: u1 = 0,
                
                    /// [24:24] PWM0/PWM1 Compare Gang
                    pwmcmp0gang: u1 = 0,
                
                    /// [25:25] PWM1/PWM2 Compare Gang
                    pwmcmp1gang: u1 = 0,
                
                    /// [26:26] PWM2/PWM3 Compare Gang
                    pwmcmp2gang: u1 = 0,
                
                    /// [27:27] PWM3/PWM0 Compare Gang
                    pwmcmp3gang: u1 = 0,
                
                    /// [28:28] PWM0 Interrupt Pending
                    pwmcmp0ip: u1 = 0,
                
                    /// [29:29] PWM1 Interrupt Pending
                    pwmcmp1ip: u1 = 0,
                
                    /// [30:30] PWM2 Interrupt Pending
                    pwmcmp2ip: u1 = 0,
                
                    /// [31:31] PWM3 Interrupt Pending
                    pwmcmp3ip: u1 = 0,
                
                }), @ptrFromInt(0x10021000));
            
                /// PWM count register
                pub const pwmcount = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:30] PWM count register.
                    pwmcount: u31 = 0,
                
                    /// [31:31] 
                    res0: u1 = 0,
                
                }), @ptrFromInt(0x10021008));
            
                /// Scaled PWM count register
                pub const pwms = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] Scaled PWM count register.
                    pwms: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10021010));
            
                /// PWM 0 compare register
                pub const pwmcmp0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 0 Compare Value
                    pwmcmp0: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10021020));
            
                /// PWM 1 compare register
                pub const pwmcmp1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 1 Compare Value
                    pwmcmp1: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10021024));
            
                /// PWM 2 compare register
                pub const pwmcmp2 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 2 Compare Value
                    pwmcmp2: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10021028));
            
                /// PWM 3 compare register
                pub const pwmcmp3 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] PWM 3 Compare Value
                    pwmcmp3: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x1002102c));
            
            };
            /// From sifive,uart0,control peripheral generator
            pub const sifive_uart0_0 = struct {
            
                /// Transmit data register
                pub const txdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Transmit data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] Transmit FIFO full
                    full: u1 = 0,
                
                }), @ptrFromInt(0x10010000));
            
                /// Receive data register
                pub const rxdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Received data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] Receive FIFO empty
                    empty: u1 = 0,
                
                }), @ptrFromInt(0x10010004));
            
                /// Transmit control register
                pub const txctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit enable
                    txen: u1 = 0,
                
                    /// [1:1] Number of stop bits
                    nstop: u1 = 0,
                
                    /// [2:15] 
                    res0: u14 = 0,
                
                    /// [16:18] Transmit watermark level
                    txcnt: u3 = 0,
                
                    /// [19:31] 
                    res1: u13 = 0,
                
                }), @ptrFromInt(0x10010008));
            
                /// Receive control register
                pub const rxctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Receive enable
                    rxen: u1 = 0,
                
                    /// [1:15] 
                    res0: u15 = 0,
                
                    /// [16:18] Receive watermark level
                    rxcnt: u3 = 0,
                
                    /// [19:31] 
                    res1: u13 = 0,
                
                }), @ptrFromInt(0x1001000c));
            
                /// UART interrupt enable
                pub const ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark interrupt enable
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark interrupt enable
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10010010));
            
                /// UART interrupt pending
                pub const ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark interrupt pending
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark interrupt pending
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10010014));
            
                /// Baud rate divisor
                pub const div = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] Baud rate divisor.
                    div: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10010018));
            
            };
            /// From sifive,uart0,control peripheral generator
            pub const sifive_uart0_1 = struct {
            
                /// Transmit data register
                pub const txdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Transmit data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] Transmit FIFO full
                    full: u1 = 0,
                
                }), @ptrFromInt(0x10011000));
            
                /// Receive data register
                pub const rxdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Received data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] Receive FIFO empty
                    empty: u1 = 0,
                
                }), @ptrFromInt(0x10011004));
            
                /// Transmit control register
                pub const txctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit enable
                    txen: u1 = 0,
                
                    /// [1:1] Number of stop bits
                    nstop: u1 = 0,
                
                    /// [2:15] 
                    res0: u14 = 0,
                
                    /// [16:18] Transmit watermark level
                    txcnt: u3 = 0,
                
                    /// [19:31] 
                    res1: u13 = 0,
                
                }), @ptrFromInt(0x10011008));
            
                /// Receive control register
                pub const rxctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Receive enable
                    rxen: u1 = 0,
                
                    /// [1:15] 
                    res0: u15 = 0,
                
                    /// [16:18] Receive watermark level
                    rxcnt: u3 = 0,
                
                    /// [19:31] 
                    res1: u13 = 0,
                
                }), @ptrFromInt(0x1001100c));
            
                /// UART interrupt enable
                pub const ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark interrupt enable
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark interrupt enable
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10011010));
            
                /// UART interrupt pending
                pub const ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark interrupt pending
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark interrupt pending
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10011014));
            
                /// Baud rate divisor
                pub const div = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] Baud rate divisor.
                    div: u16 = 0,
                
                    /// [16:31] 
                    res0: u16 = 0,
                
                }), @ptrFromInt(0x10011018));
            
            };
            /// From sifive,spi0,control peripheral generator
            pub const sifive_spi0_0 = struct {
            
                /// Serial clock divisor
                pub const sckdiv = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Divisor for serial clock.
                    div: u12 = 0,
                
                    /// [12:31] 
                    res0: u20 = 0,
                
                }), @ptrFromInt(0x10040000));
            
                /// Serial clock mode
                pub const sckmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Serial clock phase
                    pha: u1 = 0,
                
                    /// [1:1] Serial clock polarity
                    pol: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10040004));
            
                /// Chip select ID
                pub const csid = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select ID.
                    csid: u32 = 0,
                
                }), @ptrFromInt(0x10040010));
            
                /// Chip select default
                pub const csdef = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select default value. Reset to all-1s.
                    csdef: u32 = 0,
                
                }), @ptrFromInt(0x10040014));
            
                /// Chip select mode
                pub const csmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] Chip select mode
                    mode: u2 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10040018));
            
                /// Delay control 0
                pub const delay0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] CS to SCK Delay
                    cssck: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] SCK to CS Delay
                    sckcs: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x10040028));
            
                /// Delay control 1
                pub const delay1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Minimum CS inactive time
                    intercs: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] Maximum interframe delay
                    interxfr: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x1004002c));
            
                /// SPI extra sampling delay to increase the SPI frequency
                pub const extradel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Coarse grain sample delay (multiples of system clocks)
                    coarse: u12 = 0,
                
                    /// [12:16] Fine grain sample delay (multiples of process-specific buffer delay)
                    fine: u5 = 0,
                
                    /// [17:31] 
                    res0: u15 = 0,
                
                }), @ptrFromInt(0x10040038));
            
                /// Number of delay stages from slave to the SPI controller
                pub const sampledel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:4] Number of delay stages from slave to SPI controller
                    sd: u5 = 0,
                
                    /// [5:31] 
                    res0: u27 = 0,
                
                }), @ptrFromInt(0x1004003c));
            
                /// Frame format
                pub const fmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] SPI protocol
                    proto: u2 = 0,
                
                    /// [2:2] SPI endianness
                    endian: u1 = 0,
                
                    /// [3:3] SPI I/O direction. This is reset to 1 for flash-enabled SPI controllers, 0 otherwise.
                    dir: u1 = 0,
                
                    /// [4:15] 
                    res0: u12 = 0,
                
                    /// [16:19] Number of bits per frame
                    len: u4 = 0,
                
                    /// [20:31] 
                    res1: u12 = 0,
                
                }), @ptrFromInt(0x10040040));
            
                /// Tx FIFO Data
                pub const txdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Transmit data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO full flag
                    full: u1 = 0,
                
                }), @ptrFromInt(0x10040048));
            
                /// Rx FIFO data
                pub const rxdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Received data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO empty flag
                    empty: u1 = 0,
                
                }), @ptrFromInt(0x1004004c));
            
                /// Tx FIFO watermark
                pub const txmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Transmit watermark. The reset value is 1 for flash-enabled controllers, 0 otherwise.
                    txmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10040050));
            
                /// Rx FIFO watermark
                pub const rxmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Receive watermark
                    rxmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10040054));
            
                /// SPI flash interface control
                pub const fctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] SPI Flash Mode Select
                    en: u1 = 0,
                
                    /// [1:31] 
                    res0: u31 = 0,
                
                }), @ptrFromInt(0x10040060));
            
                /// SPI flash instruction format
                pub const ffmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Enable sending of command
                    cmd_en: u1 = 0,
                
                    /// [1:3] Number of address bytes (0 to 4)
                    addr_len: u3 = 0,
                
                    /// [4:7] Number of dummy cycles
                    pad_cnt: u4 = 0,
                
                    /// [8:9] Protocol for transmitting command
                    cmd_proto: u2 = 0,
                
                    /// [10:11] Protocol for transmitting address and padding
                    addr_proto: u2 = 0,
                
                    /// [12:13] Protocol for receiving data bytes
                    data_proto: u2 = 0,
                
                    /// [14:15] 
                    res0: u2 = 0,
                
                    /// [16:23] Value of command byte
                    cmd_code: u8 = 0,
                
                    /// [24:31] First 8 bits to transmit during dummy cycles
                    pad_code: u8 = 0,
                
                }), @ptrFromInt(0x10040064));
            
                /// SPI interrupt enable
                pub const ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark enable
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark enable
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10040070));
            
                /// SPI interrupt pending
                pub const ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark pending
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark pending
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10040074));
            
            };
            /// From sifive,spi0,control peripheral generator
            pub const sifive_spi0_1 = struct {
            
                /// Serial clock divisor
                pub const sckdiv = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Divisor for serial clock.
                    div: u12 = 0,
                
                    /// [12:31] 
                    res0: u20 = 0,
                
                }), @ptrFromInt(0x10041000));
            
                /// Serial clock mode
                pub const sckmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Serial clock phase
                    pha: u1 = 0,
                
                    /// [1:1] Serial clock polarity
                    pol: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10041004));
            
                /// Chip select ID
                pub const csid = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select ID.
                    csid: u32 = 0,
                
                }), @ptrFromInt(0x10041010));
            
                /// Chip select default
                pub const csdef = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select default value. Reset to all-1s.
                    csdef: u32 = 0,
                
                }), @ptrFromInt(0x10041014));
            
                /// Chip select mode
                pub const csmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] Chip select mode
                    mode: u2 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10041018));
            
                /// Delay control 0
                pub const delay0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] CS to SCK Delay
                    cssck: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] SCK to CS Delay
                    sckcs: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x10041028));
            
                /// Delay control 1
                pub const delay1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Minimum CS inactive time
                    intercs: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] Maximum interframe delay
                    interxfr: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x1004102c));
            
                /// SPI extra sampling delay to increase the SPI frequency
                pub const extradel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Coarse grain sample delay (multiples of system clocks)
                    coarse: u12 = 0,
                
                    /// [12:16] Fine grain sample delay (multiples of process-specific buffer delay)
                    fine: u5 = 0,
                
                    /// [17:31] 
                    res0: u15 = 0,
                
                }), @ptrFromInt(0x10041038));
            
                /// Number of delay stages from slave to the SPI controller
                pub const sampledel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:4] Number of delay stages from slave to SPI controller
                    sd: u5 = 0,
                
                    /// [5:31] 
                    res0: u27 = 0,
                
                }), @ptrFromInt(0x1004103c));
            
                /// Frame format
                pub const fmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] SPI protocol
                    proto: u2 = 0,
                
                    /// [2:2] SPI endianness
                    endian: u1 = 0,
                
                    /// [3:3] SPI I/O direction. This is reset to 1 for flash-enabled SPI controllers, 0 otherwise.
                    dir: u1 = 0,
                
                    /// [4:15] 
                    res0: u12 = 0,
                
                    /// [16:19] Number of bits per frame
                    len: u4 = 0,
                
                    /// [20:31] 
                    res1: u12 = 0,
                
                }), @ptrFromInt(0x10041040));
            
                /// Tx FIFO Data
                pub const txdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Transmit data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO full flag
                    full: u1 = 0,
                
                }), @ptrFromInt(0x10041048));
            
                /// Rx FIFO data
                pub const rxdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Received data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO empty flag
                    empty: u1 = 0,
                
                }), @ptrFromInt(0x1004104c));
            
                /// Tx FIFO watermark
                pub const txmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Transmit watermark. The reset value is 1 for flash-enabled controllers, 0 otherwise.
                    txmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10041050));
            
                /// Rx FIFO watermark
                pub const rxmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Receive watermark
                    rxmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10041054));
            
                /// SPI flash interface control
                pub const fctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] SPI Flash Mode Select
                    en: u1 = 0,
                
                    /// [1:31] 
                    res0: u31 = 0,
                
                }), @ptrFromInt(0x10041060));
            
                /// SPI flash instruction format
                pub const ffmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Enable sending of command
                    cmd_en: u1 = 0,
                
                    /// [1:3] Number of address bytes (0 to 4)
                    addr_len: u3 = 0,
                
                    /// [4:7] Number of dummy cycles
                    pad_cnt: u4 = 0,
                
                    /// [8:9] Protocol for transmitting command
                    cmd_proto: u2 = 0,
                
                    /// [10:11] Protocol for transmitting address and padding
                    addr_proto: u2 = 0,
                
                    /// [12:13] Protocol for receiving data bytes
                    data_proto: u2 = 0,
                
                    /// [14:15] 
                    res0: u2 = 0,
                
                    /// [16:23] Value of command byte
                    cmd_code: u8 = 0,
                
                    /// [24:31] First 8 bits to transmit during dummy cycles
                    pad_code: u8 = 0,
                
                }), @ptrFromInt(0x10041064));
            
                /// SPI interrupt enable
                pub const ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark enable
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark enable
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10041070));
            
                /// SPI interrupt pending
                pub const ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark pending
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark pending
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10041074));
            
            };
            /// From sifive,spi0,control peripheral generator
            pub const sifive_spi0_2 = struct {
            
                /// Serial clock divisor
                pub const sckdiv = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Divisor for serial clock.
                    div: u12 = 0,
                
                    /// [12:31] 
                    res0: u20 = 0,
                
                }), @ptrFromInt(0x10050000));
            
                /// Serial clock mode
                pub const sckmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Serial clock phase
                    pha: u1 = 0,
                
                    /// [1:1] Serial clock polarity
                    pol: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10050004));
            
                /// Chip select ID
                pub const csid = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select ID.
                    csid: u32 = 0,
                
                }), @ptrFromInt(0x10050010));
            
                /// Chip select default
                pub const csdef = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:31] Chip select default value. Reset to all-1s.
                    csdef: u32 = 0,
                
                }), @ptrFromInt(0x10050014));
            
                /// Chip select mode
                pub const csmode = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] Chip select mode
                    mode: u2 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10050018));
            
                /// Delay control 0
                pub const delay0 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] CS to SCK Delay
                    cssck: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] SCK to CS Delay
                    sckcs: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x10050028));
            
                /// Delay control 1
                pub const delay1 = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Minimum CS inactive time
                    intercs: u8 = 0,
                
                    /// [8:15] 
                    res0: u8 = 0,
                
                    /// [16:23] Maximum interframe delay
                    interxfr: u8 = 0,
                
                    /// [24:31] 
                    res1: u8 = 0,
                
                }), @ptrFromInt(0x1005002c));
            
                /// SPI extra sampling delay to increase the SPI frequency
                pub const extradel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:11] Coarse grain sample delay (multiples of system clocks)
                    coarse: u12 = 0,
                
                    /// [12:16] Fine grain sample delay (multiples of process-specific buffer delay)
                    fine: u5 = 0,
                
                    /// [17:31] 
                    res0: u15 = 0,
                
                }), @ptrFromInt(0x10050038));
            
                /// Number of delay stages from slave to the SPI controller
                pub const sampledel = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:4] Number of delay stages from slave to SPI controller
                    sd: u5 = 0,
                
                    /// [5:31] 
                    res0: u27 = 0,
                
                }), @ptrFromInt(0x1005003c));
            
                /// Frame format
                pub const fmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:1] SPI protocol
                    proto: u2 = 0,
                
                    /// [2:2] SPI endianness
                    endian: u1 = 0,
                
                    /// [3:3] SPI I/O direction. This is reset to 1 for flash-enabled SPI controllers, 0 otherwise.
                    dir: u1 = 0,
                
                    /// [4:15] 
                    res0: u12 = 0,
                
                    /// [16:19] Number of bits per frame
                    len: u4 = 0,
                
                    /// [20:31] 
                    res1: u12 = 0,
                
                }), @ptrFromInt(0x10050040));
            
                /// Tx FIFO Data
                pub const txdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Transmit data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO full flag
                    full: u1 = 0,
                
                }), @ptrFromInt(0x10050048));
            
                /// Rx FIFO data
                pub const rxdata = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:7] Received data
                    data: u8 = 0,
                
                    /// [8:30] 
                    res0: u23 = 0,
                
                    /// [31:31] FIFO empty flag
                    empty: u1 = 0,
                
                }), @ptrFromInt(0x1005004c));
            
                /// Tx FIFO watermark
                pub const txmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Transmit watermark. The reset value is 1 for flash-enabled controllers, 0 otherwise.
                    txmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10050050));
            
                /// Rx FIFO watermark
                pub const rxmark = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:2] Receive watermark
                    rxmark: u3 = 0,
                
                    /// [3:31] 
                    res0: u29 = 0,
                
                }), @ptrFromInt(0x10050054));
            
                /// SPI flash interface control
                pub const fctrl = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] SPI Flash Mode Select
                    en: u1 = 0,
                
                    /// [1:31] 
                    res0: u31 = 0,
                
                }), @ptrFromInt(0x10050060));
            
                /// SPI flash instruction format
                pub const ffmt = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Enable sending of command
                    cmd_en: u1 = 0,
                
                    /// [1:3] Number of address bytes (0 to 4)
                    addr_len: u3 = 0,
                
                    /// [4:7] Number of dummy cycles
                    pad_cnt: u4 = 0,
                
                    /// [8:9] Protocol for transmitting command
                    cmd_proto: u2 = 0,
                
                    /// [10:11] Protocol for transmitting address and padding
                    addr_proto: u2 = 0,
                
                    /// [12:13] Protocol for receiving data bytes
                    data_proto: u2 = 0,
                
                    /// [14:15] 
                    res0: u2 = 0,
                
                    /// [16:23] Value of command byte
                    cmd_code: u8 = 0,
                
                    /// [24:31] First 8 bits to transmit during dummy cycles
                    pad_code: u8 = 0,
                
                }), @ptrFromInt(0x10050064));
            
                /// SPI interrupt enable
                pub const ie = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark enable
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark enable
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10050070));
            
                /// SPI interrupt pending
                pub const ip = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:0] Transmit watermark pending
                    txwm: u1 = 0,
                
                    /// [1:1] Receive watermark pending
                    rxwm: u1 = 0,
                
                    /// [2:31] 
                    res0: u30 = 0,
                
                }), @ptrFromInt(0x10050074));
            
            };
            /// From sifive,test0,control peripheral generator
            pub const sifive_test0_0 = struct {
            
                /// Test finisher register
                pub const finisher = @as(*volatile mmio.Mmio(packed struct(u32) {
                
                    /// [0:15] Test status
                    status: u16 = 0,
                
                    /// [16:31] Finisher code
                    code: u16 = 0,
                
                }), @ptrFromInt(0x4000));
            
            };
        };
    };
};