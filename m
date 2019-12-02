Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ65SLXQKGQEZKPY6AY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id B127410E5F3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 07:27:15 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id f26sf21832917edy.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 22:27:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575268035; cv=pass;
        d=google.com; s=arc-20160816;
        b=FXmObDHJL1F6RRC8BXMXSNXi0hLySuvKeU/ny0v0u6+oIlsyl9PRb4UYR3fIyc07a/
         vtEfoJRjMrNd00Y0jyyafsMX1NVmJe8Meemn4cCQvGMZPx2dqhH/CC+cXoLtTNjdg5h7
         27koNtLj9OmxbzidWkGWO7HduId3V/DcnvDhjqyR3iUb9oZOBGS8AHKUK0XdPSCqEpKq
         wApQyZPuqYc+izM8yLftNnyOkGAScsH6T1FSDhDy7M64znHRCW1xmAi+9xptRcS1d+jn
         JN5Ug//Rd5OFZ+v+ecttw/bvMYVqc2c1U8VokuM6FMRgy8+Z0QZn4TOuSzBVSL6JxK3c
         2vPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=p7W9ma6lNyZIvmiTIyj4fS4nJA1bLelffOvrh7j7Y9Q=;
        b=uGZgYTx/nCqtWVrsGnA0xt6e4/XkO0oKxMKiRaTDQCEajfpViNmq9PXcqCZK7QbQub
         pCjlG8CZlpHfF02edetE5d1ux+YXpTHNBUEt3ZJcVz12d1xMaDNsrzi+9qW1klJkrNDg
         4Daf2GF58Png+ydgrZBYMwWHlN7Bo5nvpXIp7mIkyCdiSDBi+/Am/UfGi5TViGYTDElC
         bHB2Blv4/QhG5hZdWXkxZK5bXc429WCBV+sIkGdst2TBn7J1YvlpmNdNxELYcn+eR1O6
         f5UZvqlifKx9KyXdrfMMgpbqgKBIGQ3Pvcw/doIkQKdrM3QbCnhLM1HRS7t/CpGc7Fht
         /efQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p7W9ma6lNyZIvmiTIyj4fS4nJA1bLelffOvrh7j7Y9Q=;
        b=Srt52Ef7A9RSqmo7HRsZ+iVjp+JcdDuef94NrtxQXi5uqNA1eOvNfEwJcUyqAMEk0a
         Fc4OmSMijh/J906afrQeDUxX4owgVsCBkoXnmXJIZZci2vv4IC2xQmn+j3bU4aoE4jMY
         DAPNXr064rRboKEAg04pqJMxxXH32/045UyKUfOv19/ep5ZaaFnHhUu66esNhisPcXsg
         RZCjr2sHcoRJQeMr9jz6pWIqVvDzYfprrKrbrUyuXJ93lxG2KjtgSg8EV+BFNoG16XFp
         DNw2d6PG3/dkL2n7Z+46ejscWyY4veBc0JpUENbkfZaA0CMKEnRSzqTy5nWJ/Vp/fBGB
         ae8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p7W9ma6lNyZIvmiTIyj4fS4nJA1bLelffOvrh7j7Y9Q=;
        b=el3t12alfmQsjX/AC3WGPxjhDWpIWABeVWk62fGEC510ucVr7qc9CvGH0IIH5au/lt
         sA7c3Jeuypd8AztvKJelJz8l4HmwqmDnh8hVl1pG+q6Pzzg3EFRWSFfrd4H4CQY+nO2b
         +xIAzFoDJjJfpehqpMhGLOxKKKIwnPpKfKwCk1JGhZGJimZjIwbqCVAQzLNhTsezwwpi
         AMPGFT39E9rDFNQLr2i8i02mOzJE/1grfAFN5+hCLl8Hb70e37uM4mssrba0hD4ZniTJ
         +uC2u1HGj0srTBEswpbeKTR33CePuV3JOy7A/h9nlUZClCWsT4FrzULI2+KMLmqnKMKH
         s0oA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXJry9dBqYjH8t7Q2ZNE1PVd0e+5R59uqevTCDvdnIqzVm5vuov
	h41+0x/hwYN6Kdb6mz+4fDI=
X-Google-Smtp-Source: APXvYqw1SuCI+/IerHOtMRYcsw9qQ/TGLVdpoWkmMxTVwXX7YJtYL1KAw3qDidpxfOKOWmuVwSzLIQ==
X-Received: by 2002:a17:906:c44a:: with SMTP id ck10mr52236729ejb.149.1575268035366;
        Sun, 01 Dec 2019 22:27:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a995:: with SMTP id jr21ls10565651ejb.16.gmail; Sun,
 01 Dec 2019 22:27:14 -0800 (PST)
X-Received: by 2002:a17:906:b30f:: with SMTP id n15mr21693005ejz.236.1575268034646;
        Sun, 01 Dec 2019 22:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575268034; cv=none;
        d=google.com; s=arc-20160816;
        b=fLHUJnklzR0Ntzd8BuLK2OFKTEjGMXwD988X+yZiXDo6VPbZQh1hoAtQkSlKFUb56i
         choaix66DIV4Zp9vAlhKU+Cqy1aeVi3McnDfviz0qAO64tEpQ9CZgt5lq10/c7/Et1qs
         GJNemNR6wKYo6roKn89ufc3fR/YciVoythOlhOs9Np08tR5rU5AJEfXW5tp9uYNblZip
         TJzttGOYwjYcQ8So0FvuWXaidfkO/74Cb3KUqBLf3sDctNiQ3xL+a6wue3vqMVCf8TJR
         9poxBC27UGLuQOVHdi7QhMI5RzozmfjiR8Z8WeNYcganFvlcugAyipHeDH131xUgWtwe
         hsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=zZYUTHR2yKvxeaRfvuVkdBj3HU865m2SlHsvoKXgbzs=;
        b=EWO6nPr/Piud2BR/F7QuGUptuls+h9YjNIxOEWGBli6aB0cmscpSdEcTAYONNEYRG6
         9wsqFtkhlRirRiqJKGmfPdBiL6zAnxyQdgBPY3MaiMCUC6ZoEQ6Y37btCPsCVeQbJQXd
         vcLpYH+3km7BgQBCY/Jb8yASw/QV0HmtjSzbBFl7AtmETIVJQM3CfMabv76q82OtZ9Os
         yptd736XhplG7SZUXBRuBXBsrgqaSMo9JIJXdPp55W8rPCOdFgBthGz/0dxbcOr97Rjv
         XR/Ch7No30ZOn7Hc1HmMgS3QV+MXH3LlDqLYJOuYonzB6LOju/mchb8+1nNH5iSPNLXb
         3eSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id ba12si933573edb.3.2019.12.01.22.27.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 22:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xB26RDPX004575
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2019 07:27:13 +0100
Received: from [167.87.6.91] ([167.87.6.91])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB26RB7L001996;
	Mon, 2 Dec 2019 07:27:12 +0100
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Peng Fan <peng.fan@nxp.com>, Marco Solieri <ms@xt3.it>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
        "tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>,
        "giulioc@xilinx.com" <giulioc@xilinx.com>,
        "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
        "fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <14abb592-d8c4-6c89-1e98-d774e0dd21ad@siemens.com>
Date: Mon, 2 Dec 2019 07:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
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

On 02.12.19 03:52, Peng Fan wrote:
> + jailhouse mailist.
>=20
>> -----Original Message-----
>> From: Peng Fan
>> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
>> To: Marco Solieri <ms@xt3.it>
>> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
>> giulioc@xilinx.com; claudio@evidence.eu.com; fabio.federici@utrc.utc.com
>> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
>>
>>> Subject: [PATCH 0/8] Add cache coloring support for Arm
>>>
>>
>> I am reading the patchset, but this patchset could not resolve the cache
>> contention between root cell Linux and inmate cell, right? It only addre=
ss the
>> cache contention inside the inmate cell, if I understand correctly.
>>
>> Is there any v2 plan to address the upper issue?
>>
>> To address root cell color issue, 1:1 mapping in root cell might not wor=
k,
>> because IPA/PA needs a remap, but this will waste PA space, if inmate on=
ly
>> need a small area PA space. Seems root/inmate cache contention is hard t=
o
>> avoid.

Coloring the root cell is indeed a tricky issue as I remarked back then=20
as well. I suspect the best way will be trying the approach that TI has=20
a prototype for: start Jailhouse via a loader (could be a UEFI=20
executable) and boot the root cell Linux already colored after that ->=20
no DMA in-flight problems.

What you cannot solve is the memory usage. That is inherent to coloring.=20
So, what we actually want is vendors like your employer finally=20
implementing cache partitioning in hardware. ;)

Jan

>>
>> Thanks,
>> Peng.
>>
>>> Predictability of memory access latency is severely menaced by the
>>> multi-core architectures where the last level of cache (LLC) is
>>> shared, jeopardizing applicability of many Arm platform in real-time
>>> critical and mixed-criticality scenarios. Support for cache coloring
>>> is introduced, a transparent software technique allowing partitioning
>>> the LLC to avoid mutual interference between inmates.
>>>
>>> By creating a cache stress environment with a memcpy bare-metal
>>> application or with the Linux "stress" tool, it is easy to measure
>>> performance degradations caused by inter-cell interference, e.g.
>>> running the LMBench micro-benchmarks, or just with the GIC demo within
>>> a L1 Instruction stress scenario. Once coloring is enabled, instead,
>>> predictable performances are restored. Reports of extensive benchmarks
>>> and evaluations on real application are referred in the documentation.
>>>
>>> We thanks Tomasz Kloda and Marko Bertogna for the prototype logic and
>>> Renato Mancuso for suggesting low-level design improvements. The EU
>>> Horizon 2020 IA project HERCULES (grant no. 688860) supported the
>>> initial implementation and evaluation on NVIDIA Tegra X1 and X2; Xilinx=
 Inc.
>>> supported the implementation and evaluation on ZCU102; UTRC supported
>>> the testing on ZCU104.
>>>
>>> A bird-eye view of the implementation and of the commit structure is gi=
ven.
>>> Some coloring-logic fundamentals are situated in the 'common' part
>>> between the driver and the hypervisor [1], but only the latter
>>> implements the whole coloring support [2]. The hypervisor also exposes
>>> a convenient interface to ease the load operation by the driver [3],
>>> who implements a simplified memory allocation support (only colors
>>> have to be chosen) [4] and extends the configuration file support [5].
>>> Examples root cell and demo configurations are provided for Xilinx
>>> ZCU102 [6] and NVIDIA TX2 [7]. An extensive documentation details the
>>> technique and gently explains how to use it [8].
>>>
>>> Luca Miccio (8):
>>>    Common: introduce cache coloring primitives
>>>    Hypervisor: implement cache-colored paging for Arm
>>>    Hypervisor: add hypercall to ease loading of cache-colored images
>>>    Driver: add support for cache-colored memory configurations
>>>    Support cache-colored memory configurations when loading Linux inmat=
e
>>>    Configs: zynqmp-zcu102: add cache-coloring examples
>>>    Configs: jetson-tx2: add cache-coloring examples
>>>    Documentation: add description and usage of cache coloring support
>>>
>>>   Documentation/cache-coloring.md              | 330 ++++++++++++
>>>   configs/arm64/jetson-tx2-col.c               | 529
>>> +++++++++++++++++++
>>>   configs/arm64/jetson-tx2-demo-col.c          |  76 +++
>>>   configs/arm64/zynqmp-zcu102-col.c            | 153 ++++++
>>>   configs/arm64/zynqmp-zcu102-demo-col.c       |  79 +++
>>>   configs/arm64/zynqmp-zcu102-linux-demo-col.c | 137 +++++
>>>   driver/Makefile                              |   1 +
>>>   driver/cell.c                                |  56 +-
>>>   driver/coloring.c                            | 239 +++++++++
>>>   driver/coloring.h                            |  52 ++
>>>   driver/main.c                                |   3 +
>>>   hypervisor/arch/arm-common/mmu_cell.c        |  27 +-
>>>   hypervisor/control.c                         |  77 +++
>>>   hypervisor/include/jailhouse/paging.h        |  11 +
>>>   hypervisor/paging.c                          | 168 ++++++
>>>   include/jailhouse/cell-config.h              |   9 +
>>>   include/jailhouse/coloring.h                 | 151 ++++++
>>>   include/jailhouse/hypercall.h                |   1 +
>>>   tools/jailhouse-cell-linux                   |   5 +-
>>>   19 files changed, 2096 insertions(+), 8 deletions(-)  create mode
>>> 100644 Documentation/cache-coloring.md  create mode 100644
>>> configs/arm64/jetson-tx2-col.c  create mode 100644
>>> configs/arm64/jetson-tx2-demo-col.c
>>>   create mode 100644 configs/arm64/zynqmp-zcu102-col.c  create mode
>>> 100644 configs/arm64/zynqmp-zcu102-demo-col.c
>>>   create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
>>>   create mode 100644 driver/coloring.c
>>>   create mode 100644 driver/coloring.h
>>>   create mode 100644 include/jailhouse/coloring.h
>>>
>>> --
>>> 2.20.1
>>>
>>> --
>>> You received this message because you are subscribed to the Google
>>> Groups "Jailhouse" group.
>>> To unsubscribe from this group and stop receiving emails from it, send
>>> an email to jailhouse-dev+unsubscribe@googlegroups.com.
>>> For more options, visit
>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
u
>>>
>> ps .google.com%2Fd%2Foptout&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
>> m%
>>>
>> 7C9a8ae20626fa48d42da808d6b2ba3eb2%7C686ea1d3bc2b4c6fa92cd99c5c
>>>
>> 301635%7C0%7C0%7C636892910321416684&amp;sdata=3D4VNztT05f9leIPUh
>>> a1TUx97q8sEzTgtk%2FfIzkwV3%2FJw%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/14abb592-d8c4-6c89-1e98-d774e0dd21ad%40siemens.com.
