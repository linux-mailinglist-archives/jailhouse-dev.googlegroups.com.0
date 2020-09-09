Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDFU4P5AKGQE6COBI2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 68376262F37
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 15:35:09 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id g6sf980996wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 06:35:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599658509; cv=pass;
        d=google.com; s=arc-20160816;
        b=sf6NwqANUcrqqLAAo5tTJMInapHRXPWP0b1EtaJLt8Nt8ciftNmct3+WJu23bdv7PP
         2RKfLjqVjuD9pkqn7jfIcF2KFlVnF3nugWeca3/QiEq0cTI/n3QkvLpqFmF5G1dINuty
         /tSO8gORX2N8PAMmro5pUkxh6TLMakTJID91MXNQjg1ZeE22TR4SJySJXVmdj1oC41+Z
         WRokF4LLlvSXnYjBslYn2JmLE1aRnA2BpxBmPz/XFFKpj32TXIYlgShU1ivZUxARIQAc
         lnyb8ffI6FTCg7OhxfF08iL+7Mbe7S3ClNxUhjX49Ty32TmjkfpQe0AvOkKONyi3J6To
         /fLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=IXrXWtfOnHV2hc/mvkVaEB4Y0WmSv3bLov2xJ/M5v0U=;
        b=dnvUaN1rlBslIaD937Ni+CggfR2Crp5OPdFevZ2PmGYbAnh1jf1ELVK6vQu0dEjQ2y
         J4pZUtvWHJY7v5l10KFJW1wMHGf5Euw3tqaNFiUQc6YOMaRmKV+OViUtjjndHrzkUaXi
         RrvKU0P8v7DqJb0e5dGJu0eY6tpaduQdITRDBKytiYyvO7wH3ZeZOKOt/Tgd1xzPn2gq
         uqoztcUnpCadTFbAbWv6wp24vEA3hY9K68W7j7zTNSUPoEiaUuRhBoo0wY4ozGpguvOK
         f42m5jIy9m+abzVkzbf96AMnK6UgcFxo62sCYT/SLlOqmHrJfPN0cP/t2lpyQDgbXDcf
         EMuw==
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
        bh=IXrXWtfOnHV2hc/mvkVaEB4Y0WmSv3bLov2xJ/M5v0U=;
        b=EpxgVOmWsomQi+RBN2oSF5STYKEA4nFliezA2HwMjoEArhj3scwq8R6XjPZ9KPUPgb
         Gh7fjXk+mQ2gNbgT4GxTCNhKjJJ+q2S0HwehMLmNHl5QfjzNbv4eeH+ORAUcaJaJsEEg
         /hDPxrzbEVngJbXY20HaMpFhgGTYCQbipcRl/hmeBtgkceFBeR1abJASmSUkFd6ACZDS
         TpHPoJVkMjEMl8ENq+cBj7ly96dKfWP1uNg0Qzah0XdmILq2oZhgT4fh+XxfbNXZwfWM
         CBXQG6kb9/h7/n9m/viEJNf8512yR643e4Of0hABZUdmCNg38WQbV91Xg51sWZZIaMkV
         1VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IXrXWtfOnHV2hc/mvkVaEB4Y0WmSv3bLov2xJ/M5v0U=;
        b=JfhBgdZuWPatDq7eDR5H+1F/T61AizFdzNhO5Pd30htyBNofnWSu/Rgo0frx9cwUtT
         9ql1mKyQAr31omnxKG4kHrVYcDRM9NRzAhY7WUN2SVJTe3cYMBjDDA/4DwRYmw5JymnO
         wQTFc563SnjOa9KjiFX3lhlFRN647i/m9ZeKkQSP3K//1ackUY/4JsZnyhase4NlwYQi
         xp6nWy78HULxpUIKHKPWo1+Ebvwm/7QdxDK3IkjuKmCGvI2/bPm/OTdhPW+fHqR7ZiC5
         7vZFbhFstfUNEYZcpyht3OIX/0uCrqV/ZUXyltlYl5eBFoKRZ9DUtKqDR8Oi/HDEifMx
         xelQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qw2X63HPdhs9RVC3HOYPH7C4yKlVc6EauJwg1z40VhpqVn/E1
	2xFQoG+4JY9+EfB25yJ7eb8=
X-Google-Smtp-Source: ABdhPJwFqvW1SRzDhTOFgoq6ebB0BG24KVD1GEKBvEv4I6gry2ydL7U8bGXt4hHIoH17z1wjqV7THA==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr3806518wmc.112.1599658509019;
        Wed, 09 Sep 2020 06:35:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80d7:: with SMTP id b206ls1255268wmd.1.canary-gmail;
 Wed, 09 Sep 2020 06:35:07 -0700 (PDT)
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr3825368wmi.13.1599658507815;
        Wed, 09 Sep 2020 06:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599658507; cv=none;
        d=google.com; s=arc-20160816;
        b=oGqNEMIldCk44GSNOsNPo4BJWf27pK2E4vXyuHZg7eskBQZqZyZTg1f7tgjvriJ90h
         xLqNKJneaayDqkKdXuGopMbuimZ3nX/lMQWt7XEjjLP4YXSqe+8ulQQL4oP/3G0uxy2s
         07c23otHXw3RrCh+x7N7IV7Q0TL/E+yh4Id8HUkdvEKgVNV5SIdbJcR1//jh2femFlmD
         Dmj1yzx5xMFi5OkR58clB9OwzRKP2NtA4vBmkjGRUEG5mEMiNK70ewkgndH8RnM+6+dX
         PwEpY1dckb/IzKN1F1o1c8qsz0cPDoL3H/OxXHCv6sBhKaCdzsd6ndLBhJrswgH2l6Pv
         b4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=SNsU3h7SOeb0em+UmvnznIf1EYjnhVqXUM8Hr6+FB7A=;
        b=s+BL1tATKfXyuHoOwcOFCy4XVVYiU54Xwzm7eVZsfyKM5fwZUqvWGC13tZRzo+DW8e
         YP82WwPFSl5F24AJOBOo2oRnhdwSo+XmYtrTuOggT6jw0Vg9wiWzVrhWXMnwyXiDi+9z
         bOqmEOtS6nM2WdDJ1XMSWPcTQThRBwejzBCZxfNFJxZi/BhWOXxLF5oqcL4x2BmuPgwK
         NiWEGrvmAsF0LdHhKPHqAfOH2bn4FYPfmpvqV7LWg7MY8KykiHbWQUXoflahg/oBisr9
         ML1PcJV2qzebPl69IHUcedghrULKcc6qSw7Oj5xjEjjPYa5bVjNA/mLUp0ewRhs4W2N+
         ws4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k14si76950wrx.1.2020.09.09.06.35.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 06:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 089DZ6mq031352
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2020 15:35:06 +0200
Received: from [139.22.116.238] ([139.22.116.238])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 089DZ6u1019127;
	Wed, 9 Sep 2020 15:35:06 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
Date: Wed, 9 Sep 2020 15:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
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

On 09.09.20 15:21, Jan-Marc Stranz wrote:
> I change the kernel command line directly in the "grub.cfg" file; i.e.
> the resulting command line is identical to the line specified in the file=
.
>=20
> I've also tried "memmap=3D0x5200000\\\$0x3a000000" with the same result.
>=20

If the resulting command line of the kernel is actually
"memmap=3D0x5200000$0x3a000000" now (directly in grub.conf, you must only
quote once: "\$"), you either have some other resources at 0x3a000000,
not just RAM. Check what /proc/iomem reports - when that parameter is
not in use. Or your system has less than 512 MB RAM (unlikely)...

Maybe share your generated config.c.

Jan

> j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:10:03
> UTC+2:
>=20
>     On 09.09.20 14:58, Jan-Marc Stranz wrote:
>     > I have good news.
>     > I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
>     >
>     > The hardware check of Jalihouse works and I was able to create a
>     > configuration for the root cell with "jailhouse config create
>     nuc8i7.c".
>     > (I've attached this configuration.)
>     > I inserted this cell configuration into the Yocto build system and
>     the
>     > file "nuc8i7.cell" is created and installed under
>     > "/usr/share/jailhouse/cells".
>     >
>     > In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I
>     > extended the Linux command line with:
>     > intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
>     >
>     > I took the entry "memmap =3D ..." from the generated configuration
>     "nuc8i7.c".
>     >
>     > While re-booting the system it gets stuck with the following messag=
e:
>     > Kernel panic - System is deadlocked on memory
>     >
>     > The kernel parameter=C2=A0 "memmap =3D ..." should actually work, b=
ecause
>     82M
>     > of the following area is reserved:
>     >
>     > /* MemRegion: 00100000-39ffffff : System RAM */
>     > {
>     > =C2=A0=C2=A0 =C2=A0 .phys_start =3D 0x100000,
>     > =C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000,
>     > =C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x39f00000,
>     > =C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE |
>     > =C2=A0=C2=A0 =C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA=
,
>     > }
>     >
>     > What could I do?
>     >
>=20
>     Most probably, that "$" in the kernel command line is prematurely
>     resolved as "$0" or so and the resulting kernel command line is
>     invalid.
>     Depending in how you inject the parameter, make sure quoting or
>     escaping
>     ("\$", or even more) is correctly done and validate the output of the
>     kernel.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-e=
a765b28a796n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-=
ea765b28a796n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0f3281b7-5da9-d616-d7ba-775ae1593e0b%40siemens.com.
