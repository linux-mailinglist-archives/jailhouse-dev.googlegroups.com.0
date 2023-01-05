Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX453SOQMGQEMAHICTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749865F336
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 18:54:40 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id c66-20020a1c3545000000b003d355c13229sf1340734wma.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 09:54:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672941280; cv=pass;
        d=google.com; s=arc-20160816;
        b=wT2e7zPiyqPh9K7UQdWL7IA1QnmAeTEpsvmvmUs5CwWc3Mb+yMd+wStId3LdWwnH5T
         fo5lQ/pwvywRWyd/uEJi1p9N6zE8XCcW9b4b7+ZRw3yeVXhDBLt/OrtLhA6pIa8JOmQW
         WR4allfL7TKdqDBD65Kx5gUbLEiiR57cbhxSSX4paJEploBMwMp3zInkK4fA6UWwyt1p
         t7/ZJb9qTtyBjCB/atS5+ZJ7m4vZsPVlBOf7EiREG5bil3aFIATrGdpreUxA9zVawgX/
         7zjsHjl+8aCkvnBYnGMvMQEaRL6/WcGIVL+kCb5+wDJgSvX94Yai2dYaQf2YYXyKm9j8
         kpgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=Zt++9hgYi0HOtM1MeKLlGRl2v7ZbW3psA23Ni7nx0ko=;
        b=bYNxDa9NZCwMq8w06ORzFuoTv5N5HHnnzvsD+aCRekpB/o/RMQkTGWyMQZvl1RHtMR
         pg1Q+0sewYTpxJcZNudQKwXkpyFrw5uSP8q/kwCbf4fq5DMhqpW7+saoAAJghZGHKyV/
         rt0yqD92LDekLltmu09+dgMMZE6oq3lvDUkWQWS5s6nkpZAd7S94jquCpZ1UH7LRwJZV
         onda1cuRm1ygjKYvCFujwq5m6h+HenA4RmqWTzoNFN0JzNE4WnhObQI6/KJEpjPU8h/Q
         twcY0Qg0fODQWjNsRhGCchofxtNNk75CdMi0/nDDauJizMXijuSj9LBeUn+gVTyIYte2
         L8DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=aVzBTHbk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt++9hgYi0HOtM1MeKLlGRl2v7ZbW3psA23Ni7nx0ko=;
        b=FzXzx81hW2RiSUNR8LrpXLYqCas3FQtonRMi+JgFSY1iwxNldcUQ4cV4SFHLilNd0Q
         zTQYiwB37JY5sHMSpUPrDdtfgVUUuwwI4z5Tfz1YjF4UhKHNfqQJPyF6mddABFu7IEjG
         F5tJv10kClQuEzCcaCeTyuLm6hQ9fdmW1rCU7crlG1RMFK8GjQ/lZFWNlm5cj2z3b/SC
         2yvZ8iNMQNajv2BtjMWeYMG2yw+epXENi0Nf9shG/zAfG0XydLC91E5FQFN13vvVwmM7
         Fb7QYUK31OnK/wIRWLivEsFX3ZcYbKr5ih8qslrurvAYrtsuVG+rBOXOCsc9Q9Al3XVV
         sCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt++9hgYi0HOtM1MeKLlGRl2v7ZbW3psA23Ni7nx0ko=;
        b=UBBnrbmTwV0k67veb30I2eLlh8dgKLciezWVdQISHWiaFDOIurcc4kw9LmvB3VYsef
         7672uRmr0Nmu34bH5gqaq5Q7F5TYjzqoORf1b0vTgOvH+OE8ZPQoyPMqQJZjmzCFREMw
         54IOx97+rg6ORbBxP+wj4b8+WyWiPnMqcSRkvxhrgXGbMD1+JB+PWtjmQeheQMYyJmY+
         JiB8H/jLAdE9/91vAkghqFO+zo8V8OYy+hlWZywiCb1z4RPS/TihRbcHatqFGC+YsB6Y
         535onjigL7lA2eMYhskX07stpseR/5EiooXM4C/FftB+ocJY6VLjECBqf1kDQlyJHVEJ
         odKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpLTDpNLSkg+Hx6N8mAHv5JK7OeBOBPn+dKO4Z/mi/EmSA8KL50
	he79kMmjmNktbksRi4JZj1I=
X-Google-Smtp-Source: AMrXdXszG5h4Mm4ZLQlN58ZZW0TjwPI4eOeoOzyVDIFImikFfLOnV+WfJwnbyojaG3afMAuZ+vpTow==
X-Received: by 2002:a05:600c:44c9:b0:3d1:d771:373 with SMTP id f9-20020a05600c44c900b003d1d7710373mr2899106wmo.18.1672941279978;
        Thu, 05 Jan 2023 09:54:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:790b:0:b0:3d9:bb72:6814 with SMTP id l11-20020a1c790b000000b003d9bb726814ls5705155wme.3.-pod-control-gmail;
 Thu, 05 Jan 2023 09:54:38 -0800 (PST)
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id r10-20020a05600c35ca00b003d1f2de195amr40325899wmq.32.1672941278544;
        Thu, 05 Jan 2023 09:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672941278; cv=none;
        d=google.com; s=arc-20160816;
        b=fhEMLr2DNFyoNwnSsUS+cgJodgUEnu3auwU8wMaroaiDqocms8GlqT19QbMVrn69i8
         bddVn70cIRBpsTKm2DfcWqG8MDI7toeRNJ9EYY/7JFHBmRAGsW8u0UgD7V7r5q8sbVZY
         dbTUF9tzDyWODu8M6HrcxsZOKH2ZdE8/IukArGlMzyUbjvSVVbLowCsCSXNf0FcjEe+l
         tvhgXgBWbaMAeBWS2xv7WLsthzyV61Dfy4brBDkBI2Mffu7xCsdoxf88QKh/HS3Jd8lF
         69H++Y1R2ym7isQX3syiwVUio1Yujz/WFdsA+iHwK79xM4v7OrmkQy9uKhfZnJ8J4TjA
         rwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EGMZxGs354bf0UD9/xVfYvVJnxYPcd9Tq/AVcqndTCE=;
        b=SF2daY0KlEM6QqxBqLujvkhVAGi1xL+X4h50Gwy9gKj9VoMCzCiN324YhFsWm7/GAh
         Eqn2ztWc6Pfgg+Xj8y6hjewgfZTjqG21v9KnQMFvqFAKXGi1ERA5hODtSovbdr39pEY8
         cJ/5pnVC2rD+kBWVQlZSL98a0r3EvWyENTDPUqLJsPCALvYWzspAEXpgXA7wj9GZWubx
         19gs0cLP6bs3sTAuQtClU4ZPoipdRiOs9mEZpv78O1PByFax+igGfTRC3rm3+Qo1HlSc
         GCT4Mxs/JLzQvsiErmYAOd8Z5nHcxng6YAQOpDITG3XNbGTqI5qdL6nndpKf44CwWXPV
         WFcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=aVzBTHbk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id ay6-20020a05600c1e0600b003d9c716fa3csi235844wmb.1.2023.01.05.09.54.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NnvHf0hcSzyYt;
	Thu,  5 Jan 2023 18:54:38 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 18:54:37 +0100
Message-ID: <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
Date: Thu, 5 Jan 2023 18:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Tommi Parkkila
	<tommi.parkkila@gmail.com>
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=aVzBTHbk;
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



On 05/01/2023 18:24, Jan Kiszka wrote:
> On 05.01.23 18:21, Tommi Parkkila wrote:
>> Oh, I was missing *.cell from the point 2. Now fixed=C2=A0and no complai=
nts.
>>
>> to 5. tammik. 2023 klo 12.20 Tommi Parkkila (tommi.parkkila@gmail.com
>> <mailto:tommi.parkkila@gmail.com>) kirjoitti:
>>
>>      Jan - Just ran the config check on the host PC and on target.
>>
>>      1. On host, it identified some memregion overlappings that were due
>>      my own copy/paste errors. It also complained a missing resource
>>      interception for architecture x86:
>>      */In cell 'STM32MP1-Root', region 1
>>      =C2=A0 phys_start: 0x00000000f7600000
>>      =C2=A0 virt_start: 0x00000000f7600000
>>      =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009a00000
>>      =C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ | JAILHOUSE_ME=
M_WRITE |
>>      JAILHOUSE_MEM_EXECUTE
>>      overlaps with xAPIC
>=20
> Another detail when running cross: "-a arm" - you don't have to worry
> about x86 resources on your target.

Side note: We should store the architecture in the configuration. Just=20
for the same reason why we introduced the magic byte at the beginning=E2=80=
=A6

   Ralf

>=20
> Jan
>=20
>>      =C2=A0 phys_start: 0x00000000fee00000
>>      =C2=A0 virt_start: 0x00000000fee00000
>>      =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000001000
>>      =C2=A0 flags:=C2=A0=C2=A0/*
>>      I fixed the copy paste mem=C2=A0overlappings, do I need to worry ab=
out
>>      the xAPIC overlapping?
>>      */
>>      /*
>>      2. On target, the check complained the configuration is not root
>>      cell configuration???
>>      */root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
>>      jailhouse/configs/stm32mp157.c
>>      Reading configuration set:
>>      Not a root cell configuration: jailhouse/configs/arm/stm32mp157.c/*
>>      The config here is the same as ran on the host PC. What causes it t=
o
>>      complain the above?
>>
>>      to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.kiszka@siemens.com
>>      <mailto:jan.kiszka@siemens.com>) kirjoitti:
>>
>>          On 05.01.23 17:53, Tommi Parkkila wrote:
>>          > Jan - Thanks again. I have not tried the config check yet.
>>          Actually, it
>>          > does not work on hw currently, it does not find pyjailhouse
>>          module. I'll
>>          > check whats=C2=A0going wrong with it and=C2=A0let you know.
>>
>>          You can also run it offline, even directly from the source fold=
er
>>          (tools/jailhouse-config-check ...).
>>
>>          Jan
>>
>>          > -tommi
>>          >
>>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
>>          (jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
>>          > <mailto:jan.kiszka@siemens.com
>>          <mailto:jan.kiszka@siemens.com>>) kirjoitti:
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:
>>          >=C2=A0 =C2=A0 =C2=A0> Thanks for your reply, Jan. I managed to=
 get forward
>>          from the 'hang'
>>          >=C2=A0 =C2=A0 =C2=A0> condition. There were several misdefinit=
ions on my root-cell
>>          >=C2=A0 =C2=A0 =C2=A0> configuration. Now I get the root-cell s=
tarted
>>          sometimes, but more
>>          >=C2=A0 =C2=A0 =C2=A0often
>>          >=C2=A0 =C2=A0 =C2=A0> I get two types of issues after enable c=
ommand. Any help
>>          or ideas
>>          >=C2=A0 =C2=A0 =C2=A0where
>>          >=C2=A0 =C2=A0 =C2=A0> to continue my debugging would be greatl=
y appreciated.
>>          Please, see the
>>          >=C2=A0 =C2=A0 =C2=A0> issues explained below.
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0Already tried "jailhouse config check"?
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> Thanks,
>>          >=C2=A0 =C2=A0 =C2=A0> -tommi
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> +++++++++++++++++++++++++++++++++
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> 1. Terminal hangs
>>          >=C2=A0 =C2=A0 =C2=A0> -- After the enable command for the root=
 cell, jailhouse
>>          gets started
>>          >=C2=A0 =C2=A0 =C2=A0> but then the terminal goes unresponsive.=
 Below, example
>>          log, where I
>>          >=C2=A0 =C2=A0 =C2=A0> give ls cmd, which then causes terminal =
to go
>>          unresponsive...:
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0Missing interrupts could be one reason. Or=
 something is
>>          completely
>>          >=C2=A0 =C2=A0 =C2=A0broken with memory mapping so that a kerne=
l device driver
>>          gets stuck on
>>          >=C2=A0 =C2=A0 =C2=A0waiting for some register bit to flip, e.g=
. But most
>>          frequent are
>>          >=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically around GIC =
resources being
>>          improperly
>>          >=C2=A0 =C2=A0 =C2=A0passed through. The config checker may fin=
d that.
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0> /*root@stm32mp1:~# modprobe jailhouse
>>          >=C2=A0 =C2=A0 =C2=A0> [ 1315.034414] jailhouse: loading out-of=
-tree module
>>          taints kernel.
>>          >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# jailhouse enable
>>          >=C2=A0 =C2=A0 =C2=A0> ~/jailhouse/configs/arm/itron_stm32mp157=
.cell
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> Initializing Jailhouse hypervisor v0.12
>>          (314-gc7a1b697-dirty) on CPU 0
>>          >=C2=A0 =C2=A0 =C2=A0> Code location: 0xf0000040
>>          >=C2=A0 =C2=A0 =C2=A0> Page pool usage after early setup: mem 2=
8/1514, remap
>>          0/131072
>>          >=C2=A0 =C2=A0 =C2=A0> Initializing processors:
>>          >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 0... OK
>>          >=C2=A0 =C2=A0 =C2=A0> =C2=A0CPU 1... OK
>>          >=C2=A0 =C2=A0 =C2=A0> Initializing unit: irqchip
>>          >=C2=A0 =C2=A0 =C2=A0> Initializing unit: PCI
>>          >=C2=A0 =C2=A0 =C2=A0> Page pool usage after late setup: mem 50=
/1514, remap
>>          5/131072
>>          >=C2=A0 =C2=A0 =C2=A0> [0] Activating hypervisor
>>          >=C2=A0 =C2=A0 =C2=A0> [ 1355.352714] The Jailhouse is opening.
>>          >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# ls*/
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> 2. Issue with setting CPU clock
>>          >=C2=A0 =C2=A0 =C2=A0> -- The second issue I see is related to =
i2c bus and
>>          system clock.
>>          >=C2=A0 =C2=A0 =C2=A0> Terminal starts printing error statement=
s infinitely
>>          after Jailhouse
>>          >=C2=A0 =C2=A0 =C2=A0> opening. Below, is a snippet of an examp=
le logs.
>>          >=C2=A0 =C2=A0 =C2=A0>
>>          >=C2=A0 =C2=A0 =C2=A0> */[ =C2=A0 85.322027] The Jailhouse is o=
pening.
>>          >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.322648] stm32f7-i2c 5c002000=
.i2c: failed to
>>          prepare_enable
>>          >=C2=A0 =C2=A0 =C2=A0clock
>>          >=C2=A0 =C2=A0 =C2=A0> root@stm32mp1:~# [ =C2=A0 85.339233] cpu=
 cpu0:
>>          _set_opp_voltage: failed to
>>          >=C2=A0 =C2=A0 =C2=A0> set voltage (1350000 1350000 1350000 mV)=
: -22
>>          >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.350413] cpufreq: __target_in=
dex: Failed to change cpu
>>          >=C2=A0 =C2=A0 =C2=A0frequency: -22
>>          >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.357706] cpu cpu0: _set_opp_v=
oltage: failed to set
>>          voltage
>>          >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000 mV): -22
>>          >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.365124] cpufreq: __target_in=
dex: Failed to change cpu
>>          >=C2=A0 =C2=A0 =C2=A0frequency: -22
>>          >=C2=A0 =C2=A0 =C2=A0> [ =C2=A0 85.381985] cpu cpu0: _set_opp_v=
oltage: failed to set
>>          voltage
>>          >=C2=A0 =C2=A0 =C2=A0> (1350000 1350000 1350000 mV): -22
>>          >=C2=A0 =C2=A0 =C2=A0> /*- - -
>>          >=C2=A0 =C2=A0 =C2=A0> +++++++++++++++++++++++++++++++++
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0Same possible reasons as above. Or do you =
know how clock
>>          control happens
>>          >=C2=A0 =C2=A0 =C2=A0on that platform? Is there firmware (TF-A?=
) involved?
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0Jan
>>          >
>>          >=C2=A0 =C2=A0 =C2=A0--
>>          >=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology
>>          >=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux
>>          >
>>
>>          --
>>          Siemens AG, Technology
>>          Competence Center Embedded Linux
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a4c03581-e791-6448-92be-c51e896be4bd%40oth-regensburg.de.
