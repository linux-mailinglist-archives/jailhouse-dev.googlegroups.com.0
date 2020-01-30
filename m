Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ5CZLYQKGQE4USXSFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD014D75F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 09:17:44 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id o24sf1115741wmh.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 00:17:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580372264; cv=pass;
        d=google.com; s=arc-20160816;
        b=niHr/BZmonuEtSYaO0cfhYiGbCiJy3FzhMcfqnWRnSuPMeINsJKvN/tnwznrgeghs3
         N3LFyK0cgopBrtYNQyZVToyzRVgvJc+1Kc1yncM/PBwxs0v+iy3m2LsHbwEqheGmbjH0
         ZnsDtjo0IINVCInJ+CZV4x6ca2Ca0j65Ml7J9LhOV52ubl977cv6TCOtYpuRL2QWQnh1
         7XJPuzEQsdU6feGewRwEQmfKOCjyJQPseh2fpLLdwnie2nuUb5/CvE2Cx3m+Dj/wdjdg
         Tuw0Rht/FL3ahYbdwyMRIA03OggKvFnTWhtXQAaOP8O/y4/rOq2JjfQ3XWmXF3EyFoL6
         XCbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=2vc+68dKQbJ7go8FAbRVVy09D9+0JlPMXg42y+rgG4I=;
        b=n4GAKF9HCB/y5cT3vo0NJjznGstuQsoDvLiEQMVtZB8J1aQapCFUcz4I4Y3w2Wm8hJ
         Xtk0FfrI8ilSDPCXR9c/7wCTuNyu8JhdUsgP2DTnYCVCjwNgDTmWHz0qPgHtfwd/MClf
         pwl6pqt4yx69HnCUoiEO/+c/SXkMQ2fWJzMx6pi2Ro0Ue5Vaw/Qr0JiyG9SoXsAb/53q
         d2SJFo6ohHWDaqa3Gs3hqfoHw9LecbtWTVtrTHJ9jV/I5uSl7ZNY4CwRsqfMGjMUVPu6
         4fVI07bh1LhcJK/dJN4w+FCxbmzcABUY9HqHLySOaZNd/9Tdy4/MNfJ0ZHVj7HMyIvMj
         HDMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2vc+68dKQbJ7go8FAbRVVy09D9+0JlPMXg42y+rgG4I=;
        b=cpXrcQ9LZzOh5MO20hqDXV9/vIGQIW8dayksi2FyBND+xrlPtt6p/ts9Wc7gVEWy65
         RglKPELHFzLaeuPZX31wdt2jXe42pp0bnT/WcXolU2rKWJxaeIXPQvpGh9oajnJ5GCJD
         jCvO6R/dTCafh2scZzKRWu4QI1kdWj77rx76gB+UOJXVZJx4gVxnxdC3OwUDYcjZM/9A
         teBTrALt8dT6n74B4ZjDEyxoYDYmtBJY/ZITlRBXKAg2hv8kS9kdNstgRVLU1HQVGwyg
         mZim1MaYBXO25YljAcu9nSllGNkbQ6opQBsNWpnJsbQ9C1COkN7oYx9v5t2JoDpsPhxG
         tq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2vc+68dKQbJ7go8FAbRVVy09D9+0JlPMXg42y+rgG4I=;
        b=Pz2TSnzRHX8HSXNjKB4yAy+5kevX6u0d5evwk9ac5UtDVGX/oLSbk8cI1D2kWlM3I6
         jwKxQCYNu7p4nNTzfBAPG1DTbRcuV8NsXDGBRm39oW02tDECtMtLaWB7MG7zEldrwOL5
         82D60KFa2tyGj2v6Oz9plbKBKQgbHNkx9ln9K7Ohmskg+L0YgI/p5mlVXPUqyawV2YbR
         uXdY1vsbdAvnad8/FBjieeZ4y9R7Nl+2Dlf3m1fMB+B3CJcFovjvCq9g5Pzen3jnXeYN
         8L9uLnVYQBqPivU2tdZZ0G05Ug/XllP85BnLOdGrVgMYId9YwqXgCVcDr3buF7ghTCpt
         q2qQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUqulMlw9R7ComETat8CLx+Un1tLuM2NdSFVRK4rx2sUlh2F/vu
	NyRFI7ENzX7m6ZC+AOnd2VQ=
X-Google-Smtp-Source: APXvYqwm0Zy7s2X/eeTjz2QI4pGdr3vgLtc4yPj5OOI7Fl8LWWw7YHHXDNMWyMutMsSJLBfqs5ulaQ==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr3834847wrp.236.1580372263734;
        Thu, 30 Jan 2020 00:17:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb4c:: with SMTP id u12ls1650362wrn.6.gmail; Thu, 30 Jan
 2020 00:17:42 -0800 (PST)
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr4283983wrm.60.1580372262880;
        Thu, 30 Jan 2020 00:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580372262; cv=none;
        d=google.com; s=arc-20160816;
        b=miO+jX6acTOwHjHbYw+MzmXYbmn6WygDAsmtOg98KR/Ku8Auag5sYvfM2qt9TOFXQx
         Xh4g4eCyi+EN4FkmuqdCKQNX3I7FZ/10h8hSqObDd5w+gsj41qyCph7SpGRnpq+n+BuI
         5j/0GJzyBhpmEX87JtruS9s55EWfLfLpG0vpECAl1+XeLQBqJ0uE7fIGkT+Oh1Ttdgvm
         4rq53jjirhA8KG1U0/qykVAqJf330hEMsBiVWkL5oPaKGgdBvRBRuTEMCZtzTOK1IjVc
         zJz/+E+kvTHC/dzJpEkdIS+Fo2IDtoIuXD+XjC17Si/xPmihrs03l4JvaoCiPn0EWlky
         X1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=S0TPWWTylc+c2fpyrM4IIesXw+b3KTxoTjI2Y9RHNnA=;
        b=YzWyRWfDRL/UAaNIUuCX9zhxqk4vt7VG0VyVtut+0gMkblWY7wrhQjtOd82jTVAc3w
         qpK3XB6eGfVb0UmQZuMz4vN8QJi8CJFyeJ6PzsL7jQfBX+s73DBcNbPNTkJgSXsNcUV1
         mfuZgKwg3gGpaYu6E5v2jBnGZP2LK4C48zD9M1qTBJjkNbqjyF0ELAP/B44HP0zdPKk9
         HqGZeu4HxkWlCJi2i8Le2p+96ADH2HKjoeFYKFYR/fSzy1bqNdWKVbSgmu3LuXtRw6C5
         tTykb1S695nxQPlANDs/z9x5EArbJX85hi9XY8JJOveV7Gk/RfZmuXDgIVfVw1BTSSF+
         zS3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w11si254832wmk.0.2020.01.30.00.17.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 00:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00U8He3m013852
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2020 09:17:41 +0100
Received: from [167.87.49.4] ([167.87.49.4])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00U8Hdlj032229;
	Thu, 30 Jan 2020 09:17:40 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Claudio Scordino <claudio@evidence.eu.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
Date: Thu, 30 Jan 2020 09:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 29.01.20 21:45, Saroj Sapkota wrote:
> NO, its 8GB-version and its iomem is:
> 02100000-02100fff : /axip2p@2100000
> 02110000-02110fff : /axip2p@2110000
> 02120000-02120fff : /axip2p@2120000
> 02130000-02130fff : /axip2p@2130000
> 02140000-02140fff : /axip2p@2140000
> 02150000-02150fff : /axip2p@2150000
> 02160000-02160fff : /axip2p@2160000
> 02170000-02170fff : /axip2p@2170000
> 02180000-02180fff : /axip2p@2180000
> 02190000-02190fff : /axip2p@2190000
> 02200000-0220ffff : security
> 02210000-0221ffff : gpio
> 02390000-02390fff : /axi2apb@2390000
> 023a0000-023a0fff : /axi2apb@23a0000
> 023b0000-023b0fff : /axi2apb@23b0000
> 023c0000-023c0fff : /axi2apb@23c0000
> 023d0000-023d0fff : /axi2apb@23d0000
> 02430000-02444fff : /pinmux@2430000
> 02600000-0280ffff : /dma@2600000
> 02900800-02900fff : /aconnect@2a41000/ahub
> 02901000-029010ff : /aconnect@2a41000/ahub/i2s@2901000
> 02901100-029011ff : /aconnect@2a41000/ahub/i2s@2901100
> 02901200-029012ff : /aconnect@2a41000/ahub/i2s@2901200
> 02901300-029013ff : /aconnect@2a41000/ahub/i2s@2901300
> 02901400-029014ff : /aconnect@2a41000/ahub/i2s@2901400
> 02901500-029015ff : /aconnect@2a41000/ahub/i2s@2901500
> 02902000-029021ff : /aconnect@2a41000/ahub/sfc@2902000
> 02902200-029023ff : /aconnect@2a41000/ahub/sfc@2902200
> 02902400-029025ff : /aconnect@2a41000/ahub/sfc@2902400
> 02902600-029027ff : /aconnect@2a41000/ahub/sfc@2902600
> 02903000-029030ff : /aconnect@2a41000/ahub/amx@2903000
> 02903100-029031ff : /aconnect@2a41000/ahub/amx@2903100
> 02903200-029032ff : /aconnect@2a41000/ahub/amx@2903200
> 02903300-029033ff : /aconnect@2a41000/ahub/amx@2903300
> 02903800-029038ff : /aconnect@2a41000/ahub/adx@2903800
> 02903900-029039ff : /aconnect@2a41000/ahub/adx@2903900
> 02903a00-02903aff : /aconnect@2a41000/ahub/adx@2903a00
> 02903b00-02903bff : /aconnect@2a41000/ahub/adx@2903b00
> 02904000-029040ff : /aconnect@2a41000/ahub/dmic@2904000
> 02904100-029041ff : /aconnect@2a41000/ahub/dmic@2904100
> 02904200-029042ff : /aconnect@2a41000/ahub/dmic@2904200
> 02904300-029043ff : /aconnect@2a41000/ahub/dmic@2904300
> 02905000-029050ff : /aconnect@2a41000/ahub/dspk@2905000
> 02905100-029051ff : /aconnect@2a41000/ahub/dspk@2905100
> 02907000-029070ff : /aconnect@2a41000/ahub/afc@2907000
> 02907100-029071ff : /aconnect@2a41000/ahub/afc@2907100
> 02907200-029072ff : /aconnect@2a41000/ahub/afc@2907200
> 02907300-029073ff : /aconnect@2a41000/ahub/afc@2907300
> 02907400-029074ff : /aconnect@2a41000/ahub/afc@2907400
> 02907500-029075ff : /aconnect@2a41000/ahub/afc@2907500
> 02908000-029080ff : /aconnect@2a41000/ahub/ope@2908000
> 02908100-029081ff : /aconnect@2a41000/ahub/ope@2908000
> 02908200-029083ff : /aconnect@2a41000/ahub/ope@2908000
> 0290a000-0290a1ff : /aconnect@2a41000/ahub/mvc@290a000
> 0290a200-0290a3ff : /aconnect@2a41000/ahub/mvc@290a200
> 0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixer@290bb00
> 0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@290e400
> 0290f000-0290ffff : /aconnect@2a41000/ahub/admaif@290f000
> 02910000-02911fff : /aconnect@2a41000/ahub/asrc@2910000
> 02930000-0297ffff : /aconnect@2a41000/adma@2930000
> 02c00000-02c0ffff : /mc_sid@2c00000
> 02c10000-02c1ffff : /mc_sid@2c00000
> 03010000-0301ffff : /watchdog@30c0000
> 03090000-0309fffe : /watchdog@30c0000
> 030c0000-030cfffe : /watchdog@30c0000
> 03100000-0310003f : serial
> 03110000-0311003f : /serial@3110000
> 03130000-0313003f : /serial@3130000
> 03160000-031600ff : /i2c@3160000
> 03180000-031800ff : /i2c@3180000
> 03190000-031900ff : /i2c@3190000
> 031b0000-031b00ff : /i2c@31b0000
> 031c0000-031c00ff : /i2c@31c0000
> 031e0000-031e00ff : /i2c@31e0000
> 03210000-0321ffff : /spi@3210000
> 03240000-0324ffff : /spi@3240000
> 03280000-0328ffff : /pwm@3280000
> 03290000-0329ffff : /pwm@3290000
> 032a0000-032affff : /pwm@32a0000
> 03400000-0340020f : /sdhci@3400000
> 03440000-0344020f : /sdhci@3440000
> 03460000-0346020f : /sdhci@3460000
> 03500000-03500fff : sata-ipfs
> 03501000-03506fff : sata-config
> 03507000-03508fff : sata-ahci
> 03510000-0351ffff : /hda@3510000
> 03520000-03520fff : padctl
> 03530000-03537fff : /xhci@3530000
> 03538000-03538fff : /xhci@3530000
> 03540000-03540fff : ao
> 03550000-03557fff : /xudc@3550000
> 03558000-03558fff : /xudc@3550000
> 03820000-038205ff : /efuse@3820000
> 03830000-0383ffff : /kfuse@0x3830000
> 03960000-03960fff : 3960000.tegra_cec
> 03990000-0399ffff : 3990000.mipical
> 039c0000-039c000f : /tachometer@39c0000
> 03a90000-03a9ffff : sata-aux
> 03ad0000-03adffff : /se_elp@3ad0000
> 03ae0000-03aeffff : /se_elp@3ad0000
> 03c00000-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox interrrupt
> 03c10000-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox
> 08010000-08010fff : /funnel_major@8010000
> 08030000-08030fff : /etf@8030000
> 08050000-08050fff : /etr@8050000
> 08060000-08060fff : /tpiu@8060000
> 08070000-08070fff : stm-base
> 08820000-08820fff : /funnel_minor@8820000
> 08a1c000-08a1cfff : /ptm_bpmp@8a1c000
> 09010000-09010fff : /funnel_bccplex@9010000
> 09840000-09840fff : /ptm@9840000
> 09940000-09940fff : /ptm@9940000
> 09a40000-09a40fff : /ptm@9a40000
> 09b40000-09b40fff : /ptm@9b40000
> 0b1f0000-0b22ffff : sce-pm
> 0b230000-0b23ffff : sce-cfg
> 0c168000-0c168003 : Tegra Combined UART SPE mailbox
> 0c240000-0c2400ff : /i2c@c240000
> 0c250000-0c2500ff : /i2c@c250000
> 0c260000-0c26ffff : /spi@c260000
> 0c280000-0c28003f : /serial@c280000
> 0c2a0000-0c2a00ff : /rtc@c2a0000
> 0c2f0000-0c2f0fff : security
> 0c2f1000-0c2f1fff : gpio
> 0c300000-0c303fff : /pinmux@2430000
> 0c340000-0c34ffff : /pwm@c340000
> 0c360000-0c3603ff : /pmc@c360000
> 0c370000-0c3705ff : /pmc@c370000
> 0c390000-0c392ffe : /pmc@c360000
> 0d230000-0d230fff : /actmon@d230000
> 0e000000-0e07ffff : /cpufreq@e070000
> 10000000-10000fff : /pcie-controller@10003000/pci@1,0
> 10004000-10004fff : /pcie-controller@10003000/pci@3,0
> 12000000-12ffffff : /iommu@12000000
> 13e00000-13e0ffff : /host1x
> 13e10000-13e1ffff : /host1x
> 13ec0000-13efffff : /host1x
> 150c0000-150fffff : /host1x/nvcsi@150c0000
> 15100000-1513ffff : /host1x/tsecb@15100000
> 15340000-1537ffff : /host1x/vic@15340000
> 15380000-153bffff : /host1x/nvjpg@15380000
> 15480000-154bffff : /host1x/nvdec@15480000
> 154c0000-154fffff : /host1x/nvenc@154c0000
> 15500000-1553ffff : /host1x/tsec@15500000
> 15600000-1563ffff : /host1x/isp@15600000
> 15700000-157fffff : /host1x/vi@15700000
> 15810000-1581ffff : /host1x/se@15810000
> 15820000-1582ffff : /host1x/se@15820000
> 15830000-1583ffff : /host1x/se@15830000
> 15840000-1584ffff : /host1x/se@15840000
> 17000000-17ffffff : /gp10b
> 18000000-18ffffff : /gp10b
> 80000000-96079fff : System RAM
>  =C2=A0 80280000-817dffff : Kernel code
>  =C2=A0 82040000-823b9fff : Kernel data
> 961bd000-efffffff : System RAM
> f0200000-2757fffff : System RAM
> 275880000-27588ffff : persistent_ram
> 275890000-27589ffff : persistent_ram
> 2758a0000-2758affff : persistent_ram
> 2758b0000-2758bffff : persistent_ram
> 2758c0000-2758cffff : persistent_ram
> 2758d0000-2758dffff : persistent_ram
> 2758e0000-2758effff : persistent_ram
> 2758f0000-2758fffff : persistent_ram
> 275900000-27590ffff : persistent_ram
> 275910000-27591ffff : persistent_ram
> 275920000-27592ffff : persistent_ram
> 275930000-27593ffff : persistent_ram
> 275940000-27594ffff : persistent_ram
> 275950000-27595ffff : persistent_ram
> 275960000-27596ffff : persistent_ram
> 275970000-27597ffff : persistent_ram
> 275980000-27598ffff : persistent_ram
> 275990000-27599ffff : persistent_ram
> 2759a0000-2759affff : persistent_ram
> 2759b0000-2759bffff : persistent_ram
> 2759c0000-2759cffff : persistent_ram
> 2759d0000-2759dffff : persistent_ram
> 2759e0000-2759effff : persistent_ram
> 2759f0000-2759fffff : persistent_ram
> 275a00000-275a7ffff : persistent_ram
> 275e00000-275ffffff : System RAM
> 276600000-2767fffff : System RAM
> 277000000-2771fffff : System RAM

OK, but reservation still doesn't work as needed. There must be no RAM=20
identified by the kernel from 270000000 onward, see comments in=20
jetson-tx2.c.

But there might be more different with your system, just compare the=20
addresses of the persistent memory with the tx2 config. Maybe you have a=20
newer variant of the board. Adding Claudio, maybe he has an idea. But I=20
suspect you will have to update the config for the variations.

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
jailhouse-dev/f34d7c4b-add2-7aef-666d-f132f30da6e9%40siemens.com.
