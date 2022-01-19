Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBLFZT6HQMGQED7I2VSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0FD49377D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jan 2022 10:41:01 +0100 (CET)
Received: by mail-qt1-x83b.google.com with SMTP id p28-20020ac8409c000000b002c96bebc6c3sf1150601qtl.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jan 2022 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X+tKPtml64+nBQcDf8MwW2mZ2oGUmdoqCj7OrqOR41k=;
        b=V2dS/nzkVZYtnhmBxY0PJwQsyyF9d+TJMCmVJJff3Jxo/vYVxIjA8UA3UT7zQDujEK
         6WZtr9h/hwYpBIHbS1MwUhx9C76FOpzFSzYZA+/6dFxTW95E848Rkp9UyJDMjUih6AGY
         8Fv4pFP18WaTLpKK3vDMqIvkIwInBLwH3MdJENYqJYyLDL6FGX+U+nR1CDCOD2+vixRz
         fEOUZ6v8YYroi9mxx9HKU2HAxuZYrbNloA76g9QurlOJu+dFDXS74tAZ8g2obdjAsT2c
         RXoPWctcIvffpitH4XXgIsDaFPtppPZ+NuhDexg/bNM7A5cH5jv4cUsPNaSVgXPNTq4p
         nozg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X+tKPtml64+nBQcDf8MwW2mZ2oGUmdoqCj7OrqOR41k=;
        b=KwUhPZ1MsskPNiqhPZjaC97DUyr7FRsV4gOIwi7W6/cYPgQ1IHY5nwB1b3RGmIAm2e
         i41z/3m3vRdPpJYqF2NYIMIO6LdKcoNuTpq7WVgnv+gi1SPbXYc7nUCfSswPP6q2tesd
         LNDpEAcWLJwyal4Fxl1hNLfZPc3loXBiXWDpUUAC9l8Jn6C8aeC2GP7dZHxubK2NVO7N
         jaS571hbNJHGMybpfR692o6mmZyju90hgpdi9x86n62JbNvznuQvRm+2qSoa+JhXvK5u
         gTgvXfGUOcvwkbSjvG6k0tLKj+kJ/6V4RHbLf0NxZ/dXX+i3CUbpCUvagxBeWJjy5g+T
         9TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=X+tKPtml64+nBQcDf8MwW2mZ2oGUmdoqCj7OrqOR41k=;
        b=xq14RN4Lk/XgCdrTEbVc3vpawtgvIwvCP+pgixy0VFf4SyDoV2pq15ItqfpeaLh3Wy
         YpDZdns1/P5b1oZYR6aYnPryNT3q71f86rkZhARiviNXZZCH1ltFdG8lnzq+wfnVuvyp
         1ABzbbXC8ajtSI4QQEtP1vGat+6j3iW2uYCUfpGa7HCZqlAyk5vemlV8+5YmRUL03WLV
         IHilGAwlN/NXsdD8TPbhMa6j1vdUVswGf/Q6cdzjxrilvKwxtf8+Pzws54tCcVnNcYfB
         J8GOHzdbO2kJGc7wnNU3puJGOS8an+06VGnMdfB2T7TeWdgsRKncBUiEw+iWORd2aTgV
         64QA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326Aa2ugeuWzzEYiGP99arAHcWpj5woVvz5gRw5gjT+PJuPBuuQ
	d3KftKjNoEQIe+yg+Wmq7pw=
X-Google-Smtp-Source: ABdhPJzndk8mKGh+T6c+HYqCOPjxlbnUdAhAY/OeKRjo0gcxGDIsD0pE2/51nXghWsbziuH8Z5MtIg==
X-Received: by 2002:a05:6214:262a:: with SMTP id gv10mr25885119qvb.102.1642585260920;
        Wed, 19 Jan 2022 01:41:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5bc7:: with SMTP id b7ls768721qtb.11.gmail; Wed, 19 Jan
 2022 01:41:00 -0800 (PST)
X-Received: by 2002:a05:622a:1393:: with SMTP id o19mr24262817qtk.350.1642585260377;
        Wed, 19 Jan 2022 01:41:00 -0800 (PST)
Date: Wed, 19 Jan 2022 01:40:59 -0800 (PST)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <391b2878-029d-4a31-b811-29d78749924an@googlegroups.com>
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
	boundary="----=_Part_14810_1284942261.1642585259857"
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

------=_Part_14810_1284942261.1642585259857
Content-Type: multipart/alternative; 
	boundary="----=_Part_14811_2112469219.1642585259857"

------=_Part_14811_2112469219.1642585259857
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
root:~# modprobe uio_ivshmem

root:~# echo "110a 4106 110a 4106 ffc002 ffffff" > 
/sys/bus/pci/drivers/uio_ivshmem/new_id
[  448.468251] uio_ivshmem 0001:00:0c.0: enabling device (0000 -> 0002)
[  448.479735] uio_ivshmem 0001:00:0c.0: state_table at 0x0000000050400000, 
size 0x0000000000001000
[  448.487710] uio_ivshmem 0001:00:0c.0: rw_section at 0x0000000050401000, 
size 0x00000000000df000
[  448.504564] xilinx-dp-snd-card 
fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to init link 
xilinx-dp0: -517

root:~# ./virtio-ivshmem-block /dev/uio0 disk.img
./virtio-ivshmem-block: cannot open /sys/class/uio/uio0/maps/map2/size: No 
such file or directory
```
It's still not able to detect the required device.

Also,

```
root:~# lspci -k
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/391b2878-029d-4a31-b811-29d78749924an%40googlegroups.com.

------=_Part_14811_2112469219.1642585259857
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div>Hi,<div><br></div><div>I have tried to figure it and resolved the=
 "PCI devices not showing", and devices are showing now(`c` and `d`):<br></=
div><div><br></div><div>```</div><div>Activating hypervisor<br>[ &nbsp; 73.=
183592] pci-host-generic fc000000.pci: host bridge /pci@0 ranges:<br>[ &nbs=
p; 73.199132] pci-host-generic fc000000.pci: &nbsp; MEM 0xfc100000..0xfc103=
fff -&gt; 0xfc100000<br>[ &nbsp; 73.208489] pci-host-generic fc000000.pci: =
ECAM at [mem 0xfc000000-0xfc0fffff] for [bus 00]<br>[ &nbsp; 73.218012] pci=
-host-generic fc000000.pci: PCI host bridge to bus 0001:00<br>[ &nbsp; 73.2=
26675] pci_bus 0001:00: root bus resource [bus 00]<br>[ &nbsp; 73.233239] p=
ci_bus 0001:00: root bus resource [mem 0xfc100000-0xfc103fff]<br>[ &nbsp; 7=
3.245689] pci 0001:00:0c.0: [110a:4106] type 00 class 0xffc002<br>[ &nbsp; =
73.255187] pci 0001:00:0c.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ &nb=
sp; 73.268934] pci 0001:00:0d.0: [110a:4106] type 00 class 0xffc003<br>[ &n=
bsp; 73.275920] pci 0001:00:0d.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>=
[ &nbsp; 73.333292] pci 0001:00:0c.0: BAR 0: assigned [mem 0xfc100000-0xfc1=
00fff]<br>[ &nbsp; 73.350022] pci 0001:00:0d.0: BAR 0: assigned [mem 0xfc10=
1000-0xfc101fff]<br>[ &nbsp; 73.365843] The Jailhouse is opening.<br>[ &nbs=
p; 73.379727] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_card=
: ASoC: failed to init link xilinx-dp0: -517</div><div>```<br></div><div>bu=
t after doing this,</div><div><br></div><div>```</div><div>root:~# modprobe=
 uio_ivshmem<br><br></div><div>root:~# echo "110a 4106 110a 4106 ffc002 fff=
fff" &gt; /sys/bus/pci/drivers/uio_ivshmem/new_id<br>[ &nbsp;448.468251] ui=
o_ivshmem 0001:00:0c.0: enabling device (0000 -&gt; 0002)<br>[ &nbsp;448.47=
9735] uio_ivshmem 0001:00:0c.0: state_table at 0x0000000050400000, size 0x0=
000000000001000<br>[ &nbsp;448.487710] uio_ivshmem 0001:00:0c.0: rw_section=
 at 0x0000000050401000, size 0x00000000000df000<br>[ &nbsp;448.504564] xili=
nx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_card: ASoC: failed to =
init link xilinx-dp0: -517<br><br></div><div>root:~# ./virtio-ivshmem-block=
 /dev/uio0 disk.img<br>./virtio-ivshmem-block: cannot open /sys/class/uio/u=
io0/maps/map2/size: No such file or directory</div><div>```</div><div>It's =
still not able to detect the required device.</div><div><br></div><div>Also=
,</div><div><br></div><div>```</div><div>root:~# lspci -k<br>00:0d.0 Class =
ffc0: 110a:4106<br>00:0c.0 Class ffc0: 110a:4106 uio_ivshmem</div><div>```<=
/div><div><br></div><div>Please let me know what I am missing.</div><div><b=
r></div><div><br></div><div>Thanks and Regards,</div><div>Anmol</div></div>=
</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On =
Thursday, January 6, 2022 at 1:23:51 PM UTC+5:30 Jan Kiszka wrote:<br/></di=
v><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 05.01.22 22:22, An=
mol wrote:
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
om/d/msgid/jailhouse-dev/391b2878-029d-4a31-b811-29d78749924an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/391b2878-029d-4a31-b811-29d78749924an%40googlegroups.co=
m</a>.<br />

------=_Part_14811_2112469219.1642585259857--

------=_Part_14810_1284942261.1642585259857--
