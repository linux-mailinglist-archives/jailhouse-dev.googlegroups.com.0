Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNUNY77AKGQEEIKSXRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6592D5435
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 07:56:55 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id o12sf1539331wrq.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 22:56:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607583415; cv=pass;
        d=google.com; s=arc-20160816;
        b=e+Iruz74MwKeTkuSQEgu7Kzm58mdXoUYyBFeaVSprwAw/rIzrsdLH/jM32hy0UEVYu
         eJMz9BAYYhS9XFVsz5N8j286H8eUbt8WoeugXHNRvI6Q3ev486G0+yAKjXRe8VVCbeUt
         eC56fJN/85/3WyOYi0An8VpmF1U0uck1PKByv2mgqnluBWy6SJXpPE7RQ6iDAPCOHYS0
         akdLYJtWH4RFob0yHgKidgHRv82jELXukCw2MC/t330hOSUhDHdJMwtiPbAtYlwKheZH
         v55s8U9pJCwlehgtl/t9S89ouNpB/YLjIpy8VTqGiM7jxPXWgu3PIaqcfH1GC8P5MbF4
         +EPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=s5WjnOFc6pVVYaN17tfEVc2LrYrcKGOQRLJb5flctNY=;
        b=kd6P95dIoPXzp7uV9B15sQwkqMgTPNYSVhcVANU2f93GH4egPL9DX2J4osiV91CB5k
         a/AqfPCA1Zx151LOJRfhPmA0pjHziLK1qupKvJsm4zZ/IGDe3OxQ7P5G+g9xzmK/AMNN
         7Env9Dmh8bktZC/d7ENKG1ndwUppeiynGnUTZuKuQpQ2+Gkms/pQZGbPzACHQZrOCAsU
         jKHZ//eVmdOHomsUDBOo5zBm+S2/ssXT/docKLl/Zt2zYRbXgblxlndQm5xZS45ZUxhl
         9uJw3jtRxXuyJIo4JD8hYv/s1TJvr5gavGFibXmLjphNIO9e2WctzlDwBeaxWRdDQRhW
         EBvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s5WjnOFc6pVVYaN17tfEVc2LrYrcKGOQRLJb5flctNY=;
        b=JfzrZHuCjNaf+ODYc1KSv9Kf3ZyxOAwe8CZDnDZXVXT0zGZayViEfjoOM3qv1mYQ8r
         CkJezHuuM5WsVsR6UN4+88kyQ2Rs7/eUnUXiYhI5HgXcw7CjoU1L3Ig5wy2eQpFTQo05
         oYvYBPkfgEZq1U2EwYsPCV1k9JWZd6qYyElfG4tJduUPdbwx6KoPwmnWpuqe6EbKCfBE
         l8PDREDSEkuYMKPcPt+cRdK12wFBzWtR88U2MRFoYXyhwP3aFYIm4r81lwjZIQAwAOBG
         IBBeSfDljXcHZyJI7lD04/x5Iaap7/hNLwtPUrwDvDfyGnCq9xaBkmWz9DEmiT+epv4s
         4P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s5WjnOFc6pVVYaN17tfEVc2LrYrcKGOQRLJb5flctNY=;
        b=LaNKr/wMN0suIQ9Pwnkp5cEdnSupML3gXZlOpRETepdS71C03bC2uyr7nzT2NSIkCl
         YCQLNuA8EYyGklm1wEUACVO2TgcW7kifG+zOTSu+yE7rvtFBD3TQC9uyZaousxCbkq9N
         M1J0YEvpSgjFw+FUGhGLANj4/nkFwsCGqNELsp799R18rdAMP97dsJvewVes7BON1tX5
         XQxuqb0xPay9bz2z2FrsYMcq74QgRD0K2KTHaSaLFs5jFkFpvraa6k58WuiuGBH5oTnQ
         NCQmKvrM6mzrNDPHeuwro98eQ+LnTzmUSJo4zQXS086ZZDYuIRovwyUImeG0lSBFrDbX
         xXZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530cIAsnSnKeB0ki8bHXKNqVXC6TB96eT2Y5bTVRTbuAUgpvtxF1
	8Dfgh0ViNX/5MiDlwIi2K7c=
X-Google-Smtp-Source: ABdhPJyM5bltSZ65RU2W/xF9QBwoaP7m/KdjtTF24haJlf/PsIDYDeB6cPvqZqND5w/QplAlfUmJAg==
X-Received: by 2002:a1c:741a:: with SMTP id p26mr6631058wmc.47.1607583415017;
        Wed, 09 Dec 2020 22:56:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5543:: with SMTP id g3ls1988305wrw.0.gmail; Wed, 09 Dec
 2020 22:56:54 -0800 (PST)
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr4937318wro.81.1607583414037;
        Wed, 09 Dec 2020 22:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607583414; cv=none;
        d=google.com; s=arc-20160816;
        b=D3DM72hzxoyzi9SCW9rGHLmSEH10ycn9U6vbVyI1biEDPf89te6+0GhcAYLcU8OfjY
         f8rAV9PySywhElvmeIe2QHTjSvKNeVfsC7Vz1KoNzw7LjVChQCtC3uRsWyJv6sh3R6iT
         nz+bcBo1Kri76Qbw2PgAi3hPBnXqC8i7wNfSaCBTtqN/eczGkvD3vXv5RLJ3DKQMLOod
         XYnY3t9edypT2Y0Dax6/lzCjlV37Y8x7ZfMm+kuNo4SBE5mtTbRoWrT6CflmVXny2Fxm
         wGHxlHoW2Gc0J3RipK0k1/smC7OnmwdkD5p9GXSBIJnt5yIqkYoBY4iC+LzAaEMU/FeV
         gMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GXCEuC95HenKTJF29kA5wUvipZmupA7GKY1oBlJxUw0=;
        b=M3klQuFl/6U25Jdnt8ufD8e893IzB1U2LANaQxznTjIFiG1XgW6bj1kROv4YIIvSbV
         rG2f5Aov/msH/whjjCPJMtjJYIqfD4ZWl1lOooaXxGoIVAP1AafLHsjmKc0IhUVEs0pH
         BmawDpX9HAzrSXwSkVJlv0+S784olHNdJ6wmm9SHa/DH4i38pBcSt9R37bhwOMyJ1o6N
         qXKfY0R4VByMzrkpjkn64I2jRcysEBJTrCHANiPqf+w7s+uDle5oP8ZETyWxUiECXPhA
         g7y/XWD0oroxenYUx98PbGdCwGxkV3a7hUh/ADydLoVkfNAW+WtDkvtSgwjA195egjKc
         3pFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x130si79357wmg.2.2020.12.09.22.56.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 22:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0BA6urZh018628
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Dec 2020 07:56:53 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BA6uq6J031258;
	Thu, 10 Dec 2020 07:56:53 +0100
Subject: Re: jailhouse hardware check error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <92106761-1676-12d6-4d79-c1d9096e06d1@siemens.com>
Date: Thu, 10 Dec 2020 07:56:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 09.12.20 10:52, Sainz Markel wrote:
> After realizing the inconsistency on VT-x emulation in VMware and
> switching to VBox, I get the following error in hardware check command:
>=20
> =C2=A0
>=20
> mjonian@mjonian-VirtualBox:~/Projects/jailhouse/tools$ sudo jailhouse
> hardware check
>=20
> Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Availability
>=20
> ------------------------------=C2=A0 ------------------
>=20
> Number of CPUs > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ok
>=20
> Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok
>=20
> Traceback (most recent call last):
>=20
> =C2=A0 File "./jailhouse-hardware-check", line 147, in <module>
>=20
> =C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioap=
ics, dmar_regions)
>=20
> =C2=A0 File
> "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_parser.py",
> line 338, in parse_dmar
>=20
> =C2=A0=C2=A0=C2=A0 f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb=
')
>=20
> =C2=A0 File
> "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_parser.py",
> line 90, in input_open
>=20
> =C2=A0=C2=A0=C2=A0 raise e
>=20
> IOError: [Errno 2] No such file or directory:
> '//sys/firmware/acpi/tables/DMAR'
>=20

Are you starting Linux with "intel_iommu=3Doff"? Don't do that for running
the hardware check, only when running Jailhouse later on.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/92106761-1676-12d6-4d79-c1d9096e06d1%40siemens.com.
