Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBS7Y7SVAMGQEGHUOBOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CA7F5E2E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 12:49:34 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id 38308e7fff4ca-2c6f3cd892csf7398601fa.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 03:49:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700740173; cv=pass;
        d=google.com; s=arc-20160816;
        b=obMGLlFGtLtF07bRnSrvrbbgGRcLdjzFAqwAvzPXiJMfPICQl9Z1WZiIVClEbg5qt/
         YMBChCOq31GPXFV3mjbnkKG1bJrUBDx7DjNofXPBRepDk0lMck+BR1nKZ3s6zSG10ECn
         gLtoRPr+rXGCMwNsr4J153r+o/5plJ5hDyRZ5uKDc+aCqLH3UbIP27RmeWUcjnpsWMgG
         LcjeSOxUxFtxp1d1QL8RP16cdjsQ+/fufifZD6nIRnl4yITFFmdJTDUcmxYlMIF4DXpn
         9yYQ0mFPoO/9ablrQQhNZj4666GE1WN60vFcgkIkEXTs9b55SgtEsV+58tr/zsE/F4ds
         Vjcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=T0bxkmkgmFyBTlulX6thvjAJlokS6WiED8JB+5kvaxA=;
        fh=8SfdoBx/XJgInw4b9LBcr2wFSMupRjR7ptGMcTO0h8w=;
        b=kp80n0ms5PNL9Km0zIKJeyWKM0vXUTjb3lYWqW/6Fk1TyypuyPKATNzkR9jQx/fdU4
         OqV8xh7ZUa5o2eBXaOVK8xKZILFtFkOZMjcLbA3WKme8X5RbZcQUm4ASzBx7EKs6cSU5
         lK0C0zqL6ebFrRkPBdhw3N+hUQvTTP+LfEJFtGt6QoReXcCWNjJG1h6yfVLWAxUHGv41
         Yd/PsoBfb3yabRAAM/f4AJkf4pd8Ch/AbcfhmigzpdLvI+vuycNTWgiKjjqMQ50nuePq
         VwRS5oTZ2GCzUzbpcbesPVF1rCdA+sD2w4SYrZHxP41i6E4B0td7NMALWhlCvOZG1okc
         W0ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=qON7SOQ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700740173; x=1701344973; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=T0bxkmkgmFyBTlulX6thvjAJlokS6WiED8JB+5kvaxA=;
        b=Z+ZbZhZi6GmFzeGAXzPrM/Mqy4/B+jf6eV8cBs+KTAw/WP/jtL3UP+NWlWNiqDQuyN
         6BTQMMIX1MjnDB7oN35dZy5OyGpnWjMaHqtXruiw+4iu8a99il30m58FoT5VE0Vmoh7c
         oSGUNMBEXXHscrAkUPHEIsOAc00LaUY1vQjWDudN0bdRTxJ8s7k+FnpVneLVPCTfdHKA
         /s+l3t/Ym0HvdIZgcuzGdWnziaT5Z7JZXw/E3FIifN664jXemFwwpN0J7ld8+9WVslBy
         7iwYCS1p5LpXYhKg5xsoHEIShR+iOaJRLPOSr3dlc5RMASepuKN5X2ieG3YmtkoOoPQf
         aaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700740173; x=1701344973;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0bxkmkgmFyBTlulX6thvjAJlokS6WiED8JB+5kvaxA=;
        b=YJXet5OPT9Ypcd0scE0DSRDVguhJ/CmV4R3nrZZh4zAzHFrvpuC5iRnIn77mGc1loj
         tPIrC+1u/vulSzeuoKIYQJmkNF8J9RCDG9fwUW2juqILkRwVlJgr3NKN2qd8yb+FFObe
         WN4NgLB+hjgVgFH8XcEJRJivkkVJ6ZpNyL/ei+Buk8eBvA+7HAofD79L3RS4wPduXQia
         1seB+SQk0YF+alEjMZ4GwbI3iGSZ+wzuuiiuctu5PMpg2Gnn5TLrj5KdTZWYBbsiwfdr
         Dv+kXMFtm/WXA45RVur9EuXEDpyfPCmbO72LD/8CQlVVlMRzJlDD3vY+GGr5vhyBHfUW
         JZgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwJiFQBA9vBeDMiWRYmLfIrfYiDdSwcmqR6JujaN4GtQEh+nwWi
	xKTJ9aEdMlEepTpDMmas/jU=
X-Google-Smtp-Source: AGHT+IEa33jdaEu0rbLmucxHeL4NX9Re9KAXXm1srrPW6FH/Cbnaxbdbzih1ZALeC+1Sh0/pxpOI/w==
X-Received: by 2002:a05:6512:220a:b0:50a:68f0:fb94 with SMTP id h10-20020a056512220a00b0050a68f0fb94mr4516229lfu.9.1700740172024;
        Thu, 23 Nov 2023 03:49:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4013:b0:50a:68f4:6371 with SMTP id
 br19-20020a056512401300b0050a68f46371ls182439lfb.2.-pod-prod-04-eu; Thu, 23
 Nov 2023 03:49:29 -0800 (PST)
X-Received: by 2002:a05:6512:220a:b0:50a:68f0:fb94 with SMTP id h10-20020a056512220a00b0050a68f0fb94mr4516140lfu.9.1700740169200;
        Thu, 23 Nov 2023 03:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700740169; cv=none;
        d=google.com; s=arc-20160816;
        b=QpeUhZct3dmL7iWgii+2abx/NuNp1Gz/J3fdky0UDEWd41hOOgh43J7bF+zw48E8ia
         9SdzCC+98k2dBR464v2dfoWj6e/evnHodnHo2LhPodH7AYspP/AjpO0/dIPMcx0CKQol
         rKbbIpVQ8tvw62VyajlgULLYSU+Qh5Tim6e5muAoccHm7bRdQU3qnpU2fZSsDS+a0qfl
         FHaRZ1s99tD/hEwKV/trSZHZdbEqRc3ivPAnQMEmKNTrIPpHTO9baEZdy6209ZXoXzIC
         JcZkMY/NpZxA/jL/zQB65qjXnn9H9f7+rDixb1/rSOgk+TLeJerUYKA77R8PZEjq36jC
         49SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=01vFtUNR1I8c8FUl81ELADRS/psYAUW+DVJz04DrDpo=;
        fh=8SfdoBx/XJgInw4b9LBcr2wFSMupRjR7ptGMcTO0h8w=;
        b=GIQ+Ffj1kLKwFFRe/NNuJpg2z7gMGynGrPWEI94jS9IUMfbpynA5nmb9yUPtan9eGz
         uXgajmDK9TBtJ58zbitHzfP+PCSGdS//NBXxzz1wZ4NQIKqqHvK37xm8EdLE+ui6olMH
         Vw03uFM2ArNoU7hlMgy1cVT5396Wujctegzp3NGeCyX+2Sj7SrjbqWH9UUyfSt9fBLiG
         ZcbiSrPYXuYplNvUdnCdnNVaORC4ZiEgsaO2SaUwY6U07DyURwZnJMk3zCJwMYgZ344Q
         ARG7GmHjrs2q1qLFh1J2fvXRjqlWiOlyxt4Um0h2Fmc+BJ9IAs7qG79SkzE3ab0rOqzv
         RGLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=qON7SOQ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id o36-20020a05600c512400b0040b336e13a0si80979wms.0.2023.11.23.03.49.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 03:49:29 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [194.95.104.13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 0F52A2E011D;
	Thu, 23 Nov 2023 12:49:25 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4Sbbxd4NlNzxqs;
	Thu, 23 Nov 2023 12:49:25 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 Nov
 2023 12:49:25 +0100
Message-ID: <42e9e931-b628-40a5-8375-cc2a495eff41@oth-regensburg.de>
Date: Thu, 23 Nov 2023 12:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_arm_cortex_A55_support=EF=BC=9F?=
Content-Language: en-US
To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
 <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
 <184a93de-9ba3-4ad2-9771-f114000eeaf5@oth-regensburg.de>
 <2be7b167-688f-4b75-971f-57242f8b443fn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <2be7b167-688f-4b75-971f-57242f8b443fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=qON7SOQ2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 23/11/2023 04:33, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
>  >On 22/11/2023 06:53, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
>  >> I am trying to transplant jailhouse on the A55 core, but now I have
>  >> encountered some problems. After I execute the following command, the
>  >> system will freeze.
>  >> $ jailhouse enable renesas-r9a07g044l2.cell
>  >
>  >No error log? Is the debug console configured correctly?
>=20
> I think there is no problem with the debug console configuration I set up=
.
> Please refer to:
> .debug_console =3D {
>  =C2=A0 =C2=A0 =C2=A0.address =3D 0x1004b800,
>  =C2=A0 =C2=A0 =C2=A0.size =3D 0x400,
>  =C2=A0 =C2=A0 =C2=A0.type =3D JAILHOUSE_CON_TYPE_SCIFA,
>  =C2=A0 =C2=A0 =C2=A0.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CON_REGDIST_4,
> },
>=20
>  >
>  >>
>  >> What are the possible consequences?
>  >>
>  >> I made sure I did the following:
>  >> 1.Linux kernel version 5.10
>  >> 2.Linux starts in EL2
>  >> 3. Turn on KVM
>  >
>  >Do not use KVM in combination with Jailhouse. Disable KVM in your kerne=
l.
>  >
> I turned off KVM as you said but the problem still exists.
> root@smarc-rzg2l:~# dmesg | grep -r kvm
> root@smarc-rzg2l:~# insmod jailhouse.ko
> [123.760797] jailhouse: loading out-of-tree module taints kernel.
> root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
>=20
>=20
>  >Ralf
>  >
>  >> 4. Turn off kernel CONFIG_ARM64_VHE
>=20
> I would also like to add:
> I refer to this post and added mov and ret modifications to entry.S to=20
> output jailhouse is opening.
> However, when using the command jailhouse cell list later, I also=20
> encountered the problem of the serial port being stuck.
> Reference post:=20
> https://groups.google.com/g/jailhouse-dev/c/zwY9bpxq8mg/m/VF44nEC2AwAJ
> log:
> root@smarc-rzg2l:~# insmod jailhouse.ko
> [79.631308] jailhouse: loading out-of-tree module taints kernel.
> root@smarc-rzg2l:~# jailhouse enable renesas-r9a07g044l2.cell
> [85.716867] pci-host-generic e0000000.pci: host bridge /pci@0 ranges:
> [85.723692] pci-host-generic e0000000.pci: MEM=20
> 0x00e0100000..0x00e0103fff -> 0x00e0100000
> [85.733615] pci-host-generic e0000000.pci: ECAM at [mem=20
> 0xe0000000-0xe00fffff] for [bus 00]
> [85.742977] pci-host-generic e0000000.pci: PCI host bridge to bus 0001:00
> [85.749828] pci_bus 0001:00: root bus resource [bus 00]
> [85.755130] pci_bus 0001:00: root bus resource [mem 0xe0100000-0xe0103fff=
]
> [85.763626] pci 0001:00:1f.0: [0ff0:c000] type 0f class 0xc0000f
> [85.769669] pci 0001:00:1f.0: unknown header type 0f, ignoring device
> [85.776475] The Jailhouse is opening.
> root@smarc-rzg2l:~# jailhouse cell list
> ID Name
>=20
> So is this way of modifying entry.S the correct way?

I can not comment on that, I'm not into that issue. If it works for you=20
for the moment to do further evaluation - great! You can of course=20
contact the original authors of the workaround.

Thanks,
   Ralf

>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/2be7b167-688f-4b75-971f-5=
7242f8b443fn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/2be7b167-688f-4b75-971f-57242f8b443fn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/42e9e931-b628-40a5-8375-cc2a495eff41%40oth-regensburg.de.
