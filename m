Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBAVYT6HQMGQEIUSTFYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 796FC49376E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jan 2022 10:38:11 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id u12-20020a05620a0c4c00b00475a9324977sf1315666qki.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jan 2022 01:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ub5l79V41DFnUmYvsHkLVg6WVHxhcYtHcUIN/SGS2ig=;
        b=By1IYPDt/gmG2dhhIVKYbWn+uwsLs86amRFygZXok0WEgljGhOP7v9BDtD+E37fMy9
         c4C+yIiKkSbsjC/aXMtg7Kd01RWfPeHtkYQPTj4Z/hWhNzkTHzxtsriIzgQCxi6+voAK
         HrNnlXzTz4FjJWWCaHo+BrKK8urqHnmiqw6cG6HM+RBUExXo/BpmQpu09o/QNb8WRr08
         fSyoXaYzjwYzPn+wMpc1on4HVEYDK9rMv1jpokPtB6iIL9gld+QqF2fr5klwMBgt9+Zv
         b2VxRjctNFvphl3GhxVZvxYPodKbBVWcgYznjWFg28dTNUnGtTj9lBb8zOnGwze1RIzl
         duMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ub5l79V41DFnUmYvsHkLVg6WVHxhcYtHcUIN/SGS2ig=;
        b=SjYA8Y9ptIM0CeFPAWSk9Rtr4/6YiCGjhUaV+7S9ddP4TMOxnEMAtgzLf+5V0j5xQx
         Ovg/Ftg2Qu5I2khdratt0Yg5CjP8Q1oieEXjB4pWhB32mKDv329vuKSQzRSGIwwDykKO
         3csw1fxFYfw/EBu81z5nTTZLw7HuQPkdlKQqD3d4JTHf6kPaxOBlOzAmcCJk6ejHL6it
         tw1OVC6xt9OWUOryTrgClx+TVfl302cZSs5eBt+MmmRoNQa1EIk8Xt905pNLw9CcKEMQ
         NdbLHBfpaH9ripmAXLnK7XSsXAE+vfueJyupmEGO3i/l91IAXCtQ655Kk3YLB5N3e5ZY
         R9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ub5l79V41DFnUmYvsHkLVg6WVHxhcYtHcUIN/SGS2ig=;
        b=MQRWHTG56SzqQhIIXTJIx5fpCRlBSG6uqE7QB6kk5kPH1vGTMuFxnJOByFRcOCbG50
         Dyk2TSFQikZfO1rfMAkqfxaZmdi35YcVW0tOBVaXEFM8Z+QSkUUXRpm+6ogLOiWPSfvH
         C9s2uKfjS1sRykfOPP1NzaZnWNu2XLsaaLsXbr0jXoUpjTLEoGXvoVwCBgwIXS6gseXt
         tds8LC7dvKJ3rs5GXjWwgdGwgqG0WTiQxYDK2FTLIVfa0Yax6/ZUYH9SsdDqf3aqg4zo
         L+SUEkC4o+ARu1QHNrMlvIdjKXxScdNTDUETKWrGNXRwmIihGfjgmsMDApVPX/QqnPIO
         owQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53073exYNpjiGSD53QmQ0skPBLB0s7OWNfigIQJBXinSIjKO6ptn
	wNLYxVTsamkPA0P1XDbWbQA=
X-Google-Smtp-Source: ABdhPJyUWGQzPIXqagb0MUY9DUZcNNU/P9i4pxYmghTL0WmjBFcFpp1w/r65dRdyLAUwC2xutGVPxQ==
X-Received: by 2002:a05:622a:4c:: with SMTP id y12mr24477143qtw.335.1642585090303;
        Wed, 19 Jan 2022 01:38:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:5aed:: with SMTP id c13ls760589qvh.6.gmail; Wed, 19 Jan
 2022 01:38:09 -0800 (PST)
X-Received: by 2002:ad4:5d68:: with SMTP id fn8mr25457538qvb.76.1642585089687;
        Wed, 19 Jan 2022 01:38:09 -0800 (PST)
Date: Wed, 19 Jan 2022 01:38:09 -0800 (PST)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c38e6f54-e0a1-4404-a727-0a40ba5c8a49n@googlegroups.com>
In-Reply-To: <5f6add41-9c0a-0403-979f-19f4702dd45c@web.de>
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com>
 <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
 <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
 <CAC+yH-ZsR5AqLjCuK+y5ePczmiMK7upnkh3O+ppq8nEzC=j1TA@mail.gmail.com>
 <5f6add41-9c0a-0403-979f-19f4702dd45c@web.de>
Subject: Re: Help Needed Regarding Virtio IVSHMEM
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14782_343785133.1642585089164"
X-Original-Sender: anmol.karan123@gmail.com
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

------=_Part_14782_343785133.1642585089164
Content-Type: multipart/alternative; 
	boundary="----=_Part_14783_610387401.1642585089164"

------=_Part_14783_610387401.1642585089164
Content-Type: text/plain; charset="UTF-8"

Hi,

I have tried to figure it and resolved the "PCI devices not showing", and 
devices are showing now(`c` and `d`):

```
Activating hypervisor
[   73.183592] pci-host-generic fc000000.pci: host bridge /pci@0 ranges:
[   73.199132] pci-host-generic fc000000.pci:   MEM 0xfc100000..0xfc103fff 
-> 0xfc100000
[   73.208489] pci-host-generic fc000000.pci: ECAM at [mem 
0xfc000000-0xfc0fffff] for [bus 00]
[   73.218012] pci-host-generic fc000000.pci: PCI host bridge to bus 0001:00
[   73.226675] pci_bus 0001:00: root bus resource [bus 00]
[   73.233239] pci_bus 0001:00: root bus resource [mem 
0xfc100000-0xfc103fff]
[   73.245689] pci 0001:00:0c.0: [110a:4106] type 00 class 0xffc002
[   73.255187] pci 0001:00:0c.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   73.268934] pci 0001:00:0d.0: [110a:4106] type 00 class 0xffc003
[   73.275920] pci 0001:00:0d.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   73.333292] pci 0001:00:0c.0: BAR 0: assigned [mem 0xfc100000-0xfc100fff]
[   73.350022] pci 0001:00:0d.0: BAR 0: assigned [mem 0xfc101000-0xfc101fff]
[   73.365843] The Jailhouse is opening.
[   73.379727] xilinx-dp-snd-card 
fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to init link 
xilinx-dp0: -517
```
but after doing this,

```
root@zcu102-zynqmp:~# modprobe uio_ivshmem

root@zcu102-zynqmp:~# echo "110a 4106 110a 4106 ffc002 ffffff" > 
/sys/bus/pci/drivers/uio_ivshmem/new_id
[  448.468251] uio_ivshmem 0001:00:0c.0: enabling device (0000 -> 0002)
[  448.479735] uio_ivshmem 0001:00:0c.0: state_table at 0x0000000050400000, 
size 0x0000000000001000
[  448.487710] uio_ivshmem 0001:00:0c.0: rw_section at 0x0000000050401000, 
size 0x00000000000df000
[  448.504564] xilinx-dp-snd-card 
fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to init link 
xilinx-dp0: -517

root@zcu102-zynqmp:~# ./virtio-ivshmem-block /dev/uio0 disk.img
./virtio-ivshmem-block: cannot open /sys/class/uio/uio0/maps/map2/size: No 
such file or directory
```
It's still not able to detect the required device.

Also,

```
root@zcu102-zynqmp:~# lspci -k
00:0d.0 Class ffc0: 110a:4106
00:0c.0 Class ffc0: 110a:4106 uio_ivshmem
```

Please let me know what I am missing.


Thanks and Regards,
Anmol

On Thursday, January 6, 2022 at 1:23:51 PM UTC+5:30 Jan Kiszka wrote:

> On 05.01.22 22:22, Anmol wrote:
> > Hi Moustafa,
> >
> > I already added `CONFIG_UIO_IVSHMEM=y` in my kernel configuration and
> > can easily load `uio_ivshmem` on the target image.
> >
> > Also, I am trying `virtio-ivshmem-console` so, is there any need for
> > `CONFIG_IVSHMEM_NET=y` to be added in the defconfig?
> >
>
> To run the virtio-ivshmem-console backend process, you just need the
> uio_ivshmem driver. Make sure it detected the required device properly
> (kernel log), then virtio-ivshmem-console will also find the needed uio
> sysfs entries.
>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c38e6f54-e0a1-4404-a727-0a40ba5c8a49n%40googlegroups.com.

------=_Part_14783_610387401.1642585089164
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I have tried to figure it and resolved the "PCI devi=
ces not showing", and devices are showing now(`c` and `d`):<br></div><div><=
br></div><div>```</div><div>Activating hypervisor<br>[ &nbsp; 73.183592] pc=
i-host-generic fc000000.pci: host bridge /pci@0 ranges:<br>[ &nbsp; 73.1991=
32] pci-host-generic fc000000.pci: &nbsp; MEM 0xfc100000..0xfc103fff -&gt; =
0xfc100000<br>[ &nbsp; 73.208489] pci-host-generic fc000000.pci: ECAM at [m=
em 0xfc000000-0xfc0fffff] for [bus 00]<br>[ &nbsp; 73.218012] pci-host-gene=
ric fc000000.pci: PCI host bridge to bus 0001:00<br>[ &nbsp; 73.226675] pci=
_bus 0001:00: root bus resource [bus 00]<br>[ &nbsp; 73.233239] pci_bus 000=
1:00: root bus resource [mem 0xfc100000-0xfc103fff]<br>[ &nbsp; 73.245689] =
pci 0001:00:0c.0: [110a:4106] type 00 class 0xffc002<br>[ &nbsp; 73.255187]=
 pci 0001:00:0c.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ &nbsp; 73.268=
934] pci 0001:00:0d.0: [110a:4106] type 00 class 0xffc003<br>[ &nbsp; 73.27=
5920] pci 0001:00:0d.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ &nbsp; 7=
3.333292] pci 0001:00:0c.0: BAR 0: assigned [mem 0xfc100000-0xfc100fff]<br>=
[ &nbsp; 73.350022] pci 0001:00:0d.0: BAR 0: assigned [mem 0xfc101000-0xfc1=
01fff]<br>[ &nbsp; 73.365843] The Jailhouse is opening.<br>[ &nbsp; 73.3797=
27] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: fa=
iled to init link xilinx-dp0: -517</div><div>```<br></div><div>but after do=
ing this,</div><div><br></div><div>```</div><div>root@zcu102-zynqmp:~# modp=
robe uio_ivshmem<br><br></div><div>root@zcu102-zynqmp:~# echo "110a 4106 11=
0a 4106 ffc002 ffffff" &gt; /sys/bus/pci/drivers/uio_ivshmem/new_id<br>[ &n=
bsp;448.468251] uio_ivshmem 0001:00:0c.0: enabling device (0000 -&gt; 0002)=
<br>[ &nbsp;448.479735] uio_ivshmem 0001:00:0c.0: state_table at 0x00000000=
50400000, size 0x0000000000001000<br>[ &nbsp;448.487710] uio_ivshmem 0001:0=
0:0c.0: rw_section at 0x0000000050401000, size 0x00000000000df000<br>[ &nbs=
p;448.504564] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_card=
: ASoC: failed to init link xilinx-dp0: -517<br><br></div><div>root@zcu102-=
zynqmp:~# ./virtio-ivshmem-block /dev/uio0 disk.img<br>./virtio-ivshmem-blo=
ck: cannot open /sys/class/uio/uio0/maps/map2/size: No such file or directo=
ry</div><div>```</div><div>It's still not able to detect the required devic=
e.</div><div><br></div><div>Also,</div><div><br></div><div>```</div><div>ro=
ot@zcu102-zynqmp:~# lspci -k<br>00:0d.0 Class ffc0: 110a:4106<br>00:0c.0 Cl=
ass ffc0: 110a:4106 uio_ivshmem</div><div>```</div><div><br></div><div>Plea=
se let me know what I am missing.</div><div><br></div><div><br></div><div>T=
hanks and Regards,</div><div>Anmol</div><div><br></div><div class=3D"gmail_=
quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, January 6, 2022 =
at 1:23:51 PM UTC+5:30 Jan Kiszka wrote:<br/></div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;">On 05.01.22 22:22, Anmol wrote:
<br>&gt; Hi Moustafa,
<br>&gt;
<br>&gt; I already added `CONFIG_UIO_IVSHMEM=3Dy` in my kernel configuratio=
n and
<br>&gt; can easily load `uio_ivshmem` on the target image.
<br>&gt;
<br>&gt; Also, I am trying `virtio-ivshmem-console` so, is there any need f=
or
<br>&gt; `CONFIG_IVSHMEM_NET=3Dy` to be added in the defconfig?
<br>&gt;
<br>
<br>To run the virtio-ivshmem-console backend process, you just need the
<br>uio_ivshmem driver. Make sure it detected the required device properly
<br>(kernel log), then virtio-ivshmem-console will also find the needed uio
<br>sysfs entries.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c38e6f54-e0a1-4404-a727-0a40ba5c8a49n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c38e6f54-e0a1-4404-a727-0a40ba5c8a49n%40googlegroups.co=
m</a>.<br />

------=_Part_14783_610387401.1642585089164--

------=_Part_14782_343785133.1642585089164--
