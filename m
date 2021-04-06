Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAF2WGBQMGQEZD4RNRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57935548E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Apr 2021 15:07:14 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id f24sf4423059ljm.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Apr 2021 06:07:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617714434; cv=pass;
        d=google.com; s=arc-20160816;
        b=vmO+d+LDGfh9xe9pXsRHEdjw1hr9plIkDfdiX2iLW0D72LMKJjaiblfb68oDrXgsAw
         WRYvOCKQHUJ7UPDFHh3wdCpbIZFRuiWjC8AJ4f3b9RD5n5sKTUJlFYz7f1l7IBiyz60k
         uxhldzAVDI3mtzik/gJi1C9Oh9DcKD80+wlMlQsTS1RQLfMfNeYPSbTczkZbwttR7SXt
         fMgNNCUFMg5zsdJl5zyp3GPvH+62MQOPojyGIo/fA0t4Zs4gWioVK085WnfD28jYjzu1
         uJ/mHAibqaAnmnY2EyTbYwEUhfuN/RK6Go9ue4pCBWu6/DW8RRKzbSVNEchYN8PX3HC6
         unnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=kIQWHXp3ABrPQXppndXXEur32DzmfKzBuHk5mnac7kA=;
        b=Kxtt0bXBFFiCP7ItpOPTwkYWLxbXliUO7NZsF1ki4hqUtRiLOaW5kMHXnEL0wJs6K8
         ZS5xWRCsLCRUJWRe5MapbYTCfYVwTlR3uT2rNHcvttJpMvMyq7Ix4JPZNfU8rYdQys9u
         q0AyiEut6fggGFrTMwcmzRgk5B5exOKbjex2Fx6DOCDxY61cWOSpeQiT+SEQcrKRZM3t
         ulx240mR4uChzx2LEmGmsFS0GrjvFrcXfhebJgQR6Uvd2ZBVDFaWTqBa122FZxgMX1SX
         +6rf6FjsDDGc3XrjAkY76AIY0iPDk2NObnpYjhXyU0zIQTHGK7EXDdb43Ec1tNpzl2sS
         ynHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ls04L8Ns;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kIQWHXp3ABrPQXppndXXEur32DzmfKzBuHk5mnac7kA=;
        b=A+4+HNzbVMTgS3JHRZEQIdtnX++cNk3x/2Nrzv78oAyNIEP+m8oeuoJIBUpPf52Sis
         Mokm9qY9B9tDXDZSaHmpY1+dWOTqymr3ilHaSNZM43sPyEANMNPcKPT4dsvj8zVh1r26
         xNxGJ0tq0j4crer8l3rTudrQlJ1bea1SN6wF7HEbJ/Wfw1BB6a+uPuXLvjvWgRzOry/d
         q9FArtSVMg6w0glwXqHVxebokA0UVTnvFhb2MhzgHN6UsTp/TpocB3gsaWa0NVav824c
         PUJRT9rGq74E5q2WddODMyXFp1deNbZxkcjZIL6/FhN7/feIFUb2QI5lVvcm9XXNaDu9
         7nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kIQWHXp3ABrPQXppndXXEur32DzmfKzBuHk5mnac7kA=;
        b=gf65sHHzo4/x28ijrDfFV3KcVKe3hj7afDtNagoL+ACT198rGO/+dyBiJzZ1VPhZf4
         K9I95IzXy8asFFLgDCZaFkfClf2+ZqHrchyOAjjxMlZeMZhu7d7Sn33U4OYkeSwlLTDU
         MQLWS2WNnDh/a+vsp7gG4fcgRdI/3b0Dffqzj2J/y3UuC7pBs7UQ8I9ncW/JVfJajCTt
         5Zm2EvLkN3T0jH/SvaGUmef4B9Lb7sa+jQvJXpKXdO7TflHB6BT8iiaoLyyHJWd6vDCX
         pjKX51korxuhdT6x9RjCptkU3HZtAY2s3faIcPSpABiFVFni4hiZijfPknpC4uP9K1Fz
         JuUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533M2feiSFqL/w0ovcIJMzMJLs/nNjhIJ24pSr9Vten65MYyRc0M
	HkXZeVsnDEdEoAzavpjCF+w=
X-Google-Smtp-Source: ABdhPJz1gCAIVrCGOhxr08wa6aKQNyLGkRg1ThSunW8qk9mr3CgxZqLapvSTgitSDj0AG1gl5gGSKg==
X-Received: by 2002:a2e:b043:: with SMTP id d3mr19567197ljl.280.1617714432924;
        Tue, 06 Apr 2021 06:07:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls3580454lji.1.gmail; Tue, 06 Apr
 2021 06:07:11 -0700 (PDT)
X-Received: by 2002:a2e:8950:: with SMTP id b16mr19232829ljk.345.1617714431031;
        Tue, 06 Apr 2021 06:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617714431; cv=none;
        d=google.com; s=arc-20160816;
        b=TVdqh2GioZhTnZYBd5XMXWzpUTl364Kt3jfVI8Z/+4WXMgts/0RJ/MEMBmYOUwFdpy
         4w8/6KHqiwbqdMAqYIkynFoqIkkXP640/kjEh/2Tm3gnjYHGowiq9rPnvrVx0qi4HPTI
         g7jC3Zwu1jCufMdLrbrw0xjnfJ2sLSAyDufxrXmzjUrVjaaN9r/EO7yu0CqIjadLzO1Y
         UAEg/lDG/3EhFq/yIvvI7cJvSXeBidvNyoq4lbW6yGY92LdfjjcBsIZYzKvPbXAwX9hY
         crt0ede2TS2H1OjQzCGGs4EDOLLARpyH5WU/+zM0HhPyzSmfztzSSPrJb3YtFiHf9zjI
         fXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=YdH+HupCBMvKqhDU4qD/4SRoOQ1DSaVZ3USNtUDVvyg=;
        b=XzHD2O0cQklaIdOH8PgM0ZoBJ1yV+JA+kx8QFRBB+LlJ++kJQ9K5pY0QukIgOTlbvh
         NaTd2lrABafoXNBppe/Ohb8aQ2WosM4cpVG2d1w+BDs/3vNA4gEOKF3HIAD1vN4L4e35
         psku5+GP/uOB5J6d0mnolAgqWqgZ4MosdNwr7G/s64opK5uurbDJMPdlUkza9p9bTsxN
         L63ACyg7tylJwGHlDdYQ0CoQ6XNxS8J78sFQV5egC7foAR7hlaL1sHc7ctFtowhGNcPc
         q5d8CqeFNuhP/RpCprrxMQwm+BUIn5316wziHLIOn1659t5e9L2v2GNi5os8jkSvFgrA
         u3+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ls04L8Ns;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id v26si1712121lfo.2.2021.04.06.06.07.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4FF78r74V5zxwH;
	Tue,  6 Apr 2021 15:07:08 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Apr 2021
 15:07:08 +0200
Subject: Re: HELP
To: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>,
	<jailhouse-dev@googlegroups.com>, <nikhildevshatwar@gmail.com>
CC: Jan kiszka <jan.kiszka@siemens.com>
References: <321eddc.40ef8.1788d817ec9.Coremail.caohp19@lzu.edu.cn>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <c8d5c803-7d1d-b0fa-d11a-4ad3826e7f4a@oth-regensburg.de>
Date: Tue, 6 Apr 2021 15:07:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <321eddc.40ef8.1788d817ec9.Coremail.caohp19@lzu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Ls04L8Ns;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Hongpeng,

On 01/04/2021 14:56, =E6=9B=B9=E5=AE=8F=E9=B9=8F wrote:
> Dear sir,
>=20
> I wanted to know how to write my own config files about non-root cell. By=
 the way, I tried to alter the=20
> rpi4-linux-demo.c and compiled it. Of course, it was successful in that w=
ay.=20
>=20
> 1. But I don't understand why there are several memory regions definition=
s.

Different memory regions address different aspects of the system (e.g.,
RAM, peripherals, platform devices, =E2=80=A6).

> 2. How to know the memory addresses.

You could start by looking into your device-tree or /proc/iomem.

> 3. How many memory regions should be defined.=20

Depends on the topology of your system and on what you are trying to
achieve. And it's not just all about memory regions: Keep in mind that
you also need to consider PCI devices or interrupts.

You could start by having a look into Jan's tutorial:
  https://www.youtube.com/watch?v=3D7fiJbwmhnRw

Hope that helps,
  Ralf

>=20
> Whether should I reference the Raspberry Pi 4 model B's manual to resolve=
 three questions.
> Here is the part of rpi4-linux-demo.c about memory definitions.(I didn't =
why there are 5 memory regions, 2 RAM definitions).
> =20
> .mem_regions =3D {
>  /* IVSHMEM shared memory regions (demo) */
>  {
>  .phys_start =3D 0x3faf0000,
>  .virt_start =3D 0x3faf0000,
>  .size =3D 0x1000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  },
>  {
>  .phys_start =3D 0x3faf1000,
>  .virt_start =3D 0x3faf1000,
>  .size =3D 0x9000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_ROOTSHARED,
>  },
>  {
>  .phys_start =3D 0x3fafa000,
>  .virt_start =3D 0x3fafa000,
>  .size =3D 0x2000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  },
>  {
>  .phys_start =3D 0x3fafc000,
>  .virt_start =3D 0x3fafc000,
>  .size =3D 0x2000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>  },
>  {
>  .phys_start =3D 0x3fafe000,
>  .virt_start =3D 0x3fafe000,
>  .size =3D 0x2000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_ROOTSHARED,
>  },
>  /* IVSHMEM shared memory region */
>  JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
>  /* UART */ {
>  .phys_start =3D 0xfe215040,
>  .virt_start =3D 0xfe215040,
>  .size =3D 0x40,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
>  JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
>  },
>  /* RAM */ {
>  .phys_start =3D 0x3f900000,
>  .virt_start =3D 0,
>  .size =3D 0x10000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>  },
>  /* RAM */ {
>  .phys_start =3D 0x30000000,
>  .virt_start =3D 0x30000000,
>  .size =3D 0x8000000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>  JAILHOUSE_MEM_LOADABLE,
>  },
>  /* communication region */ {
>  .virt_start =3D 0x80000000,
>  .size =3D 0x00001000,
>  .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  JAILHOUSE_MEM_COMM_REGION,
>  },
>  }
>=20
> By the way, what information should I obtained so that I can  write my ow=
n cell config.
> If I can get your generous help, I will appreciate.
> Thank you again !
>=20
> Yours sincerely,
> Hongpeng Cao.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c8d5c803-7d1d-b0fa-d11a-4ad3826e7f4a%40oth-regensburg.de.
