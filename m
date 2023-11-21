Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTM76OVAMGQEQTPXVLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 687DF7F328B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 16:42:07 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id 2adb3069b0e04-5079630993dsf5296230e87.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 07:42:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700581326; cv=pass;
        d=google.com; s=arc-20160816;
        b=dMEJpI7r6mTgxwMtGJ+7ry1eB7F8Mx22Zw89gjpM4tGhNxW8pTcI1bVhkil7NoMlXr
         RBi+Wcd5jEV3hImtlaHdNgQNgDCXQxZtGC7H6A0XQHSWX/6NjQvXEhMxhhOfrycnGOdy
         3jd+/Sgcxw1au8zdfCrUWQFy4cD04QpaG/AQMMv9Wz/d1rycfOblZ3Mz5cwajLwYCk4x
         fA6wTEp36iM3Jark0eFz9lmlBWz6XsvDwnDx74lDnmoGot+Zzoim2VsX4VG4WbBRe5Ia
         uwMZrgHK+SgRhm1teiF5dDQ5PQw+kdJa0M91MJA8XgtXHa4hrdj1uTnE3t5x7xBg1Bb7
         p4Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=AwRAlWDfA7j/BKsfdjoIDLvdYP8dJKAGShkxj8o89rM=;
        fh=3GS9BGSzdOIlLnZEGOXnk9YKm5KT4NzPBz2ENBb9RNo=;
        b=eiBEX5bLU+Y/3+lOlZlGqHbJcCMqvqdLxtNpCuvETqz3dOTXt4UnCPQoP19nL1GHm9
         i8ABrllaaGCIdheMF5m2g9yhZXSxAE/2whk5SuTuoDZ+/CttZHXY/IYXQvYPu9akp1kS
         ojXTHpfbieejdWzoqKbVFfetptoYCjKOdrtWgkouAu51E3DH0oyyMSysxCQdDfVRx1YE
         EOMWSFW25Fd6+uyxfUUKvGScRNQQH9HRfwRy9lZMgR25AQawTyth3s+2xKirbDi3thiF
         MmXjRkd/JacTYO6WzEiOLlCpI5nifrTnO0Q0QD/snLMY/MoQaM1dcEPU27gf0jLkYXLQ
         iwTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fWcoTc8u;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700581326; x=1701186126; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AwRAlWDfA7j/BKsfdjoIDLvdYP8dJKAGShkxj8o89rM=;
        b=Rtkv2s0B5kehmFqMXp0TFYrt7t7qMgdYUmUUwTLuLeQ/5colYuRiXIdwirh8zWO79Q
         uvwiI1efyASgi+RrIEaclwZpYg5+vdBMNVSK4A36o1N6Us+VtPLM9K8eW5KSuru4D2Ab
         vNeV5RBgKCgtwixM8e+pwczulT96ezwym17VxfjzlpS81JcNevQ+OHHCRJIWflCbhjQO
         W8yE3pydQQ/jfr3B/hu+OSYE65pfPNWw2MsWRKo5of/hsc4H6oWEFNqqvXMe8byKuaJR
         uRTuYkuPMZ6boUPc1awmf4WlRDa0fYagQgzAfM70eo2n/EUphl0+pieEW+vtgMFZvA2J
         ag6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700581326; x=1701186126;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwRAlWDfA7j/BKsfdjoIDLvdYP8dJKAGShkxj8o89rM=;
        b=uMW17MarYqsCuYgcEnJxbF6x1V/mw4Wob4odCGQ/7PVHLWQgqOA8XYpessBfymEJ3U
         aKJzllXwfserNDPOlO5THd6prBO82Pri6oIY29Do16GNJC9cJ9dE1bWLDX8eTIyoTLVD
         JI1iD5f64Dpb0+dU4yEnB5kfB9jyvyvZW5FCxdFolkQI7JHSrcIF3K6QsBoSDXtVtRcE
         R1cGLlNJbCfTOrcPYk27kQd9cr+maI/pv3bJzlOTjMUiD63gOuUclRuG56r50UQZCWlJ
         0T4mfnVt8BS9hF9werRvMsv+Tn9wH1E0FERhKbNi2cjp6T39bkijK5u9gZlgNsq9PEI/
         6udg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxJ9hrqazEni1IacBHurtG558ZA3EWbS9gCDjlnCWxYGESa2M9J
	MkZhf3rr/eIXd8kFgz1T+D0=
X-Google-Smtp-Source: AGHT+IFlSCU1j4/+/+KilUcxX8aL0CRyjayaRiocQj4XlzncNhOn3GEl3AM7cB8W2YYLHbyxu5YQBA==
X-Received: by 2002:a05:6512:1084:b0:507:9803:ff8b with SMTP id j4-20020a056512108400b005079803ff8bmr10686379lfg.44.1700581325913;
        Tue, 21 Nov 2023 07:42:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1149:b0:507:979a:7f48 with SMTP id
 m9-20020a056512114900b00507979a7f48ls248699lfg.1.-pod-prod-04-eu; Tue, 21 Nov
 2023 07:42:03 -0800 (PST)
X-Received: by 2002:a19:6712:0:b0:50a:764d:7de9 with SMTP id b18-20020a196712000000b0050a764d7de9mr6528291lfc.66.1700581323070;
        Tue, 21 Nov 2023 07:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700581323; cv=none;
        d=google.com; s=arc-20160816;
        b=WFMEhKo/QDBhXd1F+IA0S39dSgsU7Ojh5UR1ljkPHDQAZNvEJQKvrinUCFRUHvtZwN
         YrklCej4eRnlCAc3gyqEHhpJ0P8NL/JChcZFOI1MdGPMx19c0lP4jSkEWGv5rhUAAmHW
         9Ju44UzixvoOed6kWj4lxTtqqfsxmSkWHfu666yNoRsChuk60WpQzIFWGa76uXQTHzO+
         MzzqoOzZ2EbeCO1EArcQHvUub2vJd7igZJNsoMzpdPM1TB3eesctDZo4FHQn5SRpetCN
         gW7DBT/6+L5ZTBeKOEDjYa0G6WQgtJF0COSUasuvBcrA2sLLeYSTZYjaN8C1Pwq41Krs
         zTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/4xo5bxGavn5VZx9BTpSVKCYYlS81XwcGIcNOXFWqTY=;
        fh=3GS9BGSzdOIlLnZEGOXnk9YKm5KT4NzPBz2ENBb9RNo=;
        b=RolxSfE4j9mXaTu6S7dER9TSmXLoNgv1eX2yyVpdT9a6Po/LTbp12/VR0ckeoi4pT8
         DDJCRGC+1BdxSfO3SitRG//wKO/8rZcJL3OB9uqXYIYOesgqgpH+E5km+Uk7228TO+/c
         Y/dTw6CL6PulG7UOZsxC+7z/nlQ+0Ja8DKal5QN1lZ30taDHP80Y00av+KIyX7CR7TSi
         37PeFAb5xre4oIctYvGdAt5qRdVYmBiY5fyJWCpo4YFh3/qmhhF/6V+LMDmILWcbfTm2
         j5qesfai77TAavoBXIyVBXhQXNu0z9Jwh9sxh9ke37AfszeEPyLTv03X2oWziTG1s2iT
         fqsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fWcoTc8u;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id fl19-20020a05600c0b9300b0040b29e29a47si133021wmb.0.2023.11.21.07.42.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:42:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id E490B2A00F4;
	Tue, 21 Nov 2023 16:42:01 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4SZTBx4LN7zxqw;
	Tue, 21 Nov 2023 16:42:01 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 Nov
 2023 16:42:01 +0100
Message-ID: <3b88b7b0-60fd-4fbb-8506-d2d0309c5333@oth-regensburg.de>
Date: Tue, 21 Nov 2023 16:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse enable pci error
Content-Language: en-US
To: Paresh Bhagat <pareshbhagat29@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <2847752b-a183-418c-9c42-42641c6ffe20n@googlegroups.com>
 <261c0edb-f0a7-4384-a300-8a0567c16f8dn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <261c0edb-f0a7-4384-a300-8a0567c16f8dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fWcoTc8u;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Paresh,

On 21/11/2023 05:30, Paresh Bhagat wrote:
> Update. Got the jailhouse enabled but still getting the pci error.
>=20
> nitializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU 3
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/993, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 2... OK
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU v3
> Initializing unit: ARM SMMU
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"
> Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"
> Page pool usage after late setup: mem 79/993, remap 144/131072
> Activating hypervisor
> [ =C2=A0332.417442] pci-host-generic 76000000.pci: host bridge /pci@0 ran=
ges:
> [ =C2=A0332.417476] pci-host-generic 76000000.pci: =C2=A0 =C2=A0 =C2=A0ME=
M=20
> 0x0076100000..0x0076103fff -> 0x0076100000
> [ =C2=A0332.417572] pci-host-generic 76000000.pci: ECAM at [mem=20
> 0x76000000-0x760fffff] for [bus 00]
> [ =C2=A0332.417732] pci-host-generic 76000000.pci: PCI host bridge to bus=
 0001:00
> [ =C2=A0332.417741] pci_bus 0001:00: root bus resource [bus 00]
> [ =C2=A0332.417748] pci_bus 0001:00: root bus resource [mem=20
> 0x76100000-0x76103fff]
> [ =C2=A0332.417793] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000

According to your config, 1:0:0.0 ist the first ivshmem device, 1:0:1.0=20
is the second one, right?

Could you please try to enable one ivshmem device, so please disable the=20
second one for testing. Let's try to get one running, then we can go=20
further.

And for the first ivshmem device, would you consider (just for testing),=20
to only connect two peers? And, in your config, plase use the=20
JAILHOUSE_SHMEM_=E2=80=A6 macros for defining the ivshmem memregions.

Thanks,
   Ralf

> [ =C2=A0332.417819] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x0000fff=
f]
> [ =C2=A0332.418103] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
> [ =C2=A0332.418127] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x0000fff=
f]
> [ =C2=A0332.420175] pci 0001:00:00.0: BAR 0: no space for [mem size 0x000=
10000]
> [ =C2=A0332.420195] pci 0001:00:00.0: BAR 0: failed to assign [mem size=
=20
> 0x00010000]
> [ =C2=A0332.420203] pci 0001:00:01.0: BAR 0: no space for [mem size 0x000=
10000]
> [ =C2=A0332.420209] pci 0001:00:01.0: BAR 0: failed to assign [mem size=
=20
> 0x00010000]
> [ =C2=A0332.420916] The Jailhouse is opening.
> [ =C2=A0332.531915] psci: CPU1 killed (polled 0 ms)
> [ =C2=A0332.579879] psci: CPU2 killed (polled 0 ms)
> [ =C2=A0332.631860] psci: CPU3 killed (polled 0 ms)
>=20
>=20
> On Tuesday, November 21, 2023 at 12:50:49=E2=80=AFAM UTC+5:30 Paresh Bhag=
at wrote:
>=20
>     Any fix for the following error while trying to enable jailhouse ?
>     something wrong with the memory allocation?
>=20
>     Initializing Jailhouse hypervisor v0.12 (324-ge57d1eff-dirty) on CPU =
0
>     Code location: 0x0000ffffc0200800
>     Page pool usage after early setup: mem 39/993, remap 0/131072
>     Initializing processors:
>      =C2=A0CPU 0... OK
>      =C2=A0CPU 2... OK
>      =C2=A0CPU 1... OK
>      =C2=A0CPU 3... OK
>     Initializing unit: irqchip
>     Initializing unit: ARM SMMU v3
>     Initializing unit: ARM SMMU
>     Initializing unit: PVU IOMMU
>     Initializing unit: PCI
>     Adding virtual PCI device 00:00.0 to cell "k3-am62p5-sk"
>     Adding virtual PCI device 00:01.0 to cell "k3-am62p5-sk"
>     Page pool usage after late setup: mem 78/993, remap 144/131072
>     Activating hypervisor
>     [ =C2=A0122.542841] pci-host-generic 76000000.pci: host bridge /pci@0=
 ranges:
>     [ =C2=A0122.542873] pci-host-generic 76000000.pci: =C2=A0 =C2=A0 =C2=
=A0MEM
>     0x0076100000..0x0076103fff -> 0x0076100000
>     [ =C2=A0122.542947] pci-host-generic 76000000.pci: ECAM at [mem
>     0x76000000-0x760fffff] for [bus 00]
>     [ =C2=A0122.543103] pci-host-generic 76000000.pci: PCI host bridge to=
 bus
>     0001:00
>     [ =C2=A0122.543112] pci_bus 0001:00: root bus resource [bus 00]
>     [ =C2=A0122.543119] pci_bus 0001:00: root bus resource [mem
>     0x76100000-0x76103fff]
>     root@am62pxx-evm:/usr/share/jailhouse# [ =C2=A0122.543161] pci
>     0001:00:00.0: [110a:4106] type 00 class 0xff0000
>     [ =C2=A0122.543187] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x000=
0ffff]
>     [ =C2=A0122.543455] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0=
001
>     [ =C2=A0122.543481] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x000=
0ffff]
>     [ =C2=A0122.545437] pci 0001:00:00.0: BAR 0: no space for [mem size
>     0x00010000]
>     [ =C2=A0122.545458] pci 0001:00:00.0: BAR 0: failed to assign [mem si=
ze
>     0x00010000]
>     [ =C2=A0122.545466] pci 0001:00:01.0: BAR 0: no space for [mem size
>     0x00010000]
>     [ =C2=A0122.545471] pci 0001:00:01.0: BAR 0: failed to assign [mem si=
ze
>     0x00010000]
>     [ =C2=A0122.545896] The Jailhouse is opening.
>     Unhandled data read at 0xb00328(4)
>     FATAL: unhandled trap (exception class 0x24)
>=20
>     i have attached root cell config and output of cat /proc/iomem for
>     referrence.
>=20
>     Thanks
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/261c0edb-f0a7-4384-a300-8=
a0567c16f8dn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/261c0edb-f0a7-4384-a300-8a0567c16f8dn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3b88b7b0-60fd-4fbb-8506-d2d0309c5333%40oth-regensburg.de.
