Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBF5L7GKAMGQEKI5LRWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0853EE9B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jun 2022 21:29:29 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id c16-20020a05622a059000b002f93304d0d8sf12309311qtb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jun 2022 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F6zJRKqMQbbGEVOt/6MicXlQNfI7RNnzhkX4BKsUbW4=;
        b=W7DKocqJLHesoP0VpapZWrCHFaHVHbHRMRdLsPXd7yweg2COv2rQlD26Kit3EeTFr6
         /ywucufYY3zPYVtwfIdQe2G4uef4s7UQZ9Idmh9TTmLAIKdlPHogdIfRHcm+9HOBBUa7
         5LA+JfuhqOv1EsbIPBdKmIrqomfnxxuBetnLV4iFTBXQVyUl8m6Asbd3eK5f+OnD34Lg
         g2hS03zNrlrRRubjyp/lVkITbfXZxYJA20BULovQoPE5SqUK4Kc6koHAChI3Zgvpx6HJ
         9WQJdo03nANyfLj3n0QELG/YLCwgdKDP+CMTxeeNGk/DrptNo/tNaSchEHAM/RmaxuC7
         5Gyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F6zJRKqMQbbGEVOt/6MicXlQNfI7RNnzhkX4BKsUbW4=;
        b=p3gfpBPapwx3V04Oo41GYGQ/dDcwXVTMlYPpRGPFexf2Yf8779IEamWCNmWtzjjQmT
         jczFR8byeRvgltC4lx3xbj9etBD5pglLHaOiVBx29NdKdcTxG09+r9qh3gjaewKjepzc
         AaIfrNYnI1DOYNedDs3TrJkE5MAzhymzNB8L1zWj2gIAn5l28Pm0/dXvJVMiK+wOqRd5
         hiA6qFuWBrXgAdH0r9GHyPYFUgrJu9ZU3SnqwGdAzGDPnbZaP62zwJyClZYxhsuSypB7
         TaLfBXDmxaqHYrtvkxuZR+Fg6/V1jKq/6uk5ZrvHRaZB/il1EoFBjQ1k5HBZNm+PSjcD
         KsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F6zJRKqMQbbGEVOt/6MicXlQNfI7RNnzhkX4BKsUbW4=;
        b=ieNAgAKAkW3NY7PlRPbQUDq1OF1siO19Fi7SFiAs6PmlD/1xNihBbt8JupLvYVFdi3
         Ruwh0pHuKz7jqL2lEaRUytzWZgsPNx48ZqVnR9qZM97YUvi1oArpq28vR7HuMwzP11aw
         Xbo5Hn6780pzhzl1bzGLT0jn8EvsjAr6L2BHH8ReqJHg6A7BK8fVOzsRP8zrQgx0IjzT
         GCcLXr6NDHMkdMy1PLBykxJ2gmUsx+OIXyQRVxxOJhNOCIu+5AUeAgqqvkD/yXFYeN10
         CGR9Vg0Itl5aCG/uaj4xDmduYBfsUU0G7NAPlfHrbF2eFt8wiTpwNHbZCI6h8/AGroYw
         CwnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53110h755nIkv65ml+ty8sh2PUHAafZe/S9lgY2opvDgKVF5hlds
	2jIVIbhD8fByTqRXsh7I9O4=
X-Google-Smtp-Source: ABdhPJyI+J/MkANG9l2dZcVSPt+AJOwPxu2dDKtHJffbFBccy4Uow2CjpevAHLh7s3QO8uoVHkJOgw==
X-Received: by 2002:a37:c20a:0:b0:6a6:bfa7:ca5a with SMTP id i10-20020a37c20a000000b006a6bfa7ca5amr4211471qkm.283.1654543767986;
        Mon, 06 Jun 2022 12:29:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4408:b0:6a5:96a4:9106 with SMTP id
 v8-20020a05620a440800b006a596a49106ls1820214qkp.5.gmail; Mon, 06 Jun 2022
 12:29:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:6a0:750e:f938 with SMTP id m19-20020a05620a291300b006a0750ef938mr17509205qkp.200.1654543767099;
        Mon, 06 Jun 2022 12:29:27 -0700 (PDT)
Date: Mon, 6 Jun 2022 12:29:26 -0700 (PDT)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <003480a3-4384-45f2-87c6-e7badb3ef40an@googlegroups.com>
Subject: Linux inmate not receiving interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_574_924247809.1654543766278"
X-Original-Sender: prabhakar.csengg@gmail.com
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

------=_Part_574_924247809.1654543766278
Content-Type: multipart/alternative; 
	boundary="----=_Part_575_182255329.1654543766278"

------=_Part_575_182255329.1654543766278
Content-Type: text/plain; charset="UTF-8"

Hi,

I have the below setup for Linux inmate:
* Use initramfs
* UART is enabled 
* eMMC is enabled

In the inmate cell I have the below:
    .irqchips = {
        /* GIC */ {
            .address = 0xf1010000,
            .pin_base = 128,
            .pin_bitmap = {
                1 << (153+32 - 160), /* SCIF1 - SPI153 */
            },
        },
        /* GIC */ {
            .address = 0xf1010000,
            .pin_base = 160,
            .pin_bitmap = {
                1 << (168+32 - 192), /* SDHI3 - SPI168 */
            },
        },
    },

And in the inmate DTS I have the below:

        scif1: serial@e6e68000 {
            compatible = "renesas,scif-r8a774a1",
                      "renesas,rcar-gen3-scif", "renesas,scif";
            reg = <0 0xe6e68000 0 0x40>;
            interrupt-parent = <&gic>;
            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&cpg CPG_MOD 206>,
                 <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
                 <&scif_clk>;
            clock-names = "fck", "brg_int", "scif_clk";
            power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
            resets = <&cpg 206>;
            pinctrl-0 = <&scif1_pins>;
            pinctrl-names = "default";
        };

        gic: interrupt-controller@f1010000 {
            compatible = "arm,gic-400";
            #interrupt-cells = <3>;
            #address-cells = <0>;
            interrupt-controller;
            reg = <0x0 0xf1010000 0 0x1000>,
                  <0x0 0xf102f000 0 0x20000>,
                  <0x0 0xf1040000 0 0x20000>,
                  <0x0 0xf106f000 0 0x20000>;
            interrupts = <GIC_PPI 9
                    (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
        };

When Linux is started on the inmate cell, I can see its booting through but 
it doesn't  fall into shell.

--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -341,6 +341,9 @@ static void __exception_irq_entry gic_handle_irq(struct 
pt_regs *regs)
                irqstat = readl_relaxed(cpu_base + GIC_CPU_INTACK);
                irqnr = irqstat & GICC_IAR_INT_ID_MASK;
 
+               if (irqnr < 1020)
+                       pr_err(">>>>>>>>>>>>>>>>%s We received 
IRQ:%u<<<<<<<<<<<<<<\n", __func__, irqnr);
+
                if (unlikely(irqnr >= 1020))
                        break;

I added the above and I can see the Linux inmate receives only 0/1/27 
interrupts. 

Which gives me a feeling the Linux inmate isn't receiving the required 
interrupts.

Any pointers on where I should be looking into?
 
Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/003480a3-4384-45f2-87c6-e7badb3ef40an%40googlegroups.com.

------=_Part_575_182255329.1654543766278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I have the below setup for Linux inmate:<=
/div><div>* Use initramfs</div><div>* UART is enabled <br></div><div>* eMMC=
 is enabled<br></div><div><br></div><div>In the inmate cell I have the belo=
w:</div><div>&nbsp; &nbsp; .irqchips =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; /=
* GIC */ {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .address =3D 0xf101=
0000,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pin_base =3D 128,<br>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .pin_bitmap =3D {<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1 &lt;&lt; (153+32 - 160), /* SCI=
F1 - SPI153 */<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &n=
bsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; /* GIC */ {<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .address =3D 0xf1010000,<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; .pin_base =3D 160,<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; .pin_bitmap =3D {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 1 &lt;&lt; (168+32 - 192), /* SDHI3 - SPI168 */<br>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br>&nbsp; &nbsp; &nbsp; &nbsp; },=
<br>&nbsp; &nbsp; },</div><div><br></div><div>And in the inmate DTS I have =
the below:</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; scif1: seri=
al@e6e68000 {<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D "=
renesas,scif-r8a774a1",<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; "renesas,rcar-gen3-scif", "renesas,scif";<br>&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0 0xe6e68000 0 0x40&gt=
;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interrupt-parent =3D &lt;&a=
mp;gic&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interrupts =3D &lt=
;GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; clocks =3D &lt;&amp;cpg CPG_MOD 206&gt;,<br>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;&amp;cpg CPG_CORE R8A774A1_CLK_S=
3D1&gt;,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&=
lt;&amp;scif_clk&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; clock-na=
mes =3D "fck", "brg_int", "scif_clk";<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; power-domains =3D &lt;&amp;sysc R8A774A1_PD_ALWAYS_ON&gt;;<br>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; resets =3D &lt;&amp;cpg 206&gt;;<br>&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pinctrl-0 =3D &lt;&amp;scif1_pins&g=
t;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pinctrl-names =3D "default=
";<br>&nbsp; &nbsp; &nbsp; &nbsp; };<br></div><div><br></div><div>&nbsp; &n=
bsp; &nbsp; &nbsp; gic: interrupt-controller@f1010000 {<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; compatible =3D "arm,gic-400";<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; #interrupt-cells =3D &lt;3&gt;;<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; #address-cells =3D &lt;0&gt;;<br>&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; interrupt-controller;<br>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; reg =3D &lt;0x0 0xf1010000 0 0x1000&gt;,<br>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;0x0 0xf102f000 0 0x=
20000&gt;,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &lt;0x0 0xf1040000 0 0x20000&gt;,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &lt;0x0 0xf106f000 0 0x20000&gt;;<br>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;GIC_PPI 9<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (GIC_CPU_MASK_SIM=
PLE(6) | IRQ_TYPE_LEVEL_HIGH)&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; };<br></d=
iv><div><br></div><div>When Linux is started on the inmate cell, I can see =
its booting through but it doesn't&nbsp; fall into shell.</div><div><br></d=
iv><div>--- a/drivers/irqchip/irq-gic.c<br>+++ b/drivers/irqchip/irq-gic.c<=
br>@@ -341,6 +341,9 @@ static void __exception_irq_entry gic_handle_irq(str=
uct pt_regs *regs)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; irqstat =3D readl_relaxed(cpu_base + GIC_CPU_INTACK);<br>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; irqnr =3D irqstat &amp; GICC_IAR_I=
NT_ID_MASK;<br>&nbsp;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 if (irqnr &lt; 1020)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; pr_err("&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;&gt;%s We received IRQ:%u&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;&lt;&lt;&lt;&lt;&lt;&lt;\n", __func__, irqnr);<br>+<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (unlikely(irqnr &gt;=3D 1020))<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; break;<br></div><div><br></div><div>I added the above and I can =
see the Linux inmate receives only 0/1/27 interrupts. <br></div><div><br></=
div><div>Which gives me a feeling the Linux inmate isn't receiving the requ=
ired interrupts.</div><div><br></div><div>Any pointers on where I should be=
 looking into?<br></div><div>&nbsp;<br></div><div>Cheers,</div><div>Prabhak=
ar<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/003480a3-4384-45f2-87c6-e7badb3ef40an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/003480a3-4384-45f2-87c6-e7badb3ef40an%40googlegroups.co=
m</a>.<br />

------=_Part_575_182255329.1654543766278--

------=_Part_574_924247809.1654543766278
Content-Type: text/plain; charset=US-ASCII; name=inmatelog.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=inmatelog.txt
X-Attachment-Id: fff3612b-2625-4431-9b6d-63e9dd352174
Content-ID: <fff3612b-2625-4431-9b6d-63e9dd352174>

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd073]
[    0.000000] Linux version 5.10.31+ (prasmi@prasmi) (aarch64-linux-gnu-gcc (Linaro GCC 7.5-2019.12) 7.5.0, GNU ld (Linaro_Binutils-2019.12) 2.28.2.20170706) #72 SMP PREEMPT Mon Jun 6 19:09:39 BST 2022
[    0.000000] Machine model: Jailhouse cell on HopeRun HiHope RZ/G2M main board based on r8a774a1
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x0000000078000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x000000005f400000-0x0000000078ffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x77f28b00-0x77f2afff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x000000005f400000-0x0000000078ffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x000000005f400000-0x0000000078ffffff]
[    0.000000] Initmem setup node 0 [mem 0x000000005f400000-0x0000000078ffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 22 pages/cpu s50200 r8192 d31720 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 103824
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: debug loglevel=7 clk_ignore_unused
[    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 367516K/421888K available (11072K kernel code, 1062K rwdata, 3908K rodata, 3072K init, 478K bss, 37988K reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=2.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] random: get_random_bytes called from start_kernel+0x32c/0x4f8 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec02923e, max_idle_ns: 440795202125 ns
[    0.000009] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every 2199023255496ns
[    0.000184] Console: colour dummy device 80x25
[    0.000732] printk: console [tty0] enabled
[    0.000857] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.66 BogoMIPS (lpj=33333)
[    0.000904] pid_max: default: 32768 minimum: 301
[    0.001059] LSM: Security Framework initializing
[    0.001179] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.001217] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.004159] rcu: Hierarchical SRCU implementation.
[    0.004869] Detected Renesas RZ/G2 r8a774a1 ES1.3
[    0.005517] EFI services will not be available.
[    0.006050] smp: Bringing up secondary CPUs ...
[    0.006923] Detected PIPT I-cache on CPU1
[    0.007119] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
[    0.007341] smp: Brought up 1 node, 2 CPUs
[    0.007399] SMP: Total of 2 processors activated.
[    0.007425] CPU features: detected: 32-bit EL0 Support
[    0.007449] CPU features: detected: CRC32 instructions
[    0.038814] CPU: All CPU(s) started at EL1
[    0.038912] alternatives: patching kernel code
[    0.040405] devtmpfs: initialized
[    0.043215] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.043279] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.043992] pinctrl core: initialized pinctrl subsystem
[    0.045078] DMI not present or invalid.
[    0.046009] NET: Registered protocol family 16
[    0.048752] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.048982] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.049217] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.049335] audit: initializing netlink subsys (disabled)
[    0.049719] audit: type=2000 audit(0.048:1): state=initialized audit_enabled=0 res=1
[    0.050612] thermal_sys: Registered thermal governor 'step_wise'
[    0.050751] cpuidle: using governor menu
[    0.050960] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.051102] ASID allocator initialised with 65536 entries
[    0.051542] Serial: AMBA PL011 UART driver
[    0.057454] sh-pfc e6060000.pinctrl: r8a774a1_pfc support registered
[    0.070619] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.070665] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.070691] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.070715] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.073676] cryptd: max_cpu_qlen set to 1000
[    0.078653] ACPI: Interpreter disabled.
[    0.080237] renesas-cpg-mssr e6150000.clock-controller: MSTP 402/rwdt ON
[    0.080345] renesas-cpg-mssr e6150000.clock-controller: MSTP 408/intc-ap ON
[    0.082124] renesas-cpg-mssr e6150000.clock-controller: cpg_mssr_probe CPG registered
[    0.083266] iommu: Default domain type: Translated
[    0.083582] vgaarb: loaded
[    0.084092] SCSI subsystem initialized
[    0.084958] usbcore: registered new interface driver usbfs
[    0.085047] usbcore: registered new interface driver hub
[    0.085118] usbcore: registered new device driver usb
[    0.085552] pps_core: LinuxPPS API ver. 1 registered
[    0.085579] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.085624] PTP clock support registered
[    0.087720] clocksource: Switched to clocksource arch_sys_counter
[    0.088046] VFS: Disk quotas dquot_6.6.0
[    0.088161] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.088515] pnp: PnP ACPI: disabled
[    0.103936] NET: Registered protocol family 2
[    0.104865] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.105023] TCP established hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.105125] TCP bind hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    0.105270] TCP: Hash tables configured (established 4096 bind 4096)
[    0.105435] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.105495] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.105726] NET: Registered protocol family 1
[    0.106750] RPC: Registered named UNIX socket transport module.
[    0.106786] RPC: Registered udp transport module.
[    0.106806] RPC: Registered tcp transport module.
[    0.106825] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.106854] PCI: CLS 0 bytes, default 64
[    0.210298] Initialise system trusted keyrings
[    0.210656] workingset: timestamp_bits=42 max_order=17 bucket_order=0
[    0.221485] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.222782] NFS: Registering the id_resolver key type
[    0.222845] Key type id_resolver registered
[    0.222868] Key type id_legacy registered
[    0.223045] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.223072] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.223401] 9p: Installing v9fs 9p2000 file system support
[    0.315084] Key type asymmetric registered
[    0.315124] Asymmetric key parser 'x509' registered
[    0.315214] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.315244] io scheduler mq-deadline registered
[    0.315265] io scheduler kyber registered
[    0.317842] gpio_rcar e6055400.gpio: driving 32 GPIOs
[    0.326649] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.328678] SuperH (H)SCI(F) driver initialized
[    0.329583] e6e68000.serial: ttySC0 at MMIO 0xe6e68000 (irq = 15, base_baud = 0) is a scif
[    0.329644] renesas-cpg-mssr e6150000.clock-controller: MSTP 206/scif1 ON
[    1.114446] printk: console [ttySC0] enabled
[    1.132479] loop: module loaded
[    1.138321] libphy: Fixed MDIO Bus: probed
[    1.143460] tun: Universal TUN/TAP device driver, 1.6
[    1.149460] e1000e: Intel(R) PRO/1000 Network Driver
[    1.154512] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.160570] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.166037] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.171756] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.178090] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.184205] sky2: driver version 1.30
[    1.188824] VFIO - User Level meta-driver version: 0.3
[    1.195522] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.202200] ehci-pci: EHCI PCI platform driver
[    1.206781] ehci-platform: EHCI generic platform driver
[    1.212198] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.218484] ohci-pci: OHCI PCI platform driver
[    1.223070] ohci-platform: OHCI generic platform driver
[    1.228780] usbcore: registered new interface driver usb-storage
[    1.236347] i2c /dev entries driver
[    1.240933] sdhci: Secure Digital Host Controller Interface driver
[    1.247193] sdhci: Copyright(c) Pierre Ossman
[    1.251921] Synopsys Designware Multimedia Card Interface Driver
[    1.254197] cpg_sd_clock_enable enabling clock
[    1.258327] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.262485] renesas-cpg-mssr e6150000.clock-controller: MSTP 311/sdif3 ON
[    1.276238] ledtrig-cpu: registered to indicate activity on CPUs
[    1.282515] No iBFT detected.
[    1.286398] usbcore: registered new interface driver usbhid
[    1.292054] usbhid: USB HID core driver
[    1.297306] NET: Registered protocol family 10
[    1.303432] Segment Routing with IPv6
[    1.307338] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.313590] renesas_sdhi_internal_dmac ee160000.mmc: mmc0 base at 0x00000000ee160000, max clock rate 200 MHz
[    1.314196] NET: Registered protocol family 17
[    1.328349] 9pnet: Installing 9P2000 support
[    1.332828] Key type dns_resolver registered
[    1.337689] registered taskstats version 1
[    1.341904] Loading compiled-in X.509 certificates
[    1.366970] clk: Not disabling unused clocks
[    1.374745] Freeing unused kernel memory: 3072K
[    1.379670] Run /init as init process
------=_Part_574_924247809.1654543766278--
