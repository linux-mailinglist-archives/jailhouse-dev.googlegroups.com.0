Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBM7D6LUAKGQEC5KKONI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2625E5B4
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 15:46:34 +0200 (CEST)
Received: by mail-qk1-x739.google.com with SMTP id b139sf1605435qkc.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 06:46:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562161587; cv=pass;
        d=google.com; s=arc-20160816;
        b=ofNLocQVDZSy6+Vl/KmrZcibpQYcFeMYrmeAKTvm4Nbvt8wQ9yLh0zMad2Q23zuHzx
         MG28nGPPFoLjvzu4SdKsp6CN8EGXBJKx6EKWIj27ZODcT647Wcpku6qgocmIcrLGU/1+
         YsWFxErg61LP8uuUrsy58biWWPg+smL1oFtyF0khaf8w53s1OOXu7aAoJLq7bv5sMEnA
         h+VrAA0xPo3z5Q5K5xP9pKyoYA4Cd85BerFvJgBfxPTw67yTZgdHGVdHIQ43FMLOCme+
         qQqYtGyN0n9jXyXyjsavV1Ybvxp4RNqpKNOPShenKDyGkE5xCdP7Ym1LkBmCCoLsY/R2
         SIXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=3/4mR90b08tjvfdgSpLKLFZ5WxYj4uke9A+UqR6QCG8=;
        b=oOGiVsV8dR8nC1suTqbs61iE0gAYYZ3EmwOener38xcT+/UMgt85t9Nn76cTYOt2DP
         6zKZaSPxvjZ1RKlPr1Fw/ANi+u/07AgeE8LBYHUpix+5iTWZ7cAc6ns37xZT35h/naHa
         uUdwbqON3/6RN9TTavNMErrOc9jpxwLe5j2sApWNDVukD/dFwcKt5TkQDn7ZOd6+10/b
         iS7PDGJ2PEbndSsoAmVDYldypvJOZ+VCWmJZyvCakjw04G7bt7ANcOGAbxGyWtBavHRS
         I/nVo0ITSKcOeBCACstBBMd1qCptIBOCM04ycU7wsamFCJ7oTW8uIuT6jlVPmULu/Az+
         F52w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z3nCCAUB;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3/4mR90b08tjvfdgSpLKLFZ5WxYj4uke9A+UqR6QCG8=;
        b=FJ8lOwscKHKgpi3vfwX3PjHBMpukoLI6nYSlwQgFGy/3Zp8TYnoNK5ITMRQJSvNALl
         xCNM2m4gCZhxet8fkSy0MFywO1lMfRQyRmZ+sS80uoHhy8owgqDfu1HRHuBpPnRCgQLh
         4jeboTpn2qTHP3F7a0dpwhOKCB5DQDtnXMxbNpAU9PfaP5U7SHoibIdpaKrqb444KBKd
         gY+wfIFMNGiQ/FkmqFgN4JyMyVi5bXbxVxoak9reY3LsDfJbElFWY70rIjJ4WAYIvLmp
         1YauYzwEq7pTNjiLMDq755O8mkjxCWHJvjNFKg+x4yB53OsjPt5IB8gWfBZAIb17rgX7
         6yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3/4mR90b08tjvfdgSpLKLFZ5WxYj4uke9A+UqR6QCG8=;
        b=Tm+bHYNLLvw9i+n7ZhOsPJWrNKbpLZrMKVACPM2PnjZysLsBok5UTfDKiqjK90/yf+
         aHAO2do/qzdJROuMZT+XeQuK31Vlol4gpJvHQKcPKYWvjvj6s3rZKD7EJuoUaX8KPutL
         cwP0opZjAHA9cp7U3bxtFUt5ROmP6eZT2m14gs4xs5UlqyyRFcpV/U9UQKMdpiEVzIe7
         2Qo3+m75DDnxpqz5WJWDqRwDmEuVoeM3F1s8xZ48XHI8gL59XldSb5bqIzPK7IH1H9Q0
         x+UQqieaQfa42uKlNOS6WGnPOMdpZSY0nx36AeL7tAcXcjo3V3NoAc/hdS6ilinWDzmH
         9ZnA==
X-Gm-Message-State: APjAAAXlMNMjG3n+xTv6twzfU+cKX+mWjSZAThlIC2giXMSuezMRdRsv
	L+hdWDL0R/G04QLvODZjuL0=
X-Google-Smtp-Source: APXvYqwOzIJeQ9J4vD46A0EHe1scaPUvun0z2SDyEEtS+y3ubSxvYTS9Z4AbMje7jEIu5cSBx19+lA==
X-Received: by 2002:a81:4b87:: with SMTP id y129mr21540744ywa.275.1562161587707;
        Wed, 03 Jul 2019 06:46:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:103:: with SMTP id 3ls295621ybx.5.gmail; Wed, 03 Jul
 2019 06:46:27 -0700 (PDT)
X-Received: by 2002:a25:aa44:: with SMTP id s62mr19322838ybi.146.1562161587336;
        Wed, 03 Jul 2019 06:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562161587; cv=none;
        d=google.com; s=arc-20160816;
        b=cU7K4YMFL2LEgoLeyxL7jMKYRULAlb7ImApM0XJO0+jT6OZm3bWvLDQbB7llKuIfpi
         Ta5YhLZBY5iFGhd2fcgxywcs/k++v3zZYg/PTTppY9tLisKgj8+8Y+bZOIQkTq1IcEnd
         pHxXYj6sgfcYthLSJRCa70zWxTA03Se++PDjbajAoOp7jZ2D29qgLRgPu+7rGZYYvazD
         ANWYfnaWUi10mBrt3NMUBAEvB+W2QdGG4Tjg30/cYr6bPlgNJabaze0HrGTeLsCb8ZB8
         vcLLgE1oQkLLN80EwW5sPKsTtZx9oHrQe5pJfKzietOD/imhBB6mzzPn0tA+l8YzCPFr
         AU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MgNlfivzOuUViFXyEjFu5osgIeXIj0FZKykSzS6rl8Q=;
        b=m9VXfBURLPvZpV8RtRUDTdNqnX/4ij4qD90BTwD+1Dm1+uhC5J8BGN67PzO+l3nb/3
         tx5P910L/uhzZsMxJO+WX4jbdY8XSHaQSA2P3XTu1L6JF/fIUj5L6GGHxZMmflyhDq7E
         VjXYQsrUwOAMgy5XJIx6dbUSQAMxMD9r66PtvUXox0+/Gs+xphKd6Uvsca0pfdDKTUeF
         XHD2F4iFGs/tRjfNUFrPGXerRf6jaWs7UH4/6xbjrlW7biNrAbX6gnttzeSIa132VpDS
         LWeLvaE4wGx9KrHTjhNXzD+9P5NXHGXXWqv5m3jceY9wNknFRtiX2QxateAlBUxMc9t0
         0+hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Z3nCCAUB;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id t132si152029ywc.0.2019.07.03.06.46.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63DkQ0I037580;
	Wed, 3 Jul 2019 08:46:26 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63DkQBQ036433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 08:46:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 08:46:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 08:46:26 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63DkOKK120583;
	Wed, 3 Jul 2019 08:46:24 -0500
Subject: Re: [PATCH 5/6] core: Move unit initialization after memory
 initialization
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-6-p-yadav1@ti.com>
 <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
 <7d39456a-9797-e83c-1cba-63d21b374e51@ti.com>
 <ca098d37-5a46-882b-e295-d8a2cdf093f9@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <47bf5f44-f36c-1aad-3ff4-d4e315d4c837@ti.com>
Date: Wed, 3 Jul 2019 19:16:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ca098d37-5a46-882b-e295-d8a2cdf093f9@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Z3nCCAUB;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
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



On 03/07/19 3:16 PM, Jan Kiszka wrote:
> On 03.07.19 11:12, Pratyush Yadav wrote:
>>
>>
>> On 02/07/19 9:18 PM, Jan Kiszka wrote:
>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>> The SMMU driver needs access to guest paging structures, so they need =
to
>>>> be initialized before we can initialize the driver.
>>>
>>> No signed-off - because you were not sure if this is ready? ;)
>>
>> Quite the opposite. I was so sure this simple change was correct, I didn=
't double-check the patch and missed the signed-off.
>>
>>> The bad news: it isn't. The x86 IOMMUs have to be initialized prior to =
calling arch_map_memory_region because that calls iommu_map_memory_region.
>>>
>>> Can you describe in more details why the SMMU driver needs that guest p=
aging access during init, and why that can't be solved by hooking into ARM'=
s arch_map_memory_region?
>>
>> SMMU's init doesn't need guest paging access, but arm_smmuv3_cell_init()=
 does. Linux might have already initialised some stream table entries befor=
e Jailhouse was enabled. We need to copy those entries in the hypervisor's =
stream table. This is done in arm_smmuv3_cell_init(). But for some reason, =
cell_init() is not called for the root cell. So I call it from arm_smmuv3_i=
nit().
>>
>> This seemed like a simple enough change to work around the problem. Call=
ing cell_init() from a later point works just as fine. Any particular reaso=
n why cell_init() is not called for the root cell? I see a lot of drivers (=
ioapic, vtd, etc) calling it in their init functions.
>=20
> I suppose you mean the cell_init unit callback (cell_init() is called alr=
eady during early_init()): That is called on cell_create only. We could als=
o call the cell_init callbacks after unit initialization from init_late(), =
but that requires some careful checks if there are ordering issue. However,=
 that wouldn't solve your issue.
>=20
> But your problem is not that different from vtd.c e.g. It also needs to a=
ccess the guest pages in order to transfer interrupt remapping information =
into the new IR table. That is done during config_commit, and you should ju=
st do the same.

config_commit() is called at both cell init and destroy. I don't see a way =
to differentiate between the two. I need it to run only one time when the c=
ell comes up. The cleanup is handled by the unit's cell_exit() callback. An=
y other way to do this?

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
jailhouse-dev/47bf5f44-f36c-1aad-3ff4-d4e315d4c837%40ti.com.
For more options, visit https://groups.google.com/d/optout.
