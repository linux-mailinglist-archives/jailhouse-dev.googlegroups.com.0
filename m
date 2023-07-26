Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBOHIQOTAMGQEXKXBGKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59E763370
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 12:23:54 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2b701c82e83sf55818951fa.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 03:23:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690367034; cv=pass;
        d=google.com; s=arc-20160816;
        b=EO59Mmx+VfCkk74f6qKc2Sc/CpPBU1dMJRxCuJTPCQPjqsNkv+kS8OUhK4ipY6Dc+v
         ThTe3fyDvbmp2CclMErhYo3R42aK+JeQDNE4lg7ay2N+xlIZjmsZZK3WN6HVo2vjakzZ
         nmxDMptPsrFzx7nSvDnxpindc2S/hBrbG3kDJX3G0VRuTrIBlGYTK8tBN3hVF9pmvp60
         nSZ8/BHSNgUuIvgnIK5z1V9zm024MHZFCETRdZ08k7yxKc2s/jTomQulFx53yJEEraWB
         Y4UdBFh7kqGgrwh057AxKvQP/VIY19aQY3YNZReRodk5By8aspzbO4aUxK1y5uHBDaPa
         aMzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Bp+cTk1/uLYR+M8k9I8oIoaBiHd7zGzP2HmvfOw4cjo=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=bX0ylJZ/m4T1p8auiVyqYmFex4G5dKfbEsPSh2qpF4Cu7AdR3uMUFOksBzxQmn36OT
         Vid9vaWW3CKbsB7ggz7nk7KowkIhQtjAkoj6iQTZ9qJir4OysjyAKTe8sucXMwZtFBK9
         Qs1gzLfNJARHvEg9NB0g1g6bvWXqln2qTZvnAC6Zch2kEy0QeSL65nKcqh1PYvCj0lsY
         BlvSmL+WwQCDJ0pz14gkFKGXV4O9BNVYUKdcDi2U9YETTv41YdlHUy5bzQln797a/rir
         41UKrSWeKhTHN819Np8oEEqKfgURc5oMhJDkQsnGyBNlINZ9AM8hVcPsql54bhSMaSrO
         J+/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=AM7G3TZI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690367034; x=1690971834;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp+cTk1/uLYR+M8k9I8oIoaBiHd7zGzP2HmvfOw4cjo=;
        b=CumgAdRKOY6ktpPcbXpSjCsTmipY6u1zKz75NgwrVn2+eEZkzxf8p0/r9j5ZCvuv48
         5+y4nbSQ9USQ9F0rHidKG81y3K6ZfeXL8M1db/hLmdqwNxYkjtNBDo7SV8K+hWYbeO4o
         y0zIorTZ7dW5wB0Foc8OKDz1K2TZkiuhIzgOrwkq9wyILh1gm3BsOr3dq/hMOIt5ut/Y
         F1Xdb/7SIuKKqwCvG9KSbB+8GhTlp63voPvQSOdqPdzwt7JuaaoLt9P/5mWte+DyC0Op
         aiQWkvrK2/oNHP/lVphfoVuVzbd5+Q5BAWojNP4GxBCOYz0CwfUdFHrfc4UMI+GvcERz
         JKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690367034; x=1690971834;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp+cTk1/uLYR+M8k9I8oIoaBiHd7zGzP2HmvfOw4cjo=;
        b=HJfj2EQIeGC8Vo5vqGjq7HwHAYQYoAvgact38fs/dnrDMCJLlBPRFAl11UsX41xILe
         r8TvHJxJhXC9OUW79+/Yps6RYeyNpuP/JHAsHoageLOOk86b7UVGivYjJ3NZk0BtqyUc
         5jwmzgDafDfC1gnUMIuHyBVcATNlifFO7b4sKBpgehHtWGCV4D2lYuVbNkbu3znii4rR
         WgmeUL316FgY+d1vLfO/4JJqj8b7401LvWqoO6LHSEBD2s+T60Jn+INZjHljPCHL3sAH
         Y6rSIbT8niq6jK5iv4aRI1VI6txnJW7tVvMuhK6BHKJvobuiY4s1JxKH3QQVMn+k0qw/
         /MfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLaPkAlQZGIKBxsyJXJL/I408LQSquXMh+Bdpkug4DcxRNyqBt6I
	CPdw2CL9X379jwH2l12kHV8=
X-Google-Smtp-Source: APBJJlEngVfmygy0dj8Wz32pgF5INPb3qOVOxLRXfRNm1dZ/UPiixSChtE8/TNCK2PqZN4z3aB6j7A==
X-Received: by 2002:a2e:9904:0:b0:2b6:db9b:aadc with SMTP id v4-20020a2e9904000000b002b6db9baadcmr1060963lji.32.1690367033095;
        Wed, 26 Jul 2023 03:23:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:c99:b0:2b9:5ebc:4afe with SMTP id
 bz25-20020a05651c0c9900b002b95ebc4afels195095ljb.0.-pod-prod-09-eu; Wed, 26
 Jul 2023 03:23:50 -0700 (PDT)
X-Received: by 2002:a2e:918a:0:b0:2b9:35ae:c9ac with SMTP id f10-20020a2e918a000000b002b935aec9acmr1155674ljg.2.1690367030605;
        Wed, 26 Jul 2023 03:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690367030; cv=none;
        d=google.com; s=arc-20160816;
        b=abQT9+qB5SBwqc2jsbjozW4L2aPyHGCYroKqkIUHJyNyh1jnWS/1XhjXvvA4h6+XZu
         QqdCU6diKGRlOBnQy4DDfWtEekPJtnmuJ4BIYHTx45xsqCzUVa0lMk1ZyB2GCyedoZvt
         NngEv1eSK/Hf0A1MA0ip6GHebb3QRIpnnIp91TqLly2c1vo5DDx2zIHx2Wca03VvYV15
         hj6ZT30rRJ2p6eKAJeMdoPlGoFlAe/ViSu9QKHclbXZ+XIwb62CHspXR+TtVaZmJtw6e
         Hq5b10S8Maoexoda/4KThyHca3alFCvyq26Tyz2riVsqhP0Vurim2R2E23DB+LPW2crl
         q9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9M4td2wLKxBd6c0LwhX51zQJcGLmEggU8y8OkpOmTqg=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=gm6/RRt2Eu8uAAOvuWiLZbbejHPY0tZ6rM3grClERFslNK4l7CU8CTxWk0oXYueT1s
         4vAptYYvE5uNPKU6LK7sEtnEIHYqGMJ6t1zWhR8bi7GWERrZX63uyKNThU2BeSox+pd5
         r4PVGUtsaRXB1SILH9hvc5YB2Ah6ywHcN24MwEAxaDNaMPg/MlSOobyf1doq9kviAhgs
         O8ilt78ImbV5MFPLcPGKN8BV4ao6Uxw8lDaQyx8/znQqCpiyVITvcVQTwPzo285kguHN
         NvPrXv2F37W5Gxbj1+WW/34QKPIgsabuyZvOW06ibScfLDEi5TdfYbt7uLUO+v+yfotM
         97dQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=AM7G3TZI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id ay29-20020a05600c1e1d00b003f9d3636ac6si294733wmb.0.2023.07.26.03.23.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 03:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 53BF43E00EB;
	Wed, 26 Jul 2023 12:23:49 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4R9qkD71NCzxqw;
	Wed, 26 Jul 2023 12:23:48 +0200 (CEST)
Received: from [192.168.179.88] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 12:23:48 +0200
Message-ID: <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
Date: Wed, 26 Jul 2023 12:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Configuration with 2 guest cells
Content-Language: en-US
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=AM7G3TZI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 26/07/2023 10:14, Jan-Marc Stranz wrote:
> I have a HW target with Intel core i5=C2=A0 (11th generation) and 32 GB R=
AM.
>=20
> In the hypervisor configuration for the root cell, 1 GiB (1024 MiB) is=20
> reserved for guest cells:
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 110600000-1505fffff : guest ce=
lls (1024 MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x110600000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x110600000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x40000000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>=20
> In the configurations for the guest cells, this area is divided so that=
=20
> each guest cell can use a maximum of 512 MiB:
>=20
> Guest 1:
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 110600000-1305fffff : Guest Ce=
ll (1) (max. 512=20
> MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Low RAM (1 MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x110600000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x100000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Communication region (4 KiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00100000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_COMM_REGION,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* High RAM (max. 511 MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x110700000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00200000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1ff00000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>=20
> Guest 2:
>=20
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 130600000-1505fffff : Guest Ce=
ll (2) (max. 512=20
> MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Low RAM (1 MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x130600000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x100000 ,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Communication region (4 KiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00100000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x100000 ,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_COMM_REGION,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* High RAM (max. 511 MiB) */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x130700000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00200000,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1ff00000 ,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>=20
> If only 320 MiB is used in both guest cells, then the guest cells can be=
=20
> successfully started one after the other with the command "jailhouse=20
> cell linux".
>=20
> However, if more than 320 MiB is used in guest cells (e.g. 336 MiB),=20
> then only one of the two guest cells can be successfully started.
> When the 2nd guest cell is started, an error message is issued:
>=20
> Traceback (most recent call last):
>  =C2=A0 File "/usr/libexec/jailhouse/jailhouse-cell-linux", line 737, in =
<module>
>  =C2=A0 =C2=A0 cell =3D JailhouseCell(config)
>  =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/cell.py", line=
 36,=20
> in __init__
>  =C2=A0 =C2=A0 raise e
>  =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/cell.py", line=
 33,=20
> in __init__
>  =C2=A0 =C2=A0 fcntl.ioctl(self.dev, JailhouseCell.JAILHOUSE_CELL_CREATE,=
 create)
> OSError: [Errno 12] Cannot allocate memory
> ERROR: Linux guest cell not started!
>=20
> I have now run numerous tests with different sizes for the guest cells=20
> and have come to the limit of 320 MiB, at which both guest cells can=20
> still be started.
>=20
> However, I cannot see why both guest cells cannot be started.
> Actually, in the configuration for the root cell, enough memory has been=
=20
> reserved for both guest cells.
>=20
> Is there an explanation for this unexpected behavior?

Did you run jailhouse-config-check over the combination of different=20
configurations?

The ENOMEM must happen somewhere in the driver or hypervisor. You could=20
add printks to boil that down.

What you could try: You could give the hypervisor more memory=20
(hypervisor_memory.size). Of course, you have align everything to the=20
new layout then. Maybe the HV runs out of memory, as it must keep track=20
of more page tables, as the cell gets more memory.

   Ralf

>=20
> Jan-Marc.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/81fa9191-18dd-4003-9cfb-b=
ed496d5723fn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/81fa9191-18dd-4003-9cfb-bed496d5723fn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/faf9ae5c-7f62-5814-7453-793bffb881c3%40oth-regensburg.de.
