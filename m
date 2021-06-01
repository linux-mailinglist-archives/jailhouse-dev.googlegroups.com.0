Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT6H3GCQMGQEYTQGYOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262139784B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 18:44:01 +0200 (CEST)
Received: by mail-pj1-x1038.google.com with SMTP id r91-20020a17090a1864b029015da4ff1c12sf2091pja.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 09:44:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622565840; cv=pass;
        d=google.com; s=arc-20160816;
        b=lNKuEVtQKHJ6zOe+hsL4NYkO83kdPqMoxFYMwtFtJCZmtVNUsxSiHcOnrK8ICUdiTR
         AdBJMfLUzuCS4MCTeQLfTkXmbsgzD8C13DFTMYdtaAmH1fXimR3fCwILCKyc3CSUPN85
         XQIVSdBtarIMcZpFvXMh01WgD/schzLERjChjGFdhVrzieS78YfZiOXm8IgUKW/UJ0Oy
         LtYdzkN6GYIxd1up5+JHiDsL/CT0eteJ0RUzAsRFTGuBwFs553XamoZSVnjgnW6w2dfT
         l1NYZJDXqd8RVdFdL0HOftnmAUJGWJFMUQYrypf3OsWFwD7SGSDGJN2FTAUHLUwlorcB
         UBaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9CIztxVH8/6j6siS3Btnrx2U/VXoc1MHZLiHGko9A1U=;
        b=SMiM7HvqZdx4muv2TT8S9GHURvNg/oWW05T6tsQKTGmJY2cjjJ8QIKsOM/iav1zv0b
         9vu1GSpffBjnm1PKzZk0MSuSFnIYjhsSR7DqT96Mp9UcN/Eaj6CRyIAQamqnB7Sl+7PK
         7B3XdCzwgqAolsB8zTHcYnICyme5Mb4aouruSmFXT422sS3D+fc7jkFrtjBuwLtO65yv
         DI97uSlwcC0VszbALjuDz3QWV7wFWzuVYA2Y6H8HgHTPyB8mxfVjUashz3Sat8gYV+4E
         uot/8KxnEROWXAFSDBCmnfJgT/sJgXsSi9RCqBMtmNabBhmF8Z0eBlxqUf2T1HcJqDda
         Lg3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9CIztxVH8/6j6siS3Btnrx2U/VXoc1MHZLiHGko9A1U=;
        b=rPR5aqxN8M3QsP2tKqGCQfdNLCmo2ppXWsqNj1U7V0P61h5NnareAOiAK1vkiYfmPb
         lQOM//svDG/+Jg6xdqM06j9rmmRsondIC7vwtQQQhC3U7uCeYPDOO1xdnEEsynnpGLRU
         wxyOAmlKpoq6Up9jhTvkYU12FfGoUvG5bGNLUtUoo+vsW1sQMPto3M5ko9K6h+t7+6Ql
         5c+DyBdPRvk45T2W+9jXC5cbckKBul/GomwMWbaL8HFgUR4HXYxIKVce6UO5ej28+xa6
         kFhmPmKIkSssnnbdA9TIXmyxPwNQjFtnuinwIpiYXfvP2VkKJULqZ3KZ2eGmgQaI7JPv
         walw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9CIztxVH8/6j6siS3Btnrx2U/VXoc1MHZLiHGko9A1U=;
        b=bLNXJ+85omJDjTyX6WomQBVI3v8ehJaSqSFrwjzSCcfCHU1JwSLb14CZoP4SqTXdUV
         smnL4naTJhzC+R2ecsy1TzS9o1SRxH2TUkwHD3gSWSMmK42lUViNU6h7Ys3Tw5OnZjZf
         Ch9kdT/TS98/RCOlawj1YNblzYXIzBWS4es89RQ6IymtmBKh3zCSAYvH78JQof9ZMJVs
         Q1J8+e6koZLjL2IvL8jyKbCWcqe5febTm2Uj1Gin4B6Rul6+veXaO4ReObr7RTJTN0TH
         mrNukThe1smS35Y68AYTsgjLEadXS/IFAvIfSlGRzXjpWAAaAZOmuab4O5yh59GUeqQc
         ffqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309yBZ59S9eyhnJ+uLtxlYNzGqPA4sukH5X17bACUnx/zV9MVr4
	4mLMwP2RjPW8VzERzPJqf48=
X-Google-Smtp-Source: ABdhPJyIzpL7GuALHKu8nW2iCJAdTaC3DcWUR8GsoZUrYnMa6+9g4QRW+ZnPruNfFuNYMfrCOyK0Dg==
X-Received: by 2002:a17:90b:247:: with SMTP id fz7mr732487pjb.137.1622565839711;
        Tue, 01 Jun 2021 09:43:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:6903:: with SMTP id s3ls3313597pgq.9.gmail; Tue, 01 Jun
 2021 09:43:59 -0700 (PDT)
X-Received: by 2002:a63:5f56:: with SMTP id t83mr9758185pgb.70.1622565839073;
        Tue, 01 Jun 2021 09:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622565839; cv=none;
        d=google.com; s=arc-20160816;
        b=w67F8WyKhFQXdUCtmDVcZ1JRoy4I+kYt2+YL0P+xAgSueUFnMx+66phKU/A4Bn/4yc
         1Cf2UHSzrmwYoB9Dy8v3+KOcCRR0g3ZSercuf/78ant4poI24Nl29kGWajv+XUSle0RV
         g2QSrZwYfQLmpw4eZd7HDQNBzl3JCv7VIOsDTISfat/3SQqf+Y0Qp8s0zlj9Bsk2g2MJ
         kFEyorETcRv+CFnNFV0goTrMNcRKm3ZyPx+l7jW1MKWbpIAmwnt9xrJr6cZQ6ejjilgw
         GW7q6CmMp5r4gfecihEIDurixJgArGy+IcAzUrV2acFeYKlreo+tqjEFA0DP3WmQdgwm
         aZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=/MIFcTRwDc86s/kuzqpqqOQdnGEHWV0qVShbZXawMuc=;
        b=NWfejSKB1+mUGG5zQ5VEVOFzfxSieKwHQXpsyKzCp8NmppVNuONbmO8T3wgYTCTI/W
         yfI8SCRzbeJNDWaRE07LdYXOw6+xzT0lpHtXYMpwJQF/UY1dY6exQD3wrAW98J/X5WP0
         EeFpw9w2WbkvLkWeowoHTeFcHwGGcBP1rW+kfWVWCWL6hfeLe5bxiETyHP3A5rN26Tkl
         yXLknUlxFNP9avoUkCFMdFqLNBhoSzS/UiFWMHnc7dj8OT1tbO61jqQKPT7r93MdxmUp
         20JQwn4ipawERa/l8zE87aWf1jpsPGkbwR/Vsf9U8bp9KLo//LkVSJe2mSU4kxZoGvCL
         nFQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k78si91300pfd.5.2021.06.01.09.43.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 09:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 151Ght9X017799
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jun 2021 18:43:55 +0200
Received: from [167.87.91.190] ([167.87.91.190])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 151GeH59004250;
	Tue, 1 Jun 2021 18:40:17 +0200
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
 <0520cade-198a-4f89-95e4-cd5fbc6c1ae2n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <47600e22-8b78-f08d-0d75-94df09a3de64@siemens.com>
Date: Tue, 1 Jun 2021 18:40:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0520cade-198a-4f89-95e4-cd5fbc6c1ae2n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 01.06.21 12:40, along li wrote:
> Is UART different from other=C2=A0 devices? I see some uart-8250.c=C2=A0 =
code.=C2=A0
> The=C2=A0 uart is=C2=A0 especially=C2=A0 =C2=A0treated ?
>=20

Only in so far as the hypervisor may use a UART for its own outputs. But
there is no special handling of it when it comes to guest accesses.
That's also why you may get a mess on the console when both the
hypervisor and a guest write to the same UART.

> Will some demos which show=C2=A0 how to=C2=A0 partition=C2=A0 network dev=
ices or some
> other devices into=C2=A0 =C2=A0inmates=C2=A0 =C2=A0be done?
> I have tryed=C2=A0 in rpi4b.=C2=A0 like=C2=A0 zynqmp-zcu102-linux-demo.c =
,=C2=A0 =C2=A0I added
> the mem regions and irq.=C2=A0 But, the=C2=A0 network cann't seen in inma=
te.
> =C2=A0

You will have to adjust the inmate dts/dtb as well in order to make the
device visible. That is not done automatically by the Jailhouse runtime.

Jan

>=20
> =E5=9C=A82021=E5=B9=B45=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UT=
C+8 =E4=B8=8B=E5=8D=886:10:37<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>=20
>     On 14.05.21 05:08, along li wrote:
>     > Dear community,
>     >
>     > For X86 platform, the=C2=A0 tutorial=C2=A0 pdf talks some about=C2=
=A0 how to
>     partition
>     > pci device into none-root cells.=C2=A0 =C2=A0 =C2=A0
>     > tutorial:=C2=A0
>     >
>     =C2=A0https://events.static.linuxfound.org/sites/events/files/slides/=
ELCE2016-Jailhouse-Tutorial.pdf
>     <https://events.static.linuxfound.org/sites/events/files/slides/ELCE2=
016-Jailhouse-Tutorial.pdf>
>=20
>     >
>     <https://events.static.linuxfound.org/sites/events/files/slides/ELCE2=
016-Jailhouse-Tutorial.pdf
>     <https://events.static.linuxfound.org/sites/events/files/slides/ELCE2=
016-Jailhouse-Tutorial.pdf>>
>=20
>     >
>     > But how to do this in arm64 platforms, there is no=C2=A0 document.
>     >
>     > Well how to do this, Are there=C2=A0 some configuration demos ?
>     >
>=20
>     Plenty, though understanding the details requires a bit knowledge abo=
ut
>     the respective platforms. If you look at
>     configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it
>     gets
>     a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54=
.
>     But, as I already explained, there can be more complex challenges whe=
n
>     you also need to enable / clock the respective device, and those
>     controls are shared with the root cell.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0520cade-198a-4f89-95e4-c=
d5fbc6c1ae2n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/0520cade-198a-4f89-95e4-=
cd5fbc6c1ae2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/47600e22-8b78-f08d-0d75-94df09a3de64%40siemens.com.
