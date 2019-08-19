Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNGB5LVAKGQEFCN7LPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC392473
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 15:14:29 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t9sf5275234wrx.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 06:14:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566220469; cv=pass;
        d=google.com; s=arc-20160816;
        b=o7gen8VnEoAH8DRWmsd+tlMQMahJ8D24LgIlgHoy4k1/Wqbfnn/Bh/audy22fx+Mmf
         WZR0UXUP30d5ecYtj31oIJwzzyX3tk5jRhkBYWrr32uOTLV/jdts4qhC8k2r6Jbdix9j
         D48yRdz8cy9G41QqjQEH6ap/RTTBEeSmMX/xMwigourmF/bsuGod9teYx0dyUx7DxVhA
         2zJzXjALkghWmQfrFFudTef6fSJmXWlIR+gfF2nbhvUMSz5znlmUdSjdIK3iycCaCEEY
         A4dY8IoXJF/X2xc88TMDwm/gdYMMJA0hmQc+OLjfAqTj6IQrSlcRn7+iEXB/OUJEB26D
         znvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=Ka/NqJENFc1BkStb+uuFpPqyKP3kLCJM/XZcpUzYaeI=;
        b=jtyQrmklMyo8sIiaU2QinNwJStv778V5WGiNHaEWWbgOm9DLgoknGJe0YV16Z8Mhm9
         yCeRfM1kgg/UVb+I0/Tz1M3US1FoWcH4M4Ut/jfYQZtVayhCG7kmyScOhWJYbHaWbNAE
         iShPQZ5dd+sqKNqLpPHBrab+bYMC5YiVOHdbUasDE5Sc6oP2IVGSo5HFmhMybakI9Da0
         XN4m7spL+DqdkskyTFRcE6S3+sX+Q14RUpsTkpZmApIAyc/i4cm/k4QUULL70fSZm7kp
         kWoMk/PCcpM52C29xA5H7hN+YDhrrdRNdGxIemba5lR1K8LVZD9V4xz4CQJyEVe7Ofhr
         jHJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=VUbBCauV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ka/NqJENFc1BkStb+uuFpPqyKP3kLCJM/XZcpUzYaeI=;
        b=BPeFf/4d9TDtFQC5N0Bb0DqgCtbP7xDV5kbI73cetcL1RHNYyxza+P+XYjXzfmnasR
         TruJAwS2elUG4DcR0LQJnhBx82hSbdIX14CDpajh9/cemcJAqBHHSX1j5i/3mTvSLEMt
         L+zNb89pdMqEcLAjDY0qzoaDbKS0ikjAA7tVQjf08QkaLtt32fQa/J+QrapTW+YPMAmB
         k8tdYaTZUVdPRsk4YBMNjI4/Tq2lm2j0gTQfFiqETUfYoelJXLWs6HhuxQsF3b64/4hP
         49KyGRneJNhoTX0KkJfXQKbup2ZgDn44CSTRxkPaxLp/ubigVsott6kpdmzTr2caeDJG
         Gi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ka/NqJENFc1BkStb+uuFpPqyKP3kLCJM/XZcpUzYaeI=;
        b=tKbrJ7JeZV6FVPLXvs6ZK3yEKmSFZhj1bKd6+ZmnfO4g931pNdI025LW9nkozrf02S
         ZAvLHyNG21WvZjQwlWgtyOeR+KZHqn1L1UhpSBG1/KgM48g0TOGuIoiloh3ZD9pS5unu
         89vSk6dgvxWid3NaAzpu7/w8iL7WR+a/N2FEZ0h4eyiivWDKiza1E1OmoEzcGtu3MH61
         vluOgd0ZpIiv63lV0XUQJo3Dmylc8bu6QNMTqBX7Qekw3vZbEySfU4bMsRh25l6sGapw
         ves56v7RK4J7PT9dc+xZYS0izl1P5opaXUkRI0fnAmf5c4GjZ+/iHot8425U6juTK22e
         dBLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXBMNwAiKTDzmuE4WZRy2xBylld4AJVycd3PeIjVU9YtAE6h35d
	6XgdvOl4KXxZMFd7UOtSphA=
X-Google-Smtp-Source: APXvYqxnc14Q71P0UOO0ThlXuuLzLX52Is0RK7dkikWN54HIBDV8K537OW7U2eJeFHMyhbHwHEFrwQ==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr27896540wrj.66.1566220469563;
        Mon, 19 Aug 2019 06:14:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc01:: with SMTP id f1ls773292wmh.4.canary-gmail; Mon,
 19 Aug 2019 06:14:28 -0700 (PDT)
X-Received: by 2002:a1c:d10b:: with SMTP id i11mr21452862wmg.78.1566220468486;
        Mon, 19 Aug 2019 06:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566220468; cv=none;
        d=google.com; s=arc-20160816;
        b=SGP2R2VilFJVXdwDxZqaG+ZEx4cejnXVTnB+4a9256vLPrG+1JHqTcxjhakF4num1A
         PwP9FS+yPZQXn1Dm72WhEYdeXUJxbOiAzTsZProiUfxWwEnd44GS8SKwwKR+U3Sa3/gi
         ZYBaFrApgITQC4zNgwb/uaB08oLSpV7LkI8wqYcLRFp7TSMijyjOFV7sCZhnlqolYuFq
         g3VBFVovRRlgjfybxAC26vjT6V6KC/M/HSpZYOGV1FIip/PHmFAcssDduPdnv0Em/Mz0
         +9MwH6yYY2mrzJ8n7Uv6Mz9bUcQHMYHJC9+NRyGxd2eiafGrF0VsUCtUgu9Fip+sB5+j
         Dm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=C3zjmCe77G0+DNFEIQr6xeTTHhj71pMRd4GZHKBjwB4=;
        b=DD7vgunP2nGcZ6b2dwbzwEK9LgTCLbHzIGv2EAhp7ZqnEBPwgIrbf87NaHus8rV6hM
         TCyioFXXqZrcCzcUqQLKX/RaEJ2sLwx3vJj8LzQsy4NzhrV32+2zrzyMsugXrPWQsYkb
         rkt8Vh24PVKeOOUTo9ufJE4Dqlf+7jF3ZSRuMwFaO0rAF7dDKfDEhlW59HmmOCDx/bXG
         ETl6hYuPamybTuaj45B175odEb6YiOIHl2NAS2b7aPhqd2EUFZI5sy04svouLFHOlpbq
         sGTo87hDvznA6/2YhoqouKo3oMneBoueqVtVuDdcHRVrJGMNYEIDe1zYk0fzk3OZaeC2
         pugA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=VUbBCauV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id p4si486077wme.2.2019.08.19.06.14.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 06:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46BvXM6mLJzy5p;
	Mon, 19 Aug 2019 15:14:27 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 19 Aug
 2019 15:14:27 +0200
Subject: Re: Simulating Ethernet between cells
To: <sebastiansaueressig@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <18334f63-04e4-4d66-8097-8f12cac6f4f0@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <26b39cb6-8a05-319c-9c7c-11ce255fb9a3@oth-regensburg.de>
Date: Mon, 19 Aug 2019 15:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <18334f63-04e4-4d66-8097-8f12cac6f4f0@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=VUbBCauV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Sebastian,

On 8/19/19 2:32 PM, sebastiansaueressig@gmail.com wrote:
> Hello,
>=20
> I wanted to ask if it is possible to establish an Ethernet connection
> between 2 cells.
> On my board there are no Ethernet ports I could use, so I have to
> simulate this connection somehow.
>=20
> Here I came across the topic "shared memory region".
> I was able to build the region and /lscpi -v/ (inmate cell) gives me :
>=20
> /03:00.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared memory
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Red Hat, Inc Inter-=
VM shared memory
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: fast devsel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 100000000 (64-bit, n=
on-prefetchable) [size=3D128K]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 10000000 (32-bit, no=
n-prefetchable) [size=3D16K]
> /
> /
> /
> /
> /
>=20
> I used : =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .shmem_=
protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
>=20
>=20
> Now unfortunately I lack the idea what I should do now.

You need a kernel that comes with the ivshmem-net driver. Try this [1]
branch with CONFIG_IVSHMEM_NET=3Dy

  Ralf

[1] https://github.com/siemens/linux/tree/jailhouse-enabling/4.19

>=20
> On the topic Userspace I/0 I have looked at the examples of Henning Schil=
d.
> Am I right here ?
>=20
>=20
> Many greetings
> Sebastian Saueressig
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/18334f63-04e4-4d66-8097-8=
f12cac6f4f0%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/18334f63-04e4-4d66-8097-=
8f12cac6f4f0%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/26b39cb6-8a05-319c-9c7c-11ce255fb9a3%40oth-regensburg.de.
