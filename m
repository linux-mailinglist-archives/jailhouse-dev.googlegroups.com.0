Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBXXC6HUAKGQEUV37A3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D535E0A5
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 11:12:02 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id s5sf1251450pgr.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 02:12:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562145121; cv=pass;
        d=google.com; s=arc-20160816;
        b=zfuJ9oD69vLKq/c1fT+G4Ld0GlTfV3I2p6Q6sVl3BnWXoWXcgFvP5bYLmJEMBJqAK5
         zEZivn/KU7CGWsghEaWM1BE7jlaFDeWSs9VX8M6HKfqP8HIXRkm2c8nhY21XtW5Mb7uV
         7wLdiVz/j09Qg/YGmAWnl1+nGpGpOeZzSpOWjxh0h2FOYpsCfi9pSzfE+EHr7h6df1Cy
         OMFiIY6Tl7v9aE+3+pHq+SHnZFckSxfXXWEePnv+Urn7C6VBqWMWWbQPasj6mo8rBIeU
         a1bmsMp2v/MEdRfFn492oegJkhPTb5DnACDU33Bzu3i5dQKKtN4cUihyGOGbkfiFrkN/
         Z5Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from:dkim-signature;
        bh=uwad/yDTtUjN627Uijn4zobbLhHPuH8gtmcNehMiMv8=;
        b=z8jNmYBU2vnoTvihVcBs06+byA567HjoPINtQAeDBAKzpEOTLEdA7EB+0/xOlmeoGC
         dp3uDmtJClmA7DEla18P0KsCnMgSCBlcEBzB2c3baw0hUHUvvKv7EI0/ZkqkWwtcq4tK
         i8R9P18jFxst19kutGVxVtg+KTEkp2UMgErRaoDOYFR3Ie0IoNr17m2FCJHr6IpB9kqa
         mHX1KyhGbs5SMohxs4VOgRY16PNtzvuRlw2OELn7oqvYJf7ns2xX1HndfVFqej9I93Z+
         jmnX6ms0lFLHz3uW8BXy545uPzs0U11QaGS9Yv0j0SXqmoLuA90WF2feTwrGG7Vs/ios
         Bp3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dBQd1TJE;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwad/yDTtUjN627Uijn4zobbLhHPuH8gtmcNehMiMv8=;
        b=rPglRfbNsmIV2yYUBJdc8Kt03TWMUVrSCcuL6L5X7GPRQCzzm1emij7z2dUih2nKB5
         q5j4oOQDFCSzFCHjn5MGFOFxRKn06CkytEww71b+PoVUKXzyftY+J/7LKM5ISYlDRkPQ
         VE556aoQMW+puPN+x27Q4Va5r0zS+VI9dYfFj9r9Z3nTfV0W+kVunNCRN7qpfJAa0ufB
         Q0z6i7ePyxomHepeuYvWq62PnEU+tIj0/xoRDLtPmrwyIN/AJWRaYsARqV5gFM3HSkRp
         p5eSk4xk19qiJDV8mi1KhqVhH12mn1x0KYQx1qlvwQGlu0HD5Hbj3Ztg2Ee2XTQtvvIp
         o36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwad/yDTtUjN627Uijn4zobbLhHPuH8gtmcNehMiMv8=;
        b=F+IKRX2FIbtvHu1mKp2Gled5hHkddFaH+OWUpbATYau0W+fvJsVTaCzisfPQHnL1dk
         AbLggJAEN7u8V+2QMrdoKl3DELA1KkAOeuBDpproYDiH1zv7roOH9h+QCGtkjOp1Xr6H
         O74nvKu/8JZNgXW+veZT1nu7z6Jug/MtpA4G/vVnjrmVs86Q1YdMAiMRMEb5iiLXducc
         db9uk9iHwRzsdM7EErngKzE2Q8uN478vnp/58NkuPB4sft7yI/c2XAManXFMytFtt+jM
         tjVSmbByjPP7lDmnO1jYk004GBoNFdKpgFl2pJT4TjYKS7IEsHtrXEIHwHey2LRQxQzq
         BeEQ==
X-Gm-Message-State: APjAAAXH6UdS5yluDmZXVhSyLHjANXIMKzavhlR5S7JPKTkpqlIayOOf
	g5gb4iMl/QKjEOvKkE9iIzw=
X-Google-Smtp-Source: APXvYqxv/KszjWk+vozft8gZFEjBG1wk3tlJ7KQWdSo9Pj45+sDi6MVdFMNFbFgEnUK0cptS+jvoHg==
X-Received: by 2002:a17:902:8489:: with SMTP id c9mr41591650plo.327.1562145118744;
        Wed, 03 Jul 2019 02:11:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:1654:: with SMTP id 81ls327831pfw.2.gmail; Wed, 03 Jul
 2019 02:11:58 -0700 (PDT)
X-Received: by 2002:a63:a41:: with SMTP id z1mr35803270pgk.290.1562145117962;
        Wed, 03 Jul 2019 02:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562145117; cv=none;
        d=google.com; s=arc-20160816;
        b=tM5xfBc3uLMBdDdTZ9BVi8wZcGbibpztZHIAQjWNiECFNYmRfSMdFn9/8GZWGj5EC3
         un3YATh4t1zLkQ9uu/2qmOC5tJqySGE2IeyrmHuct8M37ylo4OtndQ4R8UtExTO00XxU
         zUbb4xAk4GfV+epqYGXyVolGpzpOKDrsfhTJfzLTNY8Krm1a3695W7GCvTpv3ffySnQi
         dWnLh/J0rfIqMCWOOSmlzPJZ4wGbuPi7tpSJQKQluDWzH5sXFCO2nW02mIJ5LKY9IGxw
         J/pLxhZR1UdPkaD5XKePXEK7yClhIFBKCtDeG1jZKpwm/yzDwy+2WoNxZb1n1wzVsGRq
         2JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :dkim-signature;
        bh=MVQj4qTKORo/BUboZfvAswXNCiDhCNfVWaaMCas4ZAs=;
        b=lhKykR5Cg5rIXD/PHw8GeWNN04FkT3F9Xwa9DxjmRGGYuRHCFsYXjgv8BJqg/VcKEs
         hd18sLmb4CxiOBVNgSkCl1IoA06Ru+nsbOQS2dJKy/EIQeustQQXxAHXTx0dcaUtaaDo
         LACLcHUUIvXiz2BbUf830CsM16tzXNGfP5SsSdYsYSJufcoBcsu1P9JxPmLOAeGhO2De
         sA6iXd+YGJFn0rkeL7qqY01StRcO7hihWSfgud8KhlKpcpI83iPhg2PWJqjLJjBozPef
         BeI0WwSrC0efLDOE/YgYs/MvEb/bjA/TwxZXEWMw9aqeKVmLLFlDZhtssKwyrQOfSqcA
         o4hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dBQd1TJE;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id cm10si144188plb.0.2019.07.03.02.11.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x639Bv9d092853;
	Wed, 3 Jul 2019 04:11:57 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x639BvPZ055716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 04:11:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 04:11:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 04:11:56 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x639BqCS076400;
	Wed, 3 Jul 2019 04:11:54 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 5/6] core: Move unit initialization after memory
 initialization
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-6-p-yadav1@ti.com>
 <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
Message-ID: <7d39456a-9797-e83c-1cba-63d21b374e51@ti.com>
Date: Wed, 3 Jul 2019 14:42:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=dBQd1TJE;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
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



On 02/07/19 9:18 PM, Jan Kiszka wrote:
> On 02.07.19 16:36, Pratyush Yadav wrote:
>> The SMMU driver needs access to guest paging structures, so they need to
>> be initialized before we can initialize the driver.
>=20
> No signed-off - because you were not sure if this is ready? ;)

Quite the opposite. I was so sure this simple change was correct, I didn't =
double-check the patch and missed the signed-off.

> The bad news: it isn't. The x86 IOMMUs have to be initialized prior to ca=
lling arch_map_memory_region because that calls iommu_map_memory_region.
>
> Can you describe in more details why the SMMU driver needs that guest pag=
ing access during init, and why that can't be solved by hooking into ARM's =
arch_map_memory_region?

SMMU's init doesn't need guest paging access, but arm_smmuv3_cell_init() do=
es. Linux might have already initialised some stream table entries before J=
ailhouse was enabled. We need to copy those entries in the hypervisor's str=
eam table. This is done in arm_smmuv3_cell_init(). But for some reason, cel=
l_init() is not called for the root cell. So I call it from arm_smmuv3_init=
().

This seemed like a simple enough change to work around the problem. Calling=
 cell_init() from a later point works just as fine. Any particular reason w=
hy cell_init() is not called for the root cell? I see a lot of drivers (ioa=
pic, vtd, etc) calling it in their init functions.
=20
> Jan
>=20
>> ---
>> =C2=A0 hypervisor/setup.c | 14 +++++++-------
>> =C2=A0 1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/hypervisor/setup.c b/hypervisor/setup.c
>> index e3b1b3c8..c4032f5b 100644
>> --- a/hypervisor/setup.c
>> +++ b/hypervisor/setup.c
>> @@ -174,13 +174,6 @@ static void init_late(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 for_each_unit(unit) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Initializing unit: %=
s\n", unit->name);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error =3D unit->init();
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (error)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_mem_region(mem, root_cell.config=
, n) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (JAILHOUSE_MEM=
ORY_IS_SUBPAGE(mem))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 error =3D mmio_subpage_register(&root_cell, mem);
>> @@ -190,6 +183,13 @@ static void init_late(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 for_each_unit(unit) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Initializing unit: %=
s\n", unit->name);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error =3D unit->init();
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (error)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config_commit(&root_cell);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paging_dump_stats("after late setu=
p");
>>
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
jailhouse-dev/7d39456a-9797-e83c-1cba-63d21b374e51%40ti.com.
For more options, visit https://groups.google.com/d/optout.
