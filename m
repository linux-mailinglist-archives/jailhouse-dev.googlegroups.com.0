Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT4UT7VQKGQEYOYDYBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 73465A1A74
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 14:51:28 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id x12sf2063767wrw.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 05:51:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567083088; cv=pass;
        d=google.com; s=arc-20160816;
        b=eCOWv0u2zFq7GqKwWu7/FcklM87LK5oUUL2mGL/tyrGR8+Fao32pCmGgWttMzT0PUL
         xN2VHnOza6+kHoLxcIu6AutlVMaW6xkm9tbTupps3d6UIxM6C5IfYShfscM0AP65bWjX
         jqDGtx/w+Jnt6BB9rNfm7gm/UAhXsIm3uePxVP1HZQs3lq9hcIOIVd6egbo0amv3U2Ig
         WaZpQJZMqZvN/qG609gMXFITw2S6oKRAaSfbSQc1vL1QYuCdkfWBDx3PXL+3r86POehb
         DRx0A1Wau3uYfh5yuRUJQQIGISmOeYOVtP83AjTxO2GiL6t6kNIFqXTG8ubx6337sD+r
         2qxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=PbjONBYeqNBb9hrw5bP2svnhhfIXPUFD5HUM6kZYBU0=;
        b=zdHsjjDzmdBA0hTQMe4aFBxW7eK9oxvmBziyHgO9bXTNHKaOoBw9LAz5DyxPCwo4u0
         8WGHAUDRng7+Vrk+zd749Q9oVJ3LjZvCxZEOheRhJKO8IzwSNpwInOux4yhWCDtYRXrn
         uwhAXCwLHAoq8kzb2ELdLsDcAMuSQEaRTZQX4PnYzh2qSSUXU+tXGHyG4aKGK9HUvpLp
         U5wresVWnV8yOzL6jbdufPHYknmIUQKXznAaZjqisFv3sjxtqwWaKIIXEmJ8Mai+4zt2
         pe2xHmPn41gfnXjbbKNvAVZL4GQRXxrelZ4qx475mM607VYuBHaJzYCZ+Yz7op4IEp83
         PEqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbjONBYeqNBb9hrw5bP2svnhhfIXPUFD5HUM6kZYBU0=;
        b=S/uxtMxbkCYNpmEvoUTYPzoSNvlXKUzRx3h6Mwz7Dxux/5e9kfVL4sk8PRZWyXpt9o
         2/2Oc4u09T4pB76NZhomL94umWhQ0zDNQ17RTD2IrFYkhty7O4fX7MWFJyu8nZSvRNLl
         An0BUp8YuFaNxpjMjvGZFjonfH8YR08dLUlXtdTcO4bH1vhWCmLAUYIPzSc5VpzoEf3m
         mlAHgToGNKb761CE3bNaSZKCJDo6w7cW2GXOMIhVm0ljsl04S4+7TLPOz0g4uNuOEyk+
         W8Hvp21do6gfQ+qeRLyeQjhkEYiduYqtix3YP0eiNZGW/6GC2THET8QaSLV4J7/u8Jn3
         sT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbjONBYeqNBb9hrw5bP2svnhhfIXPUFD5HUM6kZYBU0=;
        b=eDC0lzAsr6UYhBCFttWZrjs8q1Fa+JD5Yg+/8l+DRu2dNI5l75xDgIjdzOMEkGlFAB
         UyEreZSfMZGVHRPQbIjoaxzNxjx8TsowFS8Zg/LHiE6tuoSZOrF4p+NorGDZFJr2sFbY
         QLXwTCEUqzWYqJ6c0IKUAbzO9xpbtHSelv6Vrdb7XLSY54vqLaLo0bAMp2r4H4XoP1MM
         I8oGCYoSCB+DLvMAfvUpPvtHBt3ikte24LIE/h04oPZ3q8bfPAals8kp2zAP8mUOt3mL
         rDFY31KNkUEBFUjm1i+qYSThbqFANew7cHBBFRs3Zjqzphq8JnFRKYWdcOXcaJUV+TGk
         OqOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVXxTGIMCvyFzect7XO0BUapoYInNLHPjpfd2oSP5CNX9NKhtJg
	n3EEsaVg7xBVsUPqg2DEwhs=
X-Google-Smtp-Source: APXvYqw0PHYZbuAnXsGt/WUbtuDQsAzkUl1Dft+yfbT+VIw/EnbXSTtBgKJQSH/haM/sdbq+3TbaCg==
X-Received: by 2002:adf:a348:: with SMTP id d8mr11698629wrb.235.1567083088109;
        Thu, 29 Aug 2019 05:51:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6942:: with SMTP id r2ls777734wrw.3.gmail; Thu, 29 Aug
 2019 05:51:27 -0700 (PDT)
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr12015765wrt.26.1567083087200;
        Thu, 29 Aug 2019 05:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567083087; cv=none;
        d=google.com; s=arc-20160816;
        b=AmjCbbma3VpC1ZeRplI1Zsp/ppb2qGZ7J2MJK/B+Q9at/sXmJgBqN/f0+Sw3DbiQtD
         C0JLw8SQ+QefzKB9+ZRDpTNY2ob/+hXRlQLC1cO8/C4FmZavBZMi6OhPBTWpW/ep564t
         nSLFGt0IrgJaAWaYHd0nd09c8UVaxYo58LhKmGTQ+hBMvaQ1YUmxVbw3pFNULx3pibAR
         LF7XiphbGDp3tDPqHHdfHnjUvJLmZJ6P6bUAoZGuLuvIBylLGGgbzNKQUP9rKo5EBcbP
         jZpvTSwezBR2Tj+kkum+/ndD92eDqA3nkIfrIZiT6mwgkATu4vjJ1AmBWXCIJPhqWy7v
         PIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ostd63D/pHq1wEszrvnCWLljd4cbA1uBfg2xxYmiHik=;
        b=mnoT1+k8lrh2zk23ezz366Gba40ackl7w2V8K8A3ColZCm/cr/WAVZcNNG5EmmP+cT
         GhTo0591NBF2JIlrVcKCqO9cmu6/0+IRyCyLzLL3dCAmzzyrrqETh2dn6RBzjj/F4PkF
         r6MoDqARwi+FPPibDX2A5so6iqfq457NfV6z61UxgBfbWoUUevEEv3zD0xyIK59b9QIg
         rbLetq9yNA4Qa0QEIg9VsYHj1uImQtoVk/orxY4brq1ejgFrvD+e1tq0vrZG3uoY9R2P
         lD9tP3h8G0h0J1ruyMP8/+UgSkpdq9D2IdFe858e//4CHdNZ5Q1EYAOlxwPaBXYmQoIQ
         RDPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id l9si140354wmc.0.2019.08.29.05.51.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 05:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7TCpQDk031221
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 14:51:26 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7TCpPr7021414;
	Thu, 29 Aug 2019 14:51:26 +0200
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
To: Jan Lipponen <jan.lipponen@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
 <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
Date: Thu, 29 Aug 2019 14:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 29.08.19 12:44, Jan Lipponen wrote:
> Hi Jan,
>=20
> thanks for your quick answer! Please find the kernel log attached.

There is no report of the host controller being detected. You should=20
find it at least in the device tree under /sys/firmware/devicetree/base/pci=
@0.
The kernel log should look like this:

[   30.213785] pci-host-generic fc000000.pci: host bridge /pci@0 ranges:
[   30.220268] pci-host-generic fc000000.pci:   MEM 0xfc100000..0xfc103fff =
-> 0xfc100000
[   30.228537] pci-host-generic fc000000.pci: ECAM at [mem 0xfc000000-0xfc0=
fffff] for [bus 00]
[   30.237019] pci-host-generic fc000000.pci: PCI host bridge to bus 0001:0=
0
[   30.243837] pci_bus 0001:00: root bus resource [bus 00]
[   30.249078] pci_bus 0001:00: root bus resource [mem 0xfc100000-0xfc103ff=
f]
[   30.255989] pci 0001:00:00.0: [1af4:1110] type 00 class 0xff0100
[   30.256015] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit=
]
[   30.256577] pci 0001:00:01.0: [1af4:1110] type 00 class 0xff0100
[   30.256597] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit=
]
[   30.257891] pci 0001:00:00.0: BAR 0: assigned [mem 0xfc100000-0xfc1000ff=
 64bit]
[   30.265272] pci 0001:00:01.0: BAR 0: assigned [mem 0xfc100100-0xfc1001ff=
 64bit]
[   30.272804] The Jailhouse is opening.
[   30.299771] ivshmem-net 0001:00:00.0: enabling device (0000 -> 0002)
[   30.307270] ivshmem-net 0001:00:01.0: enabling device (0000 -> 0002)

Check if your root cell kernel is the required driver support built in.
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linu=
x/files/arm64_defconfig_4.19
can be a reference.

Jan

>=20
> -Jan
>=20
> On Thursday, 29 August 2019 13:17:49 UTC+3, Jan Kiszka wrote:
>=20
>     On 29.08.19 10:36, Jan Lipponen wrote:
>      > Hi!
>      >
>      > I have ran in a similar situation as Sebastian in a post from yest=
erday
>      > <https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk
>     <https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk>>=
=C2=A0but with a
>      > ARM64 device (ZCU104 board). The problem seems to be that Linux is=
 unable to
>      > detect the virtual IVSHMEM PCI device. The Jailhouse enables fine =
with
>     following
>      > logs:
>      >
>      >
>      > |
>      > Initializing Jailhouse hypervisor=C2=A0 on CPU 0
>      > Code location: 0x0000ffffc0200800
>      > Page pool usage after early setup: mem 39/996, remap 0/131072
>      > Initializing processors:
>      > =C2=A0=C2=A0CPU 0... OK
>      > =C2=A0=C2=A0CPU 1... OK
>      > =C2=A0=C2=A0CPU 3... OK
>      > =C2=A0=C2=A0CPU 2... OK
>      > Initializing unit: irqchip
>      > Initializing unit: PCI
>      > Adding virtual PCI device 00:00.0 to cell "ZCU104-root"
>      > DEBUG pci.c: pci_cell_init returned 0
>      > Page pool usage after late setup: mem 59/996, remap 5/131072
>      > Activating hypervisor
>      > [=C2=A0 627.901240] The Jailhouse is opening.
>      > |
>      >
>      >
>      > I've just added the DEBUG print there.
>      >
>      > I do not have the /lspci/=C2=A0tool installed on the target, but I=
 can see
>     that no
>      > PCI devices are created under //sys/bus/pci/devices/=C2=A0and the =
probe
>     function of
>      > the /uio_ivshmem/ driver never gets called. Re-scanning the PCI bu=
s doesn't
>      > help. After enabling a guest cell I can see that Jailhouse is able=
 to
>     create a
>      > shared memory connection between the guest and root cell via the I=
VSHMEM
>     device:
>      >
>      > |
>      > [ 1493.087945] CPU3: shutdown
>      > [ 1493.090656] psci: CPU3 killed.
>      > Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU104-bmetal"
>      > Shared memory connection established: "ZynqMP-ZCU104-bmetal" <-->
>     "ZCU104-root"
>      > Created cell "ZynqMP-ZCU104-bmetal"
>      > |
>      >
>      > This makes me think that from the Jailhouse's point of view everyt=
hing is
>     going
>      > great and the only problem is that Linux's PCI subsystem is just u=
nable to
>      > discover the device. I initially thought it is a device tree issue=
 so I went
>      > ahead and added a PCI node to the device tree, following the examp=
le in
>      > jailhouse/configs/arm64/dts/inmate-zynqmp.dts
>      >
>     <https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e=
4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91
>     <https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e=
4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91>>.
>=20
>      > It seems that the base address of this generic PCI host controller=
 needs to
>      > match the /.pci_mmconfig_base /property in the root cell config. T=
his,
>     however,
>      > resulted in a kernel warning:
>      >
>      > |
>      > Activating hypervisor
>      > [=C2=A0 171.863249] sysfs: cannot create duplicate filename
>      > '/bus/platform/devices/fc000000.pci'
>      > [=C2=A0 171.871362] ------------[ cut here ]------------
>      > [=C2=A0 171.875977] WARNING: CPU: 1 PID: 1932 at fs/sysfs/dir.c:31
>      > sysfs_warn_dup+0x5c/0x78
>      > |
>      >
>      > So, the=C2=A0fc000000.pci device is already registered without my =
additional
>     device
>      > tree node, but the /uio_ivshmem/=C2=A0does not get probed because =
it's
>     registered as
>      > a PCI driver.
>      >
>      > Additioanlly, I've tried adding=C2=A0CONFIG_KALLSYMS_ALL and=C2=A0=
CONFIG_PCI_DEBUG in
>      > kernel config, but nothing changed.
>      >
>      >
>      > To get me forward, I would have couple of questions.
>      >
>      > =C2=A0 * Should a device indeed be created under=C2=A0/sys/bus/pci=
/devices when
>     Jailhouse
>      > =C2=A0 =C2=A0 is enabled, regardless if /uio_ivshmem /driver is in=
serted into
>     kernel or not?
>=20
>     Yes. The device comes first (namely the virtual PCI host controller a=
nd then,
>     via scanning it, the virtual device(s)), and then the drivers bind to=
 it (for
>     pci-generic host controller and ivshmem devices).
>=20
>      >
>      > =C2=A0 * Is the /uio_ivshmem /driver's probe called after Linux's =
PCI subsystem
>      > =C2=A0 =C2=A0 successfully registers the IVSHMEM device?
>=20
>     See above: The generic host controller should be detected first. It's=
 added via
>     a dt overlay by the jailhouse driver to the root cell. Could you shar=
e the
>     complete kernel log of the root cell?
>=20
>      >
>      > =C2=A0 * Should I add a device tree node for a /pci-host-generic /=
driver
>     (/compatible
>      > =C2=A0 =C2=A0 =3D "pci-host-ecam-generic"/) or not? Initially, I o=
nly have an entry
>     for the
>      > =C2=A0 =C2=A0 ZynqMP PCIe core (/compatible =3D "xlnx,nwl-pcie-2.1=
1"/).
>      >
>=20
>     Nope, not needed, done automatically.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google Groups=
=20
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email=20
> to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-5=
2beb009b025%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-=
52beb009b025%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1dc9ffa7-64a6-6578-cb29-2573f680b6b3%40siemens.com.
