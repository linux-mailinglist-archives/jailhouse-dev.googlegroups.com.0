Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ7IULXQKGQE7QVSAOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id B47FC113C77
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 08:39:19 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id t3sf1115405wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Dec 2019 23:39:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575531559; cv=pass;
        d=google.com; s=arc-20160816;
        b=XGiLjsj9NNo5/a4PxcffnM1ABAyjiL+stozOf4Jxg0BUZASemsCUBWHPDNmPfVVjLd
         taaG0jKtSQJme2GsKUSsuaQBJtPPT75f7skbryU01H00c9Nx6BBZocLVul4jnmoDkXx8
         k7JlIy4nLxvVDiQ/urd3F8a3bJ+aguAmUZYzQa709Ed4qO6AcePmC6RXh8pm5W3p24Wx
         OCYNW6O0sUzCERuAhKBflKlUUkXUepk5Su0Kikw4ALFlwD51g70UosH7uak8OKUuZ/Vp
         z0vQZmT1Mv9bFIkmkwBGInoI9YyNsxSFLDRLGT2uize/o1MLMHBgPNhAxsuU8ViN9Mxy
         JHXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ixkgKOj0JlbX6WMv2fgVgf97jTn5Snv+WIGzAyj/0ao=;
        b=0t4UueiSuAVPV1Do4idJ9FQTsHcCLj4r+KVwrhitTJnUKyKOi54s/Dy7fC0kzwinWp
         dPrBmXhercbRVUiVvb8Zl1UImjQAgi//OipQCLhFkm2s0Lb9ZF9VzzKjaVc6zWzWq5l2
         wQlNBZL3NUVfgK9F2b9AItW7PhbudoPXaFzBTu4PVyB8PuUrxU6AH8MR+d0IduAeK2ba
         IbM3BbjmzrBd1ye7PZ2dxkZrikxbMiScv9aSEucoy0B427T1LcQf0il3uWM2TINvx3Ci
         Nv/K3bFQLfBpg3NzuojjeE/Dxv7enJWNljHoOEH+/3Qmettoi1sDGtqbJ2uN+rY28Ig/
         Zwjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixkgKOj0JlbX6WMv2fgVgf97jTn5Snv+WIGzAyj/0ao=;
        b=shPDC6m4FoIMQUes/vh7okARIWklmgYm4LBE6K9Dq/Qn7+7CFINCMg80GhRmuhWt8s
         le0tq+NdPKfgy8Lv3RUxzdC2mQC2pS3g5xMku4UYdILHYUP8w+C2UsYIUD93mXiLUhp6
         LiaxvhJfl4VSbZ4WW8gsAehn+PZyEcE3a9iuivErwBPQhJxEzCPiQe0t0BSvhB7kHJAw
         +XtpZGEyO4YpjCxFYnnMY1mxGqiqnvXSu/O5aWCZet1DPUhpf0e6Q2ljtIxD0PqB8OKy
         OnyKQxucA7Xcz8s/UWh6X8LuzYXupauSyiJfvki3fg62kH1aZZVv9xCbsxKj/790B5Cu
         6dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixkgKOj0JlbX6WMv2fgVgf97jTn5Snv+WIGzAyj/0ao=;
        b=a94Jl1hax0ii7ZvT8uhiRKZzcUblJab/hsz3Xs8RvUMyj2h9cI9jdfVyr8STRa6EY6
         Qn/NO+iYComT05bpGKmOuAGJsO9TP8JJoLhHs6oQDkcBBH2QJCj1W9eRGenYIyCAHt5t
         klSjoZ3CBrgUe3jOAkizId3OxJr9HDuNsJXnwGUSOt6mkFK1sq2pJT1l461kVb/ltBsQ
         n7oEZM97rvRCNofjOFhBnRqJuF7P5SY9KvW2MAdvCIcO2BsWJ+6gIziw5NUcsgv0ebWT
         X0pUnfdMIfiIAdSV6AZasfIbWqnlmdmlLyK9OtKufZKY03mE4ua7MSmxRMTjcwVD3PDt
         5twg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUmq5dM6icdLqDae7ZDOMZ4Mf9KtSdJ20xT70SKpsAFKZWXhr5B
	Fq9VKMzHwkJVFiFkvKwZdRg=
X-Google-Smtp-Source: APXvYqxo+6xcldg0uOE+ioicuufovJCAc6bX9PIT5jUjwvoiHfM1fGiu6o7Piat1PjPLcieDvuOgEQ==
X-Received: by 2002:adf:d184:: with SMTP id v4mr7118577wrc.76.1575531559397;
        Wed, 04 Dec 2019 23:39:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls905104wrw.4.gmail; Wed, 04 Dec
 2019 23:39:18 -0800 (PST)
X-Received: by 2002:a5d:5283:: with SMTP id c3mr1526778wrv.148.1575531558762;
        Wed, 04 Dec 2019 23:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575531558; cv=none;
        d=google.com; s=arc-20160816;
        b=LVGsfGR9wYm+NaQlhbBwMAEjH3MtzWq1nkQfDTiRigO2d8f5CqeZdZBCbWgKmQuzMI
         gbkvP4JNAAXx4pMof+B76JvJHlyKEIm7wvnsXtlYpVNkTq2C46jgVVRZS/ZonDMzikWx
         NBd7+uZdQcHnxVzP7iW45a7m80qak9QbDD+V+xZqW1SIu3FjyPH1x7BAhgGuJQe3vlxK
         HYsSfem7GN0jKsIvmGRwNMs08c3uDw04eRSnszL2uIfI1SoIp92Wpv+BUrHCQwWO/6V3
         r6YZB0spXBne9IyvC2smK/oYkB0c2FuxwcLR4QS1hvkIBtRiqWFVYDFJoUh9FoIYWXBm
         sUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ehBAcCKbGiZKXjWUwGeLa649nez7ZGx8gDHyqmKy0ak=;
        b=U176uLNTd3z2YIm7fpOUpqyPE+uJ0BNIxQoa5dnqICk86mvIoTQxkJkSlqvKJKo1te
         FpAushMHzfx8BGdZvc1fho+TQU6q4vG0yNMZJtQlOzNoFYxt6mNTJpZATAhtLyVSZo97
         oT5x1XL45DFYaUcfSaBpwlWo51R69oKmNDKI0TTWqb+QpazlSxNSEEJ13x189rqAVJNz
         MIQ21UBO2+QOZoGPlv5IMebZdAjxv0tjvlXuabtjyfk7tNacPljjtJy6+pr2OjphDnvW
         6SIqbJJFiUP8cM3Y5gWlK3CCLVnbHrjtvgA7hX15AhXyEK1ExgJxNT6TgrCwkDhnhhU0
         Q06Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b9si414153wrw.2.2019.12.04.23.39.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 23:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xB57dHNo030399
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 08:39:17 +0100
Received: from [139.22.77.67] ([139.22.77.67])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB57dHpR013853;
	Thu, 5 Dec 2019 08:39:17 +0100
Subject: Re: Zephyr as a Jailhouse inmate
To: Mani Sadhasivam <manivannanece23@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
 <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com>
Date: Thu, 5 Dec 2019 08:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 05.12.19 08:14, Mani Sadhasivam wrote:
> Hi Jan,
>=20
> On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     On 02.12.19 19:43, Manivannan Sadhasivam wrote:
>     > Hello,
>     >
>     > I can see that the Zephyr RTOS has been mentioned in the FAQ as
>     > one of the ported OS for non-root cells.
>     >
>     > Is there any reference code I can look into?
>=20
>     There is x86 support for Zephyr as Jailhouse "inmate". Check out
>     zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into troubl=
e,
>     report to the communities.
>=20
>=20
> Ah, just noticed that it got removed some=C2=A0time ago:
> https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19b=
c56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
>=20

Too bad they didn't reach out...

> But this could be helpful!
> =C2=A0

Partly. For ARM, you likely don't need so may changes, see below.

>=20
>=20
>     We could probably also easily support ARM, but the last time this
>     question came up, there was still not A-core support in Zephyr which =
is
>     a precondition.
>=20
>=20
> That's what I'm trying to do on IMX8M EVK in spare time. There is an ongo=
ing
> PR for adding Cortex-A support in Zephyr, so I'm planning to utilize that=
.

That is good news. If you combine that with the device tree description
for inmates, actually those for the Linux cells, you should be able to
boot without code modifications.

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
jailhouse-dev/87131459-2a1d-91b5-21f5-3dfccd49fa81%40siemens.com.
