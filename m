Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHY6P4QKGQEA6KMUQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id AB306249A15
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 12:18:09 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id z9sf3795027ljj.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 03:18:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597832289; cv=pass;
        d=google.com; s=arc-20160816;
        b=OckttLGK6EsvbFquk3mwiay54X5+MZtxAUyrW0oZcyyZw38CQ7wohmnoeINxHiPDX7
         /t3EuajTajlWUy0npVfHpb6dgAfRRQrCk+nfSw+UBQ+9yX6SREM+e9IZ9w77M1Gn9Ab2
         DiQhrMtF4TgE2vIcNdqzWiZZQAmWZA1ZEoVhIkqnn6TcT5B0wPT98Ek4X+T598na+Wiv
         1DMwtJ05kHJGkxTTNQRGdX4ywgHnfdJOABYYvosUbqz+E77xzxwHtgDOHLZeg1nPbP3n
         kYestYNZeg9ciAgr2HEbn1/zKmfBbAXwcXAwovWuU6CoQ8yx9usmBadx2bF/QTHaMIFI
         pJoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=gfHWuSHHFHx+D/XTIQ+9jbHtHLOWvggqTR4xkp/UPGc=;
        b=r47A5b8FgYs8bNVizSF7h6sLmUPo2BfoH3UfHpPmvyMbRV2fRkegA0/wrT3/0B50qF
         vTMlq1km+sTfyQuudqBjkOFWMILqYeOyrSRH3gGnVM/r8HIGkbIKa6zhomehkgRlpdzX
         U+esvvtEk6G6OY2NB/Bs5xWGir2V9jO2I7xTmmxYxVcjIbHAGQWcSctuhjYUDyEMXyEV
         FLaOe/ll+vnkm1T5+LcP9C+F8wKo9rijLnT90FC5Je44GeAkDdzIeO4SA3g0yp1ZrKDW
         9r5vuFWTVg1SXN2kRZLoHzCIZ4/S0hPIPfD/EZALvR4D5Zbzw9DzvIdqCqqBv1HCRmhA
         VuBw==
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
        bh=gfHWuSHHFHx+D/XTIQ+9jbHtHLOWvggqTR4xkp/UPGc=;
        b=EMvcAx9iLhgdbOKov2PQ256jB/c622nR3/vnpkDpiICzoieTw5IyhaCsI4o5+1oYlQ
         4Nnp+HM/jlqhibI8YpnHqIbYH4Fn7pg1Hfy05GYa0N8bEFvqSSriEKdBuzF1rKLW9nBu
         sGyDkmnjuUTCMEtApVX6fS8OSYxqm9VOCQPub8TeCyTqiJdgw5kfQOoJfpQmQSgqGOtq
         nPWzhg6usSkDNLiSP7/yuLrGVOEiwwoS4hfILJRoGHBi8oai0Lw2HVaR/3B/YQ9tqmA0
         MKw3leNfWEszAbVNqiUgMPmEtuEjZ2hHp/NxkRfOcqmOTwR8jG59PXXhEwOMgmByp27y
         CCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gfHWuSHHFHx+D/XTIQ+9jbHtHLOWvggqTR4xkp/UPGc=;
        b=Y1dK4UJNixLMaGCx4gtC6jaz14ayFH7VhGqV5xAJWdRDI/0tdVCtFX5xLPgbud10l4
         d2fXewpQomI1g5tHN1KbSB/HwB64m8MKFnZ3vcOIPbR2jW6ugTXvzvZlORVmxBxYSk6P
         yB7nQTGsifbtMwULBc4N0njvIX323oRl6JcJ08drOMJG27A7QJouWEVRZOTGVPo58tt9
         ULHZ5etFFg2eI49cl2335PsDemEhKfydnbKRXFtWygHoEf04Z7zaZ+6VinqBs3Muf4le
         yoTdLfnZNdSZj6Vsu7mDpeUVGoaSjBWZh3RBc1ADWw7DOWS+eNEwpUTJf0R8w+W8LKf/
         VnHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zgC2jKMkEW454ax2v9lFWvwC1fvIchMPjsQv8XSzVfEp2o+4V
	GxvN9k5ZFitU25mw1fak24A=
X-Google-Smtp-Source: ABdhPJxGEK1ESLaU01X+KPH2DXVUCYMUQsnhiTvapnWzjG7gRgomOmxi5bMPCiNR3JOBhEkGMaqJGA==
X-Received: by 2002:a2e:7504:: with SMTP id q4mr11973456ljc.41.1597832289183;
        Wed, 19 Aug 2020 03:18:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c18:: with SMTP id h24ls1506111ljc.6.gmail; Wed, 19 Aug
 2020 03:18:08 -0700 (PDT)
X-Received: by 2002:a2e:9f4e:: with SMTP id v14mr12439255ljk.72.1597832288041;
        Wed, 19 Aug 2020 03:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832288; cv=none;
        d=google.com; s=arc-20160816;
        b=P0NFxzbWvhPBT4ZN6fd42PHtplplDHqimNRTnDuEu/5K9vbyz5R2x1pVrbUHBDA/VH
         daSZor61dXcq465/1ld+t6s4dm/vIjeBPuIvj0MsW+moc2olq76Fjw2pDXqO55AtdcgP
         oCIPaRZ1aYpsIg2/HzdBi4qEY+obIiSqThbS7ZM8gW0/Ye4ksVn7Ujv6N5GhjwFmFBCa
         ZC7pJVPVr6H2omuOf6UEzUau4gcotAboBr6RTJZY69wmHOAcBSoZHZv6Gm78x11s5668
         ANCtWSvVFay0OJWWHbnr47xzkwHPdd9a8l1OZi7nxhsKrcvGxtnFnhhNwCmzkdd2MbyA
         fOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aB9tJ2nip0w3S2FDbmM6cg9q+hFaY6E4Ip3Iu/jyCbY=;
        b=zm3ey0TrvOMqsa8qvfFpNmfznnbT+pAZxyUsn+E82yuj93vr2onVAX4S9VPwzO8EmC
         XVItCzuvS2LYxM7gGQ6MNZ3YTSMGB3j/oZRjhMdkzHRCNPOXhcP92SxPmj06AJiqm7EX
         I5osjzmnJsg3cjHpgeIpXsePuMhV4jGU2A9xeLcMHYM+L1smScEECh8aA4aoEfWkywvp
         L5LZuEpJu2B4u18lT4qLwl9TsXiXafMWMElWmmFj6ZEIVj8c/NpbfBc5GASgfVUlPXwh
         /XccPsNmXk1RRlZb3mB8UZwljOfwENJtRJHf9RZ8O/sEka/x2HXklkPs6LIyMgPuNh3q
         5Gtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p12si798075ljj.0.2020.08.19.03.18.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 03:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07JAI6CE031677
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 12:18:07 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07JAI59C007958;
	Wed, 19 Aug 2020 12:18:06 +0200
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of
 memory
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>,
        jailhouse-dev@googlegroups.com
References: <20200817171736.78100-1-jakub@luzny.cz>
 <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
Date: Wed, 19 Aug 2020 12:18:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
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

On 18.08.20 15:12, Jakub Lu=C5=BEn=C3=BD wrote:
>     > - * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex=
-A72, 1GB RAM)
>     > + * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex=
-A72, 1GB, 2GB, 4GB or 8GB RAM)
>=20
>     Not sure anymore what I meant with "32-bit", that can be removed.
>=20
> =C2=A0
> Alright, I was wondering what that means.
>=20
>     >=C2=A0 =C2=A0*
>     >=C2=A0 =C2=A0* Copyright (c) Siemens AG, 2020
>     >=C2=A0 =C2=A0*
>     > @@ -10,6 +10,9 @@
>     >=C2=A0 =C2=A0*
>     >=C2=A0 =C2=A0* This work is licensed under the terms of the GNU GPL,=
 version 2.=C2=A0 See
>     >=C2=A0 =C2=A0* the COPYING file in the top-level directory.
>     > + *
>     > + * Reservation via device tree: reg =3D <0x0 0x20000000 0x10000000=
>;
>     > + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0x0 0xe0000000 0x200000>=
;
>=20
>     Why this split-up into two regions?
>=20
>     This will also mean I need to add a patch to [1] so that the DT will
>     carry the carve out. And drop the mem=3D from [2]. Or can we rearrang=
e the
>     reservation to keep that mem=3D cut-off, at the price of wasting memo=
ry on
>     larger RPi variants?
>=20
>=20
> It's because the PCI MMIO address space is mapped to=C2=A00xe0000000 in t=
he
> original configuration. I don't know where this address comes from, but
> I've had some issues then I moved it somewhere else. I would like it
> most if it would be above all the available memory, but I was getting
> errors when i tried to do so:
>=20
> [ =C2=A0154.161182] pci-host-generic 200000000.pci: host bridge /pci@0 ra=
nges:
> [ =C2=A0154.161231] pci-host-generic 200000000.pci: =C2=A0 MEM
> 0x200100000..0x200103fff -> 0x200100000
> [ =C2=A0154.161354] pci-host-generic 200000000.pci: ECAM at [mem
> 0x200000000-0x2000fffff] for [bus 00]
> [ =C2=A0154.161525] pci-host-generic 200000000.pci: PCI host bridge to bu=
s
> 0001:00
> [ =C2=A0154.161540] pci_bus 0001:00: root bus resource [bus 00]
> [ =C2=A0154.161553] pci_bus 0001:00: root bus resource [mem
> 0x200100000-0x200103fff]
> [ =C2=A0154.161620] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
> [ =C2=A0154.161718] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0154.162420] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
> [ =C2=A0154.162523] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0154.166228] pci 0001:00:00.0: BAR 0: no space for [mem size 0x000=
01000]
> [ =C2=A0154.166246] pci 0001:00:00.0: BAR 0: failed to assign [mem size
> 0x00001000]
> [ =C2=A0154.166259] pci 0001:00:01.0: BAR 0: no space for [mem size 0x000=
01000]
> [ =C2=A0154.166270] pci 0001:00:01.0: BAR 0: failed to assign [mem size
> 0x00001000]
>=20
> So it seems that only 32-bit addresses are supported. When I tried to
> move it somewhere to the reserved space (e.g. to 0x20000000), I was
> getting crashes when enabling Jailhouse. So I stuck to the original addre=
ss.

That PCI MMIO config space is for a virtual host controller that
Jailhouse provides. If has to be placed into a free range in the
physical address space of that target. If you relocate that range in the
system config, also update the non-root cell device tree. The root cell
will get that information automatically.

Could you share /proc/iomem (without reservations) from your larger RPi?

>=20
> Currently, as it is, with the mem=3D limitation, it works also on the 2G
> and 4G variants. 8G doesn't even boot because the RPi firmware is too
> old (it boots with the next branch of jailhouse-images). But the purpose
> of this patch is to enable use of all the available memory (maybe I
> should specify that better?).
>=20
> For reserving the memory, I have a device tree overlay that can be used
> to do so. It has configurable offset and size, so it can be used
> multiple times from config.txt to reserve multiple memory regions. I

Ah, that is a nice option.

> tried to integrate that into jailhouse-images, but currently the
> precompiled DT overlays coming with RPi firmware are used, not the ones
> getting built with the kernel, so I would need to change that first.

Hmm, do not recall the background for that anymore. Why does the overlay
not work with that currently used DT?

RPi is an (out-of-tree) mess...

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
jailhouse-dev/83d289a5-8928-0fc2-68aa-64df76e8ee16%40siemens.com.
