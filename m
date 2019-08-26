Return-Path: <jailhouse-dev+bncBCB7D7MXMMIORMUN5MCRUBBH42OIW@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF029C829
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 06:00:41 +0200 (CEST)
Received: by mail-vk1-xa3b.google.com with SMTP id x130sf7146759vkc.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 21:00:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566792040; cv=pass;
        d=google.com; s=arc-20160816;
        b=THr+Q8hNtpq0qMvDrFzreD6u1G7eW/csuCPXJcARvG7F6jsLhdi1tGPX3H+4qYdjZD
         uYB9UMlQmRx8fvnw5wNMiCThK/2CAU1vt1Ts1TK1DAe/9V192s6bGFiK9jB7/+Q1vQ/W
         gscK7dYbbgW2mSBsL0Y3pE/hBB6XID5CVd+CqeEUHNZkAulgMeycKi1KaxanQpGsABT9
         p3StQJ4WZJPcAlFsla/mmp+ZrRzE1PLrVipFJ7XuaQ+MB9MgTRzVGkOm1pS1XFfv2ZRH
         GgZ07FgvqsOfH9+7UYr1V9xlj8LLLwHSrYSclfHSbNd5nF22rPeNGfdNDZeSqPtQBwXc
         jPVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=XFvqmipmn6ikS2nUaT0Mwe93qbaOdYY55JwiT0rX2RU=;
        b=0RiWODWqlWNjj1iB7nXXh27MbmOEhyBojctIrN2q1Jk3We7WJ/P+v68DTqzaEgtzsl
         ACyIyP+qvlDKaQ98O9YQyi5F32VJC9+TU+qoS06zLwwBEH71eMnyhAC4s1VuO2o2mTSw
         Ove1rPZITDFa+U+DASfYmp0gjspPyXzigBL5UY+RnjNXPfZ40pyUIHTAIhDVIF64ZESZ
         7RInGDttXKNtH936RoQuDKxqXyhPaEV4Lf3tRlfLbD5jspATg5ifAMm9LNDouU1UfU6d
         /b+fdLdAMGXyr7rGEsWpyIo+vrScWdMzTa3BmhjxFU/zRLDH9sKZVduyCvaLQv+yhqDR
         Jveg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H3cyczEz;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XFvqmipmn6ikS2nUaT0Mwe93qbaOdYY55JwiT0rX2RU=;
        b=ZI6vHXQaykot0Alo/FbRzmvd18CsqC/M/Tl0vanliSALBUHrSKYqjcfTvMzRjCGUeV
         KHAwcw6zCNgZPwedtsIdkICxBlIqPW3X5/2lLdV7H8k4RBxUiJYgRreEx3AyjGST8BK6
         VlIV6y1hiLX0Rqce/eycIyg/5tOkNeKhnUWyDrWaxmf9hclyce4VoVK8kSeMqLv5eMfA
         yQXFaGZemF4BF/VE0eYO0No1hnpZhvIvR0KwPvxrvVPZ48Mh+3niEKgTb39AIYSzZ1wN
         HP7ybgv43BNqbCPvSr4bfhNBmSDb4TFYLxV4b6FioWJvuM5uv+6OHXCfBIz/CVRD7Ut5
         OImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XFvqmipmn6ikS2nUaT0Mwe93qbaOdYY55JwiT0rX2RU=;
        b=UdzVHTZHDZ36IMj9LCmy9UCTEAeYaIljKShqPltQvpQqC1CDBox12u99hpoIgE4NxC
         +1xhTjR6IyzAb0BYJrr3r/HxGDfbiRpSby6316Dt3So1tKq5DGCCdsBkiT/+oeMCaoib
         mmscGkWAGvJthgne6sKcUKrvYz+pXBoZY6EaMJwLThvHPnDgTnl0+29oeUCQZvMYxLHU
         r7ZppBAWoYv+8YrUBD6CfKT1ABoQKW7wc1Z4izRVpo4FpNq2y6ApP9YMoCqBBRT9VyKC
         YRYATo8U01u0Xv32Fus5DpzGwz2GMVG9qs0vul8p4Pko75jfBmejNawA8OgDu1e6wQeq
         W01Q==
X-Gm-Message-State: APjAAAXNquliUDpvIR0ujKkCp9pDf42PyC2TJX91NzSvh7tipi6NHJKU
	+5kUJuiZCNznDZG6oJLapaM=
X-Google-Smtp-Source: APXvYqwU+W2lbfLHJkYXrqsOMakng9dOV4C7EInEVhrmehRvuKg0Zikwhx1gRh0JhSD6f9bTVDXahQ==
X-Received: by 2002:ab0:66c5:: with SMTP id d5mr7086934uaq.130.1566792040513;
        Sun, 25 Aug 2019 21:00:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:218d:: with SMTP id 13ls826904uac.13.gmail; Sun, 25 Aug
 2019 21:00:39 -0700 (PDT)
X-Received: by 2002:ab0:66d2:: with SMTP id d18mr7665272uaq.107.1566792039765;
        Sun, 25 Aug 2019 21:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566792039; cv=none;
        d=google.com; s=arc-20160816;
        b=DaiGKfNx02jgPHC1IiIDc/rvOpn9eGOiUhoCetpo8vRyreuBqLQ1D+6Op4KWdvK4jL
         tSb9Jy1hVGl/NUaw07FYM6bH0ADdE6xngxgCozXuGJhY95ouv0lo9VFNihAVciRcgUZk
         VcvXW41h8so+gt4AdEil8LEjDe5vkOMhQTIYazfYyB1EbBbAX3EGrdchZaziNeJxOE23
         xJ2nsMGLPXjrUO8CU0ZeAq3mDVgWC+cwsQnwu9t3R87K1EoY+TU7UaJBDLEZUGmu/Y/8
         6FWFnVtkpi96NNklKYvendKi+fTUyCg7KYaK/4JlGfzYeYqD+mxHQVbZOsskQm0C89By
         qITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pkHgSQUM/AqXeXuI6PqlHp47k55ZMjDT5L0w8A6gUzQ=;
        b=NWdi76Z9oO8ndJ6/CveNxPNL35AES38wI7+563t5EsfJr1sVRIm0LRmTA+DUm4fVBs
         sg6qVJxSI/3pu9VJtuH5GCO/9h/elVqCOk6+pnY9FxGFND7FLJhncieoTxvL8dzFwcdd
         NbsiCVncbLodRwUB1bAw4IEGZUCf6+HjQbbEn7Yz4tg1GfPboqld94iPnBs6TtxrBaB8
         1eeojci/Svx+9FdRXS1aGTTMBNULSeLgKTkQfRP5qCtF7UlcZmKdcszYIP6Ra+lxEOJw
         YFUsqQZ5gke6jhWYX4aCpSaBKt9JyCAgxIbsrME9eUvjoPo7j+ct7NmrPMTZvuPL0chB
         ye6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=H3cyczEz;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id k125si521912vkh.4.2019.08.25.21.00.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 21:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7Q40d4F053008;
	Sun, 25 Aug 2019 23:00:39 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7Q40dfk094822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 25 Aug 2019 23:00:39 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 25
 Aug 2019 23:00:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 25 Aug 2019 23:00:38 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7Q40akL075035;
	Sun, 25 Aug 2019 23:00:37 -0500
Subject: Re: [PATCH v4 2/6] arm-common: Introduce iommu functionality
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113521.7311-1-lokeshvutla@ti.com>
 <2dc1d2cb-4bb4-03a4-6716-f2311cb10b06@web.de>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <88328ab5-f553-9cf5-45a3-90fa1fdf1a83@ti.com>
Date: Mon, 26 Aug 2019 09:29:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2dc1d2cb-4bb4-03a4-6716-f2311cb10b06@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=H3cyczEz;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Hi Jan,

[..snip..]
>>
>> =C2=A0 void __attribute__((noreturn)) arch_panic_stop(void)
>> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h
>> b/hypervisor/arch/arm-common/include/asm/iommu.h
>> new file mode 100644
>> index 00000000..67ac34eb
>> --- /dev/null
>> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
>> @@ -0,0 +1,27 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.co=
m
>> + *
>> + * Authors:
>> + *=C2=A0 Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef _JAILHOUSE_ASM_IOMMU_H
>> +#define _JAILHOUSE_ASM_IOMMU_H
>> +
>> +#include <jailhouse/types.h>
>> +#include <jailhouse/utils.h>
>> +#include <jailhouse/config.h>
>=20
> Just updated this commit in next: jailhouse/config.h must not be included
> directly. It is optional, and it included automatically when available.

Just curious, how do you detect these problems? Do you run any static tool =
or
with manual inspection?

Thanks and regards,
Lokesh

>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/88328ab5-f553-9cf5-45a3-90fa1fdf1a83%40ti.com.
