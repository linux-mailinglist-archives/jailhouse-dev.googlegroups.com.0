Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBMP64COQMGQEYFATE5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E799660355
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 16:33:07 +0100 (CET)
Received: by mail-yb1-xb39.google.com with SMTP id 11-20020a25050b000000b007b7968a6423sf2177134ybf.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VC7J48mTlLZ0HNwoR5XNb5qld5NY42/EWzRcVSQESo8=;
        b=Uwz7/7NqbI/l5KzVxRdOGIjApVts4GfoCRR4Javz7jLYT4SgoUvoMhjdSATTkBowVD
         Eo576EnPKTjxk1BY6IYbPccEhP2il5NV2vQw6+k/2HfgSGxNUZq84NMkbl1iWe1n3MnE
         +qx7LhW5weX4ABev3aNn1m+eCYL3AubMOZc9nmIe4ilLS9WSwC5rGhJwKk9+IUMAzo8j
         WuQZ3zs9umO+oBfV4Ztl1EltsJ0+dlvX4/XcUBi8Qh6JbJOKdfzRlwZgLnaGxIep/q+8
         IsV5Yxuo7i+7I3BT8+UZpBwY/1FtZCmIxjf7oNVN3O91J+1JCk55i/1eFJrQ4PQ+4DHd
         t7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC7J48mTlLZ0HNwoR5XNb5qld5NY42/EWzRcVSQESo8=;
        b=Eq2D5LuSZFs/OeloSKATiPd1IQLoH/ktyaOQj+FysLGOa407HkRN2GvfjNCFw+XUvv
         ua5Bn2ecBCcGHMbfgbCMlEUlpD0jojG4kkswDhGXzbsC1Gy05v9Jy0U5eCe/SJQqEmNf
         V9SvAZcDTBd8mZMERuuBCryLXEaZ1i3zj8z8+MURuW2ElimAWVxmJQTmGoyFHuvrCc1L
         Dvul6PCn5wSCYGP7F9gJ/Cr+PjFHJbT8zVm9ruezIC/NA7GGeYqBERmXR29QBzUD3LLS
         EHaTawIDxJ88pHft0o0fxQD9GfLaLT97Ljtz0Cf0WYgdAbFAH1gqFnlyp9sUS+XYOQuH
         355g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC7J48mTlLZ0HNwoR5XNb5qld5NY42/EWzRcVSQESo8=;
        b=RMNxvJCJInqqfNEclLfXsiuaD+HlecEnIdJASokRDQZ2wgVhNBReaaXPNnbbunG9VM
         RvFJSGyjUbturM/KzbWjkYZ6Vjw9mF9rks/XaxivoxpeqRkPAA5pHnq3cM6Xrk3oiGVH
         kVCKo1nC21WPRt97t61kfBdB6rHoplSCYAJIwQfpGLeSNqK3zx3wc6+a7FC8gEBVBvd/
         VSVIxkIJYtNCxJ/TFKtMw9OVr68pRQfz1IFW1CLS0NWlLBZgbjIVnyxrCoPlven8aSg6
         Q04xR3EC2KU4dOhSa4i+zqNGtrXlFY2DbUmd9t67qDVSnVaLT12JPZyvpKrrr/ag362Y
         U0Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpArT+MbKTahhDHUYHJoT199DHF0dznUJ1s1cJm7wfBgGAq+3lK
	1VcgmZMoFhNNxBXSRDeJ9zc=
X-Google-Smtp-Source: AMrXdXsz0/f4qX65l0LHYPUj4yhlv0E2iLzczKhOi2EwqtM09JAx7GVe1z7Qg3h/Maw9jTIQoUrNoA==
X-Received: by 2002:a25:86c8:0:b0:7b6:6e81:cddc with SMTP id y8-20020a2586c8000000b007b66e81cddcmr566948ybm.186.1673019185958;
        Fri, 06 Jan 2023 07:33:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:587:b0:360:d89f:2b52 with SMTP id
 bo7-20020a05690c058700b00360d89f2b52ls894670ywb.2.-pod-prod-gmail; Fri, 06
 Jan 2023 07:33:04 -0800 (PST)
X-Received: by 2002:a0d:d686:0:b0:3c2:40d8:c662 with SMTP id y128-20020a0dd686000000b003c240d8c662mr23871ywd.436.1673019184595;
        Fri, 06 Jan 2023 07:33:04 -0800 (PST)
Date: Fri, 6 Jan 2023 07:33:03 -0800 (PST)
From: Tommi Parkkila <tommi.parkkila@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <00d34029-b440-4056-87bd-2a922d1dbcd8n@googlegroups.com>
In-Reply-To: <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
 <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
 <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com>
 <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
 <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
 <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com>
 <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
Subject: Re: STM32MP1 hangs on when entering hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1198_97437943.1673019183876"
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

------=_Part_1198_97437943.1673019183876
Content-Type: multipart/alternative; 
	boundary="----=_Part_1199_634837909.1673019183876"

------=_Part_1199_634837909.1673019183876
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf - I don't have dtc package available to download and install. Would=20
there be an alternate mechanism to generate full device tree?
Please, find the /proc/interrupts and /proc/iomem below.

Thanks for your help!
-tommi

r
















































































































































*oot@stm32mp1:~# cat /proc/interrupts           CPU0       CPU1 24:        =
=20
 0          0     GICv2  29 Level     arch_timer 25:     149536     145685=
=20
    GICv2  30 Level     arch_timer 28:          0          0     GICv2 232=
=20
Level     arm-pmu 29:          0          0     GICv2 233 Level    =20
arm-pmu 30:        947          0     GICv2 129 Level    =20
4000d000.audio-controller 31:          0          0     GICv2 126 Level    =
=20
40016000.cec 32:          0          0     GICv2 123 Level    =20
4400b004.audio-controller, 4400b024.audio-controller 33:          0        =
=20
 0     GICv2  43 Level     dma1chan0 34:          0          0     GICv2=20
 44 Level     dma1chan1 35:          0          0     GICv2  45 Level    =
=20
dma1chan2 36:        219          0     GICv2  46 Level     dma1chan3 37:  =
=20
     215          0     GICv2  47 Level     dma1chan4 38:          0      =
=20
   0     GICv2  48 Level     dma1chan5 39:        220          0     GICv2=
=20
 49 Level     dma1chan6 40:        220          0     GICv2  79 Level    =
=20
dma1chan7 41:        220          0     GICv2  88 Level     dma2chan0 42:  =
=20
     220          0     GICv2  89 Level     dma2chan1 43:          0      =
=20
   0     GICv2  90 Level     dma2chan2 44:          0          0     GICv2=
=20
 91 Level     dma2chan3 45:          0          0     GICv2  92 Level    =
=20
dma2chan4 46:          0          0     GICv2 100 Level     dma2chan5 47:  =
=20
       0          0     GICv2 101 Level     dma2chan6 48:          0      =
=20
   0     GICv2 102 Level     dma2chan7 49:          0          0     GICv2=
=20
110 Level     4c006000.dcmi 51:          0          0     GICv2 178 Level  =
=20
  50027004.audio-controller 52:          0          0     GICv2 179 Level  =
=20
  stm_thermal 53:          0          0     GICv2 112 Level    =20
54002000.hash 54:         18          0     GICv2 154 Level    =20
58000000.dma-controller 55:          0          0     GICv2 124 Level    =
=20
58003000.spi 56:      15377          0     GICv2  81 Level     mmci-pl18x=
=20
(cmd) 57:       1037          0     GICv2 156 Level     mmci-pl18x=20
(cmd) 58:          0          0     GICv2  93 Level     eth0 64:          0=
=20
         0     GICv2 111 Level     54001000.cryp 65:       1043          0=
=20
 stm32-exti-h-direct  30 Level     40010000.serial 66:          0        =
=20
 0  stm32-exti-h-direct  70 Level     eth0 67:          0          0=20
 stm32-exti-h-direct  19 Level     5c004000.rtc 68:       6432          0=
=20
 stm32-exti-h-direct  22 Level     40013000.i2c 69:          0          0  =
=20
  GICv2  66 Level     40013000.i2c 70:          0          0=20
 stm32-exti-h-direct  25 Level     40015000.i2c 71:          0          0  =
=20
  GICv2 140 Level     40015000.i2c 72:      13327          0=20
 stm32-exti-h-direct  24 Level     5c002000.i2c 73:          0          0  =
=20
  GICv2 128 Level     5c002000.i2c 74:          1          0  stm32-exti-h=
=20
 55 Edge      pmic_irq 75:          0          0  pmic_irq  16 Edge    =20
 5c002000.i2c:stpmic@33:regulators 76:          0          0  pmic_irq  17=
=20
Edge      5c002000.i2c:stpmic@33:regulators 77:          0          0=20
 pmic_irq  19 Edge      5c002000.i2c:stpmic@33:regulators 78:          0  =
=20
       0  pmic_irq  20 Edge      5c002000.i2c:stpmic@33:regulators 79:    =
=20
     0          0  pmic_irq  21 Edge    =20
 5c002000.i2c:stpmic@33:regulators 80:          0          0  pmic_irq  14=
=20
Edge      5c002000.i2c:stpmic@33:regulators 81:          0          0=20
 pmic_irq  12 Edge      5c002000.i2c:stpmic@33:regulators 82:          0  =
=20
       0  pmic_irq  13 Edge      5c002000.i2c:stpmic@33:regulators 83:    =
=20
     0          0  pmic_irq   0 Edge      5c002000.i2c:stpmic@33:onkey 84:=
=20
         0          0  pmic_irq   1 Edge    =20
 5c002000.i2c:stpmic@33:onkey 85:          0          0  stm32gpio   1 Edge=
=20
     58005000.mmc cd 86:          0          0  stm32-exti-h-direct  61=20
Edge      4c001000.mailbox 87:          0          0     GICv2 133 Level  =
=20
  4c001000.mailbox 88:          0          0  stm32-exti-h  68 Edge    =20
 10000000.m4 89:          3          0     GICv2  80 Level    =20
80000000.nand-controller 90:          0          0  stm32gpio   8 Edge    =
=20
 stmfx 91:          0          0  stmfx-core   0 Edge    =20
 stmfx-pinctrl 99:       7817          0  stm32-exti-h-direct  44 Level    =
=20
49000000.usb-otg, 49000000.usb-otg, dwc2_hsotg:usb1100:         68        =
=20
 0  stm32-exti-h-direct  43 Level     ehci_hcd:usb2101:          0        =
=20
 0  stmfx-pinctrl   0 Edge      JoySel102:          0          0=20
 stmfx-pinctrl   1 Edge      JoyDown103:          0          0=20
 stmfx-pinctrl   2 Edge      JoyLeft104:          0          0=20
 stmfx-pinctrl   3 Edge      JoyRight105:          0          0=20
 stmfx-pinctrl   4 Edge      JoyUp106:          0          0     GICv2 142=
=20
Level     4400d000.dfsdm:filter@0107:          0          0     GICv2 143=
=20
Level     4400d000.dfsdm:filter@1108:          0          0     GICv2 144=
=20
Level     4400d000.dfsdm:filter@2109:          0          0     GICv2 145=
=20
Level     4400d000.dfsdm:filter@3IPI0:          0          0  CPU wakeup=20
interruptsIPI1:          0          0  Timer broadcast interruptsIPI2:    =
=20
 11005      16421  Rescheduling interruptsIPI3:        572        670=20
 Function call interruptsIPI4:          0          0  CPU stop=20
interruptsIPI5:      69327      72456  IRQ work interruptsIPI6:          0=
=20
         0  completion interruptsErr:          0root@stm32mp1:~# cat=20
/proc/iomem10000000-1005ffff : 10000000.sram sram@100000002ffff000-2fffffff=
=20
: 2ffff000.sram sram@2ffff00040004000-400043ff : 40004000.timer=20
timer@400040004000d000-4000d3ff : 4000d000.audio-controller=20
audio-controller@4000d00040010000-400103ff : 40010000.serial=20
serial@4001000040013000-400133ff : 40013000.i2c=20
i2c@4001300040015000-400153ff : 40015000.i2c i2c@4001500040016000-400163ff=
=20
: 40016000.cec cec@400160004400b000-4400b003 : 4400b000.sai=20
sai@4400b0004400b004-4400b023 : 4400b004.audio-controller=20
audio-controller@4400b0044400b024-4400b043 : 4400b024.audio-controller=20
audio-controller@4400b0244400d000-4400d7ff : 4400d000.dfsdm=20
dfsdm@4400d0004400e000-4400e3ff : 4400e000.can m_can48000000-480003ff :=20
48000000.dma-controller dma-controller@4800000048001000-480013ff :=20
48001000.dma-controller dma-controller@4800100048002000-4800203f :=20
48002000.dma-router dma-router@4800200049000000-4900ffff : 49000000.usb-otg=
=20
usb-otg@490000004c000000-4c0003ff : 4c000000.hwspinlock=20
hwspinlock@4c0000004c001000-4c0013ff : 4c001000.mailbox=20
mailbox@4c0010004c006000-4c0063ff : 4c006000.dcmi=20
dcmi@4c00600050001020-5000111f : 50001020.pwr pwr@5000102050002000-500023ff=
=20
: soc:pin-controller@50002000 gpio@5000200050003000-500033ff :=20
soc:pin-controller@50002000 gpio@5000300050004000-500043ff :=20
soc:pin-controller@50002000 gpio@5000400050005000-500053ff :=20
soc:pin-controller@50002000 gpio@5000500050006000-500063ff :=20
soc:pin-controller@50002000 gpio@5000600050007000-500073ff :=20
soc:pin-controller@50002000 gpio@5000700050008000-500083ff :=20
soc:pin-controller@50002000 gpio@5000800050009000-500093ff :=20
soc:pin-controller@50002000 gpio@500090005000a000-5000a3ff :=20
soc:pin-controller@50002000 gpio@5000a0005000b000-5000b3ff :=20
soc:pin-controller@50002000 gpio@5000b0005000c000-5000c3ff :=20
soc:pin-controller@50002000 gpio@5000c0005000d000-5000d3ff :=20
5000d000.interrupt-controller=20
interrupt-controller@5000d00050027000-50027003 : 50027000.sai=20
sai@5002700050027004-50027023 : 50027004.audio-controller=20
audio-controller@5002700450028000-500280ff : 50028000.thermal=20
thermal@5002800054001000-540013ff : 54001000.cryp=20
cryp@5400100054002000-540023ff : 54002000.hash=20
hash@5400200054004000-540043ff : soc:pin-controller-z@54004000=20
gpio@5400400058000000-58000fff : 58000000.dma-controller=20
dma-controller@5800000058003000-58003fff : 58003000.spi=20
qspi58005000-58005fff : mmc@58005000  58005000-58005fff : 58005000.mmc=20
mmc@5800500058007000-58007fff : mmc@58007000  58007000-58007fff :=20
58007000.mmc mmc@5800700058009000-580093ff : 58009000.crc=20
crc@580090005800a000-5800bfff : 5800a000.ethernet=20
stmmaceth5800d000-5800dfff : 5800d000.usb usb@5800d0005a002000-5a0023ff :=
=20
5a002000.watchdog watchdog@5a0020005a006000-5a006fff : 5a006000.usbphyc=20
usbphyc@5a0060005c002000-5c0023ff : 5c002000.i2c=20
i2c@5c0020005c004000-5c0043ff : 5c004000.rtc rtc@5c0040005c005000-5c0053ff=
=20
: 5c005000.efuse efuse@5c00500070000000-73ffffff : 58003000.spi=20
qspi_mm80000000-80000fff : 80000000.nand-controller=20
nand-controller@4,088010000-88010fff : 80000000.nand-controller=20
nand-controller@4,088020000-88020fff : 80000000.nand-controller=20
nand-controller@4,0c0000000-f5bfffff : System RAM  c0008000-c0ffffff :=20
Kernel code  c1100000-c126326f : Kernel dataf5ff0000-f69fffff : System=20
RAMf7600000-fffffffe : System RAM*

perjantai 6. tammikuuta 2023 klo 9.19.23 UTC-5 Ralf Ramsauer kirjoitti:

>
>
> On 06/01/2023 15:08, Tommi Parkkila wrote:
> > Jan and Ralf - It looks like I have something wrong with the IRQ/GIC.=
=20
> > When I get root cell up successfully, and if I press a button (that=20
> > presumably is assigned to a IRQ routine) I get the error print below an=
d=20
> > the whole system hangs. Is there any documentation on how I should=20
> > specify IRQ/GIC on root cell configuration or jailhouse configuration=
=20
> > for the target?
>
> Interesting. What's behind IRQ 74? Would you please share=20
> /proc/interrupts, /proc/iomem and the configuration of your root cell?=20
> And also maybe the full device tree using
> $ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts
>
> Thanks
> Ralf
>
>
> >=20
> > Thanks,
> > -tommi
> >=20
> > */[   84.080587] irq 74: nobody cared (try booting with the "irqpoll"=
=20
> > option)
> > [   84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G           O=
E=20
> >     5.15.24-dirty #3
> > [   84.094144] Hardware name: STM32 (Device Tree Support)
> > [   84.099236] Workqueue: events dbs_work_handler
> > [   84.103724] [<c0110d3c>] (unwind_backtrace) from [<c010c6c0>]=20
> > (show_stack+0x10/0x14)
> > [   84.111377] [<c010c6c0>] (show_stack) from [<c0bb3c50>]=20
> > (dump_stack_lvl+0x40/0x4c)
> > [   84.118918] [<c0bb3c50>] (dump_stack_lvl) from [<c0baf750>]=20
> > (__report_bad_irq+0x3c/0xc0)
> > [   84.126986] [<c0baf750>] (__report_bad_irq) from [<c0185b8c>]=20
> > (note_interrupt+0x2a8/0x2f4)
> > [   84.135265] [<c0185b8c>] (note_interrupt) from [<c0181fd8>]=20
> > (handle_irq_event_percpu+0x80/0x88)
> > [   84.143964] [<c0181fd8>] (handle_irq_event_percpu) from [<c0182018>]=
=20
> > (handle_irq_event+0x38/0x5c)
> > [   84.152769] [<c0182018>] (handle_irq_event) from [<c0186614>]=20
> > (handle_edge_irq+0xc4/0x218)
> > [   84.161046] [<c0186614>] (handle_edge_irq) from [<c073c8b4>]=20
> > (stm32_pwr_handle_irq+0x118/0x190)
> > [   84.169650] [<c073c8b4>] (stm32_pwr_handle_irq) from [<c018165c>]=20
> > (handle_domain_irq+0x7c/0xb0)
> > [   84.178348] [<c018165c>] (handle_domain_irq) from [<c063ff04>]=20
> > (gic_handle_irq+0x7c/0x90)
> > [   84.186522] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
> > (__irq_svc+0x5c/0x90)
> > [   84.193950] Exception stack(0xced55bb8 to 0xced55c00)
> > [   84.199040] 5ba0:=20
> >   00000000 00000000
> > [   84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810800=20
> > 00000080 ced54000 ced55ca8
> > [   84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c0101254=20
> > c0101268 20010113 ffffffff
> > [   84.223509] [<c0100afc>] (__irq_svc) from [<c0101268>]=20
> > (__do_softirq+0xc0/0x430)
> > [   84.230833] [<c0101268>] (__do_softirq) from [<c012c8e0>]=20
> > (irq_exit+0xd4/0x110)
> > [   84.238157] [<c012c8e0>] (irq_exit) from [<c0181660>]=20
> > (handle_domain_irq+0x80/0xb0)
> > [   84.245797] [<c0181660>] (handle_domain_irq) from [<c063ff04>]=20
> > (gic_handle_irq+0x7c/0x90)
> > [   84.253965] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]=20
> > (__irq_svc+0x5c/0x90)
> > [   84.261392] Exception stack(0xced55ca8 to 0xced55cf0)
> > [   84.266383] 5ca0:                   df858000 df858004 00000000=20
> > c1b6cb80 c1b6cb80 c1b3cec0
> > [   84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010=20
> > cf0ba580 c205ac44 ced55cf8
> > [   84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff
> > [   84.287781] [<c0100afc>] (__irq_svc) from [<c09a34fc>]=20
> > (shmem_tx_prepare+0xcc/0xdc)
> > [   84.295422] [<c09a34fc>] (shmem_tx_prepare) from [<c09a38d8>]=20
> > (smc_send_message+0x24/0x120)
> > [   84.303696] [<c09a38d8>] (smc_send_message) from [<c099ae50>]=20
> > (do_xfer+0x98/0x464)
> > [   84.311234] [<c099ae50>] (do_xfer) from [<c099f40c>]=20
> > (scmi_clock_rate_get+0x70/0xc4)
> > [   84.318983] [<c099f40c>] (scmi_clock_rate_get) from [<c067f358>]=20
> > (scmi_clk_recalc_rate+0x3c/0x70)
> > [   84.327791] [<c067f358>] (scmi_clk_recalc_rate) from [<c0677004>]=20
> > (clk_recalc+0x34/0x74)
> > [   84.331653] sched: RT throttling activated
> > [   84.339991] [<c0677004>] (clk_recalc) from [<c0679e18>]=20
> > (clk_change_rate+0xf8/0x544)
> > [   84.347653] [<c0679e18>] (clk_change_rate) from [<c067a3f4>]=20
> > (clk_core_set_rate_nolock+0x190/0x1d8)
> > [   84.356687] [<c067a3f4>] (clk_core_set_rate_nolock) from [<c067a46c>=
]=20
> > (clk_set_rate+0x30/0x88)
> > [   84.365300] [<c067a46c>] (clk_set_rate) from [<c095a910>]=20
> > (_set_opp+0x2d0/0x5f0)
> > [   84.372647] [<c095a910>] (_set_opp) from [<c095acc0>]=20
> > (dev_pm_opp_set_rate+0x90/0x16c)
> > [   84.380508] [<c095acc0>] (dev_pm_opp_set_rate) from [<c095ff8c>]=20
> > (__cpufreq_driver_target+0x110/0x2f8)
> > [   84.389840] [<c095ff8c>] (__cpufreq_driver_target) from [<c0962f94>]=
=20
> > (od_dbs_update+0xb4/0x160)
> > [   84.398540] [<c0962f94>] (od_dbs_update) from [<c0963b18>]=20
> > (dbs_work_handler+0x2c/0x58)
> > [   84.406499] [<c0963b18>] (dbs_work_handler) from [<c0141dec>]=20
> > (process_one_work+0x1dc/0x588)
> > [   84.414881] [<c0141dec>] (process_one_work) from [<c01421e4>]=20
> > (worker_thread+0x4c/0x520)
> > [   84.422940] [<c01421e4>] (worker_thread) from [<c0149df8>]=20
> > (kthread+0x170/0x1a0)
> > [   84.430367] [<c0149df8>] (kthread) from [<c0100130>]=20
> > (ret_from_fork+0x14/0x24)
> > [   84.437481] Exception stack(0xced55fb0 to 0xced55ff8)
> > [   84.442571] 5fa0:                                     00000000=20
> > 00000000 00000000 00000000
> > [   84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000=20
> > 00000000 00000000 00000000
> > [   84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013=20
> 00000000
> > [   84.465448] handlers:
> > [   84.467682] [<716ecdd6>] irq_default_primary_handler threaded=20
> > [<63fec1af>] regmap_irq_thread
> > [   84.476083] Disabling IRQ #74/*
> >=20
> > torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti:
> >=20
> > Ralf - Not sure what you mean by your note.
> >=20
> > Jan - root cell configuration is now fixed what comes to overlapped
> > memory regions. However, the both issues: */1. Terminal hangs/*, and
> > */2. Issue with setting CPU clock/* still exists. I am not familiar
> > with clock configurations on the target, but yes TF-A is in use.
> >=20
> > -tommi
> >=20
> > to 5. tammik. 2023 klo 12.54 Ralf Ramsauer
> > (ralf.r...@oth-regensburg.de) kirjoitti:
> >=20
> >=20
> >=20
> > On 05/01/2023 18:24, Jan Kiszka wrote:
> > > On 05.01.23 18:21, Tommi Parkkila wrote:
> > >> Oh, I was missing *.cell from the point 2. Now fixed and no
> > complaints.
> > >>
> > >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila
> > (tommi.p...@gmail.com
> > >> <mailto:tommi.p...@gmail.com>) kirjoitti:
> > >>
> > >>      Jan - Just ran the config check on the host PC and on
> > target.
> > >>
> > >>      1. On host, it identified some memregion overlappings
> > that were due
> > >>      my own copy/paste errors. It also complained a missing
> > resource
> > >>      interception for architecture x86:
> > >>      */In cell 'STM32MP1-Root', region 1
> > >>        phys_start: 0x00000000f7600000
> > >>        virt_start: 0x00000000f7600000
> > >>        size:       0x0000000009a00000
> > >>        flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> > >>      JAILHOUSE_MEM_EXECUTE
> > >>      overlaps with xAPIC
> > >
> > > Another detail when running cross: "-a arm" - you don't have
> > to worry
> > > about x86 resources on your target.
> >=20
> > Side note: We should store the architecture in the
> > configuration. Just
> > for the same reason why we introduced the magic byte at the
> > beginning=E2=80=A6
> >=20
> >    Ralf
> >=20
> > >
> > > Jan
> > >
> > >>        phys_start: 0x00000000fee00000
> > >>        virt_start: 0x00000000fee00000
> > >>        size:       0x0000000000001000
> > >>        flags:  /*
> > >>      I fixed the copy paste mem overlappings, do I need to
> > worry about
> > >>      the xAPIC overlapping?
> > >>      */
> > >>      /*
> > >>      2. On target, the check complained the configuration is
> > not root
> > >>      cell configuration???
> > >>      */root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
> > >>      jailhouse/configs/stm32mp157.c
> > >>      Reading configuration set:
> > >>      Not a root cell configuration:
> > jailhouse/configs/arm/stm32mp157.c/*
> > >>      The config here is the same as ran on the host PC. What
> > causes it to
> > >>      complain the above?
> > >>
> > >>      to 5. tammik. 2023 klo 11.55 Jan Kiszka
> > (jan.k...@siemens.com
> > >>      <mailto:jan.k...@siemens.com>) kirjoitti:
> > >>
> > >>          On 05.01.23 17:53, Tommi Parkkila wrote:
> > >>          > Jan - Thanks again. I have not tried the config
> > check yet.
> > >>          Actually, it
> > >>          > does not work on hw currently, it does not find
> > pyjailhouse
> > >>          module. I'll
> > >>          > check whats going wrong with it and let you know.
> > >>
> > >>          You can also run it offline, even directly from the
> > source folder
> > >>          (tools/jailhouse-config-check ...).
> > >>
> > >>          Jan
> > >>
> > >>          > -tommi
> > >>          >
> > >>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
> > >>          (jan.k...@siemens.com <mailto:jan.k...@siemens.com>
> > >>          > <mailto:jan.k...@siemens.com
> > >>          <mailto:jan.k...@siemens.com>>) kirjoitti:
> > >>          >
> > >>          >     On 05.01.23 15:34, Tommi Parkkila wrote:
> > >>          >     > Thanks for your reply, Jan. I managed to
> > get forward
> > >>          from the 'hang'
> > >>          >     > condition. There were several
> > misdefinitions on my root-cell
> > >>          >     > configuration. Now I get the root-cell started
> > >>          sometimes, but more
> > >>          >     often
> > >>          >     > I get two types of issues after enable
> > command. Any help
> > >>          or ideas
> > >>          >     where
> > >>          >     > to continue my debugging would be greatly
> > appreciated.
> > >>          Please, see the
> > >>          >     > issues explained below.
> > >>          >
> > >>          >     Already tried "jailhouse config check"?
> > >>          >
> > >>          >     >
> > >>          >     > Thanks,
> > >>          >     > -tommi
> > >>          >     >
> > >>          >     > +++++++++++++++++++++++++++++++++
> > >>          >     >
> > >>          >     > 1. Terminal hangs
> > >>          >     > -- After the enable command for the root
> > cell, jailhouse
> > >>          gets started
> > >>          >     > but then the terminal goes unresponsive.
> > Below, example
> > >>          log, where I
> > >>          >     > give ls cmd, which then causes terminal to go
> > >>          unresponsive...:
> > >>          >     >
> > >>          >
> > >>          >     Missing interrupts could be one reason. Or
> > something is
> > >>          completely
> > >>          >     broken with memory mapping so that a kernel
> > device driver
> > >>          gets stuck on
> > >>          >     waiting for some register bit to flip, e.g.
> > But most
> > >>          frequent are
> > >>          >     interrupt issues, specifically around GIC
> > resources being
> > >>          improperly
> > >>          >     passed through. The config checker may find that.
> > >>          >
> > >>          >     > /*root@stm32mp1:~# modprobe jailhouse
> > >>          >     > [ 1315.034414] jailhouse: loading
> > out-of-tree module
> > >>          taints kernel.
> > >>          >     > root@stm32mp1:~# jailhouse enable
> > >>          >     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
> > >>          >     >
> > >>          >     > Initializing Jailhouse hypervisor v0.12
> > >>          (314-gc7a1b697-dirty) on CPU 0
> > >>          >     > Code location: 0xf0000040
> > >>          >     > Page pool usage after early setup: mem
> > 28/1514, remap
> > >>          0/131072
> > >>          >     > Initializing processors:
> > >>          >     >  CPU 0... OK
> > >>          >     >  CPU 1... OK
> > >>          >     > Initializing unit: irqchip
> > >>          >     > Initializing unit: PCI
> > >>          >     > Page pool usage after late setup: mem
> > 50/1514, remap
> > >>          5/131072
> > >>          >     > [0] Activating hypervisor
> > >>          >     > [ 1355.352714] The Jailhouse is opening.
> > >>          >     > root@stm32mp1:~# ls*/
> > >>          >     >
> > >>          >     > 2. Issue with setting CPU clock
> > >>          >     > -- The second issue I see is related to i2c
> > bus and
> > >>          system clock.
> > >>          >     > Terminal starts printing error statements
> > infinitely
> > >>          after Jailhouse
> > >>          >     > opening. Below, is a snippet of an example
> > logs.
> > >>          >     >
> > >>          >     > */[   85.322027] The Jailhouse is opening.
> > >>          >     > [   85.322648] stm32f7-i2c 5c002000.i2c:
> > failed to
> > >>          prepare_enable
> > >>          >     clock
> > >>          >     > root@stm32mp1:~# [   85.339233] cpu cpu0:
> > >>          _set_opp_voltage: failed to
> > >>          >     > set voltage (1350000 1350000 1350000 mV): -22
> > >>          >     > [   85.350413] cpufreq: __target_index:
> > Failed to change cpu
> > >>          >     frequency: -22
> > >>          >     > [   85.357706] cpu cpu0: _set_opp_voltage:
> > failed to set
> > >>          voltage
> > >>          >     > (1350000 1350000 1350000 mV): -22
> > >>          >     > [   85.365124] cpufreq: __target_index:
> > Failed to change cpu
> > >>          >     frequency: -22
> > >>          >     > [   85.381985] cpu cpu0: _set_opp_voltage:
> > failed to set
> > >>          voltage
> > >>          >     > (1350000 1350000 1350000 mV): -22
> > >>          >     > /*- - -
> > >>          >     > +++++++++++++++++++++++++++++++++
> > >>          >
> > >>          >     Same possible reasons as above. Or do you
> > know how clock
> > >>          control happens
> > >>          >     on that platform? Is there firmware (TF-A?)
> > involved?
> > >>          >
> > >>          >     Jan
> > >>          >
> > >>          >     --
> > >>          >     Siemens AG, Technology
> > >>          >     Competence Center Embedded Linux
> > >>          >
> > >>
> > >>          --
> > >>          Siemens AG, Technology
> > >>          Competence Center Embedded Linux
> > >>
> > >
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/00d34029-b440-4056-87bd-2a922d1dbcd8n%40googlegroups.com.

------=_Part_1199_634837909.1673019183876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf - I don't have dtc package available to download and install. Would th=
ere be an alternate mechanism to generate full device tree?<div>Please, fin=
d the /proc/interrupts and /proc/iomem below.</div><div><br></div><div>Than=
ks for your help!</div><div>-tommi</div><div><br></div><div>r<b><i>oot@stm3=
2mp1:~# cat /proc/interrupts<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CP=
U0 &nbsp; &nbsp; &nbsp; CPU1<br>&nbsp;24: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;29 Level &=
nbsp; &nbsp; arch_timer<br>&nbsp;25: &nbsp; &nbsp; 149536 &nbsp; &nbsp; 145=
685 &nbsp; &nbsp; GICv2 &nbsp;30 Level &nbsp; &nbsp; arch_timer<br>&nbsp;28=
: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &=
nbsp; &nbsp; GICv2 232 Level &nbsp; &nbsp; arm-pmu<br>&nbsp;29: &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; =
GICv2 233 Level &nbsp; &nbsp; arm-pmu<br>&nbsp;30: &nbsp; &nbsp; &nbsp; &nb=
sp;947 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 129 Level &n=
bsp; &nbsp; 4000d000.audio-controller<br>&nbsp;31: &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 126 Lev=
el &nbsp; &nbsp; 40016000.cec<br>&nbsp;32: &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 123 Level &nbsp=
; &nbsp; 4400b004.audio-controller, 4400b024.audio-controller<br>&nbsp;33: =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nb=
sp; &nbsp; GICv2 &nbsp;43 Level &nbsp; &nbsp; dma1chan0<br>&nbsp;34: &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &n=
bsp; GICv2 &nbsp;44 Level &nbsp; &nbsp; dma1chan1<br>&nbsp;35: &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; G=
ICv2 &nbsp;45 Level &nbsp; &nbsp; dma1chan2<br>&nbsp;36: &nbsp; &nbsp; &nbs=
p; &nbsp;219 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;=
46 Level &nbsp; &nbsp; dma1chan3<br>&nbsp;37: &nbsp; &nbsp; &nbsp; &nbsp;21=
5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;47 Level &n=
bsp; &nbsp; dma1chan4<br>&nbsp;38: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;48 Level &nbsp; &=
nbsp; dma1chan5<br>&nbsp;39: &nbsp; &nbsp; &nbsp; &nbsp;220 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;49 Level &nbsp; &nbsp; dma1c=
han6<br>&nbsp;40: &nbsp; &nbsp; &nbsp; &nbsp;220 &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;79 Level &nbsp; &nbsp; dma1chan7<br>&nb=
sp;41: &nbsp; &nbsp; &nbsp; &nbsp;220 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &=
nbsp; &nbsp; GICv2 &nbsp;88 Level &nbsp; &nbsp; dma2chan0<br>&nbsp;42: &nbs=
p; &nbsp; &nbsp; &nbsp;220 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp=
; GICv2 &nbsp;89 Level &nbsp; &nbsp; dma2chan1<br>&nbsp;43: &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv=
2 &nbsp;90 Level &nbsp; &nbsp; dma2chan2<br>&nbsp;44: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbs=
p;91 Level &nbsp; &nbsp; dma2chan3<br>&nbsp;45: &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;92 L=
evel &nbsp; &nbsp; dma2chan4<br>&nbsp;46: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 100 Level &nbsp;=
 &nbsp; dma2chan5<br>&nbsp;47: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 101 Level &nbsp; &nbsp; dma=
2chan6<br>&nbsp;48: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 102 Level &nbsp; &nbsp; dma2chan7<br>&=
nbsp;49: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0 &nbsp; &nbsp; GICv2 110 Level &nbsp; &nbsp; 4c006000.dcmi<br>&nbsp;51=
: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &=
nbsp; &nbsp; GICv2 178 Level &nbsp; &nbsp; 50027004.audio-controller<br>&nb=
sp;52: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;0 &nbsp; &nbsp; GICv2 179 Level &nbsp; &nbsp; stm_thermal<br>&nbsp;53: &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp=
; &nbsp; GICv2 112 Level &nbsp; &nbsp; 54002000.hash<br>&nbsp;54: &nbsp; &n=
bsp; &nbsp; &nbsp; 18 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GIC=
v2 154 Level &nbsp; &nbsp; 58000000.dma-controller<br>&nbsp;55: &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; =
GICv2 124 Level &nbsp; &nbsp; 58003000.spi<br>&nbsp;56: &nbsp; &nbsp; &nbsp=
;15377 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;81 Lev=
el &nbsp; &nbsp; mmci-pl18x (cmd)<br>&nbsp;57: &nbsp; &nbsp; &nbsp; 1037 &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 156 Level &nbsp; &nbs=
p; mmci-pl18x (cmd)<br>&nbsp;58: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 &nbsp;93 Level &nbsp; &nb=
sp; eth0<br>&nbsp;64: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 111 Level &nbsp; &nbsp; 54001000.cry=
p<br>&nbsp;65: &nbsp; &nbsp; &nbsp; 1043 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0 &nbsp;stm32-exti-h-direct &nbsp;30 Level &nbsp; &nbsp; 40010000.serial<br=
>&nbsp;66: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;0 &nbsp;stm32-exti-h-direct &nbsp;70 Level &nbsp; &nbsp; eth0<br>&nbs=
p;67: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;0 &nbsp;stm32-exti-h-direct &nbsp;19 Level &nbsp; &nbsp; 5c004000.rtc<br>&=
nbsp;68: &nbsp; &nbsp; &nbsp; 6432 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbs=
p;stm32-exti-h-direct &nbsp;22 Level &nbsp; &nbsp; 40013000.i2c<br>&nbsp;69=
: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &=
nbsp; &nbsp; GICv2 &nbsp;66 Level &nbsp; &nbsp; 40013000.i2c<br>&nbsp;70: &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbs=
p;stm32-exti-h-direct &nbsp;25 Level &nbsp; &nbsp; 40015000.i2c<br>&nbsp;71=
: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &=
nbsp; &nbsp; GICv2 140 Level &nbsp; &nbsp; 40015000.i2c<br>&nbsp;72: &nbsp;=
 &nbsp; &nbsp;13327 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;stm32-exti-h-=
direct &nbsp;24 Level &nbsp; &nbsp; 5c002000.i2c<br>&nbsp;73: &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GI=
Cv2 128 Level &nbsp; &nbsp; 5c002000.i2c<br>&nbsp;74: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;stm32-exti-h &nbsp=
;55 Edge &nbsp; &nbsp; &nbsp;pmic_irq<br>&nbsp;75: &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp;16 Edg=
e &nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@33:regulators<br>&nbsp;76: &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmi=
c_irq &nbsp;17 Edge &nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@33:regulators<b=
r>&nbsp;77: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;0 &nbsp;pmic_irq &nbsp;19 Edge &nbsp; &nbsp; &nbsp;5c002000.i2c:stpm=
ic@33:regulators<br>&nbsp;78: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp;20 Edge &nbsp; &nbsp; &nbsp=
;5c002000.i2c:stpmic@33:regulators<br>&nbsp;79: &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp;21 Edge &=
nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@33:regulators<br>&nbsp;80: &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_i=
rq &nbsp;14 Edge &nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@33:regulators<br>&=
nbsp;81: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0 &nbsp;pmic_irq &nbsp;12 Edge &nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@=
33:regulators<br>&nbsp;82: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp;13 Edge &nbsp; &nbsp; &nbsp;5c=
002000.i2c:stpmic@33:regulators<br>&nbsp;83: &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp; 0 Edge &nbs=
p; &nbsp; &nbsp;5c002000.i2c:stpmic@33:onkey<br>&nbsp;84: &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;pmic_irq &nbsp=
; 1 Edge &nbsp; &nbsp; &nbsp;5c002000.i2c:stpmic@33:onkey<br>&nbsp;85: &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;s=
tm32gpio &nbsp; 1 Edge &nbsp; &nbsp; &nbsp;58005000.mmc cd<br>&nbsp;86: &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;=
stm32-exti-h-direct &nbsp;61 Edge &nbsp; &nbsp; &nbsp;4c001000.mailbox<br>&=
nbsp;87: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0 &nbsp; &nbsp; GICv2 133 Level &nbsp; &nbsp; 4c001000.mailbox<br>&nbsp=
;88: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0 &nbsp;stm32-exti-h &nbsp;68 Edge &nbsp; &nbsp; &nbsp;10000000.m4<br>&nbsp=
;89: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0 &nbsp; &nbsp; GICv2 &nbsp;80 Level &nbsp; &nbsp; 80000000.nand-controller=
<br>&nbsp;90: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0 &nbsp;stm32gpio &nbsp; 8 Edge &nbsp; &nbsp; &nbsp;stmfx<br>&nbsp=
;91: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0 &nbsp;stmfx-core &nbsp; 0 Edge &nbsp; &nbsp; &nbsp;stmfx-pinctrl<br>&nbsp=
;99: &nbsp; &nbsp; &nbsp; 7817 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;st=
m32-exti-h-direct &nbsp;44 Level &nbsp; &nbsp; 49000000.usb-otg, 49000000.u=
sb-otg, dwc2_hsotg:usb1<br>100: &nbsp; &nbsp; &nbsp; &nbsp; 68 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;0 &nbsp;stm32-exti-h-direct &nbsp;43 Level &nbsp; &nb=
sp; ehci_hcd:usb2<br>101: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;0 &nbsp;stmfx-pinctrl &nbsp; 0 Edge &nbsp; &nbsp; &nbs=
p;JoySel<br>102: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;0 &nbsp;stmfx-pinctrl &nbsp; 1 Edge &nbsp; &nbsp; &nbsp;JoyDown=
<br>103: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0 &nbsp;stmfx-pinctrl &nbsp; 2 Edge &nbsp; &nbsp; &nbsp;JoyLeft<br>104:=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &n=
bsp;stmfx-pinctrl &nbsp; 3 Edge &nbsp; &nbsp; &nbsp;JoyRight<br>105: &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;stm=
fx-pinctrl &nbsp; 4 Edge &nbsp; &nbsp; &nbsp;JoyUp<br>106: &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2=
 142 Level &nbsp; &nbsp; 4400d000.dfsdm:filter@0<br>107: &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 1=
43 Level &nbsp; &nbsp; 4400d000.dfsdm:filter@1<br>108: &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 144=
 Level &nbsp; &nbsp; 4400d000.dfsdm:filter@2<br>109: &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; GICv2 145 L=
evel &nbsp; &nbsp; 4400d000.dfsdm:filter@3<br>IPI0: &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;CPU wakeup interrupt=
s<br>IPI1: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;0 &nbsp;Timer broadcast interrupts<br>IPI2: &nbsp; &nbsp; &nbsp;11005=
 &nbsp; &nbsp; &nbsp;16421 &nbsp;Rescheduling interrupts<br>IPI3: &nbsp; &n=
bsp; &nbsp; &nbsp;572 &nbsp; &nbsp; &nbsp; &nbsp;670 &nbsp;Function call in=
terrupts<br>IPI4: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;0 &nbsp;CPU stop interrupts<br>IPI5: &nbsp; &nbsp; &nbsp;69327=
 &nbsp; &nbsp; &nbsp;72456 &nbsp;IRQ work interrupts<br>IPI6: &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;completion=
 interrupts<br>Err: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br><br><br>root@stm=
32mp1:~# cat /proc/iomem<br>10000000-1005ffff : 10000000.sram sram@10000000=
<br>2ffff000-2fffffff : 2ffff000.sram sram@2ffff000<br>40004000-400043ff : =
40004000.timer timer@40004000<br>4000d000-4000d3ff : 4000d000.audio-control=
ler audio-controller@4000d000<br>40010000-400103ff : 40010000.serial serial=
@40010000<br>40013000-400133ff : 40013000.i2c i2c@40013000<br>40015000-4001=
53ff : 40015000.i2c i2c@40015000<br>40016000-400163ff : 40016000.cec cec@40=
016000<br>4400b000-4400b003 : 4400b000.sai sai@4400b000<br>4400b004-4400b02=
3 : 4400b004.audio-controller audio-controller@4400b004<br>4400b024-4400b04=
3 : 4400b024.audio-controller audio-controller@4400b024<br>4400d000-4400d7f=
f : 4400d000.dfsdm dfsdm@4400d000<br>4400e000-4400e3ff : 4400e000.can m_can=
<br>48000000-480003ff : 48000000.dma-controller dma-controller@48000000<br>=
48001000-480013ff : 48001000.dma-controller dma-controller@48001000<br>4800=
2000-4800203f : 48002000.dma-router dma-router@48002000<br>49000000-4900fff=
f : 49000000.usb-otg usb-otg@49000000<br>4c000000-4c0003ff : 4c000000.hwspi=
nlock hwspinlock@4c000000<br>4c001000-4c0013ff : 4c001000.mailbox mailbox@4=
c001000<br>4c006000-4c0063ff : 4c006000.dcmi dcmi@4c006000<br>50001020-5000=
111f : 50001020.pwr pwr@50001020<br>50002000-500023ff : soc:pin-controller@=
50002000 gpio@50002000<br>50003000-500033ff : soc:pin-controller@50002000 g=
pio@50003000<br>50004000-500043ff : soc:pin-controller@50002000 gpio@500040=
00<br>50005000-500053ff : soc:pin-controller@50002000 gpio@50005000<br>5000=
6000-500063ff : soc:pin-controller@50002000 gpio@50006000<br>50007000-50007=
3ff : soc:pin-controller@50002000 gpio@50007000<br>50008000-500083ff : soc:=
pin-controller@50002000 gpio@50008000<br>50009000-500093ff : soc:pin-contro=
ller@50002000 gpio@50009000<br>5000a000-5000a3ff : soc:pin-controller@50002=
000 gpio@5000a000<br>5000b000-5000b3ff : soc:pin-controller@50002000 gpio@5=
000b000<br>5000c000-5000c3ff : soc:pin-controller@50002000 gpio@5000c000<br=
>5000d000-5000d3ff : 5000d000.interrupt-controller interrupt-controller@500=
0d000<br>50027000-50027003 : 50027000.sai sai@50027000<br>50027004-50027023=
 : 50027004.audio-controller audio-controller@50027004<br>50028000-500280ff=
 : 50028000.thermal thermal@50028000<br>54001000-540013ff : 54001000.cryp c=
ryp@54001000<br>54002000-540023ff : 54002000.hash hash@54002000<br>54004000=
-540043ff : soc:pin-controller-z@54004000 gpio@54004000<br>58000000-58000ff=
f : 58000000.dma-controller dma-controller@58000000<br>58003000-58003fff : =
58003000.spi qspi<br>58005000-58005fff : mmc@58005000<br>&nbsp; 58005000-58=
005fff : 58005000.mmc mmc@58005000<br>58007000-58007fff : mmc@58007000<br>&=
nbsp; 58007000-58007fff : 58007000.mmc mmc@58007000<br>58009000-580093ff : =
58009000.crc crc@58009000<br>5800a000-5800bfff : 5800a000.ethernet stmmacet=
h<br>5800d000-5800dfff : 5800d000.usb usb@5800d000<br>5a002000-5a0023ff : 5=
a002000.watchdog watchdog@5a002000<br>5a006000-5a006fff : 5a006000.usbphyc =
usbphyc@5a006000<br>5c002000-5c0023ff : 5c002000.i2c i2c@5c002000<br>5c0040=
00-5c0043ff : 5c004000.rtc rtc@5c004000<br>5c005000-5c0053ff : 5c005000.efu=
se efuse@5c005000<br>70000000-73ffffff : 58003000.spi qspi_mm<br>80000000-8=
0000fff : 80000000.nand-controller nand-controller@4,0<br>88010000-88010fff=
 : 80000000.nand-controller nand-controller@4,0<br>88020000-88020fff : 8000=
0000.nand-controller nand-controller@4,0<br>c0000000-f5bfffff : System RAM<=
br>&nbsp; c0008000-c0ffffff : Kernel code<br>&nbsp; c1100000-c126326f : Ker=
nel data<br>f5ff0000-f69fffff : System RAM<br>f7600000-fffffffe : System RA=
M</i></b><br><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">perjantai 6. tammikuuta 2023 klo 9.19.23 UTC-5 Ralf Ramsaue=
r kirjoitti:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 06/01/2023 15:08, Tommi Parkkila wrote:
<br>&gt; Jan and Ralf - It looks like I have something wrong with the IRQ/G=
IC.=20
<br>&gt; When I get root cell up successfully, and if I press a button (tha=
t=20
<br>&gt; presumably is assigned to a IRQ routine) I get the error print bel=
ow and=20
<br>&gt; the whole system hangs. Is there any documentation on how I should=
=20
<br>&gt; specify IRQ/GIC on root cell configuration or jailhouse configurat=
ion=20
<br>&gt; for the target?
<br>
<br>Interesting. What&#39;s behind IRQ 74? Would you please share=20
<br>/proc/interrupts, /proc/iomem and the configuration of your root cell?=
=20
<br>And also maybe the full device tree using
<br>$ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts
<br>
<br>Thanks
<br>   Ralf
<br>
<br>
<br>&gt;=20
<br>&gt; Thanks,
<br>&gt; -tommi
<br>&gt;=20
<br>&gt; */[ =C2=A0 84.080587] irq 74: nobody cared (try booting with the &=
quot;irqpoll&quot;=20
<br>&gt; option)
<br>&gt; [ =C2=A0 84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE=20
<br>&gt;  =C2=A0 =C2=A0 5.15.24-dirty #3
<br>&gt; [ =C2=A0 84.094144] Hardware name: STM32 (Device Tree Support)
<br>&gt; [ =C2=A0 84.099236] Workqueue: events dbs_work_handler
<br>&gt; [ =C2=A0 84.103724] [&lt;c0110d3c&gt;] (unwind_backtrace) from [&l=
t;c010c6c0&gt;]=20
<br>&gt; (show_stack+0x10/0x14)
<br>&gt; [ =C2=A0 84.111377] [&lt;c010c6c0&gt;] (show_stack) from [&lt;c0bb=
3c50&gt;]=20
<br>&gt; (dump_stack_lvl+0x40/0x4c)
<br>&gt; [ =C2=A0 84.118918] [&lt;c0bb3c50&gt;] (dump_stack_lvl) from [&lt;=
c0baf750&gt;]=20
<br>&gt; (__report_bad_irq+0x3c/0xc0)
<br>&gt; [ =C2=A0 84.126986] [&lt;c0baf750&gt;] (__report_bad_irq) from [&l=
t;c0185b8c&gt;]=20
<br>&gt; (note_interrupt+0x2a8/0x2f4)
<br>&gt; [ =C2=A0 84.135265] [&lt;c0185b8c&gt;] (note_interrupt) from [&lt;=
c0181fd8&gt;]=20
<br>&gt; (handle_irq_event_percpu+0x80/0x88)
<br>&gt; [ =C2=A0 84.143964] [&lt;c0181fd8&gt;] (handle_irq_event_percpu) f=
rom [&lt;c0182018&gt;]=20
<br>&gt; (handle_irq_event+0x38/0x5c)
<br>&gt; [ =C2=A0 84.152769] [&lt;c0182018&gt;] (handle_irq_event) from [&l=
t;c0186614&gt;]=20
<br>&gt; (handle_edge_irq+0xc4/0x218)
<br>&gt; [ =C2=A0 84.161046] [&lt;c0186614&gt;] (handle_edge_irq) from [&lt=
;c073c8b4&gt;]=20
<br>&gt; (stm32_pwr_handle_irq+0x118/0x190)
<br>&gt; [ =C2=A0 84.169650] [&lt;c073c8b4&gt;] (stm32_pwr_handle_irq) from=
 [&lt;c018165c&gt;]=20
<br>&gt; (handle_domain_irq+0x7c/0xb0)
<br>&gt; [ =C2=A0 84.178348] [&lt;c018165c&gt;] (handle_domain_irq) from [&=
lt;c063ff04&gt;]=20
<br>&gt; (gic_handle_irq+0x7c/0x90)
<br>&gt; [ =C2=A0 84.186522] [&lt;c063ff04&gt;] (gic_handle_irq) from [&lt;=
c0100afc&gt;]=20
<br>&gt; (__irq_svc+0x5c/0x90)
<br>&gt; [ =C2=A0 84.193950] Exception stack(0xced55bb8 to 0xced55c00)
<br>&gt; [ =C2=A0 84.199040] 5ba0:                                         =
           =20
<br>&gt;  =C2=A0 00000000 00000000
<br>&gt; [ =C2=A0 84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c181=
0800=20
<br>&gt; 00000080 ced54000 ced55ca8
<br>&gt; [ =C2=A0 84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c010=
1254=20
<br>&gt; c0101268 20010113 ffffffff
<br>&gt; [ =C2=A0 84.223509] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c0101=
268&gt;]=20
<br>&gt; (__do_softirq+0xc0/0x430)
<br>&gt; [ =C2=A0 84.230833] [&lt;c0101268&gt;] (__do_softirq) from [&lt;c0=
12c8e0&gt;]=20
<br>&gt; (irq_exit+0xd4/0x110)
<br>&gt; [ =C2=A0 84.238157] [&lt;c012c8e0&gt;] (irq_exit) from [&lt;c01816=
60&gt;]=20
<br>&gt; (handle_domain_irq+0x80/0xb0)
<br>&gt; [ =C2=A0 84.245797] [&lt;c0181660&gt;] (handle_domain_irq) from [&=
lt;c063ff04&gt;]=20
<br>&gt; (gic_handle_irq+0x7c/0x90)
<br>&gt; [ =C2=A0 84.253965] [&lt;c063ff04&gt;] (gic_handle_irq) from [&lt;=
c0100afc&gt;]=20
<br>&gt; (__irq_svc+0x5c/0x90)
<br>&gt; [ =C2=A0 84.261392] Exception stack(0xced55ca8 to 0xced55cf0)
<br>&gt; [ =C2=A0 84.266383] 5ca0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 df858000 df858004 00000000=20
<br>&gt; c1b6cb80 c1b6cb80 c1b3cec0
<br>&gt; [ =C2=A0 84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c198=
6010=20
<br>&gt; cf0ba580 c205ac44 ced55cf8
<br>&gt; [ =C2=A0 84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff
<br>&gt; [ =C2=A0 84.287781] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c09a3=
4fc&gt;]=20
<br>&gt; (shmem_tx_prepare+0xcc/0xdc)
<br>&gt; [ =C2=A0 84.295422] [&lt;c09a34fc&gt;] (shmem_tx_prepare) from [&l=
t;c09a38d8&gt;]=20
<br>&gt; (smc_send_message+0x24/0x120)
<br>&gt; [ =C2=A0 84.303696] [&lt;c09a38d8&gt;] (smc_send_message) from [&l=
t;c099ae50&gt;]=20
<br>&gt; (do_xfer+0x98/0x464)
<br>&gt; [ =C2=A0 84.311234] [&lt;c099ae50&gt;] (do_xfer) from [&lt;c099f40=
c&gt;]=20
<br>&gt; (scmi_clock_rate_get+0x70/0xc4)
<br>&gt; [ =C2=A0 84.318983] [&lt;c099f40c&gt;] (scmi_clock_rate_get) from =
[&lt;c067f358&gt;]=20
<br>&gt; (scmi_clk_recalc_rate+0x3c/0x70)
<br>&gt; [ =C2=A0 84.327791] [&lt;c067f358&gt;] (scmi_clk_recalc_rate) from=
 [&lt;c0677004&gt;]=20
<br>&gt; (clk_recalc+0x34/0x74)
<br>&gt; [ =C2=A0 84.331653] sched: RT throttling activated
<br>&gt; [ =C2=A0 84.339991] [&lt;c0677004&gt;] (clk_recalc) from [&lt;c067=
9e18&gt;]=20
<br>&gt; (clk_change_rate+0xf8/0x544)
<br>&gt; [ =C2=A0 84.347653] [&lt;c0679e18&gt;] (clk_change_rate) from [&lt=
;c067a3f4&gt;]=20
<br>&gt; (clk_core_set_rate_nolock+0x190/0x1d8)
<br>&gt; [ =C2=A0 84.356687] [&lt;c067a3f4&gt;] (clk_core_set_rate_nolock) =
from [&lt;c067a46c&gt;]=20
<br>&gt; (clk_set_rate+0x30/0x88)
<br>&gt; [ =C2=A0 84.365300] [&lt;c067a46c&gt;] (clk_set_rate) from [&lt;c0=
95a910&gt;]=20
<br>&gt; (_set_opp+0x2d0/0x5f0)
<br>&gt; [ =C2=A0 84.372647] [&lt;c095a910&gt;] (_set_opp) from [&lt;c095ac=
c0&gt;]=20
<br>&gt; (dev_pm_opp_set_rate+0x90/0x16c)
<br>&gt; [ =C2=A0 84.380508] [&lt;c095acc0&gt;] (dev_pm_opp_set_rate) from =
[&lt;c095ff8c&gt;]=20
<br>&gt; (__cpufreq_driver_target+0x110/0x2f8)
<br>&gt; [ =C2=A0 84.389840] [&lt;c095ff8c&gt;] (__cpufreq_driver_target) f=
rom [&lt;c0962f94&gt;]=20
<br>&gt; (od_dbs_update+0xb4/0x160)
<br>&gt; [ =C2=A0 84.398540] [&lt;c0962f94&gt;] (od_dbs_update) from [&lt;c=
0963b18&gt;]=20
<br>&gt; (dbs_work_handler+0x2c/0x58)
<br>&gt; [ =C2=A0 84.406499] [&lt;c0963b18&gt;] (dbs_work_handler) from [&l=
t;c0141dec&gt;]=20
<br>&gt; (process_one_work+0x1dc/0x588)
<br>&gt; [ =C2=A0 84.414881] [&lt;c0141dec&gt;] (process_one_work) from [&l=
t;c01421e4&gt;]=20
<br>&gt; (worker_thread+0x4c/0x520)
<br>&gt; [ =C2=A0 84.422940] [&lt;c01421e4&gt;] (worker_thread) from [&lt;c=
0149df8&gt;]=20
<br>&gt; (kthread+0x170/0x1a0)
<br>&gt; [ =C2=A0 84.430367] [&lt;c0149df8&gt;] (kthread) from [&lt;c010013=
0&gt;]=20
<br>&gt; (ret_from_fork+0x14/0x24)
<br>&gt; [ =C2=A0 84.437481] Exception stack(0xced55fb0 to 0xced55ff8)
<br>&gt; [ =C2=A0 84.442571] 5fa0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 00000000=20
<br>&gt; 00000000 00000000 00000000
<br>&gt; [ =C2=A0 84.450726] 5fc0: 00000000 00000000 00000000 00000000 0000=
0000=20
<br>&gt; 00000000 00000000 00000000
<br>&gt; [ =C2=A0 84.458880] 5fe0: 00000000 00000000 00000000 00000000 0000=
0013 00000000
<br>&gt; [ =C2=A0 84.465448] handlers:
<br>&gt; [ =C2=A0 84.467682] [&lt;716ecdd6&gt;] irq_default_primary_handler=
 threaded=20
<br>&gt; [&lt;63fec1af&gt;] regmap_irq_thread
<br>&gt; [ =C2=A0 84.476083] Disabling IRQ #74/*
<br>&gt;=20
<br>&gt; torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjo=
itti:
<br>&gt;=20
<br>&gt;     Ralf - Not sure what you mean by your note.
<br>&gt;=20
<br>&gt;     Jan - root cell configuration is now fixed what comes to overl=
apped
<br>&gt;     memory regions. However, the=C2=A0both issues: */1. Terminal h=
angs/*, and
<br>&gt;     */2. Issue with setting CPU clock/* still exists. I am not fam=
iliar
<br>&gt;     with clock configurations on the target, but yes TF-A is in us=
e.
<br>&gt;=20
<br>&gt;     -tommi
<br>&gt;=20
<br>&gt;     to 5. tammik. 2023 klo 12.54 Ralf Ramsauer
<br>&gt;     (<a href data-email-masked rel=3D"nofollow">ralf.r...@oth-rege=
nsburg.de</a>) kirjoitti:
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;         On 05/01/2023 18:24, Jan Kiszka wrote:
<br>&gt;          &gt; On 05.01.23 18:21, Tommi Parkkila wrote:
<br>&gt;          &gt;&gt; Oh, I was missing *.cell from the point 2. Now f=
ixed=C2=A0and no
<br>&gt;         complaints.
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt; to 5. tammik. 2023 klo 12.20 Tommi Parkkila
<br>&gt;         (<a href data-email-masked rel=3D"nofollow">tommi.p...@gma=
il.com</a>
<br>&gt;          &gt;&gt; &lt;mailto:<a href data-email-masked rel=3D"nofo=
llow">tommi.p...@gmail.com</a>&gt;) kirjoitti:
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Jan - Just ran the config ch=
eck on the host PC and on
<br>&gt;         target.
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. On host, it identified so=
me memregion overlappings
<br>&gt;         that were due
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 my own copy/paste errors. It=
 also complained a missing
<br>&gt;         resource
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 interception for architectur=
e x86:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */In cell &#39;STM32MP1-Root=
&#39;, region 1
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x0000000=
0f7600000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x0000000=
0f7600000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =
=C2=A0 0x0000000009a00000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags: =C2=A0 =C2=A0 =
=C2=A0JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_EXECUTE
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 overlaps with xAPIC
<br>&gt;          &gt;
<br>&gt;          &gt; Another detail when running cross: &quot;-a arm&quot=
; - you don&#39;t have
<br>&gt;         to worry
<br>&gt;          &gt; about x86 resources on your target.
<br>&gt;=20
<br>&gt;         Side note: We should store the architecture in the
<br>&gt;         configuration. Just
<br>&gt;         for the same reason why we introduced the magic byte at th=
e
<br>&gt;         beginning=E2=80=A6
<br>&gt;=20
<br>&gt;          =C2=A0 =C2=A0Ralf
<br>&gt;=20
<br>&gt;          &gt;
<br>&gt;          &gt; Jan
<br>&gt;          &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x0000000=
0fee00000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x0000000=
0fee00000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =
=C2=A0 0x0000000000001000
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags:=C2=A0=C2=A0/*
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 I fixed the copy paste mem=
=C2=A0overlappings, do I need to
<br>&gt;         worry about
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 the xAPIC overlapping?
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. On target, the check comp=
lained the configuration is
<br>&gt;         not root
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 cell configuration???
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */root@stm32mp1:~# jailhouse=
/tools/jailhouse-config-check
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 jailhouse/configs/stm32mp157=
.c
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Reading configuration set:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Not a root cell configuratio=
n:
<br>&gt;         jailhouse/configs/arm/stm32mp157.c/*
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 The config here is the same =
as ran on the host PC. What
<br>&gt;         causes it to
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 complain the above?
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 to 5. tammik. 2023 klo 11.55=
 Jan Kiszka
<br>&gt;         (<a href data-email-masked rel=3D"nofollow">jan.k...@sieme=
ns.com</a>
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href data-emai=
l-masked rel=3D"nofollow">jan.k...@siemens.com</a>&gt;) kirjoitti:
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 05.01.23 17=
:53, Tommi Parkkila wrote:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Jan - Tha=
nks again. I have not tried the config
<br>&gt;         check yet.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Actually, it
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; does not =
work on hw currently, it does not find
<br>&gt;         pyjailhouse
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module. I&#39;=
ll
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; check wha=
ts=C2=A0going wrong with it and=C2=A0let you know.
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can also r=
un it offline, even directly from the
<br>&gt;         source folder
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools/jailhou=
se-config-check ...).
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Jan
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; -tommi
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; to 5. tam=
mik. 2023 klo 10.21 Jan Kiszka
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<a href data-=
email-masked rel=3D"nofollow">jan.k...@siemens.com</a> &lt;mailto:<a href d=
ata-email-masked rel=3D"nofollow">jan.k...@siemens.com</a>&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailt=
o:<a href data-email-masked rel=3D"nofollow">jan.k...@siemens.com</a>
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a =
href data-email-masked rel=3D"nofollow">jan.k...@siemens.com</a>&gt;&gt;) k=
irjoitti:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Thanks for your reply, Jan. I managed to
<br>&gt;         get forward
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from the &#39;=
hang&#39;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; condition. There were several
<br>&gt;         misdefinitions on my root-cell
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; configuration. Now I get the root-cell started
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sometimes, but=
 more
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0often
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; I get two types of issues after enable
<br>&gt;         command. Any help
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or ideas
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0where
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; to continue my debugging would be greatly
<br>&gt;         appreciated.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please, see th=
e
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; issues explained below.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Already tried &quot;jailhouse config check&quot;?
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Thanks,
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; -tommi
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; 1. Terminal hangs
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; -- After the enable command for the root
<br>&gt;         cell, jailhouse
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets started
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; but then the terminal goes unresponsive.
<br>&gt;         Below, example
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log, where I
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; give ls cmd, which then causes terminal to go
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresponsive..=
.:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Missing interrupts could be one reason. Or
<br>&gt;         something is
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completely
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0broken with memory mapping so that a kernel
<br>&gt;         device driver
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets stuck on
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0waiting for some register bit to flip, e.g.
<br>&gt;         But most
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frequent are
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0interrupt issues, specifically around GIC
<br>&gt;         resources being
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 improperly
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0passed through. The config checker may find that.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; /*root@stm32mp1:~# modprobe jailhouse
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ 1315.034414] jailhouse: loading
<br>&gt;         out-of-tree module
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taints kernel.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; root@stm32mp1:~# jailhouse enable
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; ~/jailhouse/configs/arm/itron_stm32mp157.cell
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Initializing Jailhouse hypervisor v0.12
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (314-gc7a1b697=
-dirty) on CPU 0
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Code location: 0xf0000040
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Page pool usage after early setup: mem
<br>&gt;         28/1514, remap
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0/131072
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Initializing processors:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; =C2=A0CPU 0... OK
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; =C2=A0CPU 1... OK
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Initializing unit: irqchip
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Initializing unit: PCI
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Page pool usage after late setup: mem
<br>&gt;         50/1514, remap
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5/131072
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [0] Activating hypervisor
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ 1355.352714] The Jailhouse is opening.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; root@stm32mp1:~# ls*/
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; 2. Issue with setting CPU clock
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; -- The second issue I see is related to i2c
<br>&gt;         bus and
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system clock.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; Terminal starts printing error statements
<br>&gt;         infinitely
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 after Jailhous=
e
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; opening. Below, is a snippet of an example
<br>&gt;         logs.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; */[ =C2=A0 85.322027] The Jailhouse is opening.
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c:
<br>&gt;         failed to
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_enable
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0clock
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _set_opp_volta=
ge: failed to
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; set voltage (1350000 1350000 1350000 mV): -22
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ =C2=A0 85.350413] cpufreq: __target_index:
<br>&gt;         Failed to change cpu
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0frequency: -22
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage:
<br>&gt;         failed to set
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ =C2=A0 85.365124] cpufreq: __target_index:
<br>&gt;         Failed to change cpu
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0frequency: -22
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage:
<br>&gt;         failed to set
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; /*- - -
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Same possible reasons as above. Or do you
<br>&gt;         know how clock
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 control happen=
s
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0on that platform? Is there firmware (TF-A?)
<br>&gt;         involved?
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Jan
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0--
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Siemens AG, Technology
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0Competence Center Embedded Linux
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Siemens AG, Te=
chnology
<br>&gt;          &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Competence Cen=
ter Embedded Linux
<br>&gt;          &gt;&gt;
<br>&gt;          &gt;
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/369cc25=
3-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dfi&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-=
38ed11beaa2fn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16731048095=
16000&amp;usg=3DAOvVaw29TtZmYuwvWpZjSwheJ960">https://groups.google.com/d/m=
sgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/369cc25=
3-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dfi&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
673104809516000&amp;usg=3DAOvVaw0z0hu9QZH6EjLxd4YLZNJ-">https://groups.goog=
le.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/00d34029-b440-4056-87bd-2a922d1dbcd8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/00d34029-b440-4056-87bd-2a922d1dbcd8n%40googlegroups.co=
m</a>.<br />

------=_Part_1199_634837909.1673019183876--

------=_Part_1198_97437943.1673019183876--
