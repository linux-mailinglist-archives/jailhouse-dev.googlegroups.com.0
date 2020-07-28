Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3M7QD4QKGQEKBNACBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C7230920
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 13:45:49 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id s22sf2373043ljs.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 04:45:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595936749; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZgZdw6HJx/9MzLjET14DiwkVYGKQA09942xYzTzl9p7Bp5SZaaaCfjDl2XqYb7xKqq
         PkoYJ3VX6W+f/26/dPRwqT6xeGpELMJfOdGnmmlLx2SiG7FWdav72TgNA56mahLigFMs
         FAeORXsN6gZ/Mx8Bx8gvlydWpfxNhRCAhFGDhOcgcYsG2fEvjTp8OfAqxRLP9sn9t3Wk
         dYDGwZh8OQBjvGfS1kKyttw19xqOXQ9DaztV7vycADp4jzh4aJ/3+mVHnEtTBY/AKqWF
         YavupMp5UZjihDaUOktqbGhE8EYLmHMiYrHzpLlodjRnrJVkbVcqDIogdksvX43nolaR
         EWOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ov9evWVUrPkdmzvZSlnpd9heh7Q/N4Xxo4szGyl3h+g=;
        b=okRCCMwSl3+oVwZnCmnroG/AxFf0MT8l1X8YfJVq2HWW1LvRDlzZf+1v2iTIjMDXjr
         fJnwxYgIrKHKw8YRPuvXI9ADyFMWlvBvyASADVRRHKIk3ckXE0Gkj2s4l7sKPjWPITvz
         HJ/iTLD6fTyG19kvXsOZjRt1F+NSEuph7HBiCS6BTuneOZyATz0YcR//C3/V+CIwU1SW
         TXMfe8Mb5FQcVC6L6uUKjnotHFSAloyBVUXycs1/yWH0erClucQkwRBlpK+KgF6FmLFW
         7f7cv2XApSJCPZWlmPHbKIfa9yzun2xJnVMgqDmrEOCcoihQgwUo+/N+BntasUNqAdin
         PzaQ==
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
        bh=ov9evWVUrPkdmzvZSlnpd9heh7Q/N4Xxo4szGyl3h+g=;
        b=gZlqn9hl9ElUnzho95ss6r3fPvHeOGsAs1IfvpJtB0DZpsol6Av+UW0dx9vW6PDpJT
         vLd/X6RBlYCPgRKAoNZrdvUFAnY1xNSRjIObYm7CU1S6I9LPFkS3f90iXhc93TfKRpjI
         TLqDcmRkQfpE89NwHfbAdwCjbx3MfYNR2odvdte4u8XFRRQaID6HjeasaXGZsxuXbKbI
         WL7QP52w9Wi4xE9mffmrYUQkH5pW6i04XlsYDJ+ym6Nz/BRYeZYijl2oIS1hmdBdVWP/
         FUJ8tGDsb5ObaLJZWy266yazsSKkoWr8W+3T64+P/aXf6VDO8oUWKqRMWkzP15jzd02x
         vlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ov9evWVUrPkdmzvZSlnpd9heh7Q/N4Xxo4szGyl3h+g=;
        b=k5pGPYcYPDLUyS2kcce7qmn4izYddRR6Yk8Rbs8qAugQjkdXhLXc4R6+O4FJG1WKOl
         8Lbm1/S1FvzhdHHr2Ij7zI/MJ1VI80uKfx4vRiLmKP7c1Ko0x9zZ6f5xsbpocXI2Fwjp
         olO7i9+bdPwwXQbQ5iPdurVZB8ntUR6a75tVDbbqX1FuhLw4RcV6Csx73d9KfkiXKQ+n
         BzIZAol9BceGrVr8NZLubKC3A0IOW8dFZrZyJCdERN2luRoxw+frWxHIPeT4xFFor2e0
         QLE+L+hKoBO2HePcNTsVyE+i/tTn9Agu/f3CWX5tLXG1N+GemasJSCS5AEU8B5T5i2PG
         ZAtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VcFvOD86MPZMs0vO3DNZW7n4RL+5qvUWlbJi17HNrFIrQq4H3
	cJNoO5OCowblth/hzaa44m4=
X-Google-Smtp-Source: ABdhPJwOncl1V8lci2aZPoMyPAqdR4EMprj/brQCf71lDJsSfKLVfLvn7uVhs3XFn/cn70h8agj2tw==
X-Received: by 2002:a2e:8191:: with SMTP id e17mr11437724ljg.339.1595936749437;
        Tue, 28 Jul 2020 04:45:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:81c4:: with SMTP id s4ls3622562ljg.10.gmail; Tue, 28 Jul
 2020 04:45:48 -0700 (PDT)
X-Received: by 2002:a2e:8316:: with SMTP id a22mr7267826ljh.137.1595936748567;
        Tue, 28 Jul 2020 04:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595936748; cv=none;
        d=google.com; s=arc-20160816;
        b=RdduVfbmeSIslMLFcxJ/d7chz0kIAjzFeJb5Spkz9sd/5Ar+tbIzxgBajQ5lMJqvCt
         RbDJ8CLLZ1v3JGsLwJcU8ZQHZO1REPWJnU/2dsWZafFuCwUXN0HhaKFgTaF2fe/JBikn
         2Bagk/kZ0wEjAqYvCP4GJXE5ZAFvPH4vftgp0yk75PtbcqEU0d4JvcMwiLtSvqcBdqSD
         A7AO/MKqYMsiuDCo+1CdCf6QlOm67Y+9L8LKLXYZGffPYyxkAlSx7V5VvxnqtYXpYRGA
         hGvLWYsnJIZlZyDpGvHk6ZmeGCcQzunnWPOrU51/IgUIKdJtL6TzK9Mu+yE4qYRdCbpO
         tBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gSA5TlaN6ckpckZK9/AF7z/JM8+XG4Q/9BFD/nr45vU=;
        b=GUPjxXQt+TjofLZPHqJQVHN1TqFH/mPif4IErQqDK1s0BILgvxqlxjOPpZ/KJRLmAC
         Ljr+KaHrIvf+HIn6QRqX4BkaIWAg0Jm3aks671EhsdrobQLY9WgO4K0D3BoKV9zLX9N1
         zLY7yWxV6nxyLxoH3FouNFCQp64D7RM3xFYrxwx0Y//nep+5bQvfr3eNEtpMSpbyEQbA
         CADBAf8V3F+FOSP0VzcpMWiH2Scb0kPfOmUd/3kRAfOQqR2dMbNFmpOuoT/yGjOeT6Od
         uiY2bxXH4A2VyIMlzgBC0vQmHerYNEmdMosWIn8tb/IVwmhv8+c3ZW52WuUfv73ESkRQ
         DQFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l22si343508lje.6.2020.07.28.04.45.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06SBjkBq019067
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 13:45:47 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SBjk3B016510;
	Tue, 28 Jul 2020 13:45:46 +0200
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>,
        jailhouse-dev@googlegroups.com
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com>
Date: Tue, 28 Jul 2020 13:45:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 22.07.20 15:06, Jakub Lu=C5=BEn=C3=BD wrote:
> Hi!
>=20
> For the project I'm working on I would like to allow Jailhouse to use=20
> more than 1 GiB memory on the Raspberry Pi 4. Following the memory map=20
> from BCM2711 documentation (=20
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711/rp=
i_DATA_2711_1p0.pdf=20
> ) and /proc/iomem, I added this section into rpi4.cell:
>=20
> /* RAM (1024M-4032M) */ {
> .phys_start =3D 0x40000000,
> .virt_start =3D 0x40000000,
> .size =3D 0xbc000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
>=20
> When I left mem=3D768M in the kernel command line, everything worked as=
=20
> before. But I wanted to use more memory, so I made a reserved-memory=20
> section in a device tree overlay. It reserves the range of 768M-1024M=20
> and verified it's working as expected in /proc/iomem. However, when I=20
> try to enable Jailhouse using the modified rpi4.cell, I get this error:
>=20
> root@demo:~# jailhouse enable rpi4-4g.cell
>=20
> Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 3
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
> CPU 3... OK
> CPU 0... OK
> CPU 2... OK
> CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "Raspberry-Pi4 4G"
> Adding virtual PCI device 00:01.0 to cell "Raspberry-Pi4 4G"
> Page pool usage after late setup: mem 61/994, remap 5/131072
> FATAL: instruction abort at 0xfbfff7c0
>=20
> FATAL: forbidden access (exception class 0x20)
> Cell state before exception:
> pc: ffffffc0089fd7c0 =C2=A0 lr: ffffffc0089fd7c0 spsr: 20000085 =C2=A0 =
=C2=A0 EL1
> sp: ffffffc01000bef0 =C2=A0esr: 20 1 0000086
> x0: 0000000000000000 =C2=A0 x1: 0000000000000000 =C2=A0 x2: 0000000000000=
000
> x3: 0000000000000000 =C2=A0 x4: 0000000000000000 =C2=A0 x5: 0000000000000=
000
> x6: 0000000000000000 =C2=A0 x7: 0000000000000000 =C2=A0 x8: 0000000000000=
000
> x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 0000000000000=
000
> x12: 0000000000000000 =C2=A0x13: 0000000000000000 =C2=A0x14: 000000000000=
0000
> x15: 0000000000000000 =C2=A0x16: 0000000000000000 =C2=A0x17: 000000000000=
0000
> x18: 0000000000000000 =C2=A0x19: ffffffc008a04c28 =C2=A0x20: ffffffc01480=
0000
> x21: 0000000000000000 =C2=A0x22: 0000000000000001 =C2=A0x23: 000000000000=
0000
> x24: 0000000000000001 =C2=A0x25: 0000000000000001 =C2=A0x26: ffffffc010fe=
3dc0
> x27: 0000000000000000 =C2=A0x28: ffffff80f6da5940 =C2=A0x29: ffffffc01000=
bef0
>=20
> Parking CPU 1 (Cell: "Raspberry-Pi4 4G")
>=20
> The address 0xfbfff7c0 is in the range that is mentioned in the added=20
> RAM section.
>=20
> Any ideas or hints what else could be wrong?

Sorry for the late reply. From your description, I also do not see why=20
this shouldn't work. Not other changes made than described?

If things got that weird, I sometimes instrumented paging_create()=20
(printk) to match the actually performed mappings against expectations.=20
"jailhouse config check" is now also available, just to double-check.

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
jailhouse-dev/32ebc4ac-1d9d-8983-4c25-e23856da2fad%40siemens.com.
