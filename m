Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPUK42AAMGQEZWPZ5HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BC30C6C5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 18:00:47 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id r5sf12881688wrx.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 09:00:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612285247; cv=pass;
        d=google.com; s=arc-20160816;
        b=yhlqeVJXvxlsGXavkAxJnoyX8t6Qs7ShsHvX5sHEZW3tgffBvGTeXKf/MzTk7lmUCc
         6QNb1cxkMteNr7HSsc3tX0MTKzuJoDqlT/LX//c+tMF6PV8XE5NaJb18NjSwGEMj4tdU
         mncZcivlYR1j6oD729+yKBYA0KrqHKBMNA1E10Dwa7JuHc8bdkQK6tqTmjTkLfD+ACFV
         +XXgR4InsWISBtAxLwQ4/nzHqOnYYJI8591RBmP/g/c1ggoDPmlAVUffUF8mWvH1jPK3
         HaKh99alpXPUI9sbeCsWoHqpDgj2Md2Q12jv1pcoBMIvsMyl9O2IlyQMLTqIc+yhNfU4
         nIOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ZT4DkYJgzPykBX+KV646N2Vi5n48fSqE6KffaSrUp0g=;
        b=Qt8La+I5UndYLnKcjS7+UlEwV9GjN8iJ8oU9jHBrTjYrX29EFeEz8HAYntizZuK7dq
         0FG5Zf95STB9mrc1sv/fi5vNpNpx6jnRfoXidEXsbcJ/6+zn2Q9f1aipwZ7PK0pHElvi
         3C0MPqlUtMbSKD5gNrhQaR3Ndbv3MbwNX41PXMuOX/BWgp1Nuj8fQ0mIyq1FmWZIkVwE
         Y0ds4M/DqZsWbzzVUGqVfbXqMgzTA1Ws/ANTDuWcWMrbvKcU0Mq+RskdwlZSp1ae91AZ
         M1ECHbgPvEU3uwYS5v6zRqGlKbtdfBJLXhsWHvmLtcLkoiQfM/rYJ4SgE1TdzRSGl+BJ
         TJ5g==
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
        bh=ZT4DkYJgzPykBX+KV646N2Vi5n48fSqE6KffaSrUp0g=;
        b=r9GPSqy5TNO6L/kKgJgJ91/c05Q3bQRxO63m4dI+t85qDJ2+OheC33uFf/j+XcLMEf
         NbWlRAI4zXMRg45Ql0K34+ZdSOcUYl6xQomulTsf4Erje7QcDg4vq0vq5U8kqQaffECA
         fcQBdZAFF/yylgIzeQa7uXZ5RQbyKp7hMtp9hmduZbJI16O3WcbyqFG1sKW0HQV0QD/0
         8hbKBBqCf9RoDlxhJQqpdNRDNh01jvJVrQgT03fWcxqfKus5y1rDjjsoxciEWvguhhxR
         utZrqVzrohFkVaZ8mBf9I0LjmKzRpmQSZIlXSRJJulr11T35J51nkecZv/mdDMj+Qidq
         SQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZT4DkYJgzPykBX+KV646N2Vi5n48fSqE6KffaSrUp0g=;
        b=dtr2vn+SiKa/KPLew3ZKSc5/cpr48+R+7SoUJMoMSbNlqk3wslp47qaL7/q9yM0r0g
         MGfyB+/8h+UTVDzkp658AEHBoq0Y7AVXVIk76l76VJ+TRbqqqni1cuQMF32928qkOpDU
         TqzYU8ZBPnXQVYC3sNouu5zJEYE2b2kSQ6nXGK7EfmxVLR80AAh82XflTWMWPrP9DaEh
         WQuoFmQ6fHjFqpyZ9kaVBRr0f8SCHpqb0Zyd/+5XoOK/ZshjJ52vjZqlHzr32WjxYEox
         3RX6eqQaduMfyk+sNL4uhb94LnH4Z1mJewvgrC2HVC/QbgStImYcora0yAxGlHc1mnWw
         z+ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Mv21QXLn31nVbpH1idaqPVhXv1w/CzM8SPXeva/dcpmSekCvZ
	0DWtSjcFvjPCHdzkBvFCidw=
X-Google-Smtp-Source: ABdhPJzq1mqofxrWP8u3Qv3ALOjyJcHfU3/Hz2zgZFSJarw6OiZ746Y1DZmNaQh+LrWT1ZlK3act/Q==
X-Received: by 2002:a5d:6311:: with SMTP id i17mr24490879wru.195.1612285247222;
        Tue, 02 Feb 2021 09:00:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4482:: with SMTP id r124ls1664372wma.1.canary-gmail;
 Tue, 02 Feb 2021 09:00:46 -0800 (PST)
X-Received: by 2002:a1c:9e95:: with SMTP id h143mr4505596wme.25.1612285246118;
        Tue, 02 Feb 2021 09:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612285246; cv=none;
        d=google.com; s=arc-20160816;
        b=EpdLFIhQ06/VCp6aHwLJwxbIn4yPSmLRNYEiNza+ZRDiScYTeIXqxdHGAVfsUIxS7T
         B/GvUcClpbG1qQAd+2VPCi+2JWqKJZIIb+lbeM/Vs8tSQ/2JzeEiVunK3O+RcDSJb4su
         GJbOdY/kTxrOlPgRQmuRzGktY62vy19FfQ8oB/bpdK84sMaMYlWhO7yzaOEwQKhXASM+
         GIggHrAesm5dPSs9XPuf5EeRtKwGewG+6rdJ4x3HqraDSUv0t1Cs06THnaHN3wbeMfYy
         pqBtoMk3mxa3XiXql5rYazHQZQuSUAs1cqqeawSTfIpuxo8gDo90zNTHMfSilujiZSzR
         3uAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OTlgq9jiVNQ5zs5YRqt++D4mpvYxdSWI9bEIVjtBO6c=;
        b=aUcnxHggmXQwgb3Z7VA8eaas0G3n/S6drJQ3kctxqFGzkwarXHl+1XfqOnie/ibeOZ
         4OIory930t1/GHUaYBsWdpWpQTR8hpH8tptt6cb7WX76Rd204Fc7Q4dD6jfqIPBxu+WI
         gRyt5pybvFhVyZ41OXeEKU9EcI7ZpOO4GHpnMZt0jiGsKNyNpVndmYVapeALGi9FVWZi
         tSvKfCeGNYwTGT+OkJnKUh9SuvFEuGYuBiUvoItt/b6piAMKDk26W8pJ7IMQakKJ+Jdc
         Ri9iLVDwpc6W+sJo8S54lhIy2eSC7pKgs9/mmHL52Dhxlkv0adNVK4IZJsVWaLcx1C7E
         PQvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q81si211620wme.0.2021.02.02.09.00.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 09:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 112H0j9f009830
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Feb 2021 18:00:45 +0100
Received: from [139.22.33.167] ([139.22.33.167])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 112H0jnK026054;
	Tue, 2 Feb 2021 18:00:45 +0100
Subject: Re: [PATCH 0/6] Fix unexpected behavior x86/CAT Module
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR02MB6670EC0868445B5454C42969B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7d1fb7a3-b427-74c2-2f2c-8bfd62453ac7@siemens.com>
Date: Tue, 2 Feb 2021 18:00:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <PA4PR02MB6670EC0868445B5454C42969B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 02.02.21 17:44, Bram Hooimeijer wrote:
> Dear Jan, dear Jailhouse community,=20
>=20
> We are running Jailhouse on an Intel X86 server-grade processor and use t=
he Jailhouse CAT module to isolate cache usage between cells. This patch se=
ries contains several fixes to the CAT module, to ensure the root cell rema=
ins isolated from non-root cells.
> I have tried to explain the grounds for change in each patch, with counte=
r examples where needed.=20
>=20
> Jan, I hope to extend the CAT module in the future to allow each cell to =
change its CBM during run-time, e.g. to distinguish critical and non-critic=
al sections. Now, the module dynamically allocates each cell a COS, and con=
siders any write to MSR_IA32_L3_MASK an illegal VM exit.

Right, the simpler model.

> Disregarding the last patch in this series, each cell had its own unique =
COS, which might justify a cell changing its own CBM, for example as long a=
s it is a subset of the CBM in the config file. However, in the last patch =
of the series I drop this behavior due to issues on larger CPUs -- the numb=
er of CPUs might outrange the number of COSes available.=20

One COS -> one cell is so far the model. If you have one cell -> one
CPU, you may hit that limit, true. May I ask how large your systems are?

>=20
> Allowing a cell to cleanly edit its own CBM, without affecting other cell=
s, is difficult if the COSes are dynamically assigned at cell creation. Tha=
t is why I am considering to extend the cache-regions in the config file to=
 allow for a statically allocated COS -- and make this a statically partiti=
oned resource just like e.g. memory.
> What are your thoughts on this? Any reason why you omitted this in the fi=
rst place, and opted for dynamically allocated COSes?

The "why" is generally best answered by "it's simpler to implement in
the hypervisor". Any moderation of hardware features add code to the
hypervisor. And an interface that could break or be misused if not done
properly

So, you want multiple COS per cell in order to hand out sub-control over
the cell's CBM to it and to intra-cell partitioning? Sounds complex from
the hypervisor POV, though I understand that there can be use cases.

>=20
> Thanks,=20
>=20
> Best regards, Bram Hooimeijer
>=20
> Bram Hooimeijer (6):
>   x86/cat.c: Fix type freed_mask
>   x86/cat.c: Fix CBM for non-root cell w/ root COS.
>   x86/cat.c: Fix returning bits upon cell exit
>   x86/cat.c: Fix off-by-one error
>   x86/cat.c: Fix overlap on moving the root COS CBM
>   x86/cat.c: Add COS re-use in cells with same mask.
>=20
>  hypervisor/arch/x86/cat.c | 140 ++++++++++++++++++++++++++------------
>  1 file changed, 95 insertions(+), 45 deletions(-)
>=20

Thanks for these, need to dig into the details.

I have locally an unfinished CAT rework pending that addresses L2
partitioning as found on Apollo Lake and newer - or conceptually also
multi-socket L3 partitioning. For that, it resolves the wrong initial
assumption that CAT is system-global. Baseline is a new CPU description,
see [1]. All that will clash with these, but it's my job to resolve that.

Jan

[1] https://github.com/siemens/jailhouse/commits/wip/new-cpu-config

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7d1fb7a3-b427-74c2-2f2c-8bfd62453ac7%40siemens.com.
