Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBVH4V7ZQKGQEFUS6BLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E418514B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 22:42:46 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id v198sf6355910oia.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i15NMEOrJeUJG7O3MkFh6qWASOqFfMjrEWPTlTIkrtM=;
        b=djQ3QOt5BUY61Hs7CxXNF2fWOWqNjFEddHSKd2SlCx5u5bzGZh/xAnA2/TdZRuwdM1
         MROXrms5re7w/zRyPZ50A3rhjvnyrzhX/SD2a0816xe7jDmRGNRj1pwAQJ28SivoXD7I
         bMRDGyg469pGILfnWLa7j94b6DVXea49M4SRnSIOgSHk+D6VOyDhrsbZXV9v4HNJ6pkm
         vOTa8HazXQVlgPrrrkgJT1d32LNSgVMzeUCuvWNIOSXI+OFDqW4hCA6xvd5FkglTS2Th
         ZoQY5kZLmDVRS2ePq8OQiLcFq8j98nB8Ghe9BJRF8GbqGcFsE/mNK3TOgSy4aUKJxWsQ
         /1xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i15NMEOrJeUJG7O3MkFh6qWASOqFfMjrEWPTlTIkrtM=;
        b=JDTQmJKwZDV+1iRiEJnYWnC8Pc56dXQJjgqkQZ9WpOY6cvqMk3KRul7SfVvFwBsl93
         4EUNc0gmG8rMiws8h8nU00qaN56wUpMihCGH6vxtxUspZ7WFoJ4NqHO+bHp7pl3Ztuio
         eFx+9wWsKdYQ3nZIni/kIcqU5mmGft2QpAMdp2NHmRyF3gCbkF+RxS+koQz6VydHA60L
         hmDpZ8y90IiLkUypKhLJODN+D0xb1FZefNjcwE8YYzeOGhsXqe6mPLwQclNpG8TRdO82
         f4PvuDQiVy8/bfktIsM5KyLpqxmz37yX7N3hHtuAxpbOPUV5v3clEdChut2W+EnTSXKf
         b1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i15NMEOrJeUJG7O3MkFh6qWASOqFfMjrEWPTlTIkrtM=;
        b=g6VJf6Jrpankuv0VgB/7yO8Qb+hKe/sHl+pqGzGq2RMKHdbJ6Jx27qWen7zTFbbtPM
         iKsuRK7JF4jqy+eXzluIZWDtLTTd9ZNxukbX03VHFilIiSrQ4+mmJ2wtPEuw+EkiWx6T
         U7OH+ecFAOleBID6O7HBvdN+Ro2qaR7BDLv0GsBxKnDqP4A+Hq+bVAo3GQWz+Ap6SoRv
         TwXqbSotm13eTLvezJ8++Cjp0w8xHwC2U+kd+Vqu3jFiHlDK+oZRqNxx04tCu4lHXr6R
         /y7brdHlTYBY9EoX0QktN7RjOyPgyKf3EcN4vggNHRb7t6OJgPqzF7PuNcrJOyprr9e3
         12Fg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1HfFWkDVeYdFJ4BqWVV4hTHOfpBvOh84C2Fs/71mrOwmWU6ijP
	N4HK5f5WB+4M9aWb9mxc8S0=
X-Google-Smtp-Source: ADFU+vu5GrbY+DIsPTie7d04U4ezJkSuokDT7RNpFNtOz00rVeE7F3UUR2ES7pZPwYWtj7l5bG3CWg==
X-Received: by 2002:aca:62d5:: with SMTP id w204mr1931321oib.119.1584135764709;
        Fri, 13 Mar 2020 14:42:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:13d5:: with SMTP id e21ls3530601otq.11.gmail; Fri,
 13 Mar 2020 14:42:44 -0700 (PDT)
X-Received: by 2002:a9d:75c2:: with SMTP id c2mr7466336otl.333.1584135763913;
        Fri, 13 Mar 2020 14:42:43 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:42:43 -0700 (PDT)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <557bd560-64d3-4197-8cd5-40e4537ca8cd@googlegroups.com>
In-Reply-To: <5601f586-853c-dcd1-3961-7e5e0b03ae5c@siemens.com>
References: <2568a874-f368-4cec-9076-bad2a0669af4@googlegroups.com>
 <5601f586-853c-dcd1-3961-7e5e0b03ae5c@siemens.com>
Subject: Re: how to make two non root cell with different resource
 allocation (serial port, IVSHMEM) in jetson tx1
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_385_4759635.1584135763362"
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

------=_Part_385_4759635.1584135763362
Content-Type: multipart/alternative; 
	boundary="----=_Part_386_210118119.1584135763364"

------=_Part_386_210118119.1584135763364
Content-Type: text/plain; charset="UTF-8"

I get confused how to configure for different serial output for two 
inmates, can you help me on this. I have two cell and they are displaying 
result on same serial output currently.
Root cell is same as before jetson-tx1.c
First cell configuration:
#include <jailhouse/cell-config.h> 

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0]) 

struct { 
struct jailhouse_cell_desc cell; 
__u64 cpus[1]; 
struct jailhouse_memory mem_regions[5]; 
struct jailhouse_irqchip irqchips[2]; 
struct jailhouse_pci_device pci_devices[2]; 
} __attribute__((packed)) config = { 
.cell = { 
.signature = JAILHOUSE_CELL_DESC_SIGNATURE, 
.revision = JAILHOUSE_CONFIG_REVISION, 
.name = "jetson-tx1-demo", 
.flags = JAILHOUSE_CELL_PASSIVE_COMMREG, 

.cpu_set_size = sizeof(config.cpus), 
.num_memory_regions = ARRAY_SIZE(config.mem_regions), 
.num_irqchips = ARRAY_SIZE(config.irqchips), 
.num_pci_devices = ARRAY_SIZE(config.pci_devices), 
/*On Jetson TX1 the IRQs from 212 to 223 are not assigned. 
The bare metal cell will use IRQs from 218 to 223. 
Note: Jailhouse adds 32 (GIC's SPI) to the .vpci_irq_base, 
so 186 is the base value*/ 
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
/* IVHSMEM 1*/ { 
.phys_start = 0x17ba00000, 
.virt_start = 0x17ba00000, 
.size = 0x100000, 
.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_ROOTSHARED, 

}, 

/* IVHSMEM 2*/ { 
.phys_start = 0x17bd00000, 
.virt_start = 0x17bd00000, 
.size = 0x100000, 
.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_ROOTSHARED , 

}, 
}, 

.irqchips = { 
/* GIC */ { 
.address = 0x50041000, 
.pin_base = 32, 
/* Interrupts: 
46 for UART C */ 
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
belongs to the bare metal cell */ 
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
.shmem_region = 3, /* must be no of IVSHMEM region above */ 
.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
}, 
{ 
.type = JAILHOUSE_PCI_TYPE_IVSHMEM, 
.bdf = 0xf << 3, 
.bar_mask = { 
0xffffff00, 0xffffffff, 0x00000000, 
0x00000000, 0x00000000, 0x00000000, 
},

SECOND cell configuration:
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

struct {
        struct jailhouse_cell_desc cell;
        __u64 cpus[1];
        struct jailhouse_memory mem_regions[3];
        //struct jailhouse_irqchip irqchips[2];
        //struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
        .cell = {
                .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
                .revision = JAILHOUSE_CONFIG_REVISION,
                .name = "jetson-tx1-demo1",
                .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

                .cpu_set_size = sizeof(config.cpus),
                .num_memory_regions = ARRAY_SIZE(config.mem_regions),
                .num_irqchips = 0, //ARRAY_SIZE(config.irqchips),
                .num_pci_devices = 0, //ARRAY_SIZE(config.pci_devices),
                //.vpci_irq_base = 186,
        },

        .cpus = {
                0x4,
        },

        .mem_regions = {
                /* UART */ {
                        .phys_start = 0x70006000,
                        .virt_start = 0x70006000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
                },
                /* RAM */ {
                        .phys_start = 0x17a000000,
                        .virt_start = 0,
                        .size = 0x00010000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                                JAILHOUSE_MEM_LOADABLE,
                },
                /* communication region */ {
                        .virt_start = 0x80000000,
                        .size = 0x00001000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_COMM_REGION,
                },
        }
};

/* num_msix_vectors needs to be 0 for INTx operation*/ 
.num_msix_vectors = 0, 
.shmem_region = 4, /* must be no of IVSHMEM region above */ 
.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, 
}, 
}, 
};
#include <jailhouse/types.h> 

On Friday, March 13, 2020 at 1:15:32 PM UTC-5, Jan Kiszka wrote:
>
> On 13.03.20 18:40, Saroj Sapkota wrote: 
> > I tried to make two different non-root cell by taking jetson-tx1-demo as 
> > an example when I try to create cell it says resource busy. Then I make 
> > another configuration as espresso-demo i was able to create cell but 
> > when I tried to change communication region and UART region (I mean 
> > address) it shows un-handled error but when I kept UART and 
> > communication address same as the tx1-demo it was successfully loaded 
> > and started with tx1-demo. Displaying result in the same serial port. 
> > I have attached three configuration 
> > 1.jetson-tx1-demo(in built in jailhouse) 
> > 2.jetson-tx1-inmate1(configured by using 1 as template) (resource busy 
> > error) 
> > 3.jetson-tx1-inmate2(configured by using espresso-demo as template) 
> > 4.jetson-tx1 root cell 
>
> There are several example cases in the tree that contain non-root 
> configs which can be active at the same time, e.g., 
> qemu-arm64-linux-demo and qemu-arm64-inmate-demo or also the 
> zynqmp-zcu102-linux-demo and 
> zynqmp-zcu102-linux-demo-2. 
>
> > Questions: 
> > 1. Do all cell have same UART, IVSHMEM, and communication 
> > region(0x80000000; I checked with other arm64 cell also all of them have 
> > same address why?)? 
>
> Comm region is a virtual resource. It can be mapped anywhere where there 
> is space - and where the guests expects it. So we ended up at 
> 0x800000000 on arm64. 
>
> UART is a physical resource. When it's mapped multiple times it means 
> both guests may access it - which easily ends up in an output mess at 
> best. So, it is typically given one non-root cell while the root still 
> has access but does not make use of it. 
>
> The shared memory is the same for all connected guests of the same link, 
> at least its physical address. That makes it, well, shared. 
>
> > 2. How can I direct output of each cell to different serial port? 
>
> By assigning different ports and configuring different console entries 
> in the cell config (for bare-metal inmates) or adjusting the inmate 
> device tree (for Linux inmates). 
>
> > 3. Why there is resource busy error in second case? 
>
> Both cells are supposed to use the same CPU - that is not working with 
> Jailhouse. We only hand out exclusively used CPUs. 
>
> > 4. I don't understand how to declare irqchip and pci_device for each 
> > cell and root cell? (most difficult one) 
>
> PCI assignment (except for virtual ivshmem devices) is not supported on 
> your target (missing IOMMU, missing generic PCI host controller). All 
> you can do is give one inmate exclusive access to a physical host 
> controller, thus all devices behind it. Shouldn't be many on the TX1, 
> though. For the pattern of configuring ivshmem devices, study e.g. 
> qemu-arm64 configs. Except for the ivshmem memory addresses, you may 
> copy those. 
>
> The irqchip config of inmates is first of all copy from the root cell, 
> just with the pin_bitmap reduces to those external interrupts that the 
> inmate shall exclusively(!) use. Interrupts are associated with physical 
> devices (check what Linux in the root cell reports when it still has 
> access) or with the virtual ivshmem devices (vpci_irq_base + ivshmem PCI 
> slot number (PCI device number, that's the Device in 
> Bus:Device.Function, modulo 4). 
>
> Hope that helps a bit. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/557bd560-64d3-4197-8cd5-40e4537ca8cd%40googlegroups.com.

------=_Part_386_210118119.1584135763364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I get confused how to configure for different serial =
output for two inmates, can you help me on this. I have two cell and they a=
re displaying result on same serial output currently.</div><div>Root cell i=
s same as before jetson-tx1.c<br></div><div>First cell configuration:</div>=
<div><table class=3D"highlight tab-size js-file-line-container" data-tab-si=
ze=3D"8" data-paste-markdown-skip=3D""><tbody><tr><td id=3D"LC18" class=3D"=
blob-code blob-code-inner js-file-line">#<span class=3D"pl-k">include</span=
> <span class=3D"pl-s"><span class=3D"pl-pds">&lt;</span>jailhouse/cell-con=
fig.h<span class=3D"pl-pds">&gt;</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC19" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC20" class=3D"blob-code blob-code-inner js-file-line">#<span clas=
s=3D"pl-k">define</span> <span class=3D"pl-en">ARRAY_SIZE</span>(<span clas=
s=3D"pl-v">a</span>) <span class=3D"pl-k">sizeof</span>(a) / <span class=3D=
"pl-k">sizeof</span>(a[<span class=3D"pl-c1">0</span>])</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC21" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC22" class=3D"blob-code blob-code-inner js-file-line"><span class=
=3D"pl-k">struct</span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC23" class=3D"blob-code blob-code-inner js-file-line">	<span clas=
s=3D"pl-k">struct</span> jailhouse_cell_desc cell;</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC24" class=3D"blob-code blob-code-inner js-file-line">	__u64 cpus=
[<span class=3D"pl-c1">1</span>];</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC25" class=3D"blob-code blob-code-inner js-file-line">	<span clas=
s=3D"pl-k">struct</span> jailhouse_memory mem_regions[<span class=3D"pl-c1"=
>5</span>];</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC26" class=3D"blob-code blob-code-inner js-file-line">	<span clas=
s=3D"pl-k">struct</span> jailhouse_irqchip irqchips[<span class=3D"pl-c1">2=
</span>];</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC27" class=3D"blob-code blob-code-inner js-file-line">	<span clas=
s=3D"pl-k">struct</span> jailhouse_pci_device pci_devices[<span class=3D"pl=
-c1">2</span>];</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC28" class=3D"blob-code blob-code-inner js-file-line">} __attribu=
te__((packed)) config =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC29" class=3D"blob-code blob-code-inner js-file-line">	.<span cla=
ss=3D"pl-smi">cell</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC30" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">signature</span> =3D JAILHOUSE_CELL_DESC_SIGNATURE,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC31" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">revision</span> =3D JAILHOUSE_CONFIG_REVISION,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC32" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">name</span> =3D <span class=3D"pl-s"><span class=3D"pl-pds">=
&quot;</span>jetson-tx1-demo<span class=3D"pl-pds">&quot;</span></span>,</t=
d>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC33" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">flags</span> =3D JAILHOUSE_CELL_PASSIVE_COMMREG,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC34" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC35" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">cpu_set_size</span> =3D <span class=3D"pl-k">sizeof</span>(c=
onfig.<span class=3D"pl-smi">cpus</span>),</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC36" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">num_memory_regions</span> =3D <span class=3D"pl-c1">ARRAY_SI=
ZE</span>(config.<span class=3D"pl-smi">mem_regions</span>),</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC37" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">num_irqchips</span> =3D <span class=3D"pl-c1">ARRAY_SIZE</sp=
an>(config.<span class=3D"pl-smi">irqchips</span>),</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC38" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">num_pci_devices</span> =3D <span class=3D"pl-c1">ARRAY_SIZE<=
/span>(config.<span class=3D"pl-smi">pci_devices</span>),</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC39" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span>On Jetson TX1 the IRQs from 212 t=
o 223 are not assigned.</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC40" class=3D"blob-code blob-code-inner js-file-line"><span class=
=3D"pl-c">		The bare metal cell will use IRQs from 218 to 223.</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC41" class=3D"blob-code blob-code-inner js-file-line"><span class=
=3D"pl-c">		Note: Jailhouse adds 32 (GIC&#39;s SPI) to the .vpci_irq_base,<=
/span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC42" class=3D"blob-code blob-code-inner js-file-line"><span class=
=3D"pl-c">		so 186 is the base value<span class=3D"pl-c">*/</span></span></=
td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC43" class=3D"blob-code blob-code-inner js-file-line">		.<span cl=
ass=3D"pl-smi">vpci_irq_base</span> =3D <span class=3D"pl-c1">186</span>,</=
td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC44" class=3D"blob-code blob-code-inner js-file-line">	},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC45" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC46" class=3D"blob-code blob-code-inner js-file-line">	.<span cla=
ss=3D"pl-smi">cpus</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC47" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c1">0x8</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC48" class=3D"blob-code blob-code-inner js-file-line">	},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC49" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC50" class=3D"blob-code blob-code-inner js-file-line">	.<span cla=
ss=3D"pl-smi">mem_regions</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC51" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span> UART <span class=3D"pl-c">*/</sp=
an></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC52" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">phys_start</span> =3D <span class=3D"pl-c1">0x70006000</spa=
n>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC53" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">virt_start</span> =3D <span class=3D"pl-c1">0x70006000</spa=
n>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC54" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">size</span> =3D <span class=3D"pl-c1">0x1000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC55" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">flags</span> =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC56" class=3D"blob-code blob-code-inner js-file-line">				JAILHOU=
SE_MEM_IO,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC57" class=3D"blob-code blob-code-inner js-file-line">		},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC58" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span> RAM <span class=3D"pl-c">*/</spa=
n></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC59" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">phys_start</span> =3D <span class=3D"pl-c1">0x17bfe0000</sp=
an>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC60" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">virt_start</span> =3D <span class=3D"pl-c1">0</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC61" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">size</span> =3D <span class=3D"pl-c1">0x00010000</span>,</t=
d>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC62" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">flags</span> =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC63" class=3D"blob-code blob-code-inner js-file-line">				JAILHOU=
SE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC64" class=3D"blob-code blob-code-inner js-file-line">		},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC65" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span> communication region <span class=
=3D"pl-c">*/</span></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC66" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">virt_start</span> =3D <span class=3D"pl-c1">0x80000000</spa=
n>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC67" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">size</span> =3D <span class=3D"pl-c1">0x00001000</span>,</t=
d>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC68" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">flags</span> =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC69" class=3D"blob-code blob-code-inner js-file-line">				JAILHOU=
SE_MEM_COMM_REGION,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC70" class=3D"blob-code blob-code-inner js-file-line">		},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC71" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span> IVHSMEM  1<span class=3D"pl-c">*=
/</span></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC72" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">phys_start</span> =3D <span class=3D"p=
l-c1">0x17ba00000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC73" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">virt_start</span> =3D <span class=3D"p=
l-c1">0x17ba00000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC74" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">size</span> =3D <span class=3D"pl-c1">=
0x100000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC75" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">flags</span> =3D JAILHOUSE_MEM_READ | =
JAILHOUSE_MEM_WRITE  |</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC76" class=3D"blob-code blob-code-inner js-file-line">           =
                     JAILHOUSE_MEM_ROOTSHARED,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC77" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC78" class=3D"blob-code blob-code-inner js-file-line">           =
     },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC79" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC80" class=3D"blob-code blob-code-inner js-file-line">           =
     <span class=3D"pl-c"><span class=3D"pl-c">/*</span> IVHSMEM  2<span cl=
ass=3D"pl-c">*/</span></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC81" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">phys_start</span> =3D <span class=3D"p=
l-c1">0x17bd00000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC82" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">virt_start</span> =3D <span class=3D"p=
l-c1">0x17bd00000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC83" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">size</span> =3D <span class=3D"pl-c1">=
0x100000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC84" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">flags</span> =3D JAILHOUSE_MEM_READ | =
JAILHOUSE_MEM_WRITE |</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC85" class=3D"blob-code blob-code-inner js-file-line">           =
                     JAILHOUSE_MEM_ROOTSHARED ,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC86" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC87" class=3D"blob-code blob-code-inner js-file-line">           =
     },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC88" class=3D"blob-code blob-code-inner js-file-line">	},</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC89" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC90" class=3D"blob-code blob-code-inner js-file-line">	.<span cla=
ss=3D"pl-smi">irqchips</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC91" class=3D"blob-code blob-code-inner js-file-line">		<span cla=
ss=3D"pl-c"><span class=3D"pl-c">/*</span> GIC <span class=3D"pl-c">*/</spa=
n></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC92" class=3D"blob-code blob-code-inner js-file-line">			.<span c=
lass=3D"pl-smi">address</span> =3D <span class=3D"pl-c1">0x50041000</span>,=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC93" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">pin_base</span> =3D <span class=3D"pl-=
c1">32</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC94" class=3D"blob-code blob-code-inner js-file-line">           =
             <span class=3D"pl-c"><span class=3D"pl-c">/*</span> Interrupts=
:</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC95" class=3D"blob-code blob-code-inner js-file-line"><span class=
=3D"pl-c">                           46 for UART C  <span class=3D"pl-c">*/=
</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC96" class=3D"blob-code blob-code-inner js-file-line">           =
             .<span class=3D"pl-smi">pin_bitmap</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC97" class=3D"blob-code blob-code-inner js-file-line">				<span c=
lass=3D"pl-c1">0</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC98" class=3D"blob-code blob-code-inner js-file-line">				<span c=
lass=3D"pl-c1">1</span>&lt;&lt;(<span class=3D"pl-c1">46</span>-<span class=
=3D"pl-c1">32</span>)</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC99" class=3D"blob-code blob-code-inner js-file-line">           =
             },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC100" class=3D"blob-code blob-code-inner js-file-line">          =
      },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC101" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC102" class=3D"blob-code blob-code-inner js-file-line">		<span cl=
ass=3D"pl-c"><span class=3D"pl-c">/*</span> GIC <span class=3D"pl-c">*/</sp=
an></span> {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC103" class=3D"blob-code blob-code-inner js-file-line">			.<span =
class=3D"pl-smi">address</span> =3D <span class=3D"pl-c1">0x50041000</span>=
,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC104" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">pin_base</span> =3D <span class=3D"pl=
-c1">160</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC105" class=3D"blob-code blob-code-inner js-file-line">          =
              <span class=3D"pl-c"><span class=3D"pl-c">/*</span> Interrupt=
s:</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC106" class=3D"blob-code blob-code-inner js-file-line"><span clas=
s=3D"pl-c">                           186 for IVSHMEM,</span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC107" class=3D"blob-code blob-code-inner js-file-line"><span clas=
s=3D"pl-c">                           belongs to the bare metal cell  <span=
 class=3D"pl-c">*/</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC108" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">pin_bitmap</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC109" class=3D"blob-code blob-code-inner js-file-line">				<span =
class=3D"pl-c1">0</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC110" class=3D"blob-code blob-code-inner js-file-line">				<span =
class=3D"pl-c1">3</span>&lt;&lt;(<span class=3D"pl-c1">186</span>-<span cla=
ss=3D"pl-c1">160</span>)</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC111" class=3D"blob-code blob-code-inner js-file-line">          =
              },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC112" class=3D"blob-code blob-code-inner js-file-line">          =
      },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC113" class=3D"blob-code blob-code-inner js-file-line">        },=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC114" class=3D"blob-code blob-code-inner js-file-line">
<br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC115" class=3D"blob-code blob-code-inner js-file-line">	.<span cl=
ass=3D"pl-smi">pci_devices</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC116" class=3D"blob-code blob-code-inner js-file-line">          =
      {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC117" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">type</span> =3D JAILHOUSE_PCI_TYPE_IV=
SHMEM,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC118" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">bdf</span> =3D <span class=3D"pl-c1">=
0x0</span> &lt;&lt; <span class=3D"pl-c1">3</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC119" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">bar_mask</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC120" class=3D"blob-code blob-code-inner js-file-line">          =
                      <span class=3D"pl-c1">0xffffff00</span>, <span class=
=3D"pl-c1">0xffffffff</span>, <span class=3D"pl-c1">0x00000000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC121" class=3D"blob-code blob-code-inner js-file-line">          =
                      <span class=3D"pl-c1">0x00000000</span>, <span class=
=3D"pl-c1">0x00000000</span>, <span class=3D"pl-c1">0x00000000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC122" class=3D"blob-code blob-code-inner js-file-line">          =
              },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC123" class=3D"blob-code blob-code-inner js-file-line">			<span c=
lass=3D"pl-c"><span class=3D"pl-c">/*</span> num_msix_vectors needs to be 0=
 for INTx operation<span class=3D"pl-c">*/</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC124" class=3D"blob-code blob-code-inner js-file-line">			.<span =
class=3D"pl-smi">num_msix_vectors</span> =3D <span class=3D"pl-c1">0</span>=
, </td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC125" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">shmem_region</span> =3D <span class=
=3D"pl-c1">3</span>, <span class=3D"pl-c"><span class=3D"pl-c">/*</span> mu=
st be no of IVSHMEM region above <span class=3D"pl-c">*/</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC126" class=3D"blob-code blob-code-inner js-file-line">			.<span =
class=3D"pl-smi">shmem_protocol</span> =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,=
</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC127" class=3D"blob-code blob-code-inner js-file-line">          =
      },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC128" class=3D"blob-code blob-code-inner js-file-line">		 {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC129" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">type</span> =3D JAILHOUSE_PCI_TYPE_IV=
SHMEM,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC130" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">bdf</span> =3D <span class=3D"pl-c1">=
0xf</span> &lt;&lt; <span class=3D"pl-c1">3</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC131" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">bar_mask</span> =3D {</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC132" class=3D"blob-code blob-code-inner js-file-line">          =
                      <span class=3D"pl-c1">0xffffff00</span>, <span class=
=3D"pl-c1">0xffffffff</span>, <span class=3D"pl-c1">0x00000000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC133" class=3D"blob-code blob-code-inner js-file-line">          =
                      <span class=3D"pl-c1">0x00000000</span>, <span class=
=3D"pl-c1">0x00000000</span>, <span class=3D"pl-c1">0x00000000</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC134" class=3D"blob-code blob-code-inner js-file-line">          =
              },<br><br>SECOND cell configuration:<br>#include &lt;jailhous=
e/types.h&gt;<br>#include &lt;jailhouse/cell-config.h&gt;<br><br>#define AR=
RAY_SIZE(a) sizeof(a) / sizeof(a[0])<br><br>struct {<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_cell_desc cell;<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 cpus[1];<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[3];<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //struct jailhouse_irqchip irqchips[2];<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //struct jailhouse_pci_device pc=
i_devices[2];<br>} __attribute__((packed)) config =3D {<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cell =3D {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D=
 JAILHOUSE_CELL_DESC_SIGNATURE,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .revision =3D JAILHOUSE=
_CONFIG_REVISION,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D &quot;jetson-tx1-demo1&quot;=
,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,<br><br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .cpu_set_size =3D sizeof(config.cpus),<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .n=
um_memory_regions =3D ARRAY_SIZE(config.mem_regions),<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .n=
um_irqchips =3D 0, //ARRAY_SIZE(config.irqchips),<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_=
pci_devices =3D 0, //ARRAY_SIZE(config.pci_devices),<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=
.vpci_irq_base =3D 186,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<br=
><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpus =3D {<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x4,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<br><br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mem_regions =3D {<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 UART */ {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .phys_start =3D 0x70006000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x70006000,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x1000,<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* RAM */ {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x17a000000,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0,<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x00010=
000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* communication region */ {<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x80000000,<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0=
x00001000,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_COMM_REGION,<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>};<br><br></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC135" class=3D"blob-code blob-code-inner js-file-line">          =
              <span class=3D"pl-c"><span class=3D"pl-c">/*</span> num_msix_=
vectors needs to be 0 for INTx operation<span class=3D"pl-c">*/</span></spa=
n></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC136" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">num_msix_vectors</span> =3D <span cla=
ss=3D"pl-c1">0</span>,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC137" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">shmem_region</span> =3D <span class=
=3D"pl-c1">4</span>, <span class=3D"pl-c"><span class=3D"pl-c">/*</span> mu=
st be no of IVSHMEM region above <span class=3D"pl-c">*/</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC138" class=3D"blob-code blob-code-inner js-file-line">          =
              .<span class=3D"pl-smi">shmem_protocol</span> =3D JAILHOUSE_S=
HMEM_PROTO_UNDEFINED,</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC139" class=3D"blob-code blob-code-inner js-file-line">          =
      },</td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"highlight tab-size js-file-lin=
e-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr><=
td id=3D"LC140" class=3D"blob-code blob-code-inner js-file-line">        },=
</td>
      </tr>
      <tr>
        </tr></tbody></table>};<table class=3D"highlight tab-size js-file-l=
ine-container" data-tab-size=3D"8" data-paste-markdown-skip=3D""><tbody><tr=
><td id=3D"LC17" class=3D"blob-code blob-code-inner js-file-line">#<span cl=
ass=3D"pl-k">include</span> <span class=3D"pl-s"><span class=3D"pl-pds">&lt=
;</span>jailhouse/types.h<span class=3D"pl-pds">&gt;</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table></div><br>On Friday, March 13, 2020 at 1:15:32=
 PM UTC-5, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"marg=
in: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On=
 13.03.20 18:40, Saroj Sapkota wrote:
<br>&gt; I tried to make two different non-root cell by taking jetson-tx1-d=
emo as=20
<br>&gt; an example when I try to create cell it says resource busy. Then I=
 make=20
<br>&gt; another configuration as espresso-demo i was able to create cell b=
ut=20
<br>&gt; when I tried to change communication region and UART region (I mea=
n=20
<br>&gt; address) it shows un-handled error but when I kept UART and=20
<br>&gt; communication address same as the tx1-demo it was successfully loa=
ded=20
<br>&gt; and started with tx1-demo. Displaying result in the same serial po=
rt.
<br>&gt; I have attached three configuration
<br>&gt; 1.jetson-tx1-demo(in built in jailhouse)
<br>&gt; 2.jetson-tx1-inmate1(<wbr>configured by using 1 as template) (reso=
urce busy=20
<br>&gt; error)
<br>&gt; 3.jetson-tx1-inmate2(<wbr>configured by using espresso-demo as tem=
plate)
<br>&gt; 4.jetson-tx1 root cell
<br>
<br>There are several example cases in the tree that contain non-root=20
<br>configs which can be active at the same time, e.g.,=20
<br>qemu-arm64-linux-demo and qemu-arm64-inmate-demo or also the=20
<br>zynqmp-zcu102-linux-demo and
<br>zynqmp-zcu102-linux-demo-2.
<br>
<br>&gt; Questions:
<br>&gt; 1. Do all cell have same UART, IVSHMEM, and communication=20
<br>&gt; region(0x80000000; I checked with other arm64 cell also all of the=
m have=20
<br>&gt; same address why?)?
<br>
<br>Comm region is a virtual resource. It can be mapped anywhere where ther=
e=20
<br>is space - and where the guests expects it. So we ended up at=20
<br>0x800000000 on arm64.
<br>
<br>UART is a physical resource. When it&#39;s mapped multiple times it mea=
ns=20
<br>both guests may access it - which easily ends up in an output mess at=
=20
<br>best. So, it is typically given one non-root cell while the root still=
=20
<br>has access but does not make use of it.
<br>
<br>The shared memory is the same for all connected guests of the same link=
,=20
<br>at least its physical address. That makes it, well, shared.
<br>
<br>&gt; 2. How can I direct output of each cell to different serial port?
<br>
<br>By assigning different ports and configuring different console entries=
=20
<br>in the cell config (for bare-metal inmates) or adjusting the inmate=20
<br>device tree (for Linux inmates).
<br>
<br>&gt; 3. Why there is resource busy error in second case?
<br>
<br>Both cells are supposed to use the same CPU - that is not working with=
=20
<br>Jailhouse. We only hand out exclusively used CPUs.
<br>
<br>&gt; 4. I don&#39;t understand how to declare irqchip and pci_device fo=
r each=20
<br>&gt; cell and root cell? (most difficult one)
<br>
<br>PCI assignment (except for virtual ivshmem devices) is not supported on=
=20
<br>your target (missing IOMMU, missing generic PCI host controller). All=
=20
<br>you can do is give one inmate exclusive access to a physical host=20
<br>controller, thus all devices behind it. Shouldn&#39;t be many on the TX=
1,=20
<br>though. For the pattern of configuring ivshmem devices, study e.g.=20
<br>qemu-arm64 configs. Except for the ivshmem memory addresses, you may=20
<br>copy those.
<br>
<br>The irqchip config of inmates is first of all copy from the root cell,=
=20
<br>just with the pin_bitmap reduces to those external interrupts that the=
=20
<br>inmate shall exclusively(!) use. Interrupts are associated with physica=
l=20
<br>devices (check what Linux in the root cell reports when it still has=20
<br>access) or with the virtual ivshmem devices (vpci_irq_base + ivshmem PC=
I=20
<br>slot number (PCI device number, that&#39;s the Device in=20
<br>Bus:Device.Function, modulo 4).
<br>
<br>Hope that helps a bit.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/557bd560-64d3-4197-8cd5-40e4537ca8cd%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/557bd560-64d3-4197-8cd5-40e4537ca8cd%40googlegroups.com<=
/a>.<br />

------=_Part_386_210118119.1584135763364--

------=_Part_385_4759635.1584135763362--
