Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBF4E4KOQMGQED424JZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96766080A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 21:18:32 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id p34-20020a05600c1da200b003d990064285sf3152624wms.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 12:18:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673036312; cv=pass;
        d=google.com; s=arc-20160816;
        b=Upj8vaQkckiVJf7tSv/fj6MEbDb9WM1pb5gcMcnHooEXQSVzUFNMaDnlQhT844SnJZ
         UijSYMCatelNYf55fCGapBsQN7zKMSdxrf0IlzVcyPigjHOuP5nv+PnaDjrYtVW5hmRb
         zrEYu1lSTtmcw5a1BPsZhtm7o5waoEYF+nwndiHS8sYIyGrNqIY5/U7puv4G0MYGtuBL
         6pTIQTCWJZZreqyxCCU2X6qNSCn3gMFvJKhlXGpTti1HK3J3kOcmbRanGpwcH9Xwv3Oy
         7ZZLAQEKygg1peGsBv3fruMJc3dJnDQCohrDzHSH2y//1iy/vSVWpanlEwclRdmArekG
         4D6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=Wv7ryMEUxSPfMITyt2bb4dpxvtgcNQEe0N2jHOvZ7Mo=;
        b=dtS2hqLpeft3sWQS5EjAa/TbwZrib51bfqu5pcF09bxP3wXYVmJsMioVXMqFs6SgNe
         hbGVPFsHIUkaxVkh8/27B0GfhKT2zsruV/uwbBRImbawhQLS2GxTw+ascRzClqvt/cP/
         pgyDOSSKIoOnIHhHjMFaa+73GvrIibp5QVnbSXTepi5fj8sGPq7cAcd1IF+vlfD/xvsk
         f4WulTErY3iqGn4lzPlNh6quwrzBTL058djzd3sAbg30J9p2SIrrEIMDVk3OpdC9Ito2
         Duvwv1GbMLKS0fjg6Z1P6sJVdl1CmADE51h+Pq+/VClJGrzIHCAAzUf807H/28FU8igM
         yJLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RBjtPoUF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv7ryMEUxSPfMITyt2bb4dpxvtgcNQEe0N2jHOvZ7Mo=;
        b=F1m87N/rz7ML6SCARHcpEHUdbcRBYB+1ndWhn4VbovTdT6XTPJxZtuvml2gRZGNImF
         /6+RpQJ9vsIq5vMvSxKHzSfbfdF2ezBd2mN4YZsAltnGvncwR+l81exDfjeycJ+1UufS
         BUIOeVZIZN6l+T4szDLUgQ4/GU+o6G6EuuczhbQlrP2KLbYGo4D7LxGWeiprsKfbvdA2
         7FcN+UhkO5wpJaA512SN7GtmbIBrw9QF14Hjr4Bid8gN24n79P9aB8bg2nPiSKJWyLyA
         h1ZbyzaoqoT/OwN2QxhxigBpZSSdzUNTm541T1pcNZhlKiTFIyUrIVmZ7u/S996LDL7q
         Gitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wv7ryMEUxSPfMITyt2bb4dpxvtgcNQEe0N2jHOvZ7Mo=;
        b=1PpVyrjJBClNlhu6gfea2w1J5OrGpSdj+v64kj6mVddRBPbm1Z8nD+VMru/3agAmpC
         eJzHkqTlA0/8vRdvCETVz9iEgmPHhmFU9W8vd9B9R1Oo7HuD4murpYr/TyVqaFt/4ZYc
         93rAzdAsIlfF1sYO8T1UNGolVqBa44BTJi2Fxe4UESulbgCzqtWQXP3uunoRRn57L9r4
         SGTheds9a/MUlNkQ7SNKMnJIWRWMhk2MgptsCzttnDnwuMWuEJuxXkYPrsj3b1ln7OgE
         uX6us5ZODMm3sms/hNMbuNxwmdKrpD/EdygykNBAE8UMYUbyzSz1j6XJGSYVeWeXzr6c
         IAWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqhxN7PhnZLCqImCFvyjQxg0Dn/dSF5y2kolOqTrOHJ4Gxoe27t
	WvGCNajZTgf6tKD1ftC3kLM=
X-Google-Smtp-Source: AMrXdXs77YxaRPPTKztWv+1kirVrFrJYpMeKzmsYYp7FG3oXC2vFCSSQ5KBk12cd3fN8ZTYfaDvTlQ==
X-Received: by 2002:a05:600c:1609:b0:3d0:552e:8d86 with SMTP id m9-20020a05600c160900b003d0552e8d86mr2672984wmn.112.1673036312249;
        Fri, 06 Jan 2023 12:18:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c843:0:b0:3cd:d7d0:14b6 with SMTP id c3-20020a7bc843000000b003cdd7d014b6ls122629wml.1.-pod-control-gmail;
 Fri, 06 Jan 2023 12:18:30 -0800 (PST)
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id ay9-20020a05600c1e0900b003cfb73fbf8fmr39905173wmb.7.1673036310476;
        Fri, 06 Jan 2023 12:18:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673036310; cv=none;
        d=google.com; s=arc-20160816;
        b=GrOfMdu7iwEKfs7+elH7uSWnpqul6gGx2YKTpM3FJQu2Yx8kPbS6SIk+mesvxJcvYz
         wWfZDs+aClEKZPdBu8rH+HkqRJTRJZBTaR4tWeczMpoZqF9OuK/fsCiDsDqB6WeGo11g
         F4mKXlf5mt1S1In08a5WrKm8IHIeAnH99sjI9ZtG6F7BDOW/+O5VqmidmK+UTzBiuq/p
         EoMKDecrhyC+XraTfx9TB1ylAFqdaWdRv4e69+3UZL+dbnaX06tmWgPd7voqiOkcROG1
         3cf3PLvSfwP+HKi1s9s3zo747Fg1GEfuc/VBpiwwTkdAUNZgotlWsENm1a2RCkJ3xkp6
         6txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6i+m1T9IwwMcnOsL6g6dRR52ekzt0XPCLABkAWBcu5g=;
        b=PGjLEq4nFE2WGcapxxpdfRHRdHiNdL05ytEMKhWM6abGAoQwPM032B2xs0oyhEzXpt
         umpelweZ6jpuJFMUjFFW6ieV/+ml1WpvO54mVAtqdQT+nMHHdPf4iXfmiVEQWLcdtPFq
         GX+etZq+7drN6jRVqevAijYo7UhXWlTcNdyE07mMLkcBBxfVn4lIBwFCz3mgfhz8D4n3
         1/v5rCYzvc0KomGJQWTnIAM3MhkpUcjmm+oMq++UbrsGOhcZIXlU2FuRZbJnFSyS3My5
         DkyaOQaPQaCg7PKknjlvMpBXmkYDP5Hk+iKXdw5k29K/j4Tl1gSuI8zJITxBnf/RKjBZ
         Qicw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RBjtPoUF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f19-20020a05600c4e9300b003cf567af88esi218520wmq.0.2023.01.06.12.18.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NpZRB08bVzydb;
	Fri,  6 Jan 2023 21:18:30 +0100 (CET)
Received: from [IPV6:2001:16e0:201:f776:eba4:bbc1:a6a3:3bd3]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 6 Jan
 2023 21:18:29 +0100
Message-ID: <d5711ca3-949e-9bad-8bdc-e7e8b5f9996e@oth-regensburg.de>
Date: Fri, 6 Jan 2023 21:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Tommi Parkkila <tommi.parkkila@gmail.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
 <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
 <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com>
 <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
 <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
 <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com>
 <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
 <CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1+KEH40kpi4h0A3=SQ@mail.gmail.com>
 <CAP8Rr60GYLysxvzeovfJ8CZ02DBzVjurmZ5s0bf6W0D6BaJwAA@mail.gmail.com>
 <CAP8Rr60q41KpNj=jDL=RZhwDixse1xF8cS=VhtghqoGmr9ew3A@mail.gmail.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAP8Rr60q41KpNj=jDL=RZhwDixse1xF8cS=VhtghqoGmr9ew3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=RBjtPoUF;
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

Hi,

On 06/01/2023 18:52, Tommi Parkkila wrote:
> According to the /proc/interrupts and error logs settings cpu frequency=
=20
> or voltage and when the button is pressed, all are related to pmic_irq=20
> service routines. See below snippet from /proc/interrupts:

aah, that's all really hard to read and decipher. Could you please send=20
all files as regular attachments? Isn't there a chance you get a working=20
dtc for your target?

Thanks,
   Ralf

>=20
> */73: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 =C2=A0 =C2=A0 GICv2 128 Level =C2=A0 =C2=A0 5c002000.i2c
>  =C2=A074: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0stm32-exti-h =C2=A055 Edge =C2=A0 =C2=A0 =C2=A0pmic_irq
>  =C2=A075: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A016 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A076: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A017 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A077: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A019 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A078: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A020 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A079: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A021 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A080: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A014 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A081: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A012 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A082: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A013 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:regulators
>  =C2=A083: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A0 0 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:onkey
>  =C2=A084: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 =C2=A0pmic_irq =C2=A0 1 Edge    =20
>  =C2=A05c002000.i2c:stpmic@33:onkey/*
>=20
> pe 6. tammik. 2023 klo 11.16 Tommi Parkkila (tommi.parkkila@gmail.com=20
> <mailto:tommi.parkkila@gmail.com>) kirjoitti:
>=20
>     Ralf - Please, find the full device tree attached. I used
>     "*/root@stm32mp1:~# find /proc/device-tree/ -type f -exec head {} +
>     | less > devicetree.txt/*" on target to generate the tree. Maybe
>     this works for you?
>     Thanks
>=20
>     pe 6. tammik. 2023 klo 10.42 Tommi Parkkila
>     (tommi.parkkila@gmail.com <mailto:tommi.parkkila@gmail.com>) kirjoitt=
i:
>=20
>         Ralf - here is the root cell configuration:
>=20
>         /*
>          =C2=A0* Jailhouse, a Linux-based partitioning hypervisor
>          =C2=A0*
>          =C2=A0* Test configuration for Banana Pi board (A20 dual-core
>         Cortex-A7, 1G RAM)
>          =C2=A0* https://banana-pi.org/en/banana-pi-sbcs/4.html
>         <https://banana-pi.org/en/banana-pi-sbcs/4.html>
>          =C2=A0* Copyright (c) Siemens AG, 2014
>          =C2=A0*
>          =C2=A0* Authors:
>          =C2=A0* =C2=A0Jan Kiszka <jan.kiszka@siemens.com
>         <mailto:jan.kiszka@siemens.com>>
>          =C2=A0*
>          =C2=A0* This work is licensed under the terms of the GNU GPL,
>         version 2.=C2=A0 See
>          =C2=A0* the COPYING file in the top-level directory.
>          =C2=A0*
>          =C2=A0* =C2=A0THIS IS A JAILHOUSE ROOT CELL CONFIGURATION FILE F=
OR STM32MP157
>          =C2=A0* =C2=A0- =C2=A0 BASED ON BANANA PI EXAMPLE FROM JAILHOUSE=
 REPO (A20
>         Dual Core Cortex-A7,
>          =C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 A20 UserManual:
>         https://github.com/allwinner-zh/documents/raw/master/A20/A20_User=
_Manual_v1.4_20150510.pdf <https://github.com/allwinner-zh/documents/raw/ma=
ster/A20/A20_User_Manual_v1.4_20150510.pdf>
>          =C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 A20 DataSheet:
>         https://github.com/allwinner-zh/documents/raw/master/A20/A20_Data=
sheet_v1.5_20150510.pdf <https://github.com/allwinner-zh/documents/raw/mast=
er/A20/A20_Datasheet_v1.5_20150510.pdf>
>          =C2=A0* =C2=A0- =C2=A0 WORK IN PROGRESS
>          =C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 STM32MP157 REF Manual:
>         https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>         <https://www.st.com/resource/en/reference_manual/DM00327659-.pdf>
>          =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 Memory map on=
 page 158
>          =C2=A0*/
>=20
>         #include <jailhouse/types.h>
>         #include <jailhouse/cell-config.h>
>=20
>         struct {
>         struct jailhouse_system header;
>         __u64 cpus[1];
>         // struct jailhouse_memory mem_regions[127];
>         struct jailhouse_memory mem_regions[131];
>         struct jailhouse_irqchip irqchips[1];
>         } __attribute__((packed)) config =3D {
>         .header =3D {
>         .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
>         .revision =3D JAILHOUSE_CONFIG_REVISION,
>         .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>         .hypervisor_memory =3D {
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* STM32MP157 */
>         .phys_start =3D 0xF7000000,
>         .size =3D 0x0600000,
>         },
>         .debug_console =3D {
>         /* UART-4 STM32MP157 */
>         .address =3D 0x40010000,
>         .size =3D 0x400,
>         /* .clock_reg =3D 0x01c2006c, */
>         /* .gate_nr =3D 16 */
>         /* .divider =3D 0x0d, */
>         .type =3D JAILHOUSE_CON_TYPE_STM32H7,
>         .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
>         JAILHOUSE_CON_REGDIST_4,
>         },
>         .platform_info =3D {
>         .arm =3D {
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* STM32=
MP157 */
>         .gic_version =3D 2,
>         .gicd_base =3D 0xA0021000, /// Distributor
>         .gicc_base =3D 0xA0022000, /// CPU
>         .gich_base =3D 0xA0024000, /// Hypervisor
>         .gicv_base =3D 0xA0026000, /// Virtual CPU
>         .maintenance_irq =3D 25,
>         },
>         },
>         .root_cell =3D {
>         .name =3D "STM32MP1-Root",
>=20
>         .cpu_set_size =3D sizeof(config.cpus),
>         .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
>         .num_irqchips =3D ARRAY_SIZE(config.irqchips),
>         },
>         },
>=20
>         /* STM32MP157 */
>         .cpus =3D {
>         0x3,
>         },
>         .mem_regions =3D {
>         /* IVSHMEM shared memory region - STM32MP157 */
>         /* - This macro creates four shared memory regions with a total
>         size of 0x100000 (1M), see cell-config.h*/
>         /* - Created and reserved a continous memory region in kernel
>         device tree for this one as well. */
>         /* - Placed the memory region before hypervisor region. */
>         //JAILHOUSE_SHMEM_NET_REGIONS(0xfdf00000, 0),
>         // /* SPI */ {
>         // .phys_start =3D 0x01c05000,
>         // .virt_start =3D 0x01c05000,
>         // .size =3D 0x00001000,
>         // .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         // JAILHOUSE_MEM_IO,
>         // },
>=20
>         /****************************************************************=
***********/
>         /****************************** DDR         =20
>         ******************************/
>         /************************* 0xC0000000 - 0xFFFFFFFF
>         *************************/
>         /****************************************************************=
***********/
>         /* RAM1 - STM32MP157 */ {
>         .phys_start =3D 0xC0000000,
>         .virt_start =3D 0xC0000000,
>         .size =3D 0x36A00000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>         /* JAILHOUSE INMATE LOCATED AT 0xf6a00000 - 0xf7000000*/
>         /* JAILHOUSE LOCATED AT 0xf7000000 - 0xF7600000*/
>         /* RAM2 - STM32MP157 */ {
>         .phys_start =3D 0xF7600000,
>         .virt_start =3D 0xF7600000,
>         .size =3D 0x9A00000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>=20
>         /****************************************************************=
***********/
>         /****************************** PERIPHERALS 2
>         ******************************/
>         /************************* 0x50000000 - 0x60000000
>         *************************/
>         /****************************************************************=
***********/
>         /* TAMP - STM32MP157 */ {
>         .phys_start =3D 0x5C00A000,
>         .virt_start =3D 0x5C00A000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* I2C6 - STM32MP157 */ {
>         .phys_start =3D 0x5C009000,
>         .virt_start =3D 0x5C009000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* STGENC - STM32MP157 */ {
>         .phys_start =3D 0x5C008000,
>         .virt_start =3D 0x5C008000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* ETZPC - STM32MP157 */ {
>         .phys_start =3D 0x5C007000,
>         .virt_start =3D 0x5C007000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TZC - STM32MP157 */ {
>         .phys_start =3D 0x5C006000,
>         .virt_start =3D 0x5C006000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* BSEC - STM32MP157 */ {
>         .phys_start =3D 0x5C005000,
>         .virt_start =3D 0x5C005000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* RTC - STM32MP157 */ {
>         .phys_start =3D 0x5C004000,
>         .virt_start =3D 0x5C004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* IWDG1 - STM32MP157 */ {
>         .phys_start =3D 0x5C003000,
>         .virt_start =3D 0x5C003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* I2C4 - STM32MP157 */ {
>         .phys_start =3D 0x5C002000,
>         .virt_start =3D 0x5C002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* SPI6 - STM32MP157 */ {
>         .phys_start =3D 0x5C001000,
>         .virt_start =3D 0x5C001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* USART1 - STM32MP157 */ {
>         .phys_start =3D 0x5C000000,
>         .virt_start =3D 0x5C000000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* DDRPERFM - STM32MP157 */ {
>         .phys_start =3D 0x5A007000,
>         .virt_start =3D 0x5A007000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* USBPHYC - STM32MP157 */ {
>         .phys_start =3D 0x5A006000,
>         .virt_start =3D 0x5A006000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* STGENR - STM32MP157 */ {
>         .phys_start =3D 0x5A005000,
>         .virt_start =3D 0x5A005000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DDRPHYC - STM32MP157 */ {
>         .phys_start =3D 0x5A004000,
>         .virt_start =3D 0x5A004000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DDRCTRL - STM32MP157 */ {
>         .phys_start =3D 0x5A003000,
>         .virt_start =3D 0x5A003000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* IWDG2 - STM32MP157 */ {
>         .phys_start =3D 0x5A002000,
>         .virt_start =3D 0x5A002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
>         },
>         /* LTDC - STM32MP157 */ {
>         .phys_start =3D 0x5A001000,
>         .virt_start =3D 0x5A001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* DSI - STM32MP157 */ {
>         .phys_start =3D 0x5A000000,
>         .virt_start =3D 0x5A000000,
>         .size =3D 0x800,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* GPU - STM32MP157 */ {
>         .phys_start =3D 0x59000000,
>         .virt_start =3D 0x59000000,
>         .size =3D 0x40000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* USBH_EHCI - STM32MP157 */ {
>         .phys_start =3D 0x5800D000,
>         .virt_start =3D 0x5800D000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* USBH_OHCI - STM32MP157 */ {
>         .phys_start =3D 0x5800C000,
>         .virt_start =3D 0x5800C000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* ETH1 - STM32MP157 */ {
>         .phys_start =3D 0x5800A000,
>         .virt_start =3D 0x5800A000,
>         .size =3D 0x2000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* CRC1 - STM32MP157 */ {
>         .phys_start =3D 0x58009000,
>         .virt_start =3D 0x58009000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DLYBSD2 - STM32MP157 */ {
>         .phys_start =3D 0x58008000,
>         .virt_start =3D 0x58008000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SDMMC2 - STM32MP157 */ {
>         .phys_start =3D 0x58007000,
>         .virt_start =3D 0x58007000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DLYBSD1 - STM32MP157 */ {
>         .phys_start =3D 0x58006000,
>         .virt_start =3D 0x58006000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SDMMC1 - STM32MP157 */ {
>         .phys_start =3D 0x58005000,
>         .virt_start =3D 0x58005000,
>         .size =3D 0x00001000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DLYBQS - STM32MP157 */ {
>         .phys_start =3D 0x58004000,
>         .virt_start =3D 0x58004000,
>         .size =3D 0x00001000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* QUADSPI - STM32MP157 */ {
>         .phys_start =3D 0x58003000,
>         .virt_start =3D 0x58003000,
>         .size =3D 0x00001000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* FMC (NOR/PSRAM/NAND) - STM32MP157 */ {
>         .phys_start =3D 0x58002000,
>         .virt_start =3D 0x58002000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* MDMA - STM32MP157 */ {
>         .phys_start =3D 0x58000000,
>         .virt_start =3D 0x58000000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
>         },
>         /* AXIMC - STM32MP157 */ {
>         .phys_start =3D 0x57000000,
>         .virt_start =3D 0x57000000,
>         .size =3D 0x100000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* GPIOZ - STM32MP157 */ {
>         .phys_start =3D 0x54004000,
>         .virt_start =3D 0x54004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* RNG1 - STM32MP157 */ {
>         .phys_start =3D 0x54003000,
>         .virt_start =3D 0x54003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* HASH1 - STM32MP157 */ {
>         .phys_start =3D 0x54002000,
>         .virt_start =3D 0x54002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0CRYP1 - STM32MP157 */ {
>         .phys_start =3D 0x54001000,
>         .virt_start =3D 0x54001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0BKPSRAM - STM32MP157 */ {
>         .phys_start =3D 0x54000000,
>         .virt_start =3D 0x54000000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0HDP - STM32MP157 */ {
>         .phys_start =3D 0x5002A000,
>         .virt_start =3D 0x5002A000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0DTS - STM32MP157 */ {
>         .phys_start =3D 0x50028000,
>         .virt_start =3D 0x50028000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* =C2=A0SAI4 - STM32MP157 */ {
>         .phys_start =3D 0x50027000,
>         .virt_start =3D 0x50027000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0VREFBUF - STM32MP157 */ {
>         .phys_start =3D 0x50025000,
>         .virt_start =3D 0x50025000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0LPTIM5 - STM32MP157 */ {
>         .phys_start =3D 0x50024000,
>         .virt_start =3D 0x50024000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0LPTIM4 - STM32MP157 */ {
>         .phys_start =3D 0x50023000,
>         .virt_start =3D 0x50023000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0LPTIM3 - STM32MP157 */ {
>         .phys_start =3D 0x50022000,
>         .virt_start =3D 0x50022000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0LPTIM2 - STM32MP157 */ {
>         .phys_start =3D 0x50021000,
>         .virt_start =3D 0x50021000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0SYSCFG - STM32MP157 */ {
>         .phys_start =3D 0x50020000,
>         .virt_start =3D 0x50020000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* =C2=A0EXTI - STM32MP157 */ {
>         .phys_start =3D 0x5000D000,
>         .virt_start =3D 0x5000D000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOK - STM32MP157 */ {
>         .phys_start =3D 0x5000C000,
>         .virt_start =3D 0x5000C000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOJ - STM32MP157 */ {
>         .phys_start =3D 0x5000B000,
>         .virt_start =3D 0x5000B000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOI - STM32MP157 */ {
>         .phys_start =3D 0x5000A000,
>         .virt_start =3D 0x5000A000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOH - STM32MP157 */ {
>         .phys_start =3D 0x50009000,
>         .virt_start =3D 0x50009000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOG - STM32MP157 */ {
>         .phys_start =3D 0x50008000,
>         .virt_start =3D 0x50008000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOF - STM32MP157 */ {
>         .phys_start =3D 0x50007000,
>         .virt_start =3D 0x50007000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOE - STM32MP157 */ {
>         .phys_start =3D 0x50006000,
>         .virt_start =3D 0x50006000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOD - STM32MP157 */ {
>         .phys_start =3D 0x50005000,
>         .virt_start =3D 0x50005000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOC - STM32MP157 */ {
>         .phys_start =3D 0x50004000,
>         .virt_start =3D 0x50004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOB - STM32MP157 */ {
>         .phys_start =3D 0x50003000,
>         .virt_start =3D 0x50003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* GPIOA - STM32MP157 */ {
>         .phys_start =3D 0x50002000,
>         .virt_start =3D 0x50002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* PWR - STM32MP157 */ {
>         .phys_start =3D 0x50001000,
>         .virt_start =3D 0x50001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
>         },
>         /* RCC - STM32MP157 */ {
>         .phys_start =3D 0x50000000,
>         .virt_start =3D 0x50000000,
>         .size =3D 0x1000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>=20
>         /****************************************************************=
***********/
>         /****************************** PERIPHERALS 1
>         ******************************/
>         /************************* 0x40000000 - 0x50000000
>         *************************/
>         /****************************************************************=
***********/
>         /* DCMI - STM32MP157 */ {
>         .phys_start =3D 0x4C006000,
>         .virt_start =3D 0x4C006000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* CRYP2 - STM32MP157 */ {
>         .phys_start =3D 0x4C005000,
>         .virt_start =3D 0x4C005000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* CRC2 - STM32MP157 */ {
>         .phys_start =3D 0x4C004000,
>         .virt_start =3D 0x4C004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* RNG2 - STM32MP157 */ {
>         .phys_start =3D 0x4C003000,
>         .virt_start =3D 0x4C003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* HASH2 - STM32MP157 */ {
>         .phys_start =3D 0x4C002000,
>         .virt_start =3D 0x4C002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* IPCC - STM32MP157 */ {
>         .phys_start =3D 0x4C001000,
>         .virt_start =3D 0x4C001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* HSEM - STM32MP157 */ {
>         .phys_start =3D 0x4C000000,
>         .virt_start =3D 0x4C000000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* OTG - STM32MP157 */ {
>         .phys_start =3D 0x49000000,
>         .virt_start =3D 0x49000000,
>         .size =3D 0x40000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* DLYBSD3 - STM32MP157 */ {
>         .phys_start =3D 0x48005000,
>         .virt_start =3D 0x48005000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SDMMC3 - STM32MP157 */ {
>         .phys_start =3D 0x48004000,
>         .virt_start =3D 0x48004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* ADC12 - STM32MP157 */ {
>         .phys_start =3D 0x48003000,
>         .virt_start =3D 0x48003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>         },
>         /* DMAMUX1 - STM32MP157 */ {
>         .phys_start =3D 0x48002000,
>         .virt_start =3D 0x48002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
>         },
>         /* DMA2 - STM32MP157 */ {
>         .phys_start =3D 0x48001000,
>         .virt_start =3D 0x48001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* DMA1 - STM32MP157 */ {
>         .phys_start =3D 0x48000000,
>         .virt_start =3D 0x48000000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* CANSRAM - STM32MP157 */ {
>         .phys_start =3D 0x44011000,
>         .virt_start =3D 0x44011000,
>         .size =3D 0x2800,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* CCU - STM32MP157 */ {
>         .phys_start =3D 0x44010000,
>         .virt_start =3D 0x44010000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* FDCAN2 - STM32MP157 */ {
>         .phys_start =3D 0x4400F000,
>         .virt_start =3D 0x4400F000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* FDCAN1 - STM32MP157 */ {
>         .phys_start =3D 0x4400E000,
>         .virt_start =3D 0x4400E000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* DFSDM1 - STM32MP157 */ {
>         .phys_start =3D 0x4400D000,
>         .virt_start =3D 0x4400D000,
>         .size =3D 0x800,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SAI3 - STM32MP157 */ {
>         .phys_start =3D 0x4400C000,
>         .virt_start =3D 0x4400C000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SAI2 - STM32MP157 */ {
>         .phys_start =3D 0x4400B000,
>         .virt_start =3D 0x4400B000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SAI1 - STM32MP157 */ {
>         .phys_start =3D 0x4400A000,
>         .virt_start =3D 0x4400A000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SPI5 - STM32MP157 */ {
>         .phys_start =3D 0x44009000,
>         .virt_start =3D 0x44009000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM17 - STM32MP157 */ {
>         .phys_start =3D 0x44008000,
>         .virt_start =3D 0x44008000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM16 - STM32MP157 */ {
>         .phys_start =3D 0x44007000,
>         .virt_start =3D 0x44007000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM15 - STM32MP157 */ {
>         .phys_start =3D 0x44006000,
>         .virt_start =3D 0x44006000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SPI4 - STM32MP157 */ {
>         .phys_start =3D 0x44005000,
>         .virt_start =3D 0x44005000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SPI1 - STM32MP157 */ {
>         .phys_start =3D 0x44004000,
>         .virt_start =3D 0x44004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* USART6 - STM32MP157 */ {
>         .phys_start =3D 0x44003000,
>         .virt_start =3D 0x44003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* TIM 8 - STM32MP157 */ {
>         .phys_start =3D 0x44001000,
>         .virt_start =3D 0x44001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM 1 - STM32MP157 */ {
>         .phys_start =3D 0x44000000,
>         .virt_start =3D 0x44000000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* MDIOS - STM32MP157 */ {
>         .phys_start =3D 0x4001C000,
>         .virt_start =3D 0x4001C000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* UART8 - STM32MP157 */ {
>         .phys_start =3D 0x40019000,
>         .virt_start =3D 0x40019000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* UART7 - STM32MP157 */ {
>         .phys_start =3D 0x40018000,
>         .virt_start =3D 0x40018000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* DAC1 - STM32MP157 */ {
>         .phys_start =3D 0x40017000,
>         .virt_start =3D 0x40017000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* CEC - STM32MP157 */ {
>         .phys_start =3D 0x40016000,
>         .virt_start =3D 0x40016000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* I2C5 - STM32MP157 */ {
>         .phys_start =3D 0x40015000,
>         .virt_start =3D 0x40015000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* I2C3 - STM32MP157 */ {
>         .phys_start =3D 0x40014000,
>         .virt_start =3D 0x40014000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* I2C2 - STM32MP157 */ {
>         .phys_start =3D 0x40013000,
>         .virt_start =3D 0x40013000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* I2C1 - STM32MP157 */ {
>         .phys_start =3D 0x40012000,
>         .virt_start =3D 0x40012000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* UART5 - STM32MP157 */ {
>         .phys_start =3D 0x40011000,
>         .virt_start =3D 0x40011000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* UART4 - STM32MP157 */ {
>         .phys_start =3D 0x40010000,
>         .virt_start =3D 0x40010000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* USART3 - STM32MP157 */ {
>         .phys_start =3D 0x4000F000,
>         .virt_start =3D 0x4000F000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* USART2 - STM32MP157 */ {
>         .phys_start =3D 0x4000E000,
>         .virt_start =3D 0x4000E000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO_32,
>         },
>         /* SPDIFRX - STM32MP157 */ {
>         .phys_start =3D 0x4000D000,
>         .virt_start =3D 0x4000D000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SPI3 - STM32MP157 */ {
>         .phys_start =3D 0x4000C000,
>         .virt_start =3D 0x4000C000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* SPI2 - STM32MP157 */ {
>         .phys_start =3D 0x4000B000,
>         .virt_start =3D 0x4000B000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* WWDG1 - STM32MP157 */ {
>         .phys_start =3D 0x4000A000,
>         .virt_start =3D 0x4000A000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* LPTIM1 - STM32MP157 */ {
>         .phys_start =3D 0x40009000,
>         .virt_start =3D 0x40009000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM14 - STM32MP157 */ {
>         .phys_start =3D 0x40008000,
>         .virt_start =3D 0x40008000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM13 - STM32MP157 */ {
>         .phys_start =3D 0x40007000,
>         .virt_start =3D 0x40007000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM12 - STM32MP157 */ {
>         .phys_start =3D 0x40006000,
>         .virt_start =3D 0x40006000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM7 - STM32MP157 */ {
>         .phys_start =3D 0x40005000,
>         .virt_start =3D 0x40005000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM6 - STM32MP157 */ {
>         .phys_start =3D 0x40004000,
>         .virt_start =3D 0x40004000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM5 - STM32MP157 */ {
>         .phys_start =3D 0x40003000,
>         .virt_start =3D 0x40003000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM4 - STM32MP157 */ {
>         .phys_start =3D 0x40002000,
>         .virt_start =3D 0x40002000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM3 - STM32MP157 */ {
>         .phys_start =3D 0x40001000,
>         .virt_start =3D 0x40001000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>         /* TIM2 - STM32MP157 */ {
>         .phys_start =3D 0x40000000,
>         .virt_start =3D 0x40000000,
>         .size =3D 0x400,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_IO,
>         },
>=20
>         /****************************************************************=
***********/
>         /****************************** RAM ALIASES
>         ********************************/
>         /************************* 0x30000000 - 0x40000000
>         *************************/
>         /****************************************************************=
***********/
>         /* RETRAM */{
>         .phys_start =3D 0x38000000,
>         .virt_start =3D 0x38000000,
>         .size =3D 0x10000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM - ALIAS 4 */{
>         .phys_start =3D 0x30050000,
>         .virt_start =3D 0x30050000,
>         .size =3D 0x10000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM - ALIAS 3 */{
>         .phys_start =3D 0x30040000,
>         .virt_start =3D 0x30040000,
>         .size =3D 0x10000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM - ALIAS 2 */{
>         .phys_start =3D 0x30020000,
>         .virt_start =3D 0x30020000,
>         .size =3D 0x20000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>         /* SRAM - ALIAS 1 */{
>         .phys_start =3D 0x30000000,
>         .virt_start =3D 0x30000000,
>         .size =3D 0x20000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>=20
>         /****************************** SRAMs
>         **************************************/
>         /************************* 0x10000000 - 0x30000000
>         *************************/
>         /****************************************************************=
***********/
>         /* SYSRAM */{
>         .phys_start =3D 0x2FFC0000,
>         .virt_start =3D 0x2FFC0000,
>         .size =3D 0x40000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM4 */{
>         .phys_start =3D 0x10050000,
>         .virt_start =3D 0x10050000,
>         .size =3D 0x10000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM3 */{
>         .phys_start =3D 0x10040000,
>         .virt_start =3D 0x10040000,
>         .size =3D 0x10000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>         },
>         /* SRAM2 */{
>         .phys_start =3D 0x10020000,
>         .virt_start =3D 0x10020000,
>         .size =3D 0x20000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>         /* SRAM1 */{
>         .phys_start =3D 0x10000000,
>         .virt_start =3D 0x10000000,
>         .size =3D 0x20000,
>         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>         JAILHOUSE_MEM_EXECUTE,
>         },
>         },
>=20
>         .irqchips =3D {
>         /* GIC STM32MP157*/ {
>         .address =3D 0xA0021000,
>         .pin_base =3D 32,
>         .pin_bitmap =3D {
>         0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>         },
>         },
>         },
>         };
>=20
>         pe 6. tammik. 2023 klo 9.19 Ralf Ramsauer
>         (ralf.ramsauer@oth-regensburg.de
>         <mailto:ralf.ramsauer@oth-regensburg.de>) kirjoitti:
>=20
>=20
>=20
>             On 06/01/2023 15:08, Tommi Parkkila wrote:
>              > Jan and Ralf - It looks like I have something wrong with
>             the IRQ/GIC.
>              > When I get root cell up successfully, and if I press a
>             button (that
>              > presumably is assigned to a IRQ routine) I get the error
>             print below and
>              > the whole system hangs. Is there any documentation on how
>             I should
>              > specify IRQ/GIC on root cell configuration or jailhouse
>             configuration
>              > for the target?
>=20
>             Interesting. What's behind IRQ 74? Would you please share
>             /proc/interrupts, /proc/iomem and the configuration of your
>             root cell?
>             And also maybe the full device tree using
>             $ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts
>=20
>             Thanks
>              =C2=A0 =C2=A0Ralf
>=20
>=20
>              >
>              > Thanks,
>              > -tommi
>              >
>              > */[ =C2=A0 84.080587] irq 74: nobody cared (try booting wi=
th
>             the "irqpoll"
>              > option)
>              > [ =C2=A0 84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tain=
ted:
>             G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE
>              >=C2=A0 =C2=A0 =C2=A0 5.15.24-dirty #3
>              > [ =C2=A0 84.094144] Hardware name: STM32 (Device Tree Supp=
ort)
>              > [ =C2=A0 84.099236] Workqueue: events dbs_work_handler
>              > [ =C2=A0 84.103724] [<c0110d3c>] (unwind_backtrace) from
>             [<c010c6c0>]
>              > (show_stack+0x10/0x14)
>              > [ =C2=A0 84.111377] [<c010c6c0>] (show_stack) from [<c0bb3=
c50>]
>              > (dump_stack_lvl+0x40/0x4c)
>              > [ =C2=A0 84.118918] [<c0bb3c50>] (dump_stack_lvl) from
>             [<c0baf750>]
>              > (__report_bad_irq+0x3c/0xc0)
>              > [ =C2=A0 84.126986] [<c0baf750>] (__report_bad_irq) from
>             [<c0185b8c>]
>              > (note_interrupt+0x2a8/0x2f4)
>              > [ =C2=A0 84.135265] [<c0185b8c>] (note_interrupt) from
>             [<c0181fd8>]
>              > (handle_irq_event_percpu+0x80/0x88)
>              > [ =C2=A0 84.143964] [<c0181fd8>] (handle_irq_event_percpu)
>             from [<c0182018>]
>              > (handle_irq_event+0x38/0x5c)
>              > [ =C2=A0 84.152769] [<c0182018>] (handle_irq_event) from
>             [<c0186614>]
>              > (handle_edge_irq+0xc4/0x218)
>              > [ =C2=A0 84.161046] [<c0186614>] (handle_edge_irq) from
>             [<c073c8b4>]
>              > (stm32_pwr_handle_irq+0x118/0x190)
>              > [ =C2=A0 84.169650] [<c073c8b4>] (stm32_pwr_handle_irq) fr=
om
>             [<c018165c>]
>              > (handle_domain_irq+0x7c/0xb0)
>              > [ =C2=A0 84.178348] [<c018165c>] (handle_domain_irq) from
>             [<c063ff04>]
>              > (gic_handle_irq+0x7c/0x90)
>              > [ =C2=A0 84.186522] [<c063ff04>] (gic_handle_irq) from
>             [<c0100afc>]
>              > (__irq_svc+0x5c/0x90)
>              > [ =C2=A0 84.193950] Exception stack(0xced55bb8 to 0xced55c=
00)
>              > [ =C2=A0 84.199040] 5ba0:
>              >=C2=A0 =C2=A0 00000000 00000000
>              > [ =C2=A0 84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000=
000
>             c1810800
>              > 00000080 ced54000 ced55ca8
>              > [ =C2=A0 84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55=
c08
>             c0101254
>              > c0101268 20010113 ffffffff
>              > [ =C2=A0 84.223509] [<c0100afc>] (__irq_svc) from [<c01012=
68>]
>              > (__do_softirq+0xc0/0x430)
>              > [ =C2=A0 84.230833] [<c0101268>] (__do_softirq) from [<c01=
2c8e0>]
>              > (irq_exit+0xd4/0x110)
>              > [ =C2=A0 84.238157] [<c012c8e0>] (irq_exit) from [<c018166=
0>]
>              > (handle_domain_irq+0x80/0xb0)
>              > [ =C2=A0 84.245797] [<c0181660>] (handle_domain_irq) from
>             [<c063ff04>]
>              > (gic_handle_irq+0x7c/0x90)
>              > [ =C2=A0 84.253965] [<c063ff04>] (gic_handle_irq) from
>             [<c0100afc>]
>              > (__irq_svc+0x5c/0x90)
>              > [ =C2=A0 84.261392] Exception stack(0xced55ca8 to 0xced55c=
f0)
>              > [ =C2=A0 84.266383] 5ca0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 df858000 df858004
>             00000000
>              > c1b6cb80 c1b6cb80 c1b3cec0
>              > [ =C2=A0 84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3c=
f48
>             c1986010
>              > cf0ba580 c205ac44 ced55cf8
>              > [ =C2=A0 84.282695] 5ce0: c09a38d8 c09a34fc 60010013 fffff=
fff
>              > [ =C2=A0 84.287781] [<c0100afc>] (__irq_svc) from [<c09a34=
fc>]
>              > (shmem_tx_prepare+0xcc/0xdc)
>              > [ =C2=A0 84.295422] [<c09a34fc>] (shmem_tx_prepare) from
>             [<c09a38d8>]
>              > (smc_send_message+0x24/0x120)
>              > [ =C2=A0 84.303696] [<c09a38d8>] (smc_send_message) from
>             [<c099ae50>]
>              > (do_xfer+0x98/0x464)
>              > [ =C2=A0 84.311234] [<c099ae50>] (do_xfer) from [<c099f40c=
>]
>              > (scmi_clock_rate_get+0x70/0xc4)
>              > [ =C2=A0 84.318983] [<c099f40c>] (scmi_clock_rate_get) fro=
m
>             [<c067f358>]
>              > (scmi_clk_recalc_rate+0x3c/0x70)
>              > [ =C2=A0 84.327791] [<c067f358>] (scmi_clk_recalc_rate) fr=
om
>             [<c0677004>]
>              > (clk_recalc+0x34/0x74)
>              > [ =C2=A0 84.331653] sched: RT throttling activated
>              > [ =C2=A0 84.339991] [<c0677004>] (clk_recalc) from [<c0679=
e18>]
>              > (clk_change_rate+0xf8/0x544)
>              > [ =C2=A0 84.347653] [<c0679e18>] (clk_change_rate) from
>             [<c067a3f4>]
>              > (clk_core_set_rate_nolock+0x190/0x1d8)
>              > [ =C2=A0 84.356687] [<c067a3f4>] (clk_core_set_rate_nolock=
)
>             from [<c067a46c>]
>              > (clk_set_rate+0x30/0x88)
>              > [ =C2=A0 84.365300] [<c067a46c>] (clk_set_rate) from [<c09=
5a910>]
>              > (_set_opp+0x2d0/0x5f0)
>              > [ =C2=A0 84.372647] [<c095a910>] (_set_opp) from [<c095acc=
0>]
>              > (dev_pm_opp_set_rate+0x90/0x16c)
>              > [ =C2=A0 84.380508] [<c095acc0>] (dev_pm_opp_set_rate) fro=
m
>             [<c095ff8c>]
>              > (__cpufreq_driver_target+0x110/0x2f8)
>              > [ =C2=A0 84.389840] [<c095ff8c>] (__cpufreq_driver_target)
>             from [<c0962f94>]
>              > (od_dbs_update+0xb4/0x160)
>              > [ =C2=A0 84.398540] [<c0962f94>] (od_dbs_update) from
>             [<c0963b18>]
>              > (dbs_work_handler+0x2c/0x58)
>              > [ =C2=A0 84.406499] [<c0963b18>] (dbs_work_handler) from
>             [<c0141dec>]
>              > (process_one_work+0x1dc/0x588)
>              > [ =C2=A0 84.414881] [<c0141dec>] (process_one_work) from
>             [<c01421e4>]
>              > (worker_thread+0x4c/0x520)
>              > [ =C2=A0 84.422940] [<c01421e4>] (worker_thread) from
>             [<c0149df8>]
>              > (kthread+0x170/0x1a0)
>              > [ =C2=A0 84.430367] [<c0149df8>] (kthread) from [<c0100130=
>]
>              > (ret_from_fork+0x14/0x24)
>              > [ =C2=A0 84.437481] Exception stack(0xced55fb0 to 0xced55f=
f8)
>              > [ =C2=A0 84.442571] 5fa0:                                 =
  =20
>             00000000
>              > 00000000 00000000 00000000
>              > [ =C2=A0 84.450726] 5fc0: 00000000 00000000 00000000 00000=
000
>             00000000
>              > 00000000 00000000 00000000
>              > [ =C2=A0 84.458880] 5fe0: 00000000 00000000 00000000 00000=
000
>             00000013 00000000
>              > [ =C2=A0 84.465448] handlers:
>              > [ =C2=A0 84.467682] [<716ecdd6>] irq_default_primary_handl=
er
>             threaded
>              > [<63fec1af>] regmap_irq_thread
>              > [ =C2=A0 84.476083] Disabling IRQ #74/*
>              >
>              > torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi
>             Parkkila kirjoitti:
>              >
>              >=C2=A0 =C2=A0 =C2=A0Ralf - Not sure what you mean by your n=
ote.
>              >
>              >=C2=A0 =C2=A0 =C2=A0Jan - root cell configuration is now fi=
xed what comes
>             to overlapped
>              >=C2=A0 =C2=A0 =C2=A0memory regions. However, the=C2=A0both =
issues: */1.
>             Terminal hangs/*, and
>              >=C2=A0 =C2=A0 =C2=A0*/2. Issue with setting CPU clock/* sti=
ll exists. I
>             am not familiar
>              >=C2=A0 =C2=A0 =C2=A0with clock configurations on the target=
, but yes TF-A
>             is in use.
>              >
>              >=C2=A0 =C2=A0 =C2=A0-tommi
>              >
>              >=C2=A0 =C2=A0 =C2=A0to 5. tammik. 2023 klo 12.54 Ralf Ramsa=
uer
>              >=C2=A0 =C2=A0 =C2=A0(ralf.r...@oth-regensburg.de
>             <mailto:ralf.r...@oth-regensburg.de>) kirjoitti:
>              >
>              >
>              >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 05/01/2023 18:24, Jan =
Kiszka wrote:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > On 05.01.23 18:21, Tom=
mi Parkkila wrote:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >> Oh, I was missing *.c=
ell from the point 2.
>             Now fixed=C2=A0and no
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complaints.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >> to 5. tammik. 2023 kl=
o 12.20 Tommi Parkkila
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tommi.p...@gmail.com <ma=
ilto:tommi.p...@gmail.com>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >> <mailto:tommi.p...@gm=
ail.com
>             <mailto:tommi.p...@gmail.com>>) kirjoitti:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 J=
an - Just ran the config check on the
>             host PC and on
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 1=
. On host, it identified some memregion
>             overlappings
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that were due
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 m=
y own copy/paste errors. It also
>             complained a missing
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resource
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 i=
nterception for architecture x86:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 *=
/In cell 'STM32MP1-Root', region 1
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 phys_start: 0x00000000f7600000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 virt_start: 0x00000000f7600000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009a00000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ |
>             JAILHOUSE_MEM_WRITE |
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 J=
AILHOUSE_MEM_EXECUTE
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 o=
verlaps with xAPIC
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > Another detail when ru=
nning cross: "-a arm" -
>             you don't have
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to worry
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > about x86 resources on=
 your target.
>              >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Side note: We should stor=
e the architecture in the
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration. Just
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for the same reason why w=
e introduced the magic
>             byte at the
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beginning=E2=80=A6
>              >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf
>              >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > Jan
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 phys_start: 0x00000000fee00000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 virt_start: 0x00000000fee00000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000001000
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags:=C2=A0=C2=A0/*
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 I=
 fixed the copy paste mem=C2=A0overlappings,
>             do I need to
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worry about
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 t=
he xAPIC overlapping?
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 *=
/
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 /=
*
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 2=
. On target, the check complained the
>             configuration is
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not root
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 c=
ell configuration???
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 *=
/root@stm32mp1:~#
>             jailhouse/tools/jailhouse-config-check
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 j=
ailhouse/configs/stm32mp157.c
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 R=
eading configuration set:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 N=
ot a root cell configuration:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jailhouse/configs/arm/stm=
32mp157.c/*
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 T=
he config here is the same as ran on
>             the host PC. What
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0causes it to
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 c=
omplain the above?
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 t=
o 5. tammik. 2023 klo 11.55 Jan Kiszka
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(jan.k...@siemens.com <ma=
ilto:jan.k...@siemens.com>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 <=
mailto:jan.k...@siemens.com
>             <mailto:jan.k...@siemens.com>>) kirjoitti:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 On 05.01.23 17:53, Tommi Parkkila wrote:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > Jan - Thanks again. I have not
>             tried the config
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check yet.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Actually, it
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > does not work on hw currently, it
>             does not find
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pyjailhouse
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 module. I'll
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > check whats=C2=A0going wrong with it
>             and=C2=A0let you know.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 You can also run it offline, even
>             directly from the
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source folder
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (tools/jailhouse-config-check ...).
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Jan
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > -tommi
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > to 5. tammik. 2023 klo 10.21 Jan
>             Kiszka
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (jan.k...@siemens.com
>             <mailto:jan.k...@siemens.com> <mailto:jan.k...@siemens.com
>             <mailto:jan.k...@siemens.com>>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 > <mailto:jan.k...@siemens.com
>             <mailto:jan.k...@siemens.com>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <mailto:jan.k...@siemens.com
>             <mailto:jan.k...@siemens.com>>>) kirjoitti:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi
>             Parkkila wrote:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Thanks for your reply, Jan.
>             I managed to
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get forward
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 from the 'hang'
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> condition. There were several
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misdefinitions on my root=
-cell
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> configuration. Now I get the
>             root-cell started
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sometimes, but more
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0often
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> I get two types of issues
>             after enable
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command. Any help
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 or ideas
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0where
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> to continue my debugging
>             would be greatly
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0appreciated.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Please, see the
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> issues explained below.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Already tried "jailhouse
>             config check"?
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Thanks,
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -tommi
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>             +++++++++++++++++++++++++++++++++
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> 1. Terminal hangs
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -- After the enable command
>             for the root
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cell, jailhouse
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gets started
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> but then the terminal goes
>             unresponsive.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Below, example
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 log, where I
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> give ls cmd, which then
>             causes terminal to go
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unresponsive...:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Missing interrupts could be
>             one reason. Or
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0something is
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 completely
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0broken with memory mapping so
>             that a kernel
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device driver
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gets stuck on
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0waiting for some register bit
>             to flip, e.g.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But most
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 frequent are
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically
>             around GIC
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resources being
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 improperly
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0passed through. The config
>             checker may find that.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> /*root@stm32mp1:~# modprobe
>             jailhouse
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ 1315.034414] jailhouse:
>             loading
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out-of-tree module
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 taints kernel.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# jailhouse
>             enable
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>             ~/jailhouse/configs/arm/itron_stm32mp157.cell
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Initializing Jailhouse
>             hypervisor v0.12
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (314-gc7a1b697-dirty) on CPU 0
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Code location: 0xf0000040
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Page pool usage after early
>             setup: mem
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028/1514, remap
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0/131072
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Initializing processors:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 0... OK
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 1... OK
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Initializing unit: irqchip
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Initializing unit: PCI
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Page pool usage after late
>             setup: mem
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050/1514, remap
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 5/131072
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [0] Activating hypervisor
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ 1355.352714] The Jailhouse
>             is opening.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# ls*/
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> 2. Issue with setting CPU clock
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> -- The second issue I see is
>             related to i2c
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus and
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 system clock.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> Terminal starts printing
>             error statements
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infinitely
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 after Jailhouse
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> opening. Below, is a snippet
>             of an example
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logs.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> */[ =C2=A0 85.322027] The
>             Jailhouse is opening.
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.322648] stm32f7-i2c
>             5c002000.i2c:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 prepare_enable
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0clock
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# [ =20
>             85.339233] cpu cpu0:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _set_opp_voltage: failed to
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> set voltage (1350000 1350000
>             1350000 mV): -22
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.350413] cpufreq:
>             __target_index:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Failed to change cpu
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0frequency: -22
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.357706] cpu cpu0:
>             _set_opp_voltage:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to set
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 voltage
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000
>             mV): -22
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.365124] cpufreq:
>             __target_index:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Failed to change cpu
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0frequency: -22
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.381985] cpu cpu0:
>             _set_opp_voltage:
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to set
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 voltage
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000
>             mV): -22
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0> /*- - -
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0>
>             +++++++++++++++++++++++++++++++++
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Same possible reasons as
>             above. Or do you
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0know how clock
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 control happens
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0on that platform? Is there
>             firmware (TF-A?)
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0involved?
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Jan
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0--
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 >
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Siemens AG, Technology
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Competence Center Embedded Linux
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >>
>              >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>              >
>              > --
>              > You received this message because you are subscribed to
>             the Google
>              > Groups "Jailhouse" group.
>              > To unsubscribe from this group and stop receiving emails
>             from it, send
>              > an email to jailhouse-dev+unsubscribe@googlegroups.com
>             <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
>              > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>             <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
>              > To view this discussion on the web visit
>              >
>             https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606=
-476b-a8d7-38ed11beaa2fn%40googlegroups.com <https://groups.google.com/d/ms=
gid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com>=
 <https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <htt=
ps://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11=
beaa2fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/CAP8Rr60q41KpNj%3DjDL%3DR=
ZhwDixse1xF8cS%3DVhtghqoGmr9ew3A%40mail.gmail.com <https://groups.google.co=
m/d/msgid/jailhouse-dev/CAP8Rr60q41KpNj%3DjDL%3DRZhwDixse1xF8cS%3DVhtghqoGm=
r9ew3A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d5711ca3-949e-9bad-8bdc-e7e8b5f9996e%40oth-regensburg.de.
