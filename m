Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBINMQPUAKGQEP2WUIMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C478422A0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:38:26 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id v188sf2548746lfa.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 03:38:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560335906; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZrAaSmMwZScjN+qf/NroXyf+qYhK4FOfO61o6gE4T44OCghNJFm2TBEkaGweiLKm2z
         KOwVnGSWbicxpz/Dr+hsjhlSh6Lds2Rm4/m11Gab6LE1E0ew6adhiBT+YIQCGcKDYOnd
         yPLk9Kaj0+QZ1/Cv5RH8DzU1rdGCf6pyefXVyhFmDyuMqaVHBVj1Q7bTwwUUscEYc5bp
         7QHvqjtMxDe0h+QSh0Foidu0Q3H3MFF4KHODx+YDPtEF+gj5GctneO4zJCShUi4QN/Fh
         3dyfZJqZybBzFPqgYCZO/kOxbEr4C+zcnN48+IJSmFCyxID40x1OHpDWl0clGonyNeZ0
         U13A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=NHpKBAjlTrDLt/KGnxKstlVZDZ1ncjF5x03eK6SDSIQ=;
        b=y5x3uB5uaoF8z7/rUMtMsXBS65CfXbKM+XjFBoQT0N92yaOVqbuYNW8Q9kGORnUlF9
         9PUhhxUoZnC+1Q7WW/ZKYHbz3VXeRgTG1QME8jYNHGQ57bwDltOmcJHRysTKIzDbIZF8
         RPfhNtcpHdFWBQOekPpSVM6Kx8vuTbE7FloyUPnFczwt349Fc1XXHD7HceH4EYofaBRj
         YB/bO3z3rwgjYguNQ492EDD80ok9yg8ASg0P5bm3msHE4p1+7Sg/kj+KpjLdMVNsSuFT
         qzVXXTuAY8a3fVR4WXu17OjjKrO9bidO7+ZCGFxB7TSEszYLs/krZ/fJQwLQIsyl1bEQ
         kzIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NHpKBAjlTrDLt/KGnxKstlVZDZ1ncjF5x03eK6SDSIQ=;
        b=ItVIJpmGBydtE3PQR+QDapMZvqdNkFlqB3tw35yi11v5SgaUJyU/9JXwvurZ3CYTzx
         iUdQouHn71tVy5E5mnSNAB8PFUryDB2CUouduyEcZ9R3tN34Y2n1VGUNi9pbVKGoxxnx
         Bea3aLKgkSDz7BGL33ZpJToGIXj9VTu5Z8sWgiE8zltFkF4y3aERMuw+msv4bu69oLuu
         +7mJgmj3njwqFE+8PhIjbNdmgzuXdg9y8cfAst6Hqxeayri0C4geGkJuRZ6lCQz0gxLl
         y22kTc5y6EHiJaylVKAc4h6yA4PQHxY9SZqkrjmVork0CK5g6WqSGee0aSnNm4KDmtZO
         XT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NHpKBAjlTrDLt/KGnxKstlVZDZ1ncjF5x03eK6SDSIQ=;
        b=U9i6jEDC4Kt0bZMWKI4FpbRYisWGz67iBMAIvsTaNyF11ErBd4cMoMERN5BrP1Cjoo
         +e3js67Jf+LFXrZBE8ZwGb0surIA4o+FvLe04Q1QMUBy4Bar0iukJaURylM4sL/CaJ1c
         MCYVO5BOAQyqGsOjvSTJK2ZtvZsO059ggQYxe44UfuEzowSAjeI34Et9XK3GSgkgE1Vh
         ticAKw/+LSL9hPqMDMpEdK/RN065nNGtWDMRCFSvjqI21ots1LGWcROAN1YHuaa0OniE
         Tg7DeMTabSwFtB9teFdrlzkcINwZx5whiDoZChT4zmxUzsooLK5ZKNBWISmD/KrrzAau
         vRGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWcpUuExIlAIhD84mitaVegg7zjHKodWPducRc/H0ixuEZ0nW4F
	02a3P+6RRpDzPOCW7xTHC1E=
X-Google-Smtp-Source: APXvYqyCBCjEzJANz6bD8EYUwNGO68hjZwZA8z/Y4KgtKYzrxOO7W23orXjxIv5oU5cl43Bd9J9IsA==
X-Received: by 2002:a2e:131a:: with SMTP id 26mr20199984ljt.24.1560335906091;
        Wed, 12 Jun 2019 03:38:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e96:: with SMTP id f22ls190170ljk.12.gmail; Wed, 12 Jun
 2019 03:38:25 -0700 (PDT)
X-Received: by 2002:a2e:9284:: with SMTP id d4mr43948241ljh.26.1560335905434;
        Wed, 12 Jun 2019 03:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560335905; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3yqibcE82LvijpG+cyK6HFFP/7sfHmaKaoVuwKc38EM79Bs/BmEz9HxWZJjn+xC2O
         TM4K+a5c+nlG9g1FZQ3o83MZizMrAc0bvHxVHzh3vxOmxQR3cr2VKoJMAe3Tmsw0Ps02
         1Y+iEnZ12OR7sUCgtW0PznvyVUwkOxNGQoghCDQ/oIJmYVGRZ1CP0F6yJqN16Vayz3cO
         ysXRHWUDJscLrS7hcViRfTRrQxxaaMYr7wyJLQxDdUrq7aDRMTmz6VtWgnwW/qQBcy4p
         K++FcLU7H3Wso4MRi5sSueHTHHBdAbC97J6i4EKAuHo9CGN8mzHF0R5RJThrG+MPdibK
         dOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iANe3mwGKrpbBkp5zqjsGRelWspEntlyUNGd9BUzvWU=;
        b=N078dxHtuWRvt1JX9JIlKrkfOSM8Gr2N02v6GDstXY35EJ9RDqbxuDeT51Iel9yVQ3
         996iJN5cnpiT0/jJ0u7M5NRKlPYCKWdGrEe2kEIsxoLbJaxcw01CcSFqCElLBvxO/Ztm
         TXt+ZG7WzhyCArmCdlyitTMMW41w5uxTA4r4I2JTjoBaLcFv6VB2ifEoCGAmXVtl5Jyo
         LoPHbbc542x0ItL6PgH+SNh17LBBCaV2NwIkXu5H7hwKbxwEojPJ1GcjjsvJK8eEGOA/
         JI0+RaalLc2UvkoiUIyT3FMu+8kpi7uKTlwbmdyNRIReJ5EcYQDbJr8YBJgL6XcorpJI
         ex9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f24si868992ljk.4.2019.06.12.03.38.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 03:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5CAcOJZ005591
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2019 12:38:24 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5CAcNMU003309;
	Wed, 12 Jun 2019 12:38:24 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de>
 <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fb217470-3561-5891-3214-d3dcd1b7912d@siemens.com>
Date: Wed, 12 Jun 2019 12:38:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 11.06.19 23:05, Wayne wrote:
> Jan/Ralf,
>=20
> I was able to get past issues 1 and 3 above by using Jan's kernel config =
from=20
> this thread:
>=20
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ".=20
>=20

You also find a compatible config in=20
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linu=
x/files/amd64_defconfig_4.19

>=20
> The DMA issue was resolved by disabling kernel option=C2=A0CONFIG_ISA_DMA=
_API as=20
> stated in another thread, and reflected in the config file above.
>=20
> So now I think i've almost got the non-root linux booting.=C2=A0 I'm stuc=
k at the=20
> point where its trying to mount a filesystem and since i'm not providing =
an=20
> initramfs it panics.
>=20
> Similar to the output below:
>=20
> [ 1.080178] VFS: Cannot open root device "(null)" or unknown-block(0,0): =
error -6
> [ 1.087662] Please append a correct "root=3D" boot option; here are the a=
vailable=20
> partitions:
> [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root fs on=
=20
> unknown-block(0,0)
>=20

Did you provide an initrd to that Linux? If yes, you may run into issues wi=
th=20
the kernel overwriting parts of it while unpacking. Play with a larger=20
--kernel-decomp-factor in that case, 8 or higher - though there are also li=
mits=20
in this regard, and those are defined by the non-root cell RAM size.

> I have just a couple more questions:
> 1. In general, is it true that an inmate will takeover control from the r=
oot of=20
> any resource in the following arrays, or are there some cases where they =
get=20
> "shared" between the root and inmate?
>  =C2=A0 =C2=A0 =C2=A0A. ".mem_regions" -> Shared?

You can share memory regions via JAILHOUSE_MEM_ROOTSHARED. The typical exam=
ple=20
are shared memory devices that use regions with that flag set.

>  =C2=A0 =C2=A0 =C2=A0B. ".irqchips" -> Shared?

Chips can be shared, but individual IRQ lines cannot. So, if you assign a l=
ine=20
to non-root cell, the root cell will lose access.

>  =C2=A0 =C2=A0 =C2=A0C. ".pio_bitmap" -> Inmate takes control of these if=
 matching between=20
> inmate and root

No sharing implemented for that.

>  =C2=A0 =C2=A0 =C2=A0D. ".pci_devices" -> Inmate takes control?
>  =C2=A0 =C2=A0 =C2=A0E. ".pci_caps" -> Inmate takes control?

PCI devices cannot be shared either. One cell need to take ownership and pr=
ovide=20
services to another cell via different means (e.g. ivshmem).

>=20
> 2. Along the same lines, going back to my ttyS0 issue mentioned above whi=
le=20
> trying to share it:
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0If I allocate the following to the linux non =
root cell (and set to -1 in=20
> the root)
>  =C2=A0 =C2=A0 =C2=A0.pio_bitmap =3D {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0x3f8/8 ... 0x3ff/8] =3D 0x00=C2=A0 =
=C2=A0/* serial 2*/
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0Then on the root cell I randomly get a PIO re=
ad fault on "0x3FE" when=20
> the non-root is booting, i'm not sure what process is causing this.

Do you mean access violations reported by Jailhouse?

>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the non-roo=
t linux, and alolothat=20
> block in the root cell instead then the non-root linux gets a PIO read fa=
ult on=20
> "0x3F9" while booting.
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try enume=
rate the device if its set=20
> to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the non-root seems=
 to attempt to do=20
> something with it anyway:
>=20
> "[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing =
enabled"
> "FATAL: Invalid PIO read, port: 3f9: size 1"
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0Is it possible to map the same pio block in b=
oth the root and non-root=20
> with a different mask?=C2=A0 Or does the non-root just override it?=C2=A0=
 It seems like=20
> the latter is true.

Nope, see above. If you want to avoid probing, limit the number of UARTs in=
 the=20
kernel config or command line. The latter is done here:

https://github.com/siemens/jailhouse-images/blob/master/recipes-core/custom=
izations/files/.bash_history-qemu-amd64

BTW, that demo is also configured in a way that the root cell stays away fr=
om ttyS0.

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
jailhouse-dev/fb217470-3561-5891-3214-d3dcd1b7912d%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
