Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBSVU6X2QKGQEE6CFLEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3431D336F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 May 2020 16:48:44 +0200 (CEST)
Received: by mail-oo1-xc38.google.com with SMTP id b9sf1741655oom.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 May 2020 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Iw8ZdZMPvMdt1ISPOEuaxPIxIRao3inmhXsdgzUYFzY=;
        b=fx9H7Nh/JS64u9e+LuBLZYkYoHOh9pGQxPIjV+EBRZCgiqsKechWy4mqqFVQ7cgxIG
         D7l7VXJQlqMknW5YXI3jdOILR99dw2fkQRmfK8VJxYcrnW5gkDmxbGWR307EHembfQ5q
         a6xoEHefUsUGhC4G0ZbIS1n9IekN7O6SrqiA+o6PRV8uabp9JlQWWet5Li/FfMgRjfBH
         Mgb5RJ9PxXaoxxpWOxvqyjobYWHQZ/AvCi/aN0YFxnMYDDDfMfrF89+S/7Y21ZBOua5f
         D1nhYQzOAznjZpkL7cYZe8IzjwdDuN7onc76wZZSyZVAl6YZmH2QKVeyxNvZTyuasqDt
         PG3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iw8ZdZMPvMdt1ISPOEuaxPIxIRao3inmhXsdgzUYFzY=;
        b=EW4vOlSgDxAmVNDZAkQAWHyyg5Ni1o1hdZ0eYvBFFkdpGfWm+A/3QDGsryOmTylf7X
         jafDyy0/lpjtCMRF7ulvzT7x4Uth6wwOdF3aEfLOiMz5S8qmEOKi0DjrWky6M/DYbH7R
         172pEXUUQdUOahtZ7ylGZhz2U6k7aroX5KJSieQm11yDSpiVa0afrHxcYC08myrYdMzx
         7vbn8v7tUa8GNopLJ5ArMtizlZtUINRTUtwhwts3zeLzNtQkZYPlhD4xISeJiDwvL5XS
         VDmSedsDDUczFNcRMrC9gWFYndFU7cemVigS331P8nnkQWkM28EHBO58/N+eU1U328kd
         v1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Iw8ZdZMPvMdt1ISPOEuaxPIxIRao3inmhXsdgzUYFzY=;
        b=avrcoM46TXMjuwZeMLVXrmQovSuvZOMqz/5swV2qkeGO8XPfyc1uukTVS289Vf4d0J
         04SvI5TupijbcDTkfMd87+gvG4WQ3wM5bEkeJ1oGA/JcmWCyzp7x/c/kOriwgRjAhM4p
         vNUSmxQAtUYPl7pAAoCwp0IGwiiXeKu9cifCuqd8tT8HiexG55BlbyAqfyMnqUWYHCZ8
         6hDnWRX9v1KwEQpjTCxvguhCJX06+9OJRqry1tojtvMVjwK+FpSiPBtldJIihIem7xMh
         sz+s2B1ugLdGfTvYmEUmbdLU/6qwksoJw7MjxM9U5D2IhgtpvAsVWUt7vMiNaL2o+if/
         QYCw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaJZocMPvLqwmORJrYr5XxpsfpME92sbPoYPvOsV/+Xgb4aCWI+
	KxtmJLyqp3fcLxm44q6scf0=
X-Google-Smtp-Source: APiQypInGrUEUfegLijufkVyO+Qwt9ECKH9HPxr7pui/FLaal5G4rnzmhYU1l0lcoYk0dsKLdP+KzQ==
X-Received: by 2002:aca:403:: with SMTP id 3mr32085040oie.166.1589467723111;
        Thu, 14 May 2020 07:48:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d656:: with SMTP id n83ls313888oig.0.gmail; Thu, 14 May
 2020 07:48:42 -0700 (PDT)
X-Received: by 2002:aca:d06:: with SMTP id 6mr28733980oin.78.1589467722378;
        Thu, 14 May 2020 07:48:42 -0700 (PDT)
Date: Thu, 14 May 2020 07:48:41 -0700 (PDT)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <68fecda2-9ed5-4146-b6de-fe2484f2c18a@googlegroups.com>
Subject: non-root cell communication  in jetson tx1 (Ebusy error when
 defining same pci device to both inmates)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3405_332281327.1589467721831"
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

------=_Part_3405_332281327.1589467721831
Content-Type: multipart/alternative; 
	boundary="----=_Part_3406_350154995.1589467721832"

------=_Part_3406_350154995.1589467721832
Content-Type: text/plain; charset="UTF-8"

I want to communicate between two inmate cell for this I prepared cell 
configuration as listed below.
when I tried to load both inmate it displayed EBUSY error. 
1) How can I define same shared  memory for both inmate? 
2)how can I communicate between two inmate. 
3) it is stated on intercell communication document "you can go ahead and 
connect two non-root cell and run the ivshmem-demo. They will send 
interrupts to each other." That means, we can run ivshmem-demo on both cell 
and send interrupts between inmate cell, yes?

=>In the inter-cell communication document it is stated both cell should 
have same memory region, same ivshmem-type, and same bdf. But when defining 
same pci-device to both cell it showed EBUSY error. 
please help me on this?
ROOT CELL: (only relevant part is copied)

/* IVHSMEM  1*/ {
                        .phys_start = 0x17ba00000,
                        .virt_start = 0x17ba00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,

                },

        /* IVHSMEM  2*/ {
                        .phys_start = 0x17bd00000,
                        .virt_start = 0x17bd00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
                },

    },

    .irqchips = {
        /* GIC */ {
            .address = 0x50041000,
            .pin_base = 32,
            .pin_bitmap = {
                0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
            },
        },
        /* GIC */ {
            .address = 0x50041000,
            .pin_base = 160,
            .pin_bitmap = {
                0xffffffff, 0xffffffff, 0xffffffff
            },
        },
    },

    .pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

            /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
            .shmem_region = 42,
            .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,

                },

        {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx 
operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 43,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,

                },
        }

INMATE 1 Configuration ::::::::::::::::::

struct {
    struct jailhouse_cell_desc cell;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[5];
    struct jailhouse_irqchip irqchips[2];
    struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
    .cell = {
        .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
        .revision = JAILHOUSE_CONFIG_REVISION,
        .name = "inmate1",
        .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
        .cpu_set_size = sizeof(config.cpus),
        .num_memory_regions = ARRAY_SIZE(config.mem_regions),
        .num_irqchips = ARRAY_SIZE(config.irqchips),
        .num_pci_devices = ARRAY_SIZE(config.pci_devices),
        .vpci_irq_base = 186,
    },

    .cpus = {
        0x8,
    },

    .mem_regions = {
        /* UART */ {
            .phys_start = 0x70006000,
            .virt_start = 0x70006000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* RAM */ {
            .phys_start = 0x17bfe0000,
            .virt_start = 0,
            .size = 0x00010000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        },
        /* communication region */ {
            .virt_start = 0x80000000,
            .size = 0x00001000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_COMM_REGION,
        },
        /* IVHSMEM  1*/ {
                        .phys_start = 0x17ba00000,
                        .virt_start = 0x17ba00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_ROOTSHARED,

                },
    },

    .irqchips = {
        /* GIC */ {
            .address = 0x50041000,
                        .pin_base = 32,
                        /* Interrupts:
                           46 for UART C  */
                        .pin_bitmap = {
                0,
                1<<(46-32)
                        },
                },

        /* GIC */ {
            .address = 0x50041000,
                        .pin_base = 160,
                        /* Interrupts:
                           186 for IVSHMEM,
                           belongs to the bare metal cell  */
                        .pin_bitmap = {
                0,
                3<<(186-160)
                        },

                },
        },

    .pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },
            /* num_msix_vectors needs to be 0 for INTx operation*/
            .num_msix_vectors = 0, 
                        .shmem_region = 3, /* must be no of IVSHMEM region 
above */
            .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },
         
        },
};

INMATE2 Configuration:::::::::::::::::::::::::::

struct {
    struct jailhouse_cell_desc cell;
    __u64 cpus[1];
    struct jailhouse_memory mem_regions[5];
    struct jailhouse_irqchip irqchips[2];
    struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
    .cell = {
        .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
        .revision = JAILHOUSE_CONFIG_REVISION,
        .name = "inmate2",
        .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

        .cpu_set_size = sizeof(config.cpus),
        .num_memory_regions = ARRAY_SIZE(config.mem_regions),
        .num_irqchips = ARRAY_SIZE(config.irqchips),
        .num_pci_devices = ARRAY_SIZE(config.pci_devices),
        /*On Jetson TX1 the IRQs from 212 to 223 are not assigned.
        The bare metal cell will use IRQs from 218 to 223.
        Note: Jailhouse adds 32 (GIC's SPI) to the .vpci_irq_base,
        so 190 is the base value*/
        .vpci_irq_base = 190,
    },

    .cpus = {
        0x2,
    },

    .mem_regions = {
        /* UART */ {
            .phys_start = 0x70006000,
            .virt_start = 0x70006000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },
        /* RAM */ {
            .phys_start = 0x17bfc0000,
            .virt_start = 0,
            .size = 0x00010000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        },
        /* communication region */ {
            .virt_start = 0x80000000,
            .size = 0x00001000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_COMM_REGION,
        },

       /* IVHSMEM  1*/ {
                        .phys_start = 0x17ba00000,
                        .virt_start = 0x17ba00000,
                        .size = 0x100000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_ROOTSHARED,

                },
    },

    .irqchips = {
        /* GIC */ {
            .address = 0x50041000,
                        .pin_base = 32,
                        /* Interrupts:
                           36 for UART C  */
                        .pin_bitmap = {
                0,
                1<<(36-32)
                        },
                },

        /* GIC */ {
            .address = 0x50041000,
                        .pin_base = 160,
                        /* Interrupts:
                           190 for IVSHMEM,
                           belongs to the bare metal cell  */
                        .pin_bitmap = {
                0,
                3<<(190-160)
                        },
                },
        },

    .pci_devices = {

         {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },
                        /* num_msix_vectors needs to be 0 for INTx 
operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 3, /* must be no of IVSHMEM region 
above */
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                },
        },
};

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68fecda2-9ed5-4146-b6de-fe2484f2c18a%40googlegroups.com.

------=_Part_3406_350154995.1589467721832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIHdhbnQgdG8gY29tbXVuaWNhdGUgYmV0d2VlbiB0d28gaW5t
YXRlIGNlbGwgZm9yIHRoaXMgSSBwcmVwYXJlZCBjZWxsIGNvbmZpZ3VyYXRpb24gYXMgbGlzdGVk
IGJlbG93Ljxicj48L2Rpdj48ZGl2PndoZW4gSSB0cmllZCB0byBsb2FkIGJvdGggaW5tYXRlIGl0
IGRpc3BsYXllZCBFQlVTWSBlcnJvci4gPGJyPjwvZGl2PjxkaXY+MSkgSG93IGNhbiBJIGRlZmlu
ZSBzYW1lIHNoYXJlZMKgIG1lbW9yeSBmb3IgYm90aCBpbm1hdGU/IDxicj48L2Rpdj48ZGl2PjIp
aG93IGNhbiBJIGNvbW11bmljYXRlIGJldHdlZW4gdHdvIGlubWF0ZS4gPGJyPjwvZGl2PjxkaXY+
MykgaXQgaXMgc3RhdGVkIG9uIGludGVyY2VsbCBjb21tdW5pY2F0aW9uIGRvY3VtZW50ICZxdW90
O3lvdSBjYW4gZ28gYWhlYWQgYW5kIGNvbm5lY3QgdHdvIG5vbi1yb290IGNlbGwgYW5kIHJ1biB0
aGUgaXZzaG1lbS1kZW1vLiBUaGV5IHdpbGwgc2VuZCBpbnRlcnJ1cHRzIHRvIGVhY2ggb3RoZXIu
JnF1b3Q7IFRoYXQgbWVhbnMsIHdlIGNhbiBydW4gaXZzaG1lbS1kZW1vIG9uIGJvdGggY2VsbCBh
bmQgc2VuZCBpbnRlcnJ1cHRzIGJldHdlZW4gaW5tYXRlIGNlbGwsIHllcz88YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj49Jmd0O0luIHRoZSBpbnRlci1jZWxsIGNvbW11bmljYXRpb24gZG9j
dW1lbnQgaXQgaXMgc3RhdGVkIGJvdGggY2VsbCBzaG91bGQgaGF2ZSBzYW1lIG1lbW9yeSByZWdp
b24sIHNhbWUgaXZzaG1lbS10eXBlLCBhbmQgc2FtZSBiZGYuIEJ1dCB3aGVuIGRlZmluaW5nIHNh
bWUgcGNpLWRldmljZSB0byBib3RoIGNlbGwgaXQgc2hvd2VkIEVCVVNZIGVycm9yLiA8YnI+PC9k
aXY+PGRpdj5wbGVhc2UgaGVscCBtZSBvbiB0aGlzPzxicj48L2Rpdj48ZGl2PlJPT1QgQ0VMTDog
KG9ubHkgcmVsZXZhbnQgcGFydCBpcyBjb3BpZWQpPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4v
KiBJVkhTTUVNwqAgMSovIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4MTdiYTAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHgxN2JhMDAwMDAs
PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUg
PSAweDEwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFICw8
YnI+PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj48YnI+wqDCoMKgIMKg
wqDCoCAvKiBJVkhTTUVNwqAgMiovIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4MTdiZDAwMDAwLDxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHgxN2Jk
MDAwMDAsPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnNpemUgPSAweDEwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dS
SVRFICw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPjxicj7CoMKgwqAg
fSw8YnI+PGJyPsKgwqDCoCAuaXJxY2hpcHMgPSB7PGJyPsKgwqDCoCDCoMKgwqAgLyogR0lDICov
IHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLmFkZHJlc3MgPSAweDUwMDQxMDAwLDxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCAucGluX2Jhc2UgPSAzMiw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
LnBpbl9iaXRtYXAgPSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAweGZmZmZmZmZm
LCAweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmPGJyPsKgwqDCoCDCoMKgwqAgwqDC
oMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgfSw8YnI+wqDCoMKgIMKgwqDCoCAvKiBHSUMgKi8gezxi
cj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuYWRkcmVzcyA9IDB4NTAwNDEwMDAsPGJyPsKgwqDCoCDC
oMKgwqAgwqDCoMKgIC5waW5fYmFzZSA9IDE2MCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLnBp
bl9iaXRtYXAgPSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAweGZmZmZmZmZmLCAw
eGZmZmZmZmZmLCAweGZmZmZmZmZmPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIH0sPGJyPsKgwqDC
oCDCoMKgwqAgfSw8YnI+wqDCoMKgIH0sPGJyPjxicj7CoMKgwqAgLnBjaV9kZXZpY2VzID0gezxi
cj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0lW
U0hNRU0sPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmJkZiA9IDB4MCAmbHQ7Jmx0OyAzLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5iYXJfbWFzayA9IHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhmZmZmZmYwMCwgMHhmZmZm
ZmZmZiwgMHgwMDAwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
LDxicj48YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLypudW1fbXNpeF92ZWN0b3JzIG5lZWRzIHRv
IGJlIDAgZm9yIElOVHggb3BlcmF0aW9uKi88YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAubnVtX21zaXhfdmVjdG9ycyA9IDAsPGJyPsKgwqDCoCDCoMKg
wqAgwqDCoMKgIC5zaG1lbV9yZWdpb24gPSA0Miw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLnNo
bWVtX3Byb3RvY29sID0gSkFJTEhPVVNFX1NITUVNX1BST1RPX1VOREVGSU5FRCw8YnI+PGJyPsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj48YnI+wqDCoMKgIMKgwqDCoCB7PGJy
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuYmRmID0gMHhmICZsdDsmbHQ7IDMsPGJyPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmJhcl9tYXNrID0gezxicj7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweGZmZmZmZjAwLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qbnVtX21zaXhfdmVjdG9ycyBuZWVkcyB0byBiZSAwIGZvciBJ
TlR4IG9wZXJhdGlvbiovPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLm51bV9tc2l4X3ZlY3RvcnMgPSAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1lbV9yZWdpb24gPSA0Myw8YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2htZW1fcHJvdG9jb2wgPSBK
QUlMSE9VU0VfU0hNRU1fUFJPVE9fVU5ERUZJTkVELDxicj48YnI+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0sPGJyPsKgwqDCoMKgwqDCoMKgIH08L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PklOTUFURSAxIENvbmZpZ3VyYXRpb24gOjo6Ojo6Ojo6Ojo6Ojo6Ojo6PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5zdHJ1Y3Qgezxicj7CoMKgwqAgc3RydWN0IGphaWxob3VzZV9jZWxsX2Rl
c2MgY2VsbDs8YnI+wqDCoMKgIF9fdTY0IGNwdXNbMV07PGJyPsKgwqDCoCBzdHJ1Y3QgamFpbGhv
dXNlX21lbW9yeSBtZW1fcmVnaW9uc1s1XTs8YnI+wqDCoMKgIHN0cnVjdCBqYWlsaG91c2VfaXJx
Y2hpcCBpcnFjaGlwc1syXTs8YnI+wqDCoMKgIHN0cnVjdCBqYWlsaG91c2VfcGNpX2RldmljZSBw
Y2lfZGV2aWNlc1sxXTs8YnI+fSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7PGJy
PsKgwqDCoCAuY2VsbCA9IHs8YnI+wqDCoMKgIMKgwqDCoCAuc2lnbmF0dXJlID0gSkFJTEhPVVNF
X0NFTExfREVTQ19TSUdOQVRVUkUsPGJyPsKgwqDCoCDCoMKgwqAgLnJldmlzaW9uID0gSkFJTEhP
VVNFX0NPTkZJR19SRVZJU0lPTiw8YnI+wqDCoMKgIMKgwqDCoCAubmFtZSA9ICZxdW90O2lubWF0
ZTEmcXVvdDssPGJyPsKgwqDCoCDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX0NFTExfUEFTU0lW
RV9DT01NUkVHLDxicj7CoMKgwqAgwqDCoMKgIC5jcHVfc2V0X3NpemUgPSBzaXplb2YoY29uZmln
LmNwdXMpLDxicj7CoMKgwqAgwqDCoMKgIC5udW1fbWVtb3J5X3JlZ2lvbnMgPSBBUlJBWV9TSVpF
KGNvbmZpZy5tZW1fcmVnaW9ucyksPGJyPsKgwqDCoCDCoMKgwqAgLm51bV9pcnFjaGlwcyA9IEFS
UkFZX1NJWkUoY29uZmlnLmlycWNoaXBzKSw8YnI+wqDCoMKgIMKgwqDCoCAubnVtX3BjaV9kZXZp
Y2VzID0gQVJSQVlfU0laRShjb25maWcucGNpX2RldmljZXMpLDxicj7CoMKgwqAgwqDCoMKgIC52
cGNpX2lycV9iYXNlID0gMTg2LDxicj7CoMKgwqAgfSw8YnI+PGJyPsKgwqDCoCAuY3B1cyA9IHs8
YnI+wqDCoMKgIMKgwqDCoCAweDgsPGJyPsKgwqDCoCB9LDxicj48YnI+wqDCoMKgIC5tZW1fcmVn
aW9ucyA9IHs8YnI+wqDCoMKgIMKgwqDCoCAvKiBVQVJUICovIHs8YnI+wqDCoMKgIMKgwqDCoCDC
oMKgwqAgLnBoeXNfc3RhcnQgPSAweDcwMDA2MDAwLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAu
dmlydF9zdGFydCA9IDB4NzAwMDYwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5zaXplID0g
MHgxMDAwLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IEpBSUxIT1VTRV9NRU1fSU8sPGJyPsKgwqDCoCDCoMKgwqAgfSw8YnI+wqDCoMKgIMKgwqDCoCAv
KiBSQU0gKi8gezxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAucGh5c19zdGFydCA9IDB4MTdiZmUw
MDAwLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAudmlydF9zdGFydCA9IDAsPGJyPsKgwqDCoCDC
oMKgwqAgwqDCoMKgIC5zaXplID0gMHgwMDAxMDAwMCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAg
LmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPsKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9V
U0VfTUVNX0xPQURBQkxFLDxicj7CoMKgwqAgwqDCoMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgLyog
Y29tbXVuaWNhdGlvbiByZWdpb24gKi8gezxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAudmlydF9z
dGFydCA9IDB4ODAwMDAwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5zaXplID0gMHgwMDAw
MTAwMCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFE
IHwgSkFJTEhPVVNFX01FTV9XUklURSB8PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBK
QUlMSE9VU0VfTUVNX0NPTU1fUkVHSU9OLDxicj7CoMKgwqAgwqDCoMKgIH0sPGJyPsKgwqDCoCDC
oMKgwqAgLyogSVZIU01FTcKgIDEqLyB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLnBoeXNfc3RhcnQgPSAweDE3YmEwMDAwMCw8YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudmlydF9zdGFydCA9IDB4MTdi
YTAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5zaXplID0gMHgxMDAwMDAsPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCw8YnI+PGJyPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj7CoMKgwqAgfSw8YnI+PGJyPsKgwqDCoCAuaXJx
Y2hpcHMgPSB7PGJyPsKgwqDCoCDCoMKgwqAgLyogR0lDICovIHs8YnI+wqDCoMKgIMKgwqDCoCDC
oMKgwqAgLmFkZHJlc3MgPSAweDUwMDQxMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5waW5fYmFzZSA9IDMyLDxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEludGVycnVwdHM6PGJyPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNDYgZm9yIFVBUlQg
Q8KgICovPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnBpbl9iaXRtYXAgPSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAwLDxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgMSZsdDsmbHQ7KDQ2LTMyKTxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9LDxicj48YnI+wqDCoMKgIMKgwqDCoCAvKiBHSUMgKi8gezxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCAuYWRkcmVzcyA9IDB4NTAwNDEwMDAsPGJyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBpbl9iYXNlID0gMTYwLDxicj7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEludGVycnVwdHM6
PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MTg2IGZvciBJVlNITUVNLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJlbG9uZ3MgdG8gdGhlIGJhcmUgbWV0YWwgY2VsbMKgICovPGJyPsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBpbl9iaXRtYXAg
PSB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAwLDxicj7CoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgMyZsdDsmbHQ7KDE4Ni0xNjApPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSw8L2Rpdj48ZGl2Pjxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfSw8YnI+wqDCoMKgwqDCoMKgwqAgfSw8YnI+PGJyPsKgwqDCoCAucGNp
X2RldmljZXMgPSB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7PGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnR5cGUgPSBKQUlMSE9V
U0VfUENJX1RZUEVfSVZTSE1FTSw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuYmRmID0gMHgwICZsdDsmbHQ7IDMsPGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmJhcl9tYXNrID0gezxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGZm
ZmZmZjAwLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0sPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC8qIG51bV9tc2l4X3ZlY3Rv
cnMgbmVlZHMgdG8gYmUgMCBmb3IgSU5UeCBvcGVyYXRpb24qLzxicj7CoMKgwqAgwqDCoMKgIMKg
wqDCoCAubnVtX21zaXhfdmVjdG9ycyA9IDAsIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG1lbV9yZWdpb24gPSAzLCAvKiBtdXN0IGJlIG5vIG9m
IElWU0hNRU0gcmVnaW9uIGFib3ZlICovPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5zaG1lbV9w
cm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19VTkRFRklORUQsPGJyPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj7CoMKgwqAgwqDCoMKgIMKgPGJyPsKgwqDCoMKgwqDC
oMKgIH0sPGJyPn07PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JTk1BVEUyIENvbmZpZ3VyYXRp
b246Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo8L2Rpdj48ZGl2Pjxicj5zdHJ1Y3Qgezxicj7C
oMKgwqAgc3RydWN0IGphaWxob3VzZV9jZWxsX2Rlc2MgY2VsbDs8YnI+wqDCoMKgIF9fdTY0IGNw
dXNbMV07PGJyPsKgwqDCoCBzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1s1XTs8
YnI+wqDCoMKgIHN0cnVjdCBqYWlsaG91c2VfaXJxY2hpcCBpcnFjaGlwc1syXTs8YnI+wqDCoMKg
IHN0cnVjdCBqYWlsaG91c2VfcGNpX2RldmljZSBwY2lfZGV2aWNlc1sxXTs8YnI+fSBfX2F0dHJp
YnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7PGJyPsKgwqDCoCAuY2VsbCA9IHs8YnI+wqDCoMKg
IMKgwqDCoCAuc2lnbmF0dXJlID0gSkFJTEhPVVNFX0NFTExfREVTQ19TSUdOQVRVUkUsPGJyPsKg
wqDCoCDCoMKgwqAgLnJldmlzaW9uID0gSkFJTEhPVVNFX0NPTkZJR19SRVZJU0lPTiw8YnI+wqDC
oMKgIMKgwqDCoCAubmFtZSA9ICZxdW90O2lubWF0ZTImcXVvdDssPGJyPsKgwqDCoCDCoMKgwqAg
LmZsYWdzID0gSkFJTEhPVVNFX0NFTExfUEFTU0lWRV9DT01NUkVHLDxicj48YnI+wqDCoMKgIMKg
wqDCoCAuY3B1X3NldF9zaXplID0gc2l6ZW9mKGNvbmZpZy5jcHVzKSw8YnI+wqDCoMKgIMKgwqDC
oCAubnVtX21lbW9yeV9yZWdpb25zID0gQVJSQVlfU0laRShjb25maWcubWVtX3JlZ2lvbnMpLDxi
cj7CoMKgwqAgwqDCoMKgIC5udW1faXJxY2hpcHMgPSBBUlJBWV9TSVpFKGNvbmZpZy5pcnFjaGlw
cyksPGJyPsKgwqDCoCDCoMKgwqAgLm51bV9wY2lfZGV2aWNlcyA9IEFSUkFZX1NJWkUoY29uZmln
LnBjaV9kZXZpY2VzKSw8YnI+wqDCoMKgIMKgwqDCoCAvKk9uIEpldHNvbiBUWDEgdGhlIElSUXMg
ZnJvbSAyMTIgdG8gMjIzIGFyZSBub3QgYXNzaWduZWQuPGJyPsKgwqDCoCDCoMKgwqAgVGhlIGJh
cmUgbWV0YWwgY2VsbCB3aWxsIHVzZSBJUlFzIGZyb20gMjE4IHRvIDIyMy48YnI+wqDCoMKgIMKg
wqDCoCBOb3RlOiBKYWlsaG91c2UgYWRkcyAzMiAoR0lDJiMzOTtzIFNQSSkgdG8gdGhlIC52cGNp
X2lycV9iYXNlLDxicj7CoMKgwqAgwqDCoMKgIHNvIDE5MCBpcyB0aGUgYmFzZSB2YWx1ZSovPGJy
PsKgwqDCoCDCoMKgwqAgLnZwY2lfaXJxX2Jhc2UgPSAxOTAsPGJyPsKgwqDCoCB9LDxicj48YnI+
wqDCoMKgIC5jcHVzID0gezxicj7CoMKgwqAgwqDCoMKgIDB4Miw8YnI+wqDCoMKgIH0sPGJyPjxi
cj7CoMKgwqAgLm1lbV9yZWdpb25zID0gezxicj7CoMKgwqAgwqDCoMKgIC8qIFVBUlQgKi8gezxi
cj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAucGh5c19zdGFydCA9IDB4NzAwMDYwMDAsPGJyPsKgwqDC
oCDCoMKgwqAgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg3MDAwNjAwMCw8YnI+wqDCoMKgIMKgwqDC
oCDCoMKgwqAgLnNpemUgPSAweDEwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfDxicj7CoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgSkFJTEhPVVNFX01FTV9JTyw8YnI+wqDCoMKgIMKgwqDCoCB9LDxi
cj7CoMKgwqAgwqDCoMKgIC8qIFJBTSAqLyB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5waHlz
X3N0YXJ0ID0gMHgxN2JmYzAwMDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC52aXJ0X3N0YXJ0
ID0gMCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgLnNpemUgPSAweDAwMDEwMDAwLDxicj7CoMKg
wqAgwqDCoMKgIMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0Vf
TUVNX1dSSVRFIHw8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIEpBSUxIT1VTRV9NRU1f
RVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fTE9BREFCTEUsPGJyPsKgwqDCoCDCoMKgwqAgfSw8YnI+
wqDCoMKgIMKgwqDCoCAvKiBjb21tdW5pY2F0aW9uIHJlZ2lvbiAqLyB7PGJyPsKgwqDCoCDCoMKg
wqAgwqDCoMKgIC52aXJ0X3N0YXJ0ID0gMHg4MDAwMDAwMCw8YnI+wqDCoMKgIMKgwqDCoCDCoMKg
wqAgLnNpemUgPSAweDAwMDAxMDAwLDxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+wqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIEpBSUxIT1VTRV9NRU1fQ09NTV9SRUdJT04sPGJyPsKgwqDCoCDCoMKg
wqAgfSw8YnI+PGJyPsKgwqDCoMKgwqDCoCAvKiBJVkhTTUVNwqAgMSovIHs8YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGh5c19zdGFydCA9IDB4MTdi
YTAwMDAwLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC52aXJ0X3N0YXJ0ID0gMHgxN2JhMDAwMDAsPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNpemUgPSAweDEwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSkFJTEhPVVNFX01FTV9ST09UU0hB
UkVELDxicj48YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPsKgwqDCoCB9
LDxicj48YnI+wqDCoMKgIC5pcnFjaGlwcyA9IHs8YnI+wqDCoMKgIMKgwqDCoCAvKiBHSUMgKi8g
ezxicj7CoMKgwqAgwqDCoMKgIMKgwqDCoCAuYWRkcmVzcyA9IDB4NTAwNDEwMDAsPGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBpbl9iYXNlID0gMzIs
PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSW50
ZXJydXB0czo8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAzNiBmb3IgVUFSVCBDwqAgKi88YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAucGluX2JpdG1hcCA9IHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIDAsPGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAxJmx0OyZsdDsoMzYt
MzIpPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSw8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPjxicj7CoMKgwqAgwqDCoMKg
IC8qIEdJQyAqLyB7PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIC5hZGRyZXNzID0gMHg1MDA0MTAw
MCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucGlu
X2Jhc2UgPSAxNjAsPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogSW50ZXJydXB0czo8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAxOTAgZm9yIElWU0hNRU0sPGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmVsb25ncyB0byB0aGUgYmFyZSBt
ZXRhbCBjZWxswqAgKi88YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAucGluX2JpdG1hcCA9IHs8YnI+wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIDAs
PGJyPsKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCAzJmx0OyZsdDsoMTkwLTE2MCk8YnI+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSw8YnI+wqDCoMKgwqDCoMKgwqAgfSw8YnI+PGJyPsKg
wqDCoCAucGNpX2RldmljZXMgPSB7PGJyPjxicj7CoMKgwqAgwqDCoMKgIMKgezxicj7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC50eXBlID0gSkFJTEhPVVNF
X1BDSV9UWVBFX0lWU0hNRU0sPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmJkZiA9IDB4MCAmbHQ7Jmx0OyAzLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5iYXJfbWFzayA9IHs8YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhmZmZm
ZmYwMCwgMHhmZmZmZmZmZiwgMHgwMDAwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9LDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIG51bV9tc2l4X3ZlY3RvcnMgbmVlZHMgdG8gYmUgMCBmb3IgSU5UeCBvcGVyYXRp
b24qLzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5u
dW1fbXNpeF92ZWN0b3JzID0gMCw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuc2htZW1fcmVnaW9uID0gMywgLyogbXVzdCBiZSBubyBvZiBJVlNITUVN
IHJlZ2lvbiBhYm92ZSAqLzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9TSE1FTV9QUk9UT19VTkRFRklO
RUQsPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj7CoMKgwqDCoMKgwqDC
oCB9LDxicj59Ozxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj4NCg0KPHA+PC9wPgoKLS0g
PGJyIC8+CllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmli
ZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgJnF1b3Q7SmFpbGhvdXNlJnF1b3Q7IGdyb3VwLjxiciAv
PgpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWls
cyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2
K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20iPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJyIC8+ClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRo
ZSB3ZWIgdmlzaXQgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2ph
aWxob3VzZS1kZXYvNjhmZWNkYTItOWVkNS00MTQ2LWI2ZGUtZmUyNDg0ZjJjMThhJTQwZ29vZ2xl
Z3JvdXBzLmNvbT91dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9Zm9vdGVyIj5odHRwczovL2dy
b3Vwcy5nb29nbGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi82OGZlY2RhMi05ZWQ1LTQxNDYt
YjZkZS1mZTI0ODRmMmMxOGElNDBnb29nbGVncm91cHMuY29tPC9hPi48YnIgLz4K
------=_Part_3406_350154995.1589467721832--

------=_Part_3405_332281327.1589467721831--
