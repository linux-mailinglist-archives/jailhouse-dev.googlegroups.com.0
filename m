Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB47RZTXQKGQEPEDXAPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143E11DE69
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 08:08:36 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id g26sf1524760wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 23:08:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576220916; cv=pass;
        d=google.com; s=arc-20160816;
        b=tdD+xEMHHvbQ2wEkEFkXWXX7AqDDpYWOrh6h7NtGtVT7X0c36FyvvwOvpCgmngLZ5f
         aQhj3FG3b6dmaXiCxuIVsYGIYRENgUWFPSfV7NtUgcKAt2c1oJId52BapU+vz84AhcRc
         ob3gu7V7zhOIZNV5o0w7szBeOt5TKTbfGaqigwONanl/cx1qrtU/AzF6IztFjsGqD3KM
         Kt/K8zNmxPFoJMwfYo1/1jV5G89FIOwc0azp3EPmbC/iDsxBex93vu9iWN+3mx1Ie0th
         xKUSU83UGlOtOCUVcs4DrBa4436EkYL64ch6gOmiHtQqoVXDYvy2zQPLZslMxWgQmhEB
         OnQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6z/gVyyQLcMB8lds+nVmAsmElBFf1hijKC0fmVt76vg=;
        b=A/T8bML+Xei4jhgOimtVlxYtgfl2bN+1DUeBuwsH7zpI4EkBlo1ODl3H7Kt/BTaSIy
         O+KZQCexJC9PIPWUHUh9sS6BkDkS7dd0ppPFbz2ZD6hCMCB+Hs4rZdV/l298N/QNbjyY
         M7ZPzW460AManuQ1gaST8/drldLIFKkLye8/hImKhX7ZXWsgGF5a3IuN8fFNWkNC3SEo
         ZCWFlLIQlkIDmdaYa90mmgNecbdGwqLYAEnetmyDOGU16dwkR/vdtu1veFft2meQxml5
         gjWSv7AR/6wH02cYpL0wYIrXXJ8X24LZCPpVcFB+E73psAIJI3CrUlyn1xwQlb1pO4wB
         zI2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6z/gVyyQLcMB8lds+nVmAsmElBFf1hijKC0fmVt76vg=;
        b=kvMhLhGQlgu39PBbIFOumN9Rbz9agIBKcwJOvdvxY37gu1kzd3PuZnwTXwQthTxxLL
         3MfoUk1xDIHOEK1GEf4wMeU7NEFg4tNmfuYJOhgQqDLKWJFoD04xhQR7AXvzbHx2/TA2
         vALZXIDT1aeFXFXTiZkEz5MmBUkhUExfoP2bTzcm9raXarmvh7LsHm5ymTzYVoX3YRTZ
         Z4PSYzsTKxrxUy6IMGJQEN0zEH45aJM8Y17ZC5ZHkgTeLfLVCTg9QBNg9r5NlVTQVYg3
         fMffby7a1OmgR9a43sKyu2Rxi0EOW5qnasxDQwMEy1+bG284Bk32UmMnEfvoq6vf9aBl
         cLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6z/gVyyQLcMB8lds+nVmAsmElBFf1hijKC0fmVt76vg=;
        b=mxUFaduyxFTvCRpta+Hytszm3U6VTaiye0Fsb/+tzmlPTwcsvfvTqwwgewYO8vSPGB
         d09Uq1qWr1L+hHEX+Cs8Ajx6n8gYJvCQYhWsUAhqgdXdgsORpF2iex9kvbL0T+p9Id2m
         fRKmJTErd1TXaZHn6oreEYD0lWUNt67O/3NjxWEduPJKu46sYrLP8H3xFeTKhzzkIwRZ
         IZEDDKLO/bZ0azHbUWK40nXhacbE4mdbYdJ5byHzRa5WNeIKKCFY0OWBZwhQPcq3/WmK
         nLWdqz2M1o+aPfncblyDEJ+A6D7RUiIg1AXZOXfMqN8QgIEQe837hNCWoLrEcbq25YNM
         pmcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNMiMZol+Btli/5NdHF8gaksSiTraTBD2OUbEmFgnShlSJ1uEZ
	1N14bWlJesXprJ+45ERu1oQ=
X-Google-Smtp-Source: APXvYqz05vv/fokA3Lfp1NDoBHWFvgGcM6IEyignpu9M24T1jwInSNnub5Sai+clrupeo+j4t2DJAg==
X-Received: by 2002:adf:a109:: with SMTP id o9mr11575433wro.189.1576220915989;
        Thu, 12 Dec 2019 23:08:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls4587677wmg.0.canary-gmail; Thu,
 12 Dec 2019 23:08:35 -0800 (PST)
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr11397662wmi.152.1576220915284;
        Thu, 12 Dec 2019 23:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576220915; cv=none;
        d=google.com; s=arc-20160816;
        b=cfzUE/DJK8XJuzQDto7x9W96IlWhVJMjHKZkGp+1yxm13GPD5FJMhxet03FAOh5oSM
         y9LdllDtt978mK7m0qHTPTxX07eB0jH1b0fS5+jWAS8ZiDGtQsxlqIJruk780rkqrExD
         CcJ/9duYY/UlvOy6xW783OmU3E/5bPKUvyGa/06aibvoWLc6g2LShDXAoajJUIFXRaI4
         3YTlgiWYumArDzmKMgv8re7jn/01FnWb7Bl5MsHisWxReRsZpusS2a3z8C6fqMkCJBPO
         VJeQzoOTndJYCwX9JLWDufbIlrd6lCtockSU9S0LvkSDUSNB2CVEiTEXo7jRWX3bbQI/
         aDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=rYLcc3iNdL+DoUlDJbWzTf3IH63dgDZwXuy6CjPMO6o=;
        b=nk5YcSy4Y0WT4FSe0chdcyv4Zo1eHEMMisDitUrwFu3kR0l3dXbskkKGPTkih2Wz9A
         GHQDnAE22G1BJb8Kot2cojvDW0AqUtx6cAuXFOoyipUiJwhXmQSwnTotBd3NgMgnF1k/
         lx9nSywH86HYVvQ3BS1fw/n5xKPXDeCmzV4/pskZFyvU5DBK2WFai1ZTCCGO+eUCDBBM
         HWT4Qhnnh47VFMKSgMIZ/hwqQfuzNl7Pm7rj5DqH8CE6tmDfERMXXhCKMhH8kz/3/z+j
         i4oR0537HMPlDIxjwvUCpGyuVYFtPmLEyj3bu6OXn2BWjPaBhErQ27baSvX5K5bFOVoy
         rA8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x5si233229wmk.1.2019.12.12.23.08.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 23:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xBD78Yt5016797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2019 08:08:34 +0100
Received: from [167.87.38.231] ([167.87.38.231])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xBD78WvI007462;
	Fri, 13 Dec 2019 08:08:33 +0100
Subject: Re: Adding a shared tracing mechanism
To: Guido Roncarolo <guido.roncarolo@gmail.com>,
        jailhouse-dev@googlegroups.com,
        Henning Schild <henning.schild@siemens.com>
References: <AM0PR04MB71223156702DE74066C2511BE2550@AM0PR04MB7122.eurprd04.prod.outlook.com>
 <CADVdfxh4=ZmDpzHHh1H+8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <76ed1186-e38f-32e8-e0a8-c3768d44fe3e@siemens.com>
Date: Fri, 13 Dec 2019 08:08:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CADVdfxh4=ZmDpzHHh1H+8Kucb3bDDaaOjpjJRkz3cxzYvMVXBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 12.12.19 16:43, Guido Roncarolo wrote:
> Hello All,
>=20
> I am trying to add a small tracing mechanism developed for a RTOS inside
> jailhouse.

Henning started to look into such a feature as well, but those were only
early stages. The idea is similar: export a memory region to a cell for
trace pickup. Events could come from function tracing (gcc -pg).

> It is a simple circular buffer where in constant time access you can
> insert events, then from Linux
> you can dump the shared memory and translate the circular buffer content
> into babletrace format
>=20
> To achieve this I
> 1) added a memory region inside the cell config
> 2) initialize the tracer struct in init_early() hypervisor/setup.c
> 3) try to insert a test event -> OK
> 3.1) dump mem from linux -> OK record is there
> 4) try to insert an event inside=C2=A0 entry()=C2=A0 or after -> NOT good
>=20
>=20
> FATAL: Unhandled HYP exception: synchronous abort from EL2
> =C2=A0pc: 0000ffffc020bf68 =C2=A0 lr: 0000ffffc02024d4 spsr: 800003c9 =C2=
=A0 =C2=A0 EL2
> =C2=A0sp: 0000ff0000010e90 =C2=A0esr: 25 1 0000006
> =C2=A0x0: 000000000000002b =C2=A0 x1: 000000000000001e =C2=A0 x2: 0000fff=
fc021d000
> =C2=A0x3: 00000000b7e00000 =C2=A0 x4: 0000ffffc021d030 =C2=A0 x5: 0000000=
000000000
> =C2=A0x6: 0000000000000000 =C2=A0 x7: 0000000000000000 =C2=A0 x8: 0000000=
000000000
> =C2=A0x9: 0000000000000000 =C2=A0x10: 0000000000000000 =C2=A0x11: 0000000=
000000000
> x12: 0000000000000000 =C2=A0x13: 0000000000000000 =C2=A0x14: 000000000000=
0000
> x15: 0000000000000000 =C2=A0x16: 0000000000000000 =C2=A0x17: 000000000000=
0000
> x18: 0000000000000000 =C2=A0x19: 000000000000001e =C2=A0x20: 0000ffffc021=
9038
> x21: 0000000000000001 =C2=A0x22: 0000000000000001 =C2=A0x23: 000000000000=
0002
> x24: ffff00000969c000 =C2=A0x25: ffff000008010000 =C2=A0x26: ffff00000801=
4000
> x27: 0000000000000000 =C2=A0x28: ffff8000283ea880 =C2=A0x29: 0000ff000001=
0e90
>=20
>=20
> I tried to to understand from memory-layout.txt if sharing memory
> like this is legal:what I would need a "Common memory region"
> that stays visible to all contexts but I'm unsure if this is feasible or
> allowed

Well, for filling the region, the step that fails after early_init, you
need a valid mapping inside the hypervisor at any point. Study what
happens to make the console page work. That is just the same use case as
tracing.

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
jailhouse-dev/76ed1186-e38f-32e8-e0a8-c3768d44fe3e%40siemens.com.
