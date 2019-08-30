Return-Path: <jailhouse-dev+bncBDPIBXN2TIERB4EUUPVQKGQEEF2BCDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3082AA3053
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 09:04:18 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id c18sf2446381oig.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nhaRE1i67n81eOq+4QWJ4Z9CggEnW4p+3BudSO1o+VE=;
        b=j8+P0aFQXBWFUEYRQOr9peCTbzBGTAc5YyBtY/zZsubawb7TML3MCJAZpiwX5ftBay
         YUkDva/1q+u1UeIbNkPfBOO6ixeo/4r8rTvVI5zMdbCeNuAKcFJ9eL81DL4GZfht68mi
         wu7laZGIPeoqPvSpKg8honbUXuOWkr/eeYB7dMwkASmGMYPwaBqdDeAl3/T+05Ur96yu
         MWfbQczNSMro9LuSoGgVgypOlHx8K3Kow6s/GtLiD2XwieQQHYNzkzFTnvQfXuEvqIeS
         NsaGfk9B09lihCIHUm08J2sgmCSij2zZR5D/PjYKSBrdR5h0QADe2UmgyP/CgBYFO7IZ
         8ddQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nhaRE1i67n81eOq+4QWJ4Z9CggEnW4p+3BudSO1o+VE=;
        b=AY9CJpJ/UoDqsVbqUE9PFnhr/aKN5mq/aLq6Js1GuxbZvfLTOd170pK1yEw/pruZpM
         uiGdADR/eOjgYcVcoU+nNEDWPzsXc5Y+0DmhxUJXnGoI17zNg8ioBqP9pj6z+atrIAyS
         ul5OHr5QK2BoRZHaIl27sw3dwsMuKhXTKmc4XlB6frSDkRGiua97cUHJYdrSamuesMIx
         ndlgAGfwPEhmkBftY2liqWCOPH1bNyU7AV4rtW7D+kehIldu2EsXye+/j4v+sHUlPJdO
         bMLbovzFaD/uydEplz58WgvhHdFUELH3oJSNyRuCkvDrJ08KG0Dwpz2xOvcM5A4o3Hp8
         Ja3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nhaRE1i67n81eOq+4QWJ4Z9CggEnW4p+3BudSO1o+VE=;
        b=evBBywbVd+qAfrigwbPXPpEsKPwFb2z7n7ZklNCTlji2K9X9hED1xewYTWp63evgFI
         imoYjtZpOWno/hNjCVF1/+9eoeXtL2Z8931fVjWZ3cpmnsdN+i3tpQBiyixO4+Y5xDmF
         2Xq67qzn9fWIoOgHQ/+YNQ2Ex2rM9k5FyqeN9g70KKxm3HFWIVeWCP3RDaIi14vdAGK2
         FumuQ+XS8r5mowhbat0JjVlJSELa+aVTO7bC+PhkLeVRFNJGvaqp+MpMyYeGw6V2IJfN
         erhBNv0YB9FKpxJTjozlX/br7Vd9ZKenRIjT+Ex6UrjQQ4rNYN+YgRTJZHdXVhJAPsbh
         Rt2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWtSUfq/BCA7UJlVpyIPRyul1WtAT5gq8173djSIGjy/ZZASDVo
	g1UMUWKRSRvoOFhVgNi+P4c=
X-Google-Smtp-Source: APXvYqzI0brf1yYdjv7boSfOtraLggx267jC9yjiW/q2mcTqhTi0dbd2wtDE8AENr/Phx4AckzCGPg==
X-Received: by 2002:aca:6505:: with SMTP id m5mr4219242oim.23.1567148656675;
        Fri, 30 Aug 2019 00:04:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4d14:: with SMTP id a20ls54235oib.0.gmail; Fri, 30 Aug
 2019 00:04:16 -0700 (PDT)
X-Received: by 2002:aca:2313:: with SMTP id e19mr9253812oie.2.1567148655791;
        Fri, 30 Aug 2019 00:04:15 -0700 (PDT)
Date: Fri, 30 Aug 2019 00:04:14 -0700 (PDT)
From: Jan Lipponen <jan.lipponen@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fd8da5de-70ad-4bf9-b892-3a21d7718ca1@googlegroups.com>
In-Reply-To: <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
 <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
 <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_547_1106533130.1567148655166"
X-Original-Sender: jan.lipponen@gmail.com
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

------=_Part_547_1106533130.1567148655166
Content-Type: multipart/alternative; 
	boundary="----=_Part_548_1673988969.1567148655167"

------=_Part_548_1673988969.1567148655167
Content-Type: text/plain; charset="UTF-8"

Hi,

it was indeed just a driver support problem! I had missed to enable 
*CONFIG_VIRTIO_PCI* and *CONFIG_PCI_HOST_GENERIC*. I enabled some other 
options as well, according to the reference configuration you gave me, but 
these two probably were the most crucial ones. Now I see similar output:

Initializing Jailhouse hypervisor v0.11 (0-g58052a7-dirty) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/996, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 0... OK
 CPU 2... OK
 CPU 3... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "ZCU104-root"
Page pool usage after late setup: mem 59/996, remap 5/131072
Activating hypervisor
[  476.689642] OF: PCI: host bridge /pci@0 ranges:
[  476.694189] OF: PCI:   MEM 0xfc100000..0xfc101fff -> 0xfc100000
[  476.700142] pci-host-generic fc000000.pci: ECAM at [mem 
0xfc000000-0xfc0fffff] for [bus 00]
[  476.708589] pci-host-generic fc000000.pci: PCI host bridge to bus 0000:00
[  476.715388] pci_bus 0000:00: root bus resource [bus 00]
[  476.720613] pci_bus 0000:00: root bus resource [mem 
0xfc100000-0xfc101fff]
[  476.727692] pci 0000:00:00.0: BAR 0: assigned [mem 0xfc100000-0xfc1000ff 
64bit]
[  476.735137] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
[  476.741483] The Jailhouse is opening.


And the device appears under sys/bus/pci/devices/

root@zcu104-zynqmp:/# ls sys/bus/pci/devices/
0000:00:00.0

Thank you so much for your assistance :)

-Jan

On Thursday, 29 August 2019 15:51:28 UTC+3, Jan Kiszka wrote:
>
> On 29.08.19 12:44, Jan Lipponen wrote: 
> > Hi Jan, 
> > 
> > thanks for your quick answer! Please find the kernel log attached. 
>
> There is no report of the host controller being detected. You should 
> find it at least in the device tree under 
> /sys/firmware/devicetree/base/pci@0. 
> The kernel log should look like this: 
>
> [   30.213785] pci-host-generic fc000000.pci: host bridge /pci@0 ranges: 
> [   30.220268] pci-host-generic fc000000.pci:   MEM 0xfc100000..0xfc103fff 
> -> 0xfc100000 
> [   30.228537] pci-host-generic fc000000.pci: ECAM at [mem 
> 0xfc000000-0xfc0fffff] for [bus 00] 
> [   30.237019] pci-host-generic fc000000.pci: PCI host bridge to bus 
> 0001:00 
> [   30.243837] pci_bus 0001:00: root bus resource [bus 00] 
> [   30.249078] pci_bus 0001:00: root bus resource [mem 
> 0xfc100000-0xfc103fff] 
> [   30.255989] pci 0001:00:00.0: [1af4:1110] type 00 class 0xff0100 
> [   30.256015] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 
> 64bit] 
> [   30.256577] pci 0001:00:01.0: [1af4:1110] type 00 class 0xff0100 
> [   30.256597] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x000000ff 
> 64bit] 
> [   30.257891] pci 0001:00:00.0: BAR 0: assigned [mem 
> 0xfc100000-0xfc1000ff 64bit] 
> [   30.265272] pci 0001:00:01.0: BAR 0: assigned [mem 
> 0xfc100100-0xfc1001ff 64bit] 
> [   30.272804] The Jailhouse is opening. 
> [   30.299771] ivshmem-net 0001:00:00.0: enabling device (0000 -> 0002) 
> [   30.307270] ivshmem-net 0001:00:01.0: enabling device (0000 -> 0002) 
>
> Check if your root cell kernel is the required driver support built in. 
>
> https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/arm64_defconfig_4.19 
> can be a reference. 
>
> Jan 
>
> > 
> > -Jan 
> > 
> > On Thursday, 29 August 2019 13:17:49 UTC+3, Jan Kiszka wrote: 
> > 
> >     On 29.08.19 10:36, Jan Lipponen wrote: 
> >      > Hi! 
> >      > 
> >      > I have ran in a similar situation as Sebastian in a post from 
> yesterday 
> >      > <
> https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk 
> >     <https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk>> but 
> with a 
> >      > ARM64 device (ZCU104 board). The problem seems to be that Linux 
> is unable to 
> >      > detect the virtual IVSHMEM PCI device. The Jailhouse enables fine 
> with 
> >     following 
> >      > logs: 
> >      > 
> >      > 
> >      > | 
> >      > Initializing Jailhouse hypervisor  on CPU 0 
> >      > Code location: 0x0000ffffc0200800 
> >      > Page pool usage after early setup: mem 39/996, remap 0/131072 
> >      > Initializing processors: 
> >      >   CPU 0... OK 
> >      >   CPU 1... OK 
> >      >   CPU 3... OK 
> >      >   CPU 2... OK 
> >      > Initializing unit: irqchip 
> >      > Initializing unit: PCI 
> >      > Adding virtual PCI device 00:00.0 to cell "ZCU104-root" 
> >      > DEBUG pci.c: pci_cell_init returned 0 
> >      > Page pool usage after late setup: mem 59/996, remap 5/131072 
> >      > Activating hypervisor 
> >      > [  627.901240] The Jailhouse is opening. 
> >      > | 
> >      > 
> >      > 
> >      > I've just added the DEBUG print there. 
> >      > 
> >      > I do not have the /lspci/ tool installed on the target, but I can 
> see 
> >     that no 
> >      > PCI devices are created under //sys/bus/pci/devices/ and the 
> probe 
> >     function of 
> >      > the /uio_ivshmem/ driver never gets called. Re-scanning the PCI 
> bus doesn't 
> >      > help. After enabling a guest cell I can see that Jailhouse is 
> able to 
> >     create a 
> >      > shared memory connection between the guest and root cell via the 
> IVSHMEM 
> >     device: 
> >      > 
> >      > | 
> >      > [ 1493.087945] CPU3: shutdown 
> >      > [ 1493.090656] psci: CPU3 killed. 
> >      > Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU104-bmetal" 
> >      > Shared memory connection established: "ZynqMP-ZCU104-bmetal" <--> 
> >     "ZCU104-root" 
> >      > Created cell "ZynqMP-ZCU104-bmetal" 
> >      > | 
> >      > 
> >      > This makes me think that from the Jailhouse's point of view 
> everything is 
> >     going 
> >      > great and the only problem is that Linux's PCI subsystem is just 
> unable to 
> >      > discover the device. I initially thought it is a device tree 
> issue so I went 
> >      > ahead and added a PCI node to the device tree, following the 
> example in 
> >      > jailhouse/configs/arm64/dts/inmate-zynqmp.dts 
> >      > 
> >     <
> https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91 
> >     <
> https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91>>. 
>
> > 
> >      > It seems that the base address of this generic PCI host 
> controller needs to 
> >      > match the /.pci_mmconfig_base /property in the root cell config. 
> This, 
> >     however, 
> >      > resulted in a kernel warning: 
> >      > 
> >      > | 
> >      > Activating hypervisor 
> >      > [  171.863249] sysfs: cannot create duplicate filename 
> >      > '/bus/platform/devices/fc000000.pci' 
> >      > [  171.871362] ------------[ cut here ]------------ 
> >      > [  171.875977] WARNING: CPU: 1 PID: 1932 at fs/sysfs/dir.c:31 
> >      > sysfs_warn_dup+0x5c/0x78 
> >      > | 
> >      > 
> >      > So, the fc000000.pci device is already registered without my 
> additional 
> >     device 
> >      > tree node, but the /uio_ivshmem/ does not get probed because it's 
> >     registered as 
> >      > a PCI driver. 
> >      > 
> >      > Additioanlly, I've tried adding CONFIG_KALLSYMS_ALL 
> and CONFIG_PCI_DEBUG in 
> >      > kernel config, but nothing changed. 
> >      > 
> >      > 
> >      > To get me forward, I would have couple of questions. 
> >      > 
> >      >   * Should a device indeed be created under /sys/bus/pci/devices 
> when 
> >     Jailhouse 
> >      >     is enabled, regardless if /uio_ivshmem /driver is inserted 
> into 
> >     kernel or not? 
> > 
> >     Yes. The device comes first (namely the virtual PCI host controller 
> and then, 
> >     via scanning it, the virtual device(s)), and then the drivers bind 
> to it (for 
> >     pci-generic host controller and ivshmem devices). 
> > 
> >      > 
> >      >   * Is the /uio_ivshmem /driver's probe called after Linux's PCI 
> subsystem 
> >      >     successfully registers the IVSHMEM device? 
> > 
> >     See above: The generic host controller should be detected first. 
> It's added via 
> >     a dt overlay by the jailhouse driver to the root cell. Could you 
> share the 
> >     complete kernel log of the root cell? 
> > 
> >      > 
> >      >   * Should I add a device tree node for a /pci-host-generic 
> /driver 
> >     (/compatible 
> >      >     = "pci-host-ecam-generic"/) or not? Initially, I only have an 
> entry 
> >     for the 
> >      >     ZynqMP PCIe core (/compatible = "xlnx,nwl-pcie-2.11"/). 
> >      > 
> > 
> >     Nope, not needed, done automatically. 
> > 
> >     Jan 
> > 
> >     -- 
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> >     Corporate Competence Center Embedded Linux 
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> Groups 
> > "Jailhouse" group. 
> > To unsubscribe from this group and stop receiving emails from it, send 
> an email 
> > to jailho...@googlegroups.com <javascript:> 
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>. 
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com 
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd8da5de-70ad-4bf9-b892-3a21d7718ca1%40googlegroups.com.

------=_Part_548_1673988969.1567148655167
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it was indeed just a driver support=
 problem! I had missed to enable=C2=A0<i>CONFIG_VIRTIO_PCI</i>=C2=A0and=C2=
=A0<i>CONFIG_PCI_HOST_GENERIC</i>. I enabled some other options as well, ac=
cording to the reference configuration you gave me, but these two probably =
were the most crucial ones. Now I see similar output:</div><div><br></div><=
div><div class=3D"prettyprint" style=3D"border-width: 1px; border-style: so=
lid; border-color: rgb(187, 187, 187); background-color: rgb(250, 250, 250)=
; overflow-wrap: break-word;"><code class=3D"prettyprint"><div class=3D"sub=
prettyprint"><div class=3D"subprettyprint"><span style=3D"color: rgb(102, 0=
, 102); font-family: Arial, Helvetica, sans-serif;">Initializing Jailhouse =
hypervisor v0.11 (0-g58052a7-dirty) on CPU 1</span><br></div><div class=3D"=
subprettyprint"><font color=3D"#660066">Code location: 0x0000ffffc0200800</=
font></div><div class=3D"subprettyprint"><font color=3D"#660066">Page pool =
usage after early setup: mem 39/996, remap 0/131072</font></div><div class=
=3D"subprettyprint"><font color=3D"#660066">Initializing processors:</font>=
</div><div class=3D"subprettyprint"><font color=3D"#660066">=C2=A0CPU 1... =
OK</font></div><div class=3D"subprettyprint"><font color=3D"#660066">=C2=A0=
CPU 0... OK</font></div><div class=3D"subprettyprint"><font color=3D"#66006=
6">=C2=A0CPU 2... OK</font></div><div class=3D"subprettyprint"><font color=
=3D"#660066">=C2=A0CPU 3... OK</font></div><div class=3D"subprettyprint"><f=
ont color=3D"#660066">Initializing unit: irqchip</font></div><div class=3D"=
subprettyprint"><font color=3D"#660066">Initializing unit: PCI</font></div>=
<div class=3D"subprettyprint"><font color=3D"#660066">Adding virtual PCI de=
vice 00:00.0 to cell &quot;ZCU104-root&quot;</font></div><div class=3D"subp=
rettyprint"><font color=3D"#660066">Page pool usage after late setup: mem 5=
9/996, remap 5/131072</font></div><div class=3D"subprettyprint"><font color=
=3D"#660066">Activating hypervisor</font></div><div class=3D"subprettyprint=
"><font color=3D"#660066">[=C2=A0 476.689642] OF: PCI: host bridge /pci@0 r=
anges:</font></div><div class=3D"subprettyprint"><font color=3D"#660066">[=
=C2=A0 476.694189] OF: PCI:=C2=A0 =C2=A0MEM 0xfc100000..0xfc101fff -&gt; 0x=
fc100000</font></div><div class=3D"subprettyprint"><font color=3D"#660066">=
[=C2=A0 476.700142] pci-host-generic fc000000.pci: ECAM at [mem 0xfc000000-=
0xfc0fffff] for [bus 00]</font></div><div class=3D"subprettyprint"><font co=
lor=3D"#660066">[=C2=A0 476.708589] pci-host-generic fc000000.pci: PCI host=
 bridge to bus 0000:00</font></div><div class=3D"subprettyprint"><font colo=
r=3D"#660066">[=C2=A0 476.715388] pci_bus 0000:00: root bus resource [bus 0=
0]</font></div><div class=3D"subprettyprint"><font color=3D"#660066">[=C2=
=A0 476.720613] pci_bus 0000:00: root bus resource [mem 0xfc100000-0xfc101f=
ff]</font></div><div class=3D"subprettyprint"><font color=3D"#660066">[=C2=
=A0 476.727692] pci 0000:00:00.0: BAR 0: assigned [mem 0xfc100000-0xfc1000f=
f 64bit]</font></div><div class=3D"subprettyprint"><font color=3D"#660066">=
[=C2=A0 476.735137] virtio-pci 0000:00:00.0: enabling device (0000 -&gt; 00=
02)</font></div><div class=3D"subprettyprint"><font color=3D"#660066">[=C2=
=A0 476.741483] The Jailhouse is opening.</font></div><div><br></div></div>=
</code></div><div><br></div>And the device appears under=C2=A0sys/bus/pci/d=
evices/<br><br><div class=3D"prettyprint" style=3D"border-width: 1px; borde=
r-style: solid; border-color: rgb(187, 187, 187); background-color: rgb(250=
, 250, 250); overflow-wrap: break-word;"><code class=3D"prettyprint"><div c=
lass=3D"subprettyprint"><div class=3D"subprettyprint">root@zcu104-zynqmp:/#=
 ls sys/bus/pci/devices/</div><div class=3D"subprettyprint">0000:00:00.0</d=
iv></div></code></div><br>Thank you so much for your assistance :)</div><di=
v><br></div><div>-Jan<br></div><br>On Thursday, 29 August 2019 15:51:28 UTC=
+3, Jan Kiszka  wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 29.08=
.19 12:44, Jan Lipponen wrote:
<br>&gt; Hi Jan,
<br>&gt;=20
<br>&gt; thanks for your quick answer! Please find the kernel log attached.
<br>
<br>There is no report of the host controller being detected. You should=20
<br>find it at least in the device tree under /sys/firmware/devicetree/base=
/<wbr>pci@0.
<br>The kernel log should look like this:
<br>
<br>[ =C2=A0 30.213785] pci-host-generic fc000000.pci: host bridge /pci@0 r=
anges:
<br>[ =C2=A0 30.220268] pci-host-generic fc000000.pci: =C2=A0 MEM 0xfc10000=
0..0xfc103fff -&gt; 0xfc100000
<br>[ =C2=A0 30.228537] pci-host-generic fc000000.pci: ECAM at [mem 0xfc000=
000-0xfc0fffff] for [bus 00]
<br>[ =C2=A0 30.237019] pci-host-generic fc000000.pci: PCI host bridge to b=
us 0001:00
<br>[ =C2=A0 30.243837] pci_bus 0001:00: root bus resource [bus 00]
<br>[ =C2=A0 30.249078] pci_bus 0001:00: root bus resource [mem 0xfc100000-=
0xfc103fff]
<br>[ =C2=A0 30.255989] pci 0001:00:00.0: [1af4:1110] type 00 class 0xff010=
0
<br>[ =C2=A0 30.256015] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000=
0ff 64bit]
<br>[ =C2=A0 30.256577] pci 0001:00:01.0: [1af4:1110] type 00 class 0xff010=
0
<br>[ =C2=A0 30.256597] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000=
0ff 64bit]
<br>[ =C2=A0 30.257891] pci 0001:00:00.0: BAR 0: assigned [mem 0xfc100000-0=
xfc1000ff 64bit]
<br>[ =C2=A0 30.265272] pci 0001:00:01.0: BAR 0: assigned [mem 0xfc100100-0=
xfc1001ff 64bit]
<br>[ =C2=A0 30.272804] The Jailhouse is opening.
<br>[ =C2=A0 30.299771] ivshmem-net 0001:00:00.0: enabling device (0000 -&g=
t; 0002)
<br>[ =C2=A0 30.307270] ivshmem-net 0001:00:01.0: enabling device (0000 -&g=
t; 0002)
<br>
<br>Check if your root cell kernel is the required driver support built in.
<br><a href=3D"https://github.com/siemens/jailhouse-images/blob/master/reci=
pes-kernel/linux/files/arm64_defconfig_4.19" target=3D"_blank" rel=3D"nofol=
low" onmousedown=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%=
3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse-images%2Fblob%2Fmaster%2Frecipes-k=
ernel%2Flinux%2Ffiles%2Farm64_defconfig_4.19\x26sa\x3dD\x26sntz\x3d1\x26usg=
\x3dAFQjCNGD6hHJPXYypS_M_6izdSCCRey0gw&#39;;return true;" onclick=3D"this.h=
ref=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsieme=
ns%2Fjailhouse-images%2Fblob%2Fmaster%2Frecipes-kernel%2Flinux%2Ffiles%2Far=
m64_defconfig_4.19\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGD6hHJPXYypS_M_6=
izdSCCRey0gw&#39;;return true;">https://github.com/siemens/<wbr>jailhouse-i=
mages/blob/master/<wbr>recipes-kernel/linux/files/<wbr>arm64_defconfig_4.19=
</a>
<br>can be a reference.
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; -Jan
<br>&gt;=20
<br>&gt; On Thursday, 29 August 2019 13:17:49 UTC+3, Jan Kiszka wrote:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 29.08.19 10:36, Jan Lipponen wrote:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Hi!
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; I have ran in a similar situation as Seba=
stian in a post from yesterday
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"https://groups.google.com/=
forum/#!topic/jailhouse-dev/GgGrW2an4Tk" target=3D"_blank" rel=3D"nofollow"=
 onmousedown=3D"this.href=3D&#39;https://groups.google.com/forum/#!topic/ja=
ilhouse-dev/GgGrW2an4Tk&#39;;return true;" onclick=3D"this.href=3D&#39;http=
s://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk&#39;;return t=
rue;">https://groups.google.com/<wbr>forum/#!topic/jailhouse-dev/<wbr>GgGrW=
2an4Tk</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/forum/#!top=
ic/jailhouse-dev/GgGrW2an4Tk" target=3D"_blank" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;https://groups.google.com/forum/#!topic/jailhouse-dev=
/GgGrW2an4Tk&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.=
google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk&#39;;return true;">https=
://groups.google.com/<wbr>forum/#!topic/jailhouse-dev/<wbr>GgGrW2an4Tk</a>&=
gt;&gt;=C2=A0but with a
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ARM64 device (ZCU104 board). The problem =
seems to be that Linux is unable to
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; detect the virtual IVSHMEM PCI device. Th=
e Jailhouse enables fine with
<br>&gt; =C2=A0 =C2=A0 following
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; logs:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Initializing Jailhouse hypervisor=C2=A0 o=
n CPU 0
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Code location: 0x0000ffffc0200800
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after early setup: mem 39=
/996, remap 0/131072
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Initializing processors:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: irqchip
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: PCI
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Adding virtual PCI device 00:00.0 to cell=
 &quot;ZCU104-root&quot;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; DEBUG pci.c: pci_cell_init returned 0
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after late setup: mem 59/=
996, remap 5/131072
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Activating hypervisor
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [=C2=A0 627.901240] The Jailhouse is open=
ing.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; I&#39;ve just added the DEBUG print there=
.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; I do not have the /lspci/=C2=A0tool insta=
lled on the target, but I can see
<br>&gt; =C2=A0 =C2=A0 that no
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; PCI devices are created under //sys/bus/p=
ci/devices/=C2=A0and the probe
<br>&gt; =C2=A0 =C2=A0 function of
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; the /uio_ivshmem/ driver never gets calle=
d. Re-scanning the PCI bus doesn&#39;t
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; help. After enabling a guest cell I can s=
ee that Jailhouse is able to
<br>&gt; =C2=A0 =C2=A0 create a
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; shared memory connection between the gues=
t and root cell via the IVSHMEM
<br>&gt; =C2=A0 =C2=A0 device:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [ 1493.087945] CPU3: shutdown
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [ 1493.090656] psci: CPU3 killed.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Adding virtual PCI device 00:00.0 to cell=
 &quot;ZynqMP-ZCU104-bmetal&quot;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Shared memory connection established: &qu=
ot;ZynqMP-ZCU104-bmetal&quot; &lt;--&gt;
<br>&gt; =C2=A0 =C2=A0 &quot;ZCU104-root&quot;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Created cell &quot;ZynqMP-ZCU104-bmetal&q=
uot;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; This makes me think that from the Jailhou=
se&#39;s point of view everything is
<br>&gt; =C2=A0 =C2=A0 going
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; great and the only problem is that Linux&=
#39;s PCI subsystem is just unable to
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; discover the device. I initially thought =
it is a device tree issue so I went
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ahead and added a PCI node to the device =
tree, following the example in
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; jailhouse/configs/arm64/dts/<wbr>inmate-z=
ynqmp.dts
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://github.com/siemens/jailhouse/=
blob/8e77d610dd4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynq=
mp.dts#L91" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&=
#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fja=
ilhouse%2Fblob%2F8e77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64=
%2Fdts%2Finmate-zynqmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0=
TpzqzdxZxx5UKr1HvUq0xav6kw&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttps://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhou=
se%2Fblob%2F8e77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64%2Fdt=
s%2Finmate-zynqmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0Tpzqz=
dxZxx5UKr1HvUq0xav6kw&#39;;return true;">https://github.com/siemens/<wbr>ja=
ilhouse/blob/<wbr>8e77d610dd4869223a5209c11e4314<wbr>c2e1d4d334/configs/arm=
64/dts/<wbr>inmate-zynqmp.dts#L91</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://github.com/siemens/jailhouse/=
blob/8e77d610dd4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynq=
mp.dts#L91" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&=
#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fja=
ilhouse%2Fblob%2F8e77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64=
%2Fdts%2Finmate-zynqmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0=
TpzqzdxZxx5UKr1HvUq0xav6kw&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttps://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhou=
se%2Fblob%2F8e77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64%2Fdt=
s%2Finmate-zynqmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0Tpzqz=
dxZxx5UKr1HvUq0xav6kw&#39;;return true;">https://github.com/siemens/<wbr>ja=
ilhouse/blob/<wbr>8e77d610dd4869223a5209c11e4314<wbr>c2e1d4d334/configs/arm=
64/dts/<wbr>inmate-zynqmp.dts#L91</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; It seems that the base address of this ge=
neric PCI host controller needs to
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; match the /.pci_mmconfig_base /property i=
n the root cell config. This,
<br>&gt; =C2=A0 =C2=A0 however,
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; resulted in a kernel warning:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Activating hypervisor
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [=C2=A0 171.863249] sysfs: cannot create =
duplicate filename
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; &#39;/bus/platform/devices/<wbr>fc000000.=
pci&#39;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [=C2=A0 171.871362] ------------[ cut her=
e ]------------
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [=C2=A0 171.875977] WARNING: CPU: 1 PID: =
1932 at fs/sysfs/dir.c:31
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; sysfs_warn_dup+0x5c/0x78
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; |
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; So, the=C2=A0fc000000.pci device is alrea=
dy registered without my additional
<br>&gt; =C2=A0 =C2=A0 device
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; tree node, but the /uio_ivshmem/=C2=A0doe=
s not get probed because it&#39;s
<br>&gt; =C2=A0 =C2=A0 registered as
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; a PCI driver.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Additioanlly, I&#39;ve tried adding=C2=A0=
CONFIG_KALLSYMS_ALL and=C2=A0CONFIG_PCI_DEBUG in
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; kernel config, but nothing changed.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; To get me forward, I would have couple of=
 questions.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 * Should a device indeed be create=
d under=C2=A0/sys/bus/pci/devices when
<br>&gt; =C2=A0 =C2=A0 Jailhouse
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 is enabled, regardless if /=
uio_ivshmem /driver is inserted into
<br>&gt; =C2=A0 =C2=A0 kernel or not?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Yes. The device comes first (namely the virtual PCI =
host controller and then,
<br>&gt; =C2=A0 =C2=A0 via scanning it, the virtual device(s)), and then th=
e drivers bind to it (for
<br>&gt; =C2=A0 =C2=A0 pci-generic host controller and ivshmem devices).
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 * Is the /uio_ivshmem /driver&#39;=
s probe called after Linux&#39;s PCI subsystem
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 successfully registers the =
IVSHMEM device?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 See above: The generic host controller should be det=
ected first. It&#39;s added via
<br>&gt; =C2=A0 =C2=A0 a dt overlay by the jailhouse driver to the root cel=
l. Could you share the
<br>&gt; =C2=A0 =C2=A0 complete kernel log of the root cell?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 * Should I add a device tree node =
for a /pci-host-generic /driver
<br>&gt; =C2=A0 =C2=A0 (/compatible
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =3D &quot;pci-host-ecam-gen=
eric&quot;/) or not? Initially, I only have an entry
<br>&gt; =C2=A0 =C2=A0 for the
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 ZynqMP PCIe core (/compatib=
le =3D &quot;xlnx,nwl-pcie-2.11&quot;/).
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Nope, not needed, done automatically.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 --=20
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
 Groups=20
<br>&gt; &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email=20
<br>&gt; to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"CNHxQd3GEAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"CNHxQd3GEAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6b4bb95=
0-5b1e-42e2-8d54-52beb009b025%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/6b4bb9=
50-<wbr>5b1e-42e2-8d54-52beb009b025%<wbr>40googlegroups.com</a>=20
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/6b4=
bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e=
-42e2-8d54-52beb009b025%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/6b4bb950-<wbr>5b1e-42=
e2-8d54-52beb009b025%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/fd8da5de-70ad-4bf9-b892-3a21d7718ca1%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/fd8da5de-70ad-4bf9-b892-3a21d7718ca1%40googlegroups.com<=
/a>.<br />

------=_Part_548_1673988969.1567148655167--

------=_Part_547_1106533130.1567148655166--
