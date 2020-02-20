Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBAXBXPZAKGQEDRHM64A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD71668D1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 21:48:04 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id a74sf45750oib.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 12:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b/q+TX/SP9ptKCBxNpiX9FFKdYHYNc+5bzyxUkrcMNU=;
        b=jOhrMPD3aekvO8P6/sjnQwRofETbV2o+QqGamfM853RulVGPBUNq7q01VkQxOdcS/K
         qUBzCZUmBe1FVXzwRnzvMvaOILlNjShgeymSKqZYV3QgtNGGsuyzjeVWIM8GbcutvbcL
         lyXBYm2AkNDRWqXaoBzUPFPd2KS1sGaKNEqMGiEYPmgHQoUhmGAVKNITrvwGJeAHHA7K
         IoAI1RUsTGAVCeKeCZIXjsxa9+f+P4dMW/5uwlb76rE0/TsSxHEtT94bRgqNAYYQ7ASE
         sRjuEAPMUqovZ2YwnQx4toggbmsRBIWb+6EAnNg5ahtCnpkH+30sEuoYdZTk7jZ292/9
         amdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b/q+TX/SP9ptKCBxNpiX9FFKdYHYNc+5bzyxUkrcMNU=;
        b=PJX5+jSza1/GxT69qxsDjhndpAmkVH5QfFLfgp8Pbg9ZgVc1+JElRPKRofZlK08bwH
         QA33Bm962Ih2if8ZuW5TTdL4gNfzhwOrfcU8SUTo/2p0nGXG8dHUmIlxCr6SsHfRTbGc
         IqGOr8s6/g6aktHzRPE06IhplUCrV/FEuMOtHC5iNnOduSjEuKPb+kQ1fcAbtVxveUVJ
         844+yW1AjH2XzyrwGUVqrBCJ5382A2QFgv/3AGqr252kYr676USiXxcsq53ifcDIPZ7M
         pCfpegaN9UtyDOzaD/OeuDDigq1MCLc8NtKdjAyMLMiHitVk3o8aInajJDu5HE/zWNaw
         QI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b/q+TX/SP9ptKCBxNpiX9FFKdYHYNc+5bzyxUkrcMNU=;
        b=eDLrKBEr9cv7lD1i0wPFiv9e5BrCyucCkk5K0wT13jSYyb1vl7vPiiUJA/0AsQh8FU
         sJJkiwDWEjYBtN6Q3OnEQ2eATEROuOBVDelPU/8KnbEx0XVfasC6ZZWeyOPJTq0Fedh0
         1s+8xCnIBGtL4py5cN75I7yc7Kk9aLqAfUc6CYSGF2mcFR91cabbwq9ZcSMNnDE0jwrb
         nfnskS3OWg+rzDFjo8OFONAPfeLCZXbXkiIjcEe/CgsDpRf9J2KlwJpFLMW7bj8aqgcj
         5aLBOvRxjCu3bolsErPYKkpxcEvDBNKinmgDyycIojxl/pR4vik3uqIcvcouz4QIwHIE
         WlRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6nQy5sBsI21cB3NdUaunoVmEFx0QLDfPxUNCErVNhz7jB1W2f
	Pk3OMI493uwAkpivKfm0zUk=
X-Google-Smtp-Source: APXvYqxwGpoLX6yPlJX2qYP3qqQHoxAX9QgAaVBPLLfXo8GpTWT5Qc0QBz+7aMzXEqTlKg6+ZOIeVg==
X-Received: by 2002:a05:6830:18d4:: with SMTP id v20mr25522354ote.29.1582231683060;
        Thu, 20 Feb 2020 12:48:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:649:: with SMTP id z9ls818064oih.3.gmail; Thu, 20
 Feb 2020 12:48:02 -0800 (PST)
X-Received: by 2002:aca:1b17:: with SMTP id b23mr3568392oib.95.1582231681966;
        Thu, 20 Feb 2020 12:48:01 -0800 (PST)
Date: Thu, 20 Feb 2020 12:48:01 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <84e4bb7d-006b-408d-962b-a5348114fb81@googlegroups.com>
Subject: Need help to configure non-root linux cell configuration and dts
 file for jetson tx2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16_1246040165.1582231681325"
X-Original-Sender: samirroj2016@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_16_1246040165.1582231681325
Content-Type: multipart/alternative; 
	boundary="----=_Part_17_887376543.1582231681325"

------=_Part_17_887376543.1582231681325
Content-Type: text/plain; charset="UTF-8"

Finally, I was able to install jailhouse and successfully run apic-demo on 
the kit. I want to create non-root linux cell; I used jetson-tx1-linux-demo 
as template but I was unble to define GIC and pci device and vpci_irq_base 
setting. Similarly, I have problem in creating dts file for the tx2 here 
also I used inmate-tx1.dts file as template. Both of the files are 
displayed below please provide me help to create these two files. 
what are the necessary changes that i have to make please provide me some 
help.

[1]linux-cell-configuration::::::::::::::::::::::::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

#ifndef CONFIG_INMATE_BASE
#define CONFIG_INMATE_BASE 0x0
#endif

struct {
    struct jailhouse_cell_desc cell;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[5];
    struct jailhouse_irqchip irqchips[3];
    struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
    .cell = {
        .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
        .revision = JAILHOUSE_CONFIG_REVISION,
        .name = "jetson-tx2-linux-demo",
        .flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
             JAILHOUSE_CELL_DEBUG_CONSOLE,

        .cpu_set_size = sizeof(config.cpus),
        .num_memory_regions = ARRAY_SIZE(config.mem_regions),
        .num_irqchips = ARRAY_SIZE(config.irqchips),
        .num_pci_devices = ARRAY_SIZE(config.pci_devices),

      *  .vpci_irq_base = 260, /*152*/ //how to get (from where I can get) 
vpci_irq_base *

        .cpu_reset_address = CONFIG_INMATE_BASE,
    },

    .cpus = {
        0x30,/*0xc for tx1*/
    },

    .mem_regions = {
        /* UART */ {
            .phys_start = 0x3100000,/*0x70006000*/
            .virt_start = 0x3100000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
        },
        /* RAM */ {
            .phys_start = 0x26ef00000,/*0x17bef0000*/
            .virt_start = CONFIG_INMATE_BASE,
            .size = 0x10000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                JAILHOUSE_MEM_LOADABLE,
        },
        /* RAM */ {
            .phys_start = 0x252d00000,/*0x161200000*/
            .virt_start = 0xe8000000,/*to do*/
            .size = 0x1c200000,/*0x1acf0000*/
            .flags = JAILHOUSE_MEM_RcEAD | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                JAILHOUSE_MEM_LOADABLE,
        },
        /* IVSHMEM shared memory region */ {
            .phys_start = 0x26f000000,/*0x17bf00000,*/
            .virt_start = 0x26f000000,
            .size = 0x100000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
        },
        /* communication region */ {
            .virt_start = 0x80000000,
            .size = 0x00001000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_COMM_REGION,
        },
    },

    .irqchips = {
        /* GIC */ {
            .address = 0x03881000,/*0x50041000,*/
            

*.pin_base = 32,            .pin_bitmap = {                0, (1 << (36 % 
32)), 0, 0 //how to set this .pin_bitmap & where I can find the pin details*
            },
        },
        /* GIC */ {
            .address = 0x03881000,
            

*.pin_base = 160,            .pin_bitmap = {                1 << (260+32 - 
160),/*1<<(152+32-160) for tx1*/ ** //how to set this .pin_bitmap & where I 
can find the pin details*
            },
        },
        /* GIC */ {
            .address = 0x03881000,/*newly added for tx2*/
           

* .pin_base = 288,            .pin_bitmap = {                1 << 
(260+32+160 - 288),* *//how to set this .pin_bitmap & where I can find the 
pin details*
            },
        },
    },

    .pci_devices = {
      






*  /* 00:00.0 */ {            .type = JAILHOUSE_PCI_TYPE_IVSHMEM,        
    .bdf = 0x00,            .bar_mask = { //how to define bar_mask?        
        0xffffff00, 0xffffffff, 0x00000000,                0x00000000, 
0x00000000, 0x00000000,            },            .shmem_region = 3,*
            .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
        },
    },
};

[2] dts 
file:::::::::::::::::::::::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include <dt-bindings/interrupt-controller/arm-gic.h>

/dts-v1/;

/ {
    model = "Jailhouse cell on NVIDIA Jetson TX2";

    #address-cells = <1>;
    #size-cells = <1>;

    interrupt-parent = <&gic>;

    hypervisor {
        compatible = "jailhouse,cell";
    };

    cpus {
        #address-cells = <1>;
        #size-cells = <0>;

        cpu@4 {
            compatible = "arm,cortex-a57";
            device_type = "cpu";
            enable-method = "psci";
            reg = <0x4>;
        };

        cpu@5 {
            compatible = "arm,cortex-a57";
            device_type = "cpu";
            enable-method = "psci";
            reg = <0x5>;
        };
    };

    psci {
        compatible = "arm,psci-0.2";
        method = "smc";
    };

    gic: interrupt-controller@03881000 {
        compatible = "arm,gic-400";
        #interrupt-cells = <3>;
        interrupt-controller;
        reg = <0x03881000 0x1000>, /*0x50041000 0x1000 for tx1/
              <0x03882000 0x1000>;
    };

    timer {
        compatible = "arm,armv8-timer";
        interrupts = <GIC_PPI 13 *//is this same for all armv8 architecture 
*
                (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
                 <GIC_PPI 14
                (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
                 <GIC_PPI 11
                (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
                 <GIC_PPI 10
                (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
        interrupt-parent = <&gic>;
    };

    serial@31000000 {
        compatible = "nvidia,tegra210-uart", "nvidia,tegra20-uart";
        reg = <0x31000000 0x40>;                 /*0x70006000 0x40 for tx1 **/ 
//whats the 0x40 here does this need to be changed*
        reg-shift = <2>;
        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
      *  clock-frequency = <408000000>;//how to define clock frequency 
where to look*
        status = "okay";
    };

    pci@40000000 {                                                       
/*48000000 tx1*/
        status = "okay";
        compatible = "pci-host-ecam-generic";
        device_type = "pci";
        bus-range = <0 0>;
        #address-cells = <3>;
        #size-cells = <2>;
        #interrupt-cells = <1>;
      



*  interrupt-map-mask = <0 0 0 7>;//how to define interrupt-map-mask        
interrupt-map = <0 0 0 1 &gic GIC_SPI 152 IRQ_TYPE_EDGE_RISING>,//how to 
set interrupt-map, i think i have set it wrongly.                <0 0 0 2 
&gic GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,/*152 for tx1*/                 <0 0 
0 3 &gic GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,,/*153 for tx1*/                
<0 0 0 4 &gic GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;,/*154 for tx1*/*
       

* reg = <0x40000000 0x100000>;//how to define reg for tx2        ranges 
=            <0x02000000 0x00 0x10000000 0x10000000 0x00 0x10000>;//how to 
define ranges for tx2*
    };
};

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84e4bb7d-006b-408d-962b-a5348114fb81%40googlegroups.com.

------=_Part_17_887376543.1582231681325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5GaW5hbGx5LCBJIHdhcyBhYmxlIHRvIGluc3RhbGwgamFpbGhv
dXNlIGFuZCBzdWNjZXNzZnVsbHkgcnVuIGFwaWMtZGVtbyBvbiB0aGUga2l0LiBJIHdhbnQgdG8g
Y3JlYXRlIG5vbi1yb290IGxpbnV4IGNlbGw7IEkgdXNlZCBqZXRzb24tdHgxLWxpbnV4LWRlbW8g
YXMgdGVtcGxhdGUgYnV0IEkgd2FzIHVuYmxlIHRvIGRlZmluZSBHSUMgYW5kIHBjaSBkZXZpY2Ug
YW5kIHZwY2lfaXJxX2Jhc2Ugc2V0dGluZy4gU2ltaWxhcmx5LCBJIGhhdmUgcHJvYmxlbSBpbiBj
cmVhdGluZyBkdHMgZmlsZSBmb3IgdGhlIHR4MiBoZXJlIGFsc28gSSB1c2VkIGlubWF0ZS10eDEu
ZHRzIGZpbGUgYXMgdGVtcGxhdGUuIEJvdGggb2YgdGhlIGZpbGVzIGFyZSBkaXNwbGF5ZWQgYmVs
b3cgcGxlYXNlIHByb3ZpZGUgbWUgaGVscCB0byBjcmVhdGUgdGhlc2UgdHdvIGZpbGVzLiA8YnI+
PC9kaXY+PGRpdj53aGF0IGFyZSB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMgdGhhdCBpIGhhdmUgdG8g
bWFrZSBwbGVhc2UgcHJvdmlkZSBtZSBzb21lIGhlbHAuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+WzFdbGludXgtY2VsbC1jb25maWd1cmF0aW9uOjo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs8YnI+PC9kaXY+PGRpdj4jaW5j
bHVkZSAmbHQ7amFpbGhvdXNlL3R5cGVzLmgmZ3Q7PC9kaXY+I2luY2x1ZGUgJmx0O2phaWxob3Vz
ZS9jZWxsLWNvbmZpZy5oJmd0Ozxicj48YnI+I2RlZmluZSBBUlJBWV9TSVpFKGEpIHNpemVvZihh
KSAvIHNpemVvZihhWzBdKTxicj48YnI+I2lmbmRlZiBDT05GSUdfSU5NQVRFX0JBU0U8YnI+I2Rl
ZmluZSBDT05GSUdfSU5NQVRFX0JBU0UgMHgwPGJyPiNlbmRpZjxicj48YnI+c3RydWN0IHs8YnI+
wqDCoMKgIHN0cnVjdCBqYWlsaG91c2VfY2VsbF9kZXNjIGNlbGw7PGJyPsKgwqDCoCBfX3U2NCBj
cHVzWzFdOzxicj7CoMKgwqAgc3RydWN0IGphaWxob3VzZV9tZW1vcnkgbWVtX3JlZ2lvbnNbNV07
PGJyPsKgwqDCoCBzdHJ1Y3QgamFpbGhvdXNlX2lycWNoaXAgaXJxY2hpcHNbM107PGJyPsKgwqDC
oCBzdHJ1Y3QgamFpbGhvdXNlX3BjaV9kZXZpY2UgcGNpX2RldmljZXNbMV07PGJyPn0gX19hdHRy
aWJ1dGVfXygocGFja2VkKSkgY29uZmlnID0gezxicj7CoMKgwqAgLmNlbGwgPSB7PGJyPsKgwqDC
oCDCoMKgwqAgLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9DRUxMX0RFU0NfU0lHTkFUVVJFLDxicj7C
oMKgwqAgwqDCoMKgIC5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04sPGJyPsKg
wqDCoCDCoMKgwqAgLm5hbWUgPSAmcXVvdDtqZXRzb24tdHgyLWxpbnV4LWRlbW8mcXVvdDssPGJy
PsKgwqDCoCDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX0NFTExfUEFTU0lWRV9DT01NUkVHIHw8
YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqBKQUlMSE9VU0VfQ0VMTF9ERUJVR19DT05TT0xFLDxi
cj48YnI+wqDCoMKgIMKgwqDCoCAuY3B1X3NldF9zaXplID0gc2l6ZW9mKGNvbmZpZy5jcHVzKSw8
YnI+wqDCoMKgIMKgwqDCoCAubnVtX21lbW9yeV9yZWdpb25zID0gQVJSQVlfU0laRShjb25maWcu
bWVtX3JlZ2lvbnMpLDxicj7CoMKgwqAgwqDCoMKgIC5udW1faXJxY2hpcHMgPSBBUlJBWV9TSVpF
KGNvbmZpZy5pcnFjaGlwcyksPGJyPsKgwqDCoCDCoMKgwqAgLm51bV9wY2lfZGV2aWNlcyA9IEFS
UkFZX1NJWkUoY29uZmlnLnBjaV9kZXZpY2VzKSw8YnI+PGJyPsKgwqDCoCDCoMKgPGI+wqAgLnZw
Y2lfaXJxX2Jhc2UgPSAyNjAsIC8qMTUyKi8gLy9ob3cgdG8gZ2V0IChmcm9tIHdoZXJlIEkgY2Fu
IGdldCkgdnBjaV9pcnFfYmFzZSA8L2I+PGJyPjxicj7CoMKgwqAgwqDCoMKgIC5jcHVfcmVzZXRf
YWRkcmVzcyA9IENPTkZJR19JTk1BVEVfQkFTRSw8YnI+wqDCoMKgIH0sPGJyPjxicj7CoMKgwqAg
LmNwdXMgPSB7PGJyPsKgwqDCoCDCoMKgwqAgMHgzMCwvKjB4YyBmb3IgdHgxKi88YnI+wqDCoMKg
IH0sPGJyPjxicj7CoMKgwqAgLm1lbV9yZWdpb25zID0gezxicj7CoMKgwqAgwqDCoMKgIC8qIFVB
UlQgKi8gezxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAucGh5c19zdGFydCA9IDB4MzEwMDAwMCwv
KjB4NzAwMDYwMDAqLzxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAudmlydF9zdGFydCA9IDB4MzEw
MDAwMCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLnNpemUgPSAweDEwMDAsPGJyPsKgwqDCoCDC
oMKgwqAgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgSkFJTEhPVVNFX01FTV9JTyB8
IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCw8YnI+wqDCoMKgIMKgwqDCoCB9LDxicj7CoMKgwqAg
wqDCoMKgIC8qIFJBTSAqLyB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5waHlzX3N0YXJ0ID0g
MHgyNmVmMDAwMDAsLyoweDE3YmVmMDAwMCovPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC52aXJ0
X3N0YXJ0ID0gQ09ORklHX0lOTUFURV9CQVNFLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuc2l6
ZSA9IDB4MTAwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9N
RU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEgfDxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgSkFJTEhPVVNFX01FTV9MT0FEQUJMRSw8YnI+wqDCoMKg
IMKgwqDCoCB9LDxicj7CoMKgwqAgwqDCoMKgIC8qIFJBTSAqLyB7PGJyPsKgwqDCoCDCoMKgwqAg
wqDCoMKgIC5waHlzX3N0YXJ0ID0gMHgyNTJkMDAwMDAsLyoweDE2MTIwMDAwMCovPGJyPsKgwqDC
oCDCoMKgwqAgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHhlODAwMDAwMCwvKnRvIGRvKi88YnI+wqDC
oMKgIMKgwqDCoCDCoMKgwqAgLnNpemUgPSAweDFjMjAwMDAwLC8qMHgxYWNmMDAwMCovPGJyPsKg
wqDCoCDCoMKgwqAgwqDCoMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUmNFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFIHw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIEpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BIHw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgIEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsPGJyPsKgwqDCoCDCoMKgwqAgfSw8YnI+wqDC
oMKgIMKgwqDCoCAvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uICovIHs8YnI+wqDCoMKg
IMKgwqDCoCDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDI2ZjAwMDAwMCwvKjB4MTdiZjAwMDAwLCov
PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHgyNmYwMDAwMDAsPGJyPsKg
wqDCoCDCoMKgwqAgwqDCoMKgIC5zaXplID0gMHgxMDAwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDC
oMKgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxi
cj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELDxi
cj7CoMKgwqAgwqDCoMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgLyogY29tbXVuaWNhdGlvbiByZWdp
b24gKi8gezxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAudmlydF9zdGFydCA9IDB4ODAwMDAwMDAs
PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5zaXplID0gMHgwMDAwMTAwMCw8YnI+wqDCoMKgIMKg
wqDCoCDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBKQUlMSE9VU0VfTUVNX0NPTU1f
UkVHSU9OLDxicj7CoMKgwqAgwqDCoMKgIH0sPGJyPsKgwqDCoCB9LDxicj48YnI+wqDCoMKgIC5p
cnFjaGlwcyA9IHs8YnI+wqDCoMKgIMKgwqDCoCAvKiBHSUMgKi8gezxicj7CoMKgwqAgwqDCoMKg
IMKgwqDCoCAuYWRkcmVzcyA9IDB4MDM4ODEwMDAsLyoweDUwMDQxMDAwLCovPGJyPsKgwqDCoCDC
oMKgwqAgwqDCoMKgIDxiPi5waW5fYmFzZSA9IDMyLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAu
cGluX2JpdG1hcCA9IHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIDAsICgxICZsdDsm
bHQ7ICgzNiAlIDMyKSksIDAsIDAgLy9ob3cgdG8gc2V0IHRoaXMgLnBpbl9iaXRtYXAgJmFtcDsg
d2hlcmUgSSBjYW4gZmluZCB0aGUgcGluIGRldGFpbHM8L2I+PGJyPsKgwqDCoCDCoMKgwqAgwqDC
oMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgfSw8YnI+wqDCoMKgIMKgwqDCoCAvKiBHSUMgKi8gezxi
cj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuYWRkcmVzcyA9IDB4MDM4ODEwMDAsPGJyPsKgwqDCoCDC
oMKgwqAgwqDCoMKgIDxiPi5waW5fYmFzZSA9IDE2MCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
LnBpbl9iaXRtYXAgPSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAxICZsdDsmbHQ7
ICgyNjArMzIgLSAxNjApLC8qMSZsdDsmbHQ7KDE1MiszMi0xNjApIGZvciB0eDEqLyA8L2I+PGI+
IC8vaG93IHRvIHNldCB0aGlzIC5waW5fYml0bWFwICZhbXA7IHdoZXJlIEkgY2FuIGZpbmQgdGhl
IHBpbiBkZXRhaWxzPC9iPjxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCB9LDxicj7CoMKgwqAgwqDC
oMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgLyogR0lDICovIHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKg
wqAgLmFkZHJlc3MgPSAweDAzODgxMDAwLC8qbmV3bHkgYWRkZWQgZm9yIHR4MiovPGJyPsKgwqDC
oCDCoMKgwqAgwqDCoMKgPGI+IC5waW5fYmFzZSA9IDI4OCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKg
wqAgLnBpbl9iaXRtYXAgPSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAxICZsdDsm
bHQ7ICgyNjArMzIrMTYwIC0gMjg4KSw8L2I+PGI+IDwvYj48Yj4vL2hvdyB0byBzZXQgdGhpcyAu
cGluX2JpdG1hcCAmYW1wOyB3aGVyZSBJIGNhbiBmaW5kIHRoZSBwaW4gZGV0YWlsczwvYj48YnI+
wqDCoMKgIMKgwqDCoCDCoMKgwqAgfSw8YnI+wqDCoMKgIMKgwqDCoCB9LDxicj7CoMKgwqAgfSw8
YnI+PGJyPsKgwqDCoCAucGNpX2RldmljZXMgPSB7PGJyPsKgwqDCoCDCoMKgPGI+wqAgLyogMDA6
MDAuMCAqLyB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC50eXBlID0gSkFJTEhPVVNFX1BDSV9U
WVBFX0lWU0hNRU0sPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5iZGYgPSAweDAwLDxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCAuYmFyX21hc2sgPSB7IC8vaG93IHRvIGRlZmluZSBiYXJfbWFzaz88
YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIDB4ZmZmZmZmMDAsIDB4ZmZmZmZmZmYsIDB4
MDAwMDAwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCB9LDxicj7CoMKgwqAg
wqDCoMKgIMKgwqDCoCAuc2htZW1fcmVnaW9uID0gMyw8L2I+PGJyPsKgwqDCoCDCoMKgwqAgwqDC
oMKgIC5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19WRVRILDxicj7CoMKg
wqAgwqDCoMKgIH0sPGJyPsKgwqDCoCB9LDxicj48ZGl2Pn07PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5bMl0gZHRzIGZpbGU6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojs7Ozs7Ozs7Ozs7Ozs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7
Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs8L2Rpdj48ZGl2PiNpbmNsdWRlICZsdDtkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmgmZ3Q7PGJyPjxicj4vZHRzLXYxLzs8
YnI+PGJyPi8gezxicj7CoMKgwqAgbW9kZWwgPSAmcXVvdDtKYWlsaG91c2UgY2VsbCBvbiBOVklE
SUEgSmV0c29uIFRYMiZxdW90Ozs8YnI+PGJyPsKgwqDCoCAjYWRkcmVzcy1jZWxscyA9ICZsdDsx
Jmd0Ozs8YnI+wqDCoMKgICNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj48YnI+wqDCoMKgIGlu
dGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFtcDtnaWMmZ3Q7Ozxicj48YnI+wqDCoMKgIGh5cGVydmlz
b3Igezxicj7CoMKgwqAgwqDCoMKgIGNvbXBhdGlibGUgPSAmcXVvdDtqYWlsaG91c2UsY2VsbCZx
dW90Ozs8YnI+wqDCoMKgIH07PGJyPjxicj7CoMKgwqAgY3B1cyB7PGJyPsKgwqDCoCDCoMKgwqAg
I2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPsKgwqDCoCDCoMKgwqAgI3NpemUtY2VsbHMg
PSAmbHQ7MCZndDs7PGJyPjxicj7CoMKgwqAgwqDCoMKgIGNwdUA0IHs8YnI+wqDCoMKgIMKgwqDC
oCDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTU3JnF1b3Q7Ozxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCBkZXZpY2VfdHlwZSA9ICZxdW90O2NwdSZxdW90Ozs8YnI+wqDCoMKg
IMKgwqDCoCDCoMKgwqAgZW5hYmxlLW1ldGhvZCA9ICZxdW90O3BzY2kmcXVvdDs7PGJyPsKgwqDC
oCDCoMKgwqAgwqDCoMKgIHJlZyA9ICZsdDsweDQmZ3Q7Ozxicj7CoMKgwqAgwqDCoMKgIH07PGJy
Pjxicj7CoMKgwqAgwqDCoMKgIGNwdUA1IHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgY29tcGF0
aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTU3JnF1b3Q7Ozxicj7CoMKgwqAgwqDCoMKgIMKgwqDC
oCBkZXZpY2VfdHlwZSA9ICZxdW90O2NwdSZxdW90Ozs8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
ZW5hYmxlLW1ldGhvZCA9ICZxdW90O3BzY2kmcXVvdDs7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKg
IHJlZyA9ICZsdDsweDUmZ3Q7Ozxicj7CoMKgwqAgwqDCoMKgIH07PGJyPsKgwqDCoCB9Ozxicj48
YnI+wqDCoMKgIHBzY2kgezxicj7CoMKgwqAgwqDCoMKgIGNvbXBhdGlibGUgPSAmcXVvdDthcm0s
cHNjaS0wLjImcXVvdDs7PGJyPsKgwqDCoCDCoMKgwqAgbWV0aG9kID0gJnF1b3Q7c21jJnF1b3Q7
Ozxicj7CoMKgwqAgfTs8YnI+PGJyPsKgwqDCoCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQDAz
ODgxMDAwIHs8YnI+wqDCoMKgIMKgwqDCoCBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGdpYy00MDAm
cXVvdDs7PGJyPsKgwqDCoCDCoMKgwqAgI2ludGVycnVwdC1jZWxscyA9ICZsdDszJmd0Ozs8YnI+
wqDCoMKgIMKgwqDCoCBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+wqDCoMKgIMKgwqDCoCByZWcg
PSAmbHQ7MHgwMzg4MTAwMCAweDEwMDAmZ3Q7LCAvKjB4NTAwNDEwMDAgMHgxMDAwIGZvciB0eDEv
PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgwqDCoCAmbHQ7MHgwMzg4MjAwMCAweDEwMDAmZ3Q7Ozxi
cj7CoMKgwqAgfTs8YnI+PGJyPsKgwqDCoCB0aW1lciB7PGJyPsKgwqDCoCDCoMKgwqAgY29tcGF0
aWJsZSA9ICZxdW90O2FybSxhcm12OC10aW1lciZxdW90Ozs8YnI+wqDCoMKgIMKgwqDCoCBpbnRl
cnJ1cHRzID0gJmx0O0dJQ19QUEkgMTMgPGI+Ly9pcyB0aGlzIHNhbWUgZm9yIGFsbCBhcm12OCBh
cmNoaXRlY3R1cmUgPC9iPjxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgKEdJQ19DUFVf
TUFTS19TSU1QTEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpJmd0Oyw8YnI+wqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgwqAgJmx0O0dJQ19QUEkgMTQ8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgIChHSUNfQ1BVX01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKSZndDss
PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoMKgICZsdDtHSUNfUFBJIDExPGJyPsKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElSUV9UWVBF
X0xFVkVMX0xPVykmZ3Q7LDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoCAmbHQ7R0lD
X1BQSSAxMDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgKEdJQ19DUFVfTUFTS19TSU1Q
TEUoNCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpJmd0Ozs8YnI+wqDCoMKgIMKgwqDCoCBpbnRlcnJ1
cHQtcGFyZW50ID0gJmx0OyZhbXA7Z2ljJmd0Ozs8YnI+wqDCoMKgIH07PGJyPjxicj7CoMKgwqAg
c2VyaWFsQDMxMDAwMDAwIHs8YnI+wqDCoMKgIMKgwqDCoCBjb21wYXRpYmxlID0gJnF1b3Q7bnZp
ZGlhLHRlZ3JhMjEwLXVhcnQmcXVvdDssICZxdW90O252aWRpYSx0ZWdyYTIwLXVhcnQmcXVvdDs7
PGJyPsKgwqDCoCDCoMKgwqAgcmVnID0gJmx0OzB4MzEwMDAwMDAgMHg0MCZndDs7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoweDcwMDA2MDAwIDB4NDAgZm9yIHR4MSAqPGI+LyAv
L3doYXRzIHRoZSAweDQwIGhlcmUgZG9lcyB0aGlzIG5lZWQgdG8gYmUgY2hhbmdlZDwvYj48YnI+
wqDCoMKgIMKgwqDCoCByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPsKgwqDCoCDCoMKgwqAgaW50
ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj7CoMKg
wqAgwqDCoDxiPsKgIGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDs0MDgwMDAwMDAmZ3Q7Oy8vaG93IHRv
IGRlZmluZSBjbG9jayBmcmVxdWVuY3kgd2hlcmUgdG8gbG9vazwvYj48YnI+wqDCoMKgIMKgwqDC
oCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj7CoMKgwqAgfTs8YnI+PGJyPsKgwqDCoCBw
Y2lANDAwMDAwMDAge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKjQ4MDAwMDAwIHR4MSovPGJyPsKgwqDCoCDCoMKgwqAgc3RhdHVzID0gJnF1b3Q7
b2theSZxdW90Ozs8YnI+wqDCoMKgIMKgwqDCoCBjb21wYXRpYmxlID0gJnF1b3Q7cGNpLWhvc3Qt
ZWNhbS1nZW5lcmljJnF1b3Q7Ozxicj7CoMKgwqAgwqDCoMKgIGRldmljZV90eXBlID0gJnF1b3Q7
cGNpJnF1b3Q7Ozxicj7CoMKgwqAgwqDCoMKgIGJ1cy1yYW5nZSA9ICZsdDswIDAmZ3Q7Ozxicj7C
oMKgwqAgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gJmx0OzMmZ3Q7Ozxicj7CoMKgwqAgwqDCoMKg
ICNzaXplLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj7CoMKgwqAgwqDCoMKgICNpbnRlcnJ1cHQtY2Vs
bHMgPSAmbHQ7MSZndDs7PGJyPsKgwqDCoCDCoMKgPGI+wqAgaW50ZXJydXB0LW1hcC1tYXNrID0g
Jmx0OzAgMCAwIDcmZ3Q7Oy8vaG93IHRvIGRlZmluZSBpbnRlcnJ1cHQtbWFwLW1hc2s8YnI+wqDC
oMKgIMKgwqDCoCBpbnRlcnJ1cHQtbWFwID0gJmx0OzAgMCAwIDEgJmFtcDtnaWMgR0lDX1NQSSAx
NTIgSVJRX1RZUEVfRURHRV9SSVNJTkcmZ3Q7LC8vaG93IHRvIHNldCBpbnRlcnJ1cHQtbWFwLCBp
IHRoaW5rIGkgaGF2ZSBzZXQgaXQgd3JvbmdseS48YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgICZsdDswIDAgMCAyICZhbXA7Z2ljIEdJQ19TUEkgMjYwIElSUV9UWVBFX0VER0VfUklTSU5H
Jmd0OywvKjE1MiBmb3IgdHgxKi8gPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAmbHQ7
MCAwIDAgMyAmYW1wO2dpYyBHSUNfU1BJIDI2MSBJUlFfVFlQRV9FREdFX1JJU0lORyZndDssLC8q
MTUzIGZvciB0eDEqLzxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgJmx0OzAgMCAwIDQg
JmFtcDtnaWMgR0lDX1NQSSAyNjIgSVJRX1RZUEVfRURHRV9SSVNJTkcmZ3Q7OywvKjE1NCBmb3Ig
dHgxKi88L2I+PGJyPsKgwqDCoCDCoMKgwqA8Yj4gcmVnID0gJmx0OzB4NDAwMDAwMDAgMHgxMDAw
MDAmZ3Q7Oy8vaG93IHRvIGRlZmluZSByZWcgZm9yIHR4Mjxicj7CoMKgwqAgwqDCoMKgIHJhbmdl
cyA9PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgICZsdDsweDAyMDAwMDAwIDB4MDAgMHgxMDAwMDAw
MCAweDEwMDAwMDAwIDB4MDAgMHgxMDAwMCZndDs7Ly9ob3cgdG8gZGVmaW5lIHJhbmdlcyBmb3Ig
dHgyPC9iPjxicj7CoMKgwqAgfTs8YnI+fTs8YnI+PC9kaXY+PC9kaXY+DQoNCjxwPjwvcD4KCi0t
IDxiciAvPgpZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3Jp
YmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90OyBncm91cC48YnIg
Lz4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFp
bHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRl
dit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJl
QGdvb2dsZWdyb3Vwcy5jb208L2E+LjxiciAvPgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0
aGUgd2ViIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9q
YWlsaG91c2UtZGV2Lzg0ZTRiYjdkLTAwNmItNDA4ZC05NjJiLWE1MzQ4MTE0ZmI4MSU0MGdvb2ds
ZWdyb3Vwcy5jb20/dXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPWZvb3RlciI+aHR0cHM6Ly9n
cm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvODRlNGJiN2QtMDA2Yi00MDhk
LTk2MmItYTUzNDgxMTRmYjgxJTQwZ29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJyIC8+Cg==
------=_Part_17_887376543.1582231681325--

------=_Part_16_1246040165.1582231681325--
