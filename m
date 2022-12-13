Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBJFH4OOAMGQEUYCGHHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id EA82564BD5C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 20:33:57 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id e15-20020a5b0ccf000000b006ed1704b40csf17824735ybr.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Dec 2022 11:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4CzbPswBT1ylGvIg11vLZXJZ+bmXY8+nUudPCrdiUQ=;
        b=Bf5xoM+CSSofDb24IK/+UrujVzoz0jwBkSPegaTLTUIisdqMrFtKAeLVRf0R4qMZ8D
         khBwP7HnL/EZICP31u9Ga7HYpdESoCzS9tPe3OJwch1I6W6nFuZIJkfxiRun56i1tXcR
         uaZTULyzOKBJNYBscz2iX0omGr4Bpw0ahk3de1QIYRcSuYabDy9v2gvTnn3TnPfbVazr
         TAHVAXB1NL4WIxy3lhRpIoSKREvQbUd1I4//4l2UHwvKsKmdPOnKEC2ZMV/TOXh92L6+
         4JQZVjQaBARMOzb/PU0XIv995/mVRKENnn71OW6XV+HamxexO2J1SavAW08F402VWgrB
         jU2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4CzbPswBT1ylGvIg11vLZXJZ+bmXY8+nUudPCrdiUQ=;
        b=JSBF0jjoT31ar8GuGKnjPEErFizvq3RuDUmwR+rm6b+UAJ+mw2POgu9VAKNFRoU42Y
         LM1hmD9o3Wyuvk7IQo5q9/kz3qR9NQ2HIcHtG0V96raZfr1SpWtm+95+Ih7k01kdhlUc
         Te4rTlq4lMNvpQJlHERbmeo7IroK5C9ycsC0CegY2djg4Sjot+IinW9H8JeKl79gLSCr
         j07ls3BHnVyi3q1Ofq1P3zl5dvzEPlWT4llOTC+FxNG4N1SO1dYSxuBwY5CQuMD7D9YD
         uLATsZnOK/cI49jrBjRb3wD5PiHjeUeRw4E9er/GoS+mOIxrgERNUVCtB0zUHJNGPtJF
         mUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4CzbPswBT1ylGvIg11vLZXJZ+bmXY8+nUudPCrdiUQ=;
        b=MaK3tnk9JJh+qsM94VkxspX2HD7bzg6wfV3ORmB27vnXebfo6IlHgPx+QEHWVWYguU
         Y5/oOLDKOQi4ZpEI8FPNI/Uurt3IKJcvUgON5/9pm8eKWxv1lEpfZbMHzTcHLjXnHpt2
         1L8FxMn9aJLYHkAsa1Y6A7uqbfDfCt2/EtlAAB18jtyVao9V08fDJNqPWTlSly9+alv6
         2pmHXY6785SXuy+EZwaz8n+XSECPEptEiCrgCOi8aBvLruxZ5W258PYgEdqtn5jhYIjM
         tHgZM+MuL4VT5xZbcztUxrA36vEDGzVqXubjE10bC0bVlB4xL4j7ox4r18vAlxwlHUiN
         E8Ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pn9aB/WfNjKBfckHUdDlLR2MwHpdQ604TveRBs+a34Iyp6BKde+
	kOZEpe4ZOHkP8ObTUQvba1o=
X-Google-Smtp-Source: AA0mqf5jMXbB8XGYDRUN9fjqaMkJoWKLZsjdsXtiXMkccoWtR+GaZjwz1ZZkzjEml+K3+idCtezMdg==
X-Received: by 2002:a81:c508:0:b0:407:dc75:3b9e with SMTP id k8-20020a81c508000000b00407dc753b9emr3082935ywi.202.1670960036651;
        Tue, 13 Dec 2022 11:33:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:d6d1:0:b0:393:f144:5d4d with SMTP id y200-20020a0dd6d1000000b00393f1445d4dls10829405ywd.5.-pod-prod-gmail;
 Tue, 13 Dec 2022 11:33:55 -0800 (PST)
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id 190-20020a8103c7000000b003eb447b56ccmr21131467ywd.296.1670960035562;
        Tue, 13 Dec 2022 11:33:55 -0800 (PST)
Date: Tue, 13 Dec 2022 11:33:54 -0800 (PST)
From: Tommi Parkkila <tommi.parkkila@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
Subject: STM32MP1 hangs on when entering hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_698_304465944.1670960034952"
X-Original-Sender: Tommi.Parkkila@gmail.com
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

------=_Part_698_304465944.1670960034952
Content-Type: multipart/alternative; 
	boundary="----=_Part_699_1428991389.1670960034952"

------=_Part_699_1428991389.1670960034952
Content-Type: text/plain; charset="UTF-8"

Hi all - I am trying to configure and deploy Jailhouse on STM32MP1 w/ dual 
Cortex-A7. I get Jailhouse built and installed on target, and kernel module 
installed successfully, but when enabling Jailhouse the whole system hangs 
and restarts after several seconds by WDT. I have hunted the last executed 
line of code to:

*err = entry(cpu);* 

on /jailhouse/driver/main.c::enter_hypervisor(). The process tries the both 
CPUs and both hangs. Here are some debug prints I added about the jailhouse 
header data before the entry call, if they help any: (*number inside [ ] is 
cpu-id*)






















*[  280.734679] - [1] header.core_size               = 0x16000[ 
 280.734687] - [1] header.percpu_size             = 0x4000[  280.738521] - 
[0] header.core_size               = 0x16000[  280.742961] - [1] 
header.entry                   = 0x3720[  280.747400] - [0] 
header.percpu_size             = 0x4000[  280.751840] - [1] entry           
               = 0xF0003720[  280.755775] - [0] header.entry               
    = 0x3720[  280.760215] - [1] header.console_page            = 0x10000[ 
 280.764049] - [0] entry                          = 0xF0003720[ 
 280.767986] - [1] header.gcov_info_head          = 0x0[  280.772627] - [0] 
header.console_page            = 0x10000[  280.776462] - [1] 
header.max_cpus                = 2[  280.780902] - [0] 
header.gcov_info_head          = 0x0[  280.785443] - [1] header.online_cpus 
            = 2[  280.789278] - [0] header.max_cpus                = 2[ 
 280.793718] - [1] header.debug_console_base      = 0xDF96D000[ 
 280.797653] - [0] header.online_cpus             = 2[  280.801488] - [1] 
header.arm_linux_hyp_vectors     = 0xC0114BE0[  280.806935] - [0] 
header.debug_console_base      = 0xDF96D000[  280.810871] - [1] 
header.arm_linux_hyp_abi       = 1[  280.816419] - [0] 
header.arm_linux_hyp_vectors     = 0xC0114BE0[  280.826307] - [0] 
header.arm_linux_hyp_abi       = 1*

Where and how should I start looking for the issue? All and any help will 
be highly appreciated. Below, a snapshot of memory region allocation in 
kernel device tree and a snapshot of jailhouse root-cell configuration that 
I use as an argument when enabling jailhouse.

Regards,
Tommi

*Kernel Version: 5.15.24*

//// KERNEL DEVICE TREE SNAPSHOT - START /////
*........*







*reserved-memory {        jailhouse: jailhouse@fe000000 {            reg = 
<0xfe000000 0x1000000>;            no-map;            status = "okay";      
  };    };*
*...........*



*&jailhouse {    contiguous-area = <&jailhouse>;};*
*...........*
//// KERNEL DEVICE TREE SNAPSHOT - END /////


//// ROOT CELL CONFIGURATION - START /////






















































































































*/* * Jailhouse, a Linux-based partitioning hypervisor * * Test 
configuration for Banana Pi board (A20 dual-core Cortex-A7, 1G RAM) * 
https://banana-pi.org/en/banana-pi-sbcs/4.html * Copyright (c) Siemens AG, 
2014 * * Authors: *  Jan Kiszka <jan.kiszka@siemens.com> * * This work is 
licensed under the terms of the GNU GPL, version 2.  See * the COPYING file 
in the top-level directory. *  * MODIFIED FOR STM32MP157 */#include 
<jailhouse/types.h>#include <jailhouse/cell-config.h>struct {    struct 
jailhouse_system header;    __u64 cpus[1];    struct jailhouse_memory 
mem_regions[127];    struct jailhouse_irqchip irqchips[1];    struct 
jailhouse_pci_device pci_devices[1];} __attribute__((packed)) config = {    
.header = {        .signature = JAILHOUSE_SYSTEM_SIGNATURE,        
.revision = JAILHOUSE_CONFIG_REVISION,        .flags = 
JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,        .hypervisor_memory = {          
   /* STM32MP157 */            .phys_start = 0xfe000000,            .size = 
0x1000000,        },        .debug_console = {            /* UART-4 
STM32MP157 */            .address = 0x40010000,            .size = 0x400,  
          /* .clock_reg = 0x01c2006c, */            /* .gate_nr = 16 */    
        /* .divider = 0x0d, */            .type = JAILHOUSE_CON_TYPE_8250,  
          .flags = JAILHOUSE_CON_ACCESS_MMIO |                
 JAILHOUSE_CON_REGDIST_4,        },        .platform_info = {            
/// Commented below as they are in emtrion's root cell confs            // 
.pci_mmconfig_base = 0x2000000,            // .pci_mmconfig_end_bus = 0,    
        // .pci_is_virtual = 1,            .arm = {                /* 
STM32MP157 */                .gic_version = 2,                .gicd_base = 
0xA0021000,                .gicc_base = 0xA0022000,                
.gich_base = 0xA0024000,                .gicv_base = 0xA0026000,            
    .maintenance_irq = 25,            },        },        .root_cell = {    
        .name = "STM32MP1-Root",            .cpu_set_size = 
sizeof(config.cpus),            .num_memory_regions = 
ARRAY_SIZE(config.mem_regions),            .num_irqchips = 
ARRAY_SIZE(config.irqchips),            .num_pci_devices = 
ARRAY_SIZE(config.pci_devices),            .vpci_irq_base = 108,        },  
  },    /* STM32MP157 */    .cpus = {        0x2,    },    .mem_regions = 
{        /* IVSHMEM shared memory region - STM32MP157 */        /* - This 
macro creates four shared memory regions with a total size of 0x100000 
(1M), see cell-config.h*/        /* - Created and reserved a continous 
memory region in kernel device tree for this one as well. */        /* - 
Placed the memory region before hypervisor region. */        
JAILHOUSE_SHMEM_NET_REGIONS(0xfdf00000, 0),        ......................  
      ......................        /* RAM - STM32MP157 */ {            
.phys_start = 0xC0000000,            .virt_start = 0xC0000000,            
.size = 0x3df00000,            .flags = JAILHOUSE_MEM_READ | 
JAILHOUSE_MEM_WRITE |                JAILHOUSE_MEM_EXECUTE,        },    
},    .irqchips = {        /* GIC STM32MP157*/ {            .address = 
0xA0021000,            .pin_base = 32,            .pin_bitmap = {          
      0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff            },        
},    },    .pci_devices = {        {            .type = 
JAILHOUSE_PCI_TYPE_IVSHMEM,            .bdf = 1 << 3,            .bar_mask 
= JAILHOUSE_IVSHMEM_BAR_MASK_INTX,            .shmem_regions_start = 0,    
        .shmem_dev_id = 0,            .shmem_peers = 2,            
.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,        },    },};*
////  ROOT CELL CONFIGURATION - END /////

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bfb4732c-21e8-4a5d-8a0d-382041e7554cn%40googlegroups.com.

------=_Part_699_1428991389.1670960034952
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all - I am trying to configure and deploy Jailhouse on STM32MP1 w/ dual =
Cortex-A7. I get Jailhouse built and installed on target, and kernel module=
 installed successfully, but when enabling Jailhouse the whole system hangs=
 and restarts after several seconds by WDT. I have hunted the last executed=
 line of code to:<div><div><br><div><i>err =3D entry(cpu);</i>&nbsp;</div><=
div><br></div><div>on /jailhouse/driver/main.c::enter_hypervisor(). The pro=
cess tries the both CPUs and both hangs. Here are some debug prints I added=
 about the jailhouse header data before the entry call, if they help any: (=
<i>number inside [ ] is cpu-id</i>)</div><div><br></div><div><i>[ &nbsp;280=
.734679] - [1] header.core_size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; =3D 0x16000<br>[ &nbsp;280.734687] - [1] header.percpu_size &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x4000<br>[ &nbsp;280.738521] - [0] he=
ader.core_size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x16000=
<br>[ &nbsp;280.742961] - [1] header.entry &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x3720<br>[ &nbsp;280.747400] - [0] head=
er.percpu_size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x4000<br>[ &n=
bsp;280.751840] - [1] entry &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0xF0003720<br>[ &nbsp;280.75=
5775] - [0] header.entry &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; =3D 0x3720<br>[ &nbsp;280.760215] - [1] header.console_page &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x10000<br>[ &nbsp;280.764049] -=
 [0] entry &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;=3D 0xF0003720<br>[ &nbsp;280.767986] - [1] heade=
r.gcov_info_head &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x0<br>[ &nbsp;280.7=
72627] - [0] header.console_page &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
=3D 0x10000<br>[ &nbsp;280.776462] - [1] header.max_cpus &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 2<br>[ &nbsp;280.780902] - [0] hea=
der.gcov_info_head &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x0<br>[ &nbsp;280=
.785443] - [1] header.online_cpus &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 =3D 2<br>[ &nbsp;280.789278] - [0] header.max_cpus &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 2<br>[ &nbsp;280.793718] - [1] header.d=
ebug_console_base &nbsp; &nbsp; &nbsp;=3D 0xDF96D000<br>[ &nbsp;280.797653]=
 - [0] header.online_cpus &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 2<b=
r>[ &nbsp;280.801488] - [1] header.arm_linux_hyp_vectors &nbsp; &nbsp; =3D =
0xC0114BE0<br>[ &nbsp;280.806935] - [0] header.debug_console_base &nbsp; &n=
bsp; &nbsp;=3D 0xDF96D000<br>[ &nbsp;280.810871] - [1] header.arm_linux_hyp=
_abi &nbsp; &nbsp; &nbsp; =3D 1<br>[ &nbsp;280.816419] - [0] header.arm_lin=
ux_hyp_vectors &nbsp; &nbsp; =3D 0xC0114BE0<br>[ &nbsp;280.826307] - [0] he=
ader.arm_linux_hyp_abi &nbsp; &nbsp; &nbsp; =3D 1</i><br></div></div></div>=
<div><br></div><div>Where and how should I start looking for the issue? All=
 and any help will be highly appreciated. Below, a snapshot of memory regio=
n allocation in kernel device tree and a snapshot of jailhouse root-cell co=
nfiguration that I use as an argument when enabling jailhouse.</div><div><b=
r></div><div>Regards,</div><div>Tommi</div><div><br></div><div><i>Kernel Ve=
rsion:&nbsp;5.15.24</i></div><div><br></div><div>//// KERNEL DEVICE TREE SN=
APSHOT - START /////</div><div><i>........</i></div><div><i>reserved-memory=
 {<br>&nbsp; &nbsp; &nbsp; &nbsp; jailhouse: jailhouse@fe000000 {<br>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0xfe000000 0x1000000&gt;;<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; no-map;<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; status =3D "okay";<br>&nbsp; &nbsp; &nbsp; &nbsp; };<=
br>&nbsp; &nbsp; };<br></i></div><div><i>...........</i></div><div><i>&amp;=
jailhouse {<br>&nbsp; &nbsp; contiguous-area =3D &lt;&amp;jailhouse&gt;;<br=
>};<br></i></div><div><i>...........</i></div><div>//// KERNEL DEVICE TREE =
SNAPSHOT - END /////<br></div><div><br></div><div><br></div><div><div>//// =
ROOT CELL CONFIGURATION - START /////</div><div><i>/*<br>&nbsp;* Jailhouse,=
 a Linux-based partitioning hypervisor<br>&nbsp;*<br>&nbsp;* Test configura=
tion for Banana Pi board (A20 dual-core Cortex-A7, 1G RAM)<br>&nbsp;* https=
://banana-pi.org/en/banana-pi-sbcs/4.html<br>&nbsp;* Copyright (c) Siemens =
AG, 2014<br>&nbsp;*<br>&nbsp;* Authors:<br>&nbsp;* &nbsp;Jan Kiszka &lt;jan=
.kiszka@siemens.com&gt;<br>&nbsp;*<br>&nbsp;* This work is licensed under t=
he terms of the GNU GPL, version 2. &nbsp;See<br>&nbsp;* the COPYING file i=
n the top-level directory.<br>&nbsp;* <br>&nbsp;* MODIFIED FOR STM32MP157<b=
r>&nbsp;*/<br><br>#include &lt;jailhouse/types.h&gt;<br>#include &lt;jailho=
use/cell-config.h&gt;<br><br>struct {<br>&nbsp; &nbsp; struct jailhouse_sys=
tem header;<br>&nbsp; &nbsp; __u64 cpus[1];<br>&nbsp; &nbsp; struct jailhou=
se_memory mem_regions[127];<br>&nbsp; &nbsp; struct jailhouse_irqchip irqch=
ips[1];<br>&nbsp; &nbsp; struct jailhouse_pci_device pci_devices[1];<br>} _=
_attribute__((packed)) config =3D {<br>&nbsp; &nbsp; .header =3D {<br>&nbsp=
; &nbsp; &nbsp; &nbsp; .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,<br>&nbsp;=
 &nbsp; &nbsp; &nbsp; .revision =3D JAILHOUSE_CONFIG_REVISION,<br>&nbsp; &n=
bsp; &nbsp; &nbsp; .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,<br>&nbsp=
; &nbsp; &nbsp; &nbsp; .hypervisor_memory =3D {<br>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;/* STM32MP157 */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; .phys_start =3D 0xfe000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .size =3D 0x1000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &=
nbsp; &nbsp; &nbsp; .debug_console =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; /* UART-4 STM32MP157 */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; .address =3D 0x40010000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.size =3D 0x400,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* .clock_reg=
 =3D 0x01c2006c, */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* .gate_n=
r =3D 16 */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* .divider =3D 0x=
0d, */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .type =3D JAILHOUSE_CON=
_TYPE_8250,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAILHOU=
SE_CON_ACCESS_MMIO |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;JAILHOUSE_CON_REGDIST_4,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&n=
bsp; &nbsp; &nbsp; &nbsp; .platform_info =3D {<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; /// Commented below as they are in emtrion's root cell con=
fs<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // .pci_mmconfig_base =3D 0=
x2000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // .pci_mmconfig_end=
_bus =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // .pci_is_virtual=
 =3D 1,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .arm =3D {<br>&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* STM32MP157 */<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gic_version =3D 2,<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gicd_base =3D 0xA0021=
000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .gicc_base =
=3D 0xA0022000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
.gich_base =3D 0xA0024000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; .gicv_base =3D 0xA0026000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; .maintenance_irq =3D 25,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbs=
p; &nbsp; .root_cell =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .na=
me =3D "STM32MP1-Root",<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .c=
pu_set_size =3D sizeof(config.cpus),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),<br>&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_irqchips =3D ARRAY_SIZE(config.irqchi=
ps),<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .num_pci_devices =3D ARRA=
Y_SIZE(config.pci_devices),<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; .vpci_irq_base =3D 108,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp=
; },<br><br>&nbsp; &nbsp; /* STM32MP157 */<br>&nbsp; &nbsp; .cpus =3D {<br>=
&nbsp; &nbsp; &nbsp; &nbsp; 0x2,<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .=
mem_regions =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; /* IVSHMEM shared memory r=
egion - STM32MP157 */<br>&nbsp; &nbsp; &nbsp; &nbsp; /* - This macro create=
s four shared memory regions with a total size of 0x100000 (1M), see cell-c=
onfig.h*/<br>&nbsp; &nbsp; &nbsp; &nbsp; /* - Created and reserved a contin=
ous memory region in kernel device tree for this one as well. */<br>&nbsp; =
&nbsp; &nbsp; &nbsp; /* - Placed the memory region before hypervisor region=
. */<br>&nbsp; &nbsp; &nbsp; &nbsp; JAILHOUSE_SHMEM_NET_REGIONS(0xfdf00000,=
 0),<br><br>&nbsp; &nbsp; &nbsp; &nbsp; ......................<br>&nbsp; &n=
bsp; &nbsp; &nbsp; ......................<br><br>&nbsp; &nbsp; &nbsp; &nbsp=
; /* RAM - STM32MP157 */ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .ph=
ys_start =3D 0xC0000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .virt=
_start =3D 0xC0000000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =
=3D 0x3df00000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; JAILHOUSE_MEM_EXECUTE,<br>&nbsp; &nbsp; &nbsp; &nbs=
p; },<br>&nbsp; &nbsp; },<br><br>&nbsp; &nbsp; .irqchips =3D {<br>&nbsp; &n=
bsp; &nbsp; &nbsp; /* GIC STM32MP157*/ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; .address =3D 0xA0021000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; .pin_base =3D 32,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pin_b=
itmap =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0xff=
ffffff, 0xffffffff, 0xffffffff, 0xffffffff<br>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br><b=
r>&nbsp; &nbsp; .pci_devices =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; {<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bdf =3D 1 &lt;&lt; 3,<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_=
MASK_INTX,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_regions_star=
t =3D 0,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_dev_id =3D 0,<=
br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_peers =3D 2,<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .shmem_protocol =3D JAILHOUSE_SHMEM_PROT=
O_VETH,<br>&nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; },<br>};</i><br>=
</div><div>////&nbsp;

ROOT CELL CONFIGURATION&nbsp;- END /////</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bfb4732c-21e8-4a5d-8a0d-382041e7554cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bfb4732c-21e8-4a5d-8a0d-382041e7554cn%40googlegroups.co=
m</a>.<br />

------=_Part_699_1428991389.1670960034952--

------=_Part_698_304465944.1670960034952--
