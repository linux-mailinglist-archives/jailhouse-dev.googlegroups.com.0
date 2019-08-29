Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTOMT3VQKGQENIE2WFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26EA15A6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 12:17:50 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id i4sf1866839wri.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 03:17:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567073870; cv=pass;
        d=google.com; s=arc-20160816;
        b=wsXb0WftxNJgc8EgULaX/b3jF6cvyHnPrcIYo0Cr7mbFT88otLlZorM6UMoRua0+4x
         GT5Tvz8o7bcTA61DxrJ2FUsRL78fM63WSCb/K2gvPy/aRRdybvHxekMTEV54HSEEEK8x
         xBoCItAKSZxWpAbshhTJiqJQZEz9UVIjOsEDKtVWVEiun2jYnvlB130VC/t1e9CSk03p
         3dJK9pVCT7k7nnk/TdS08QF21oV7MY+fT1RGHMkAOnd96+E9d9q7cMboTLIL2r437cRv
         0e93QVPzu6/elRfbfqaZJPyvk/exQ1uikP5bBcat6gZLnau7emi8CsrGUqIwsP8vhlz0
         ItkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+nYD536NfNUmpksuCezOCq9pFhlNPsl+cbc3aSjT0Bg=;
        b=yBz0vSjfgQHZLxHOoYtuXDkTdGDZJNYCQWDyHcOMwdpnxsyt5HkN0CYPQ8owWb1IDv
         suhBh8uQEO3WRsvSrIXwDgP3rsS6CiPfLPydKb0UJ/ZCj8WlnePQBZ29TXXRMQU70CI9
         IdowYWoro2rVTnZEf3TltWFlu2WgBJcpm1u60oJj9qRm0HlJNxho3zhvs7GKj5N13ejA
         MLqnSgePk4pBQQ19Gen+e8dNzrPyuIOQuL6L73iuIX4gV3N3NUgr9Ub2ltFAEe0sGsx5
         FN4R4I7ofsOSaAHnJ+LepjH6L0yZIF66PsbklYeJdtaBlTdA/Dd/cPGrAtt5TlKGxaZT
         g3yw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+nYD536NfNUmpksuCezOCq9pFhlNPsl+cbc3aSjT0Bg=;
        b=KvKxDZnqvoKK+muTGWxS6sbagC3lhDmqszwivf82YNp8+S5ZvCOHD2dFekQKPXkyhq
         7MpjREdUi1KDPC6v1VI2n4UNJTe8R2FI+IiZzmdBzkfia98+/Bm3YSLaHfjRATa0bz9c
         xTiE4f7V0XchaYwl8mQirnx0xy1fxT4a+76N9FuLTkUGjP/tX8z/HirFMl4PVYRHwePo
         XJZixetN37s4ZLH+t0g4VbARnpCQqjPTgy6FK8gZZ8iYoIPwyD5apNpcZBoW2woa+nrS
         L0PneaEulMwWqdlhf/aZ/NIxr7pIUF6Y/Y3vtsgzMfmMudteCt0LWHmWFkeOy6N8R7v2
         f15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+nYD536NfNUmpksuCezOCq9pFhlNPsl+cbc3aSjT0Bg=;
        b=G08LZIxQ8RUwfvdVOdAjyWzTHR11ifalUbBo1qWIIBl88E7DfWyhQqt55r6Q1D7fMn
         4hUO8ax4UHtQe733JoaMGP5pDnkLWdsc/Mqe8mgU6U1v/9S4CPnA+xwkYz8tV0n51I0s
         d4TkASX6TlQfuV5tnT0PUWL9mBX8LqvVqhLVPNnTnX5S3T2UuCHrvvNh+VAaKMYZIiGv
         y39oEMZJsTVl/tfpVDPRmR4PsOyjJPuEKc8tVBEifsP1P2Pheh3MW6199YdGuPjQjKu+
         pVi9rQN4sRhJMQ0Yatkw49RX5XI6KDjSQZ7RiMqATLrNP7QNPwkxuvOgA3ioa4TR+DdA
         r87A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLo6oFp1lA1DXsEJZyp1Pj9Dtp4jQqWgjbT21z0Rwxs1fvWXhy
	blwSpIY59zc2A96tSrjZMiY=
X-Google-Smtp-Source: APXvYqy2N5U7ogFt+y1WQ//GakdJkcwTEEIOYUs+74dfoRoEi/hqDQ4oyKGUEdFrxpkWAQdLYr7I0Q==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr9752688wrc.85.1567073869421;
        Thu, 29 Aug 2019 03:17:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:514b:: with SMTP id u11ls653272wrt.8.gmail; Thu, 29 Aug
 2019 03:17:48 -0700 (PDT)
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr10671814wrv.206.1567073868565;
        Thu, 29 Aug 2019 03:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567073868; cv=none;
        d=google.com; s=arc-20160816;
        b=SovNAlnjfkBOUKgkyl3sWl8xZ+iWw36Wo/GqxglAh4UoHlS2kEOC7B1HkNHISdlC4N
         CO9AkGwuTtBy2F7qQJL4t9JNC8XHaXxPK5/y9o8XYzaCZ4dn/cpd5wPXmvc0zC8cOGGy
         BQBda0drQo+mw5zSkgQKOKUkL/2kJFRtNpjrn8gpNSqJ/Pctcv83qg/KQSssCXNtYeCM
         1olauBQHnXqk/TRvl+pUFxagmtWCnXG0wlVBSHLVJr4KWbjcDPgegKZg/I9MWKbVIhzZ
         G/qv5sbJs1J8U68qMXmlZz9DiaRgGf2gfpoRkdaU4of9OShbyI1e7jB7vWwKZSAwKdBf
         NIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=p+tKWC60oFwBzJ4Awq1PfU5owEuWa/Iuu+DLec/oyDw=;
        b=0WOJYj2uJdS/0A0uGFYn6OhkorgbGPkNX75MfnOTpXDlNUH2hzgleDSV/R9VKvDVS3
         cTOJeX1i7LuaOyG+CrEijmMh8v0WNKsJ3mp+P6TWp8/xn8vqp2hViuHsG0Yop3Cks44I
         oBwI2/pFnJ2CIK8/vIhWHwUVGfv0G7aZzTtrcQhLxFWtDoVm6nMcaZ18eyhoBNF4Pdsv
         zYkEYfsti7AcDLrf7KSNwxan8mgHaantMUvS4Bjn96c7foZnZCh+cFYiKtpJFfnWtV32
         KTSiyq8BU1hlCEQR3803u26FWnwEkLERdO3dZXU0Bisb1E+fVgF0ra627lKr6pvyHngE
         fOtw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s78si109145wme.2.2019.08.29.03.17.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 03:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x7TAHlf5002283
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 12:17:47 +0200
Received: from [139.23.113.48] ([139.23.113.48])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7TAHlA6025777;
	Thu, 29 Aug 2019 12:17:47 +0200
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
To: Jan Lipponen <jan.lipponen@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
Date: Thu, 29 Aug 2019 12:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 29.08.19 10:36, Jan Lipponen wrote:
> Hi!
>=20
> I have ran in a similar situation as Sebastian in a post from yesterday=
=20
> <https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk>=C2=A0=
but with a=20
> ARM64 device (ZCU104 board). The problem seems to be that Linux is unable=
 to=20
> detect the virtual IVSHMEM PCI device. The Jailhouse enables fine with fo=
llowing=20
> logs:
>=20
>=20
> |
> Initializing Jailhouse hypervisor=C2=A0 on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/996, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 1... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "ZCU104-root"
> DEBUG pci.c: pci_cell_init returned 0
> Page pool usage after late setup: mem 59/996, remap 5/131072
> Activating hypervisor
> [=C2=A0 627.901240] The Jailhouse is opening.
> |
>=20
>=20
> I've just added the DEBUG print there.
>=20
> I do not have the /lspci/=C2=A0tool installed on the target, but I can se=
e that no=20
> PCI devices are created under //sys/bus/pci/devices/=C2=A0and the probe f=
unction of=20
> the /uio_ivshmem/ driver never gets called. Re-scanning the PCI bus doesn=
't=20
> help. After enabling a guest cell I can see that Jailhouse is able to cre=
ate a=20
> shared memory connection between the guest and root cell via the IVSHMEM =
device:
>=20
> |
> [ 1493.087945] CPU3: shutdown
> [ 1493.090656] psci: CPU3 killed.
> Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU104-bmetal"
> Shared memory connection established: "ZynqMP-ZCU104-bmetal" <--> "ZCU104=
-root"
> Created cell "ZynqMP-ZCU104-bmetal"
> |
>=20
> This makes me think that from the Jailhouse's point of view everything is=
 going=20
> great and the only problem is that Linux's PCI subsystem is just unable t=
o=20
> discover the device. I initially thought it is a device tree issue so I w=
ent=20
> ahead and added a PCI node to the device tree, following the example in=
=20
> jailhouse/configs/arm64/dts/inmate-zynqmp.dts=20
> <https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e4314=
c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91>.=20
> It seems that the base address of this generic PCI host controller needs =
to=20
> match the /.pci_mmconfig_base /property in the root cell config. This, ho=
wever,=20
> resulted in a kernel warning:
>=20
> |
> Activating hypervisor
> [=C2=A0 171.863249] sysfs: cannot create duplicate filename=20
> '/bus/platform/devices/fc000000.pci'
> [=C2=A0 171.871362] ------------[ cut here ]------------
> [=C2=A0 171.875977] WARNING: CPU: 1 PID: 1932 at fs/sysfs/dir.c:31=20
> sysfs_warn_dup+0x5c/0x78
> |
>=20
> So, the=C2=A0fc000000.pci device is already registered without my additio=
nal device=20
> tree node, but the /uio_ivshmem/=C2=A0does not get probed because it's re=
gistered as=20
> a PCI driver.
>=20
> Additioanlly, I've tried adding=C2=A0CONFIG_KALLSYMS_ALL and=C2=A0CONFIG_=
PCI_DEBUG in=20
> kernel config, but nothing changed.
>=20
>=20
> To get me forward, I would have couple of questions.
>=20
>   * Should a device indeed be created under=C2=A0/sys/bus/pci/devices whe=
n Jailhouse
>     is enabled, regardless if /uio_ivshmem /driver is inserted into kerne=
l or not?

Yes. The device comes first (namely the virtual PCI host controller and the=
n,=20
via scanning it, the virtual device(s)), and then the drivers bind to it (f=
or=20
pci-generic host controller and ivshmem devices).

>=20
>   * Is the /uio_ivshmem /driver's probe called after Linux's PCI subsyste=
m
>     successfully registers the IVSHMEM device?

See above: The generic host controller should be detected first. It's added=
 via=20
a dt overlay by the jailhouse driver to the root cell. Could you share the=
=20
complete kernel log of the root cell?

>=20
>   * Should I add a device tree node for a /pci-host-generic /driver (/com=
patible
>     =3D "pci-host-ecam-generic"/) or not? Initially, I only have an entry=
 for the
>     ZynqMP PCIe core (/compatible =3D "xlnx,nwl-pcie-2.11"/).
>=20

Nope, not needed, done automatically.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4%40siemens.com.
