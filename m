Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZXC32NQMGQEYVKU3HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41062FA26
	for <lists+jailhouse-dev@lfdr.de>; Fri, 18 Nov 2022 17:23:04 +0100 (CET)
Received: by mail-ej1-x638.google.com with SMTP id sh31-20020a1709076e9f00b007ae32b7eb51sf3293115ejc.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 18 Nov 2022 08:23:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668788583; cv=pass;
        d=google.com; s=arc-20160816;
        b=VJKXH0tLKyIdmklrzH42YnLM1ltqjsXOXR9NRguBRReWGj/HUauFKYEWap9nPmyKOA
         Hk8BoVFNJ8CJWktyzBfVKTFS9leXk59lCeonrGns2rDB9xGfzD9Cbtyyfzo/Pk+UNZV5
         6xvoyyqWHDWj9N77zuKu9GPkhBHbkNWA09p4hnO2mpjp5nF2Li2LfZnblchANen0di0x
         +d/5s0oJkcWH35TsSXhOP9On95by8Y2JY5hljvoFPbcKblr508xK+caoTynlA+Vu+yFn
         z0Et4abwaP7+sRJhS73WVR90cCV9gebeRfOHt+YpaiXmFY5HTwXdDTp0WVkVX9LuPaug
         2lMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=cJeYb+ognz4OgRhMUBndIK0bWlveAVS8tSES1t9pGvc=;
        b=o9oXhQ1BkyxCnJU8X2xYNKXF0EAMPPof06huGRp6kiDpsGp6vpcf1gQkwUwWbEYeaQ
         S58iF8zoygSsBvLQbyK/z2sTdd/f4jre5fzvacEuCgndtXddDGx70V0tg81mmTN++D1l
         o4uG3YCF8ybhJHyqVkhJ9klMTyqstqMDbZ7hLoZ6ZYK3YTaam4xxEF/PZBZO2M5HmXtC
         zbnmtnobeEoVkM6416unQLi5giNDuehYHLzA16Uxpu6puC+CwYRNS2mmxBpTw0Eqlxch
         WWluX6e9YEY2UPqvPqiGdlshuOdRHVo8G0Z2kyjW/rSopy6R13SvX3Hr7VcLvEFIsWf4
         ivaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qHPzcw8O;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cJeYb+ognz4OgRhMUBndIK0bWlveAVS8tSES1t9pGvc=;
        b=hZVM3veVqNTnjAD14RTt9dAygqUGo78/QnD21Ghu1M+kdmD1rMMtx58O3lKmL6iNI4
         VLQOdFJqdrrVWVN6gBcYytjrBSjRxaILKbYCBtfQEh9wYHa3ZmXeH2ET1pJDJrze2Af0
         rayHtkKYsObyv6peW2WBBLLOK38CarowkvTTTBAbjTB/w/AFLt4aT11MGYRxp8ltKx2c
         NjaHgnWF98xKzvwWZICmMtF77JYxKNP+LWV6XTR/iiFXgKtsjPhtUX5MjNZPNLA+zmBG
         OcgEGDLYBY65cU98trNzDPXcg67txFNQ2JwAW3VEc5sUucXKG1rgFNbDRpREcBDBPHuN
         dnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJeYb+ognz4OgRhMUBndIK0bWlveAVS8tSES1t9pGvc=;
        b=bNz60EkxKnMKhkGyWx0qgklPymjw286vknWXUqEq/m9yaCmbBlPQ0zCBF44e9cDHrN
         QDacdFfGz3picqqnq7B7Gcyq4VxKEEX50qNU8tJnYWXFRvDqDI505XKQGxZHY9SW4pAE
         At/dESDcr9lSHD0Ywse9bFgMT/sLGjCUdmE2Vr+A5+YaGpRHVMP1Vj94LmUDA6kAQVqt
         T8NTPkhLasZ8jAU/GEa/OOMNDtT8Fmmpl5Wyk213aSoh+P/5jaDqSot2AZZIOTEhAnKH
         yjYPR8Oq+bnO61FYCdc+GlE2sJksSS8pxGIw5lmuUKw6Zdt78zaY7x1JFm48p9VpDpn0
         Gh3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnNsZX14xvJfxSlUG3CrdKMigF60mYPEytH+iXuJms0HCBkGfi3
	p0HPS5XqcsyDMqCu7ogG0qc=
X-Google-Smtp-Source: AA0mqf4hGvt+LU0X5b/zTVaOtOwE8PJCeEWiKJ2KN/k9ISmU3RYt+fBn0EP48M2etv+Z5VbugaqqaQ==
X-Received: by 2002:a17:906:a40c:b0:7ae:180e:9b53 with SMTP id l12-20020a170906a40c00b007ae180e9b53mr6733545ejz.206.1668788583732;
        Fri, 18 Nov 2022 08:23:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:443:b0:7af:1b1:9648 with SMTP id e3-20020a170906044300b007af01b19648ls3050401eja.1.-pod-prod-gmail;
 Fri, 18 Nov 2022 08:23:01 -0800 (PST)
X-Received: by 2002:a17:907:a06f:b0:7ad:948f:11bb with SMTP id ia15-20020a170907a06f00b007ad948f11bbmr6550644ejc.354.1668788581721;
        Fri, 18 Nov 2022 08:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668788581; cv=none;
        d=google.com; s=arc-20160816;
        b=scxA8qbPJibimHA3SuP7LBCvfHnSq0wWoBgKCRVqBlPGxzXCwrzaye6L8zaRzbc78X
         2b5x7c3Ul+lgMDcDYZHCgpP2QjGG8paPOTM7Lbaqvuj1teskDUycExwRsKsmk8/aNV3I
         V7U4IMdn8GO7rXe1HlRAPItibeHUU3Vftdu5QY/s30fuZY3nMoKAe4k0UnLu3hQv/vah
         ExLgu1nGTkfCSRQJ6AQhJGlxrMg/wF+SBqK7XcE6uU1tTZr0L3uMn+F8xO1Iw3lN8HBv
         7Tj/Mt4s0aYAu6zthMLZzUI+ezzFgL9TPZLHaqmN5PAjsJkJ4Jb449Rn0e15oRbndqml
         wAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qAHvKCxk6I4tU2JdLlmkrOCODVmyZN1oh4eT69iuZd4=;
        b=W9f9Fan+oPY5IcPLvOKliN/NqRDKeXYQPUhgQW+hX71Vx5TechZMGJq1n+beyQafWY
         veps/2x3XUsmVX/cNcG2RGEMLxtUcTxp30q47ykL9eNrBRWe0RWJlUp5FgtKjNFOLSUP
         NrTYMwn8JFdwOX9uoU4/Xt57XbsW6psHv72zjF95lNH4DqH8iBFSOC+VZTelncZUYVuw
         BRIREIQ8z9lcDXYc6RWE2KuP4fvg35zkv30ve23GltmM4Tc0eAuImWMrYDPWOoqH0lM/
         8aDRMZAlEEzNXSHj97cyr6gZIhlOWbnbaxDzFupAURQId6hxly2/ReKyltrqgBgt1kZm
         GdSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qHPzcw8O;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id dy17-20020a05640231f100b004621a13c733si181594edb.1.2022.11.18.08.23.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:23:01 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NDMX51Fv2zxws;
	Fri, 18 Nov 2022 17:23:01 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:e089:ee05:7189:d907]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 17:23:00 +0100
Message-ID: <79cf1f00-9c20-404e-150b-42142c804d3e@oth-regensburg.de>
Date: Fri, 18 Nov 2022 17:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Content-Language: en-US
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>, Henning Schild
	<henning.schild@siemens.com>
CC: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
 <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
 <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=qHPzcw8O;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 18/11/2022 02:19, Karim Manaouil wrote:
> Hi Henning,
>=20
> I spent some more time debugging the issue.
> I am getting a "FATAL: Invalid MMIO/RAM write".
> Probably it's happening right after the first cpu that
> calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().
>=20
> Not sure why, but maybe you have some pointers.
>=20
> Here is the jailhouse output copy-pasted below.
>=20
> Cheers
>=20
> Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
> Code location: 0xfffffffff0000050
> Using xAPIC
> Page pool usage after early setup: mem 813/7635, remap 1/131072
> Initializing processors:

Ok, having read your log, you have (at the moment) at least two issues:

First:

 > FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2

For the moment, go to your config and allow write access to that=20
capability. I could maybe help you with this if you share your config.=20
Please also attach lspci -vvv.

I can send you the config diff, and in the long run, you need to=20
understand what the changes mean.

Second:

 > FATAL: Unhandled MSR read: c0002001

That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine Check=20
Events (MCE) in your kernel config or add appropriate parameters to your=20
kernel to disable them.

Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=3Doff to=
=20
your kernel parameters.

HTH,

   Ralf

>  =C2=A0CPU 6... (APIC ID 48) OK
>  =C2=A0CPU 64... (APIC ID 1) OK
>  =C2=A0CPU 0... (APIC ID 0) OK
>  =C2=A0CPU 16... (APIC ID 2) OK
>  =C2=A0CPU 112... (APIC ID 7) OK
>  =C2=A0CPU 104... (APIC ID 13) OK
>  =C2=A0CPU 40... (APIC ID 12) OK
>  =C2=A0CPU 72... (APIC ID 9) OK
>  =C2=A0CPU 8... (APIC ID 8) OK
>  =C2=A0CPU 56... (APIC ID 14) OK
>  =C2=A0CPU 120... (APIC ID 15) OK
>  =C2=A0CPU 110... (APIC ID 61) OK
>  =C2=A0CPU 46... (APIC ID 60) OK
>  =C2=A0CPU 14... (APIC ID 56) OK
>  =C2=A0CPU 78... (APIC ID 57) OK
>  =C2=A0CPU 94... (APIC ID 59) OK
>  =C2=A0CPU 30... (APIC ID 58) OK
>  =C2=A0CPU 126... (APIC ID 63) OK
>  =C2=A0CPU 62... (APIC ID 62) OK
>  =C2=A0CPU 2... (APIC ID 16) OK
>  =C2=A0CPU 66... (APIC ID 17) OK
>  =C2=A0CPU 18... (APIC ID 18) OK
>  =C2=A0CPU 82... (APIC ID 19) OK
>  =C2=A0CPU 114... (APIC ID 23) OK
>  =C2=A0CPU 50... (APIC ID 22) OK
>  =C2=A0CPU 98... (APIC ID 21) OK
>  =C2=A0CPU 34... (APIC ID 20) OK
>  =C2=A0CPU 12... (APIC ID 40) OK
>  =C2=A0CPU 76... (APIC ID 41) OK
>  =C2=A0CPU 60... (APIC ID 46) OK
>  =C2=A0CPU 124... (APIC ID 47) OK
>  =C2=A0CPU 44... (APIC ID 44) OK
>  =C2=A0CPU 108... (APIC ID 45) OK
>  =C2=A0CPU 92... (APIC ID 43) OK
>  =C2=A0CPU 28... (APIC ID 42) OK
>  =C2=A0CPU 26... (APIC ID 26) OK
>  =C2=A0CPU 90... (APIC ID 27) OK
>  =C2=A0CPU 74... (APIC ID 25) OK
>  =C2=A0CPU 10... (APIC ID 24) OK
>  =C2=A0CPU 106... (APIC ID 29) OK
>  =C2=A0CPU 42... (APIC ID 28) OK
>  =C2=A0CPU 58... (APIC ID 30) OK
>  =C2=A0CPU 122... (APIC ID 31) OK
>  =C2=A0CPU 20... (APIC ID 34) OK
>  =C2=A0CPU 84... (APIC ID 35) OK
>  =C2=A0CPU 36... (APIC ID 36) OK
>  =C2=A0CPU 100... (APIC ID 37) OK
>  =C2=A0CPU 116... (APIC ID 39) OK
>  =C2=A0CPU 52... (APIC ID 38) OK
>  =C2=A0CPU 4... (APIC ID 32) OK
>  =C2=A0CPU 68... (APIC ID 33) OK
>  =C2=A0CPU 96... (APIC ID 5) OK
>  =C2=A0CPU 32... (APIC ID 4) OK
>  =C2=A0CPU 88... (APIC ID 11) OK
>  =C2=A0CPU 55... (APIC ID 118) OK
>  =C2=A0CPU 119... (APIC ID 119) OK
>  =C2=A0CPU 87... (APIC ID 115) OK
>  =C2=A0CPU 23... (APIC ID 114) OK
>  =C2=A0CPU 71... (APIC ID 113) OK
>  =C2=A0CPU 7... (APIC ID 112) OK
>  =C2=A0CPU 39... (APIC ID 116) OK
>  =C2=A0CPU 103... (APIC ID 117) OK
>  =C2=A0CPU 47... (APIC ID 124) OK
>  =C2=A0CPU 111... (APIC ID 125) OK
>  =C2=A0CPU 15... (APIC ID 120) OK
>  =C2=A0CPU 79... (APIC ID 121) OK
>  =C2=A0CPU 31... (APIC ID 122) OK
>  =C2=A0CPU 95... (APIC ID 123) OK
>  =C2=A0CPU 127... (APIC ID 127) OK
>  =C2=A0CPU 63... (APIC ID 126) OK
>  =C2=A0CPU 86... (APIC ID 51) OK
>  =C2=A0CPU 22... (APIC ID 50) OK
>  =C2=A0CPU 38... (APIC ID 52) OK
>  =C2=A0CPU 102... (APIC ID 53) OK
>  =C2=A0CPU 118... (APIC ID 55) OK
>  =C2=A0CPU 54... (APIC ID 54) OK
>  =C2=A0CPU 70... (APIC ID 49) OK
>  =C2=A0CPU 109... (APIC ID 109) OK
>  =C2=A0CPU 45... (APIC ID 108) OK
>  =C2=A0CPU 93... (APIC ID 107) OK
>  =C2=A0CPU 29... (APIC ID 106) OK
>  =C2=A0CPU 13... (APIC ID 104) OK
>  =C2=A0CPU 77... (APIC ID 105) OK
>  =C2=A0CPU 61... (APIC ID 110) OK
>  =C2=A0CPU 125... (APIC ID 111) OK
>  =C2=A0CPU 5... (APIC ID 96) OK
>  =C2=A0CPU 101... (APIC ID 101) OK
>  =C2=A0CPU 37... (APIC ID 100) OK
>  =C2=A0CPU 85... (APIC ID 99) OK
>  =C2=A0CPU 21... (APIC ID 98) OK
>  =C2=A0CPU 117... (APIC ID 103) OK
>  =C2=A0CPU 53... (APIC ID 102) OK
>  =C2=A0CPU 69... (APIC ID 97) OK
>  =C2=A0CPU 49... (APIC ID 70) OK
>  =C2=A0CPU 1... (APIC ID 64) OK
>  =C2=A0CPU 65... (APIC ID 65) OK
>  =C2=A0CPU 81... (APIC ID 67) OK
>  =C2=A0CPU 17... (APIC ID 66) OK
>  =C2=A0CPU 97... (APIC ID 69) OK
>  =C2=A0CPU 33... (APIC ID 68) OK
>  =C2=A0CPU 113... (APIC ID 71) OK
>  =C2=A0CPU 25... (APIC ID 74) OK
>  =C2=A0CPU 89... (APIC ID 75) OK
>  =C2=A0CPU 41... (APIC ID 76) OK
>  =C2=A0CPU 105... (APIC ID 77) OK
>  =C2=A0CPU 9... (APIC ID 72) OK
>  =C2=A0CPU 73... (APIC ID 73) OK
>  =C2=A0CPU 121... (APIC ID 79) OK
>  =C2=A0CPU 57... (APIC ID 78) OK
>  =C2=A0CPU 3... (APIC ID 80) OK
>  =C2=A0CPU 67... (APIC ID 81) OK
>  =C2=A0CPU 35... (APIC ID 84) OK
>  =C2=A0CPU 99... (APIC ID 85) OK
>  =C2=A0CPU 115... (APIC ID 87) OK
>  =C2=A0CPU 51... (APIC ID 86) OK
>  =C2=A0CPU 19... (APIC ID 82) OK
>  =C2=A0CPU 83... (APIC ID 83) OK
>  =C2=A0CPU 107... (APIC ID 93) OK
>  =C2=A0CPU 43... (APIC ID 92) OK
>  =C2=A0CPU 11... (APIC ID 88) OK
>  =C2=A0CPU 75... (APIC ID 89) OK
>  =C2=A0CPU 123... (APIC ID 95) OK
>  =C2=A0CPU 59... (APIC ID 94) OK
>  =C2=A0CPU 27... (APIC ID 90) OK
>  =C2=A0CPU 24... (APIC ID 10) OK
>  =C2=A0CPU 80... (APIC ID 3) OK
>  =C2=A0CPU 48... (APIC ID 6) OK
>  =C2=A0CPU 91... (APIC ID 91) OK
> Initializing unit: AMD IOMMU
> AMD IOMMU @0xa1700000/0x80000
> Initializing unit: IOAPIC
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:01.0 to cell "RootCell"
> Adding PCI device 00:01.1 to cell "RootCell"
> Adding PCI device 00:01.3 to cell "RootCell"
> Adding PCI device 00:01.4 to cell "RootCell"
> Adding PCI device 00:02.0 to cell "RootCell"
> Adding PCI device 00:03.0 to cell "RootCell"
> Adding PCI device 00:04.0 to cell "RootCell"
> Adding PCI device 00:07.0 to cell "RootCell"
> Adding PCI device 00:07.1 to cell "RootCell"
> Adding PCI device 00:08.0 to cell "RootCell"
> Adding PCI device 00:08.1 to cell "RootCell"
> Adding PCI device 00:14.0 to cell "RootCell"
> Adding PCI device 00:14.3 to cell "RootCell"
> Adding PCI device 00:18.0 to cell "RootCell"
> Adding PCI device 00:18.1 to cell "RootCell"
> Adding PCI device 00:18.2 to cell "RootCell"
> Adding PCI device 00:18.3 to cell "RootCell"
> Adding PCI device 00:18.4 to cell "RootCell"
> Adding PCI device 00:18.5 to cell "RootCell"
> Adding PCI device 00:18.6 to cell "RootCell"
> Adding PCI device 00:18.7 to cell "RootCell"
> Adding PCI device 00:19.0 to cell "RootCell"
> Adding PCI device 00:19.1 to cell "RootCell"
> Adding PCI device 00:19.2 to cell "RootCell"
> Adding PCI device 00:19.3 to cell "RootCell"
> Adding PCI device 00:19.4 to cell "RootCell"
> Adding PCI device 00:19.5 to cell "RootCell"
> Adding PCI device 00:19.6 to cell "RootCell"
> Adding PCI device 00:19.7 to cell "RootCell"
> Adding PCI device 00:1a.0 to cell "RootCell"
> Adding PCI device 00:1a.1 to cell "RootCell"
> Adding PCI device 00:1a.2 to cell "RootCell"
> Adding PCI device 00:1a.3 to cell "RootCell"
> Adding PCI device 00:1a.4 to cell "RootCell"
> Adding PCI device 00:1a.5 to cell "RootCell"
> Adding PCI device 00:1a.6 to cell "RootCell"
> Adding PCI device 00:1a.7 to cell "RootCell"
> Adding PCI device 00:1b.0 to cell "RootCell"
> Adding PCI device 00:1b.1 to cell "RootCell"
> Adding PCI device 00:1b.2 to cell "RootCell"
> Adding PCI device 00:1b.3 to cell "RootCell"
> Adding PCI device 00:1b.4 to cell "RootCell"
> Adding PCI device 00:1b.5 to cell "RootCell"
> Adding PCI device 00:1b.6 to cell "RootCell"
> Adding PCI device 00:1b.7 to cell "RootCell"
> Adding PCI device 00:1c.0 to cell "RootCell"
> Adding PCI device 00:1c.1 to cell "RootCell"
> Adding PCI device 00:1c.2 to cell "RootCell"
> Adding PCI device 00:1c.3 to cell "RootCell"
> Adding PCI device 00:1c.4 to cell "RootCell"
> Adding PCI device 00:1c.5 to cell "RootCell"
> Adding PCI device 00:1c.6 to cell "RootCell"
> Adding PCI device 00:1c.7 to cell "RootCell"
> Adding PCI device 00:1d.0 to cell "RootCell"
> Adding PCI device 00:1d.1 to cell "RootCell"
> Adding PCI device 00:1d.2 to cell "RootCell"
> Adding PCI device 00:1d.3 to cell "RootCell"
> Adding PCI device 00:1d.4 to cell "RootCell"
> Adding PCI device 00:1d.5 to cell "RootCell"
> Adding PCI device 00:1d.6 to cell "RootCell"
> Adding PCI device 00:1d.7 to cell "RootCell"
> Adding PCI device 00:1e.0 to cell "RootCell"
> Adding PCI device 00:1e.1 to cell "RootCell"
> Adding PCI device 00:1e.2 to cell "RootCell"
> Adding PCI device 00:1e.3 to cell "RootCell"
> Adding PCI device 00:1e.4 to cell "RootCell"
> Adding PCI device 00:1e.5 to cell "RootCell"
> Adding PCI device 00:1e.6 to cell "RootCell"
> Adding PCI device 00:1e.7 to cell "RootCell"
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.1 to cell "RootCell"
> Adding PCI device 00:1f.2 to cell "RootCell"
> Adding PCI device 00:1f.3 to cell "RootCell"
> Adding PCI device 00:1f.4 to cell "RootCell"
> Adding PCI device 00:1f.5 to cell "RootCell"
> Adding PCI device 00:1f.6 to cell "RootCell"
> Adding PCI device 00:1f.7 to cell "RootCell"
> Adding PCI device 01:00.0 to cell "RootCell"
> Adding PCI device 01:00.1 to cell "RootCell"
> Adding PCI device 02:00.0 to cell "RootCell"
> Adding PCI device 03:00.0 to cell "RootCell"
> Adding PCI device 04:00.0 to cell "RootCell"
> Adding PCI device 04:00.1 to cell "RootCell"
> Adding PCI device 05:00.0 to cell "RootCell"
> Adding PCI device 05:00.2 to cell "RootCell"
> Adding PCI device 05:00.3 to cell "RootCell"
> Adding PCI device 06:00.0 to cell "RootCell"
> Adding PCI device 06:00.1 to cell "RootCell"
> Adding PCI device 06:00.2 to cell "RootCell"
> Adding PCI device 20:00.0 to cell "RootCell"
> Adding PCI device 20:00.2 to cell "RootCell"
> Adding PCI device 20:01.0 to cell "RootCell"
> Adding PCI device 20:01.1 to cell "RootCell"
> Adding PCI device 20:02.0 to cell "RootCell"
> Adding PCI device 20:03.0 to cell "RootCell"
> Adding PCI device 20:04.0 to cell "RootCell"
> Adding PCI device 20:07.0 to cell "RootCell"
> Adding PCI device 20:07.1 to cell "RootCell"
> Adding PCI device 20:08.0 to cell "RootCell"
> Adding PCI device 20:08.1 to cell "RootCell"
> Adding PCI device 21:00.0 to cell "RootCell"
> Adding PCI device 21:00.1 to cell "RootCell"
> Adding PCI device 22:08.0 to cell "RootCell"
> Adding PCI device 23:00.0 to cell "RootCell"
> Adding PCI device 24:00.0 to cell "RootCell"
> Adding PCI device 24:00.2 to cell "RootCell"
> Adding PCI device 24:00.3 to cell "RootCell"
> Adding PCI device 25:00.0 to cell "RootCell"
> Adding PCI device 25:00.1 to cell "RootCell"
> Adding PCI device 40:00.0 to cell "RootCell"
> Adding PCI device 40:00.2 to cell "RootCell"
> Adding PCI device 40:01.0 to cell "RootCell"
> Adding PCI device 40:02.0 to cell "RootCell"
> Adding PCI device 40:03.0 to cell "RootCell"
> Adding PCI device 40:03.1 to cell "RootCell"
> Adding PCI device 40:04.0 to cell "RootCell"
> Adding PCI device 40:07.0 to cell "RootCell"
> Adding PCI device 40:07.1 to cell "RootCell"
> Adding PCI device 40:08.0 to cell "RootCell"
> Adding PCI device 40:08.1 to cell "RootCell"
> Adding PCI device 41:00.0 to cell "RootCell"
> Adding PCI device 41:00.1 to cell "RootCell"
> Adding PCI device 42:00.0 to cell "RootCell"
> Adding PCI device 42:00.2 to cell "RootCell"
> Adding PCI device 43:00.0 to cell "RootCell"
> Adding PCI device 43:00.1 to cell "RootCell"
> Adding PCI device 60:00.0 to cell "RootCell"
> Adding PCI device 60:00.2 to cell "RootCell"
> Adding PCI device 60:01.0 to cell "RootCell"
> Adding PCI device 60:02.0 to cell "RootCell"
> Adding PCI device 60:03.0 to cell "RootCell"
> Adding PCI device 60:03.1 to cell "RootCell"
> Adding PCI device 60:04.0 to cell "RootCell"
> Adding PCI device 60:07.0 to cell "RootCell"
> Adding PCI device 60:07.1 to cell "RootCell"
> Adding PCI device 60:08.0 to cell "RootCell"
> Adding PCI device 60:08.1 to cell "RootCell"
> Adding PCI device 61:00.0 to cell "RootCell"
> Adding PCI device 62:00.0 to cell "RootCell"
> Adding PCI device 62:00.2 to cell "RootCell"
> Adding PCI device 63:00.0 to cell "RootCell"
> Adding PCI device 63:00.1 to cell "RootCell"
> Adding PCI device 80:00.0 to cell "RootCell"
> Adding PCI device 80:00.2 to cell "RootCell"
> Adding PCI device 80:01.0 to cell "RootCell"
> Adding PCI device 80:02.0 to cell "RootCell"
> Adding PCI device 80:03.0 to cell "RootCell"
> Adding PCI device 80:04.0 to cell "RootCell"
> Adding PCI device 80:07.0 to cell "RootCell"
> Adding PCI device 80:07.1 to cell "RootCell"
> Adding PCI device 80:08.0 to cell "RootCell"
> Adding PCI device 80:08.1 to cell "RootCell"
> Adding PCI device 81:00.0 to cell "RootCell"
> Adding PCI device 81:00.2 to cell "RootCell"
> Adding PCI device 82:00.0 to cell "RootCell"
> Adding PCI device 82:00.1 to cell "RootCell"
> Adding PCI device a0:00.0 to cell "RootCell"
> Adding PCI device a0:00.2 to cell "RootCell"
> Adding PCI device a0:01.0 to cell "RootCell"
> Adding PCI device a0:02.0 to cell "RootCell"
> Adding PCI device a0:03.0 to cell "RootCell"
> Adding PCI device a0:04.0 to cell "RootCell"
> Adding PCI device a0:07.0 to cell "RootCell"
> Adding PCI device a0:07.1 to cell "RootCell"
> Adding PCI device a0:08.0 to cell "RootCell"
> Adding PCI device a0:08.1 to cell "RootCell"
> Adding PCI device a1:00.0 to cell "RootCell"
> Adding PCI device a1:00.2 to cell "RootCell"
> Adding PCI device a2:00.0 to cell "RootCell"
> Adding PCI device a2:00.1 to cell "RootCell"
> Adding PCI device c0:00.0 to cell "RootCell"
> Adding PCI device c0:00.2 to cell "RootCell"
> Adding PCI device c0:01.0 to cell "RootCell"
> Adding PCI device c0:02.0 to cell "RootCell"
> Adding PCI device c0:03.0 to cell "RootCell"
> Adding PCI device c0:03.1 to cell "RootCell"
> Adding PCI device c0:03.2 to cell "RootCell"
> Adding PCI device c0:03.3 to cell "RootCell"
> Adding PCI device c0:03.4 to cell "RootCell"
> Adding PCI device c0:04.0 to cell "RootCell"
> Adding PCI device c0:07.0 to cell "RootCell"
> Adding PCI device c0:07.1 to cell "RootCell"
> Adding PCI device c0:08.0 to cell "RootCell"
> Adding PCI device c0:08.1 to cell "RootCell"
> Adding PCI device c1:00.0 to cell "RootCell"
> Adding PCI device c2:00.0 to cell "RootCell"
> Adding PCI device c3:00.0 to cell "RootCell"
> Adding PCI device c4:00.0 to cell "RootCell"
> Adding PCI device c5:00.0 to cell "RootCell"
> Adding PCI device c5:00.2 to cell "RootCell"
> Adding PCI device c6:00.0 to cell "RootCell"
> Adding PCI device c6:00.1 to cell "RootCell"
> Adding PCI device e0:00.0 to cell "RootCell"
> Adding PCI device e0:00.2 to cell "RootCell"
> Adding PCI device e0:01.0 to cell "RootCell"
> Adding PCI device e0:02.0 to cell "RootCell"
> Adding PCI device e0:03.0 to cell "RootCell"
> Adding PCI device e0:04.0 to cell "RootCell"
> Adding PCI device e0:07.0 to cell "RootCell"
> Adding PCI device e0:07.1 to cell "RootCell"
> Adding PCI device e0:08.0 to cell "RootCell"
> Adding PCI device e0:08.1 to cell "RootCell"
> Adding PCI device e1:00.0 to cell "RootCell"
> Adding PCI device e1:00.2 to cell "RootCell"
> Adding PCI device e2:00.0 to cell "RootCell"
> Adding PCI device e2:00.1 to cell "RootCell"
> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
> FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4
> RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6
> RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000000000030
> RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffffff003
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003506e0
> EFER: 0x0000000000001d01
> Parking CPU 76 (Cell: "RootCell")
> Ignoring NMI IPI to CPU 1
> Ignoring NMI IPI to CPU 2
> Ignoring NMI IPI to CPU 3
> Ignoring NMI IPI to CPU 4
> Ignoring NMI IPI to CPU 5
> Ignoring NMI IPI to CPU 6
> Ignoring NMI IPI to CPU 7
> Ignoring NMI IPI to CPU 76
> Ignoring NMI IPI to CPU 1
> Ignoring NMI IPI to CPU 2
> Ignoring NMI IPI to CPU 3
> Ignoring NMI IPI to CPU 4
> Ignoring NMI IPI to CPU 5
> Ignoring NMI IPI to CPU 6
> Ignoring NMI IPI to CPU 7
> Ignoring NMI IPI to CPU 76
> Ignoring NMI IPI to CPU 1
> Ignoring NMI IPI to CPU 2
> Ignoring NMI IPI to CPU 3
> Ignoring NMI IPI to CPU 4
> Ignoring NMI IPI to CPU 5
> FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
> RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46
> RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000000b4
> RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa9401790
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003506e0
> EFER: 0x0000000000001d01
> Parking CPU 24 (Cell: "RootCell")
> Ignoring NMI IPI to CPU 6
> Ignoring NMI IPI to CPU 7
> FATAL: Unhandled MSR read: c0002001
> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246
> RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c0002001
> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c0002001
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003506e0
> EFER: 0x0000000000001d01
> Parking CPU 68 (Cell: "RootCell")
> FATAL: Unhandled MSR read: c0002001
> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246
> RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c0002001
> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c0002001
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003506e0
> EFER: 0x0000000000001d01
> Parking CPU 44 (Cell: "RootCell")
>=20
> ------------------------------------------------------------------------
> *From:* Henning Schild <henning.schild@siemens.com>
> *Sent:* 14 November 2022 09:22
> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
> *Cc:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>;=20
> jan.kiszka@siemens.com <jan.kiszka@siemens.com>;=20
> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
> *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that=20
> the email is genuine and the content is safe.
>=20
> Am Sun, 13 Nov 2022 22:24:45 +0000
> schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:
>=20
>> Hi Ralf,
>>
>> Thanks for the reply!
>>
>> >Did you use jailhouse-config-create?
>>
>> I am using `jailhouse config create` to generate the sysconfig.c file.
>>
>> >You can use the --mem-hv option to
>> increate the memory. Try, for example, 32MiB and see if it works.
>>
>> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
>> The driver prints "The Jailhouse is opening" on dmesg. However, right
>> after that the CPUs get stuck, and I get rcu_sched detected stalls.
>> The system is completely irresponsive.
>>
>> I attached a text file containing the full output from dmesg. Here is
>> the initial part:
>=20
> I guess the output of the hypervisor might also be valuable here.
> According to its spec that machine should have a serial port, and with
> that default config from the generate script you should see logs coming
> out of there. With the usual 115200 8n1
>=20
> Henning
>=20
>> [=C2=A0 434.792008] The Jailhouse is opening.
>> [=C2=A0 455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>> [=C2=A0 455.793303] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 1-...0: (839 GPs behind=
)
>> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [=C2=A0 455=
.802292]
>> rcu:=C2=A0=C2=A0=C2=A0=C2=A0 2-...0: (144 GPs behind) idle=3D812/1/0x400=
0000000000000
>> softirq=3D905/905 fqs=3D1827 [=C2=A0 455.811276] rcu:=C2=A0=C2=A0=C2=A0=
=C2=A0 3-...0: (144 GPs
>> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
>> 455.820266] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 4-...0: (1 GPs behind)
>> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
>> 455.829252] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 5-...0: (144 GPs behind)
>> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [=C2=A0 455=
.838238]
>> rcu:=C2=A0=C2=A0=C2=A0=C2=A0 6-...0: (144 GPs behind) idle=3D912/1/0x400=
0000000000000
>> softirq=3D777/777 fqs=3D1827 [=C2=A0 455.847218] rcu:=C2=A0=C2=A0=C2=A0=
=C2=A0 7-...0: (144 GPs
>> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827 [
>> 455.856404]=C2=A0 (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364)=
 [
>> 455.862170] Sending NMI from CPU 87 to CPUs 1: [=C2=A0 465.776884] Sendi=
ng
>> NMI from CPU 87 to CPUs 2: [=C2=A0 467.182686] watchdog: BUG: soft locku=
p
>> - CPU#0 stuck for 23s! [kworker/0:1:7] [=C2=A0 467.189857] Modules linke=
d
>> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
>> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
>> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
>> 467.189928]=C2=A0 binfmt_misc configfs efivarfs ip_tables x_tables autof=
s4
>> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
>> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
>> raid6_pq ] [=C2=A0 467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: =
G
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 5.10.0 #3 [=C2=A0 467.328767] Hardware name: Dell Inc.
>> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [=C2=A0 467.337154]
>> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
>> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
>> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
>> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
>> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
>> [=C2=A0 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
>> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
>> 0000000000000001 [=C2=A0 467.385123] RDX: ffff964f1fa31280 RSI:
>> 0000000000000000 RDI: 0000000000000001 [=C2=A0 467.393024] RBP:
>> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
>> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
>> 0000000000000000 [=C2=A0 467.408836] R13: 000000000000007f R14:
>> ffff962f1f42c9c0 R15: 0000000000000080 [=C2=A0 467.416737] FS:
>> 0000000000000000(0000) GS:ffff962f1f400000(0000)
>> knlGS:0000000000000000 [=C2=A0 467.425604] CS:=C2=A0 0010 DS: 0000 ES: 0=
000
>> CR0: 0000000080050033 [=C2=A0 467.432127] CR2: 0000000000000000 CR3:
>> 00000010987ea000 CR4: 00000000003506f0 [=C2=A0 467.440045] Call Trace: [
>> 467.443289]=C2=A0 ? tlbflush_read_file+0x70/0x70 [=C2=A0 467.448266]=C2=
=A0 ?
>> tlbflush_read_file+0x70/0x70 [=C2=A0 467.453242]=C2=A0 on_each_cpu+0x2b/=
0x60 [
>> 467.457437]=C2=A0 __purge_vmap_area_lazy+0x5d/0x680 [=C2=A0 467.462679]=
=C2=A0 ?
>> _cond_resched+0x16/0x40 [=C2=A0 467.467224]=C2=A0 ?
>> unmap_kernel_range_noflush+0x2fa/0x380 [=C2=A0 467.473072]
>> free_vmap_area_noflush+0xe7/0x100 [=C2=A0 467.478315]
>> remove_vm_area+0x96/0xa0 [=C2=A0 467.482770]=C2=A0 __vunmap+0x8d/0x290 [
>> 467.486792]=C2=A0 drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [=C2=A0 467.49229=
9]
>> drm_client_buffer_vunmap+0x16/0x20 [drm] [=C2=A0 467.498144]
>> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [=C2=A0 467.505118=
]
>> process_one_work+0x1b6/0x350 [=C2=A0 467.509912]=C2=A0 worker_thread+0x5=
3/0x3e0
>> [=C2=A0 467.514361]=C2=A0 ? process_one_work+0x350/0x350 [=C2=A0 467.519=
338]
>> kthread+0x11b/0x140 [=C2=A0 467.523342]=C2=A0 ? __kthread_bind_mask+0x60=
/0x60 [
>>=C2=A0 467.528389]=C2=A0 ret_from_fork+0x22/0x30
>>
>> Cheers
>> Karim
>> ________________________________
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Sent: 12 November 2022 17:47
>> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
>> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
>> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
>> enter_hypervisor returns -ENOMEM
>>
>> This email was sent to you by someone outside the University.
>> You should only click on links or attachments if you are certain that
>> the email is genuine and the content is safe.
>>
>> On 12/11/2022 18:15, Karim Manaouil wrote:
>> > Hi Jan,
>> >
>> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
>> > nodes), running Linux kernel v5.10 (same version used by jailhouse
>> > CI with same patches applied).
>> >
>> > `jailhouse hardware check` return that everything is ok and that
>> > "Check passed!".
>> >
>> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>> >
>> > However, enter_hypervisor() [1] fails when entry() is called on
>> > every cpu and return -ENOMEM as error_code.
>>
>> Try to reserve more memory. Maybe the default size of 6MiB for HV
>> memory is insufficient for 128 CPUs.
>>
>> Did you use jailhouse-config-create? You can use the --mem-hv option
>> to increate the memory. Try, for example, 32MiB and see if it works.
>>
>>=C2=A0=C2=A0=C2=A0 Ralf
>>
>> >
>> > Do you possibly know where could the issue come from?
>> >
>> > Best
>> > Karim
>> >
>> > [1]
>> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef=
6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob/=
c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>
>> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9be=
f6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob=
/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>
>> >
>> > The University of Edinburgh is a charitable body, registered in
>> > Scotland, with registration number SC005336. Is e buidheann
>> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=
=C3=A0raichte an Alba,
>> > =C3=A0ireamh cl=C3=A0raidh SC005336.
>> >
>> > --
>> > You received this message because you are subscribed to the Google
>> > Groups "Jailhouse" group.
>> > To unsubscribe from this group and stop receiving emails from it,
>> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
>> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>>.
>> > To view this discussion on the web visit
>> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups.=
google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40A=
M0PR05MB6018.eurprd05.prod.outlook.com>
>> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE=
61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Dem=
ail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/AM=
0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.=
com?utm_medium=3Demail&utm_source=3Dfooter>>.
>> >
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/79cf1f00-9c20-404e-150b-42142c804d3e%40oth-regensburg.de.
