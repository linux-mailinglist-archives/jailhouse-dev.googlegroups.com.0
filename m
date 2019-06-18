Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBKXWUHUAKGQERERY22Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B7498B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 07:48:28 +0200 (CEST)
Received: by mail-pf1-x43d.google.com with SMTP id j7sf8564527pfn.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 22:48:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560836907; cv=pass;
        d=google.com; s=arc-20160816;
        b=Eiy5AcXTKEiSyGjv8GKCjmOi46jSq9ilTIIgDC5ulpdw2SwRdL2Hdw5Gc+mGq1W9nZ
         x22Z1jQbki8JLGuy22cn15DUFlrEEbnB/XdaNuQAPKt9WfMhGThwhag5u6htMU2IA5QR
         q8Nk23Qya1ZE+E+O0iEdhBfXAUVFbq47qP3Bc09ydQ+h8UvNLRwxANOWgw3wYCt+307q
         SnCbnqB+5/Kc1bZBFFAaBmkFc3JrZmU+LN0sM/9/UaJCImNoGScYzigZz9clqmcLX38Y
         hbVa+6Q3XscEv7u9e8ZmlaxBh4ogpGhdg3ijEs79RiAnPQv7jAM1mg/t2l5gqWGv06yT
         Pu1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/CcWDQIo6whSvKf6Ab/X3xXw8unY/RVkJUVJnxv8P14=;
        b=Nz/NzZT6Nx4Vi9z+18VgFvoY+vlHtUQT/d6kBMlH98LhYcr5kanpe7jaM78w/jKs/I
         yKprYNok7EavUT37177fSGh2ZcINZ55CarIYT0UgiUOHemAU5evIU88aU8PFdNTDWm+E
         AatioXxVZEsJoWOJPmKQbQa2l8Knq4q0gAlWFOT/6FH4bY0u4UEkJlcXq6Z/5faq5p67
         XMN6JWAZTFIwi9F4wFNI9AFei+Tq1+aKvrxzBO9H4WDbSx4c0c+OvoEV4VQ6JP4eOwI+
         p471srNcnJTkfa0BfMCqWfUiUQd4H6R/P9zMwbVK4H7kSFCYBuajMXp6K07FoV4w5eSg
         PGZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VF9ikqQH;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/CcWDQIo6whSvKf6Ab/X3xXw8unY/RVkJUVJnxv8P14=;
        b=HLt4RF1YiLOJOkK44uAzrRGK2jHlKS3eaSl0RU90wk0eVRdpqqkd9+nEOyyO70Rb4I
         Y+FaohuB6om6EQRy3RoSJg0zeC1vC+1u3u9b1DRmt+fzeFW9IjjMBGCoMxRJYzcbimli
         3LtnOy2NY9pOtkSmu0kVjM07JG0MIWWLAS6n7MjMpWacn7Sw6ZZa8PIuYKcfEoCZt1oP
         VPmP0rnkNfsjs+7C+9YEM+/hrBgYdsIZOsi4JI+LdKZRT+DbCBJN+Zi66Du4ycU2bqXM
         /23Mu1/8zmDwYmrD8/JkQDI2PLqWTDwh3mGfmvM/tcsPVxy5XO5jkvnY57vLhwqTGkUL
         Y89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/CcWDQIo6whSvKf6Ab/X3xXw8unY/RVkJUVJnxv8P14=;
        b=XKJXaQISDkX+h9cRm1aNvNi/Y0Ue0rM4cAYP0q8i3e6WCHiCbY+EABg0q9I9+/1jj4
         jvI6+LXhThWMipcKon65lRbYKpE6lPWGimWpI022TAcANZbuYAboFtQcuw1n+Tlb5KKV
         dWE0T7T+YoILrT9mY1oQAnEL07jql7cL4da0PndkpYMfwk+0hmiwB7FoZFn+7GkTFDGu
         ohhqNxv8ybgIL91m/lvDTyJ9OClVB/8pwT4tE1NRIsIh1Eb3gJtwXGGC5ATwmFtYqFqj
         7ZQk+q3i6+sQsvuxoJd93SsrybJJ5vSkSXzFSWO9A8F6j0ykHblfStrAP3vL/TtNAwL5
         /nUA==
X-Gm-Message-State: APjAAAVVV2xgwsabHX94WyPFkfI3VpcCUr9Gd+vawEhHtZX+0eCgVYFI
	VLhd69xLq34lxqHe2/NpaHk=
X-Google-Smtp-Source: APXvYqyvcBQ8+FHoyAubOOlGCiYB67O+yxFzZwBPUO4Co3ukYeiaC6MWgcaXaEMs0Qm17XSArGO2Sg==
X-Received: by 2002:a17:90a:37e9:: with SMTP id v96mr3135080pjb.10.1560836906950;
        Mon, 17 Jun 2019 22:48:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:2704:: with SMTP id o4ls597168pje.4.gmail; Mon, 17
 Jun 2019 22:48:26 -0700 (PDT)
X-Received: by 2002:a17:902:1e6:: with SMTP id b93mr68296204plb.295.1560836906476;
        Mon, 17 Jun 2019 22:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560836906; cv=none;
        d=google.com; s=arc-20160816;
        b=k/Gn+s3tTcK+B7Uqa0RuZwX437KIDogZ4cyPNFx3sVQL4pRviTqRqMGrBLuViFygcJ
         FL3JIAn+Elt2setDUPWZ9VF4REdevg1m4jDsI70Q3mjoXSwkr+nkkO4yzbd7wCyWT2Qn
         /y+vHZ88geWteUTX3dAYDRBAU9fXYElZi5fi/9m6widrksEe7ojg3gwLXDOzROHdm/7u
         X+e/CyHRfie4cO0c8ZhXpZCmpTpt+a0eo2ytqit5pBy2ljEcDr3E0sa7YiudxJmRbKg7
         dw/O/2aDxEOUAzG+oNfPVwyeiMhYLiquyOjYSzhCobg1A433UQwbgR4MqC8/g7aRjy/h
         k1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=F4JA3x6k2XPJCUcH7kpjap9itBv2pYHOFqbV+RPHdjw=;
        b=gnjcH0DqsbziA+wS1su1BE8Yxp8ORCPtM5ezouCjjJbZMf265J41/fuFvOaZXNx7+h
         4ioyRQCBPGsvUlqunErPhB4C1fK2jwyZdFkUl0BOiGml8jUE4KZeDJ0x+YO8FXQiPadV
         zztI+OQ2aKpsz5+11IDuAR0d1ym4kPi6IYk4H7NS99Dz2fG/MbYVP+qp2oRB70+C4bZJ
         7jh4x8ngaN13kbKHp/Btc/agBb2/93XFhY6tv50/YoAGz5mbgm+XyG4iuTgzuFrneU84
         rYM8Y4Ot666Q325zUH913NO9FimvOPuLd3azlqDnC5vwxNjgWj0CvTuD8eKZL33Ep1Ue
         ctyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VF9ikqQH;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k65si570684pge.0.2019.06.17.22.48.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 22:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5I5mPLo024479;
	Tue, 18 Jun 2019 00:48:25 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5I5mPXZ043217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2019 00:48:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 18
 Jun 2019 00:48:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 18 Jun 2019 00:48:25 -0500
Received: from [172.24.217.248] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5I5mNGW089362;
	Tue, 18 Jun 2019 00:48:24 -0500
Subject: Re: [EXTERNAL] Re: Allocating coherent memory
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <7b93d482-cce6-ffd4-291e-7e372f61cd89@ti.com>
 <cfb2de66-e918-74bf-5de9-cbb3aca5571e@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5c8d8dbe-f842-f7d0-fe90-2161f636b07f@ti.com>
Date: Tue, 18 Jun 2019 11:18:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cfb2de66-e918-74bf-5de9-cbb3aca5571e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=VF9ikqQH;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 17/06/19 10:15 PM, Jan Kiszka wrote:
> On 17.06.19 16:27, 'Pratyush Yadav' via Jailhouse wrote:
>> Hi,
>>
>> I am writing a driver for a device that accesses some in-memory data str=
uctures. Right now I'm using page_alloc(&mem_pool, ...) to allocate those s=
tructures, but I suspect this memory is cacheable, and thus updates to the =
in-memory structures won't necessarily be visible to the device.
>=20
> I suspect you mean you write a driver inside Jailhouse, right? Why is tha=
t driver needed in hypervisor space?

The driver is for the SMMU (an IOMMU for ARM systems). It is in hypervisor =
space because the same SMMU can be responsible for multiple cells.

> Yes, hypervisor memory, including that which comes from page_alloc, is ma=
pped cacheable. But why can't you evict the content from cache to RAM when =
that device should see it? That's how we generally work.

That is what I'm doing right now. I call arch_paging_flush_cpu_caches() whe=
never there is any update to those structures. But I thought it would be be=
tter if the memory was not cacheable to begin with.

>>
>> There is enum paging_coherent in hypervisor/include/jailhouse/paging.h t=
hat is passed as an argument to paging_create() that does exactly what I wa=
nt. But there doesn't seem to be any API/memory pool that allocates memory =
using this flag.
>=20
> PAGING_COHERENT just means that we flush page table entries along the con=
struction because the table has been in use already and we will not perform=
 a full flush after all changes are applied. It says nothing about the cach=
ing attributes of the mapped page(s).
>=20
>>
>> I tried allocating memory from the remap pool, and then remapped that me=
mory to the same address but with PAGING_COHERENT instead. But that causes =
an exception as soon as anything tries to access the memory.
>>
>> What is the recommended way to allocate coherent memory?
>>
>=20
> I suspect you mapped back the virtual address of the page, not the physic=
al one, no?

I passed paging_hvirt2phys(virt) as the physical address and (unsigned long=
)virt as the virtual address to paging_create(). What's wrong with this?

> Still, haven the memory cached and flushing caches as needed still sounds=
 like the better pattern to me.

All right. That's what I'm doing right now, so I'll stick with that.

> Jan
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5c8d8dbe-f842-f7d0-fe90-2161f636b07f%40ti.com.
For more options, visit https://groups.google.com/d/optout.
