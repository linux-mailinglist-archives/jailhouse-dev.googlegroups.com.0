Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEVJQXUAKGQEMS4SWGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5843052
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:37:55 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id a21sf27239633edt.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:37:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560368274; cv=pass;
        d=google.com; s=arc-20160816;
        b=VPXULBwPBfcT4f+/rjJAXRz7wghWbaPBjJ1GBcChj4HN8UtEpjhMoMWHlGr4Ys5JhE
         Y0uH/IMP8Ye8P7VaqxK6EBQ7+z0m7x7g127vD83MGyuYocPOrmz3jVEMQFNA5jbIjz/s
         LQquap15row0Rwt1Fa7DyS7RP/ySyj95DfTw9qXQzv3kcTZjz7TcwWoEhYRVTo+aQeDP
         NjpAVsIZ1VAYLmFbijCX0eoaC9yliYqsUCO5zBCyO0o7bQ1xbfLg1JrZC1DNSDN96xlV
         +D9o6AMsJHL+kABBLumb8JhlPWIEN50dlQvV68L8cZZjw4ahH//4gsk8RmgQwZpcw0q3
         iZcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=QJTYeeLf3Jaw6bKSN+k4QZBL/50Aagmk0sAonm09hgo=;
        b=kUGv3GgLnGx8xG6GDORCL17gElfKf9xkJCum1vXv0nphDHUCOM91sLsGMSOzsRQQRP
         iR7IOMZyOHh283oR19k/bic9oEHPgr6WX6kU5QzUB2x7/9CQw3wOvQjjAgCwdcijpuoG
         0yHYN3cXvBx/1KQYJfXJPKuzpWRljf4LrpeAoyS1JzA0DKXPV1bB/oSH9HppgrBHVCb9
         LrTMAhWBrV1DVfvYcfAovXRoHWjWMkWiDDQoNDRuv7ZbPl0o9mBIRQ5qGfF7kKDN3LR4
         w6644TyOw9T3pKfyHhLyZAHVZPhW2El9GEr2JJ/KEhsd6ocSjvtdKoTaibqKWEf/GWMO
         q1kA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QRobXutO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QJTYeeLf3Jaw6bKSN+k4QZBL/50Aagmk0sAonm09hgo=;
        b=Z6ZroEuMrB2I4dn4voSzfdmDuk7wgUcyfR0GNgCYVJmvAKoZqMoyURbq+zP6JITsgy
         Mcl0mT3WagMc+e+taSKi1+eq5Da0vvmPcEdA4eS+h6kcoEFnZvaBUjHlSe0yYx5YOT+g
         SrnR+OcLBbLXwLBahSDZWSbzAaJGXYMtGrjgOswZ9Jke/wrHs6fuwgRVhs3u6DOf1hJa
         t2ICGm5xj9XLLHuN5W2fpyBePce5gBcPmhFWEPQgUuKrLXwk5V157Z/b3yRGqLeGePjr
         AAFqpl4/EaKf0LjBTUXxxmx3Tihn7GFRxPTHzqmYHuT/7Ex65dGgv1Fhz5Tbj+vrMlhK
         A6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QJTYeeLf3Jaw6bKSN+k4QZBL/50Aagmk0sAonm09hgo=;
        b=p6BuTZGBV+Op7LZNLfLdyntWatDv6ni/5tmQk2BQsESLN/dvgPe3daOXTtOcaaAehT
         pVOO3/K3h//aXaCo80Mw4E695gMGu5cgBSHpnyhgMGXtAFrX4uFu4TI4kg1/7zooiBQh
         /rZ1xjufuVi2AT6H8+34i6oMZLXi5Cc3XhYWEh7VmnF53oaKEXrzah0QnjaBEjelCWVk
         YcCkmGwFixwy9Lau5K7S6Bn1J+YpCx91D9+QJr0TWzBGzGyjwLJb8Ui/shJrZX2dR/tY
         G84Xu/9rvfGATr1QuFiGRIxWRvUEFW0AI5ZzqpE5FuRI2o35OePZWr7zsxenVZZsaPmD
         SuAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW98eYrAV6xTBsEjXtDLZ1iee5d2azvOdD/IvFohopt405zlJ/d
	QRtFjR8EiYjtFCTOvChtBqU=
X-Google-Smtp-Source: APXvYqztmEBfGzsiElkh9BsLtMM5u2HBWdO6xdeA//+37WxOiSWh4DiEqiovudULQqNyXi7XEaNwHA==
X-Received: by 2002:a50:8bfa:: with SMTP id n55mr55446935edn.9.1560368274774;
        Wed, 12 Jun 2019 12:37:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5e48:: with SMTP id b8ls773796eju.3.gmail; Wed, 12
 Jun 2019 12:37:54 -0700 (PDT)
X-Received: by 2002:a17:906:9410:: with SMTP id q16mr36730456ejx.90.1560368274285;
        Wed, 12 Jun 2019 12:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560368274; cv=none;
        d=google.com; s=arc-20160816;
        b=Cpsg5w7xuVLWhjrXW03IBAmvNF+3i+5eRYEUy+V5SrKyTb/2tG4fGjcrvjIBiFzydK
         fbA3CuqEl2mHjjOX2bAMSYohmDcRPklTkVeqxoc1+4gZM0QhuUH0wlpxLTcaJNbZzuf0
         xEue/cz2LAYBjRSLOi/J5pUHoXdmC52pc9MU6C/Cx1OBgdD7mL1gxQKpFsbHK+pDULql
         0YIu0DXviet6GE5LNrsy5SUZ/K7QZLcebFWkHBYN7iAXuio0ea7CzPRmpTREZnEsfqRe
         d1Ro3+G76u///Iy/Oe1F0yNrDcuiBEp80UGmjXfL1clB+VRGdIIxi/Dsu8fvKZ/qDzhu
         QCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=nkH7fIywnBAiFj6oxZ71/kmOP5qoNhNzwTWrXQDFpk0=;
        b=K+Lz9U9WGKOecKKlWiRYT8CApaxmxqPHjALs0mbL76JcIDe7f2wVYOxFCfBzFMKWjt
         HvbhJe20OZI2AW5uAdPzX/ztSU8Yd1++O+ASzoEYVxBaP+qAxTvshLeDDVtLnh0c021L
         oewvn1hzt2xt63gNaaiz9x7dJ70zjrGphh7WX/pT+P1Kr4DXdr4PR58+anvnDV3n3ocS
         u6gkxEmNXPCDvWso2G7h9pKouVQBmr/SqLKrFTD6rDCcyq9SPGsrzCZqHlY1+5deBm6O
         P9i02+2LGemYZZ6wE33cyD6EuBuh5nywK/D3lBCTWX3ypKRFByAMZUDur0Ra/thq7n6h
         fZaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QRobXutO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r27si18372edd.4.2019.06.12.12.37.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45PHG968fczyD0;
	Wed, 12 Jun 2019 21:37:53 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 21:37:53 +0200
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>, <jan.kiszka@web.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <227b8454-0d62-ecd2-d052-7a94b4ceb8c8@oth-regensburg.de>
Date: Wed, 12 Jun 2019 21:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QRobXutO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 6/12/19 9:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
> Hi Ralf,
> Thanks you for the quick response.
>=20
> On 06/12/2019 03:12 PM, Ralf Ramsauer wrote:
>> Hi Vitaly,
>>
>> On 6/12/19 8:45 PM, Vitaly Andrianov wrote:
>>> Hi Jan, Ralf,
>>>
>>> More than a year ago I was working on Jailhouse support for TI AM572x
>>> SOC. That time we used v0.8 and everything worked fine. Presently I
>>> started to port that support to v0.10 version and found a lot of new
>>> features. The mane "feature" that you removed "mach-..." and introduced
>>> "units". Because am57xx requires to have custom init and cell exit
>>> functions I think I need to create am57xx unit.
>>
>> Hehe, upstream first! :)
>=20
> I will as soon as I get it working. I don't want to do porting work for
> every new version :)

That's the point.

>=20
>>
>>>
>>> If you remember, the am57xx had its own:
>>>
>>> int mach_init(void),
>>> void mach_cell_exit(struct cell *cell) and
>>> int arch_handle_smc(struct trap_context *ctx)
>>>
>>> so, I have to implement the corresponding am57xx_init() and
>>> am57xx_cell_exit().
>>>
>>> Here is the old mach_cell_exit function, but many of the functions it
>>> uses disappeared in the v0.10 version.
>>>
>>> void mach_cell_exit(struct cell *cell)
>>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_=
set) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_=
read32(wkupgen_base +
>>> OMAP_AUX_CORE_BOOT_0 +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> }
>>>
>>> Please could you help me to find a example of similar function for othe=
r
>>> platforms I can use to implement the am57xx_cell_exit function. W/o it =
I
>>> cannot bring the second CPU after a cell destroy.
>>
>> Almost exactly a year ago, I removed vexpress support. Vexpress used to
>> have a similar pattern. Before I removed it, Jan converted it to a unit.
>> This should give you an example how you can use it.
>>
>> Have a look at aa9a67d63f326a89294781acb7b1562f54b0538e. Does that help?
> Actually does not. This commit removes vexpress support. It would help
> if it converts vexpress to use=C2=A0 unit framework.

Vexpress was converted to a unit before I removed it (as an unit):
ae21d8823ef62c ("arm: Convert mach-vexpress to a unit").

>=20
> I think I have an issue with SMC. After I destroy a cell on CPU1 the CPU
> is sitting on wfi loop.
> But CPU0 cannot wake it up. I'm debugging that path now.
>=20
> In v0.10 there is no arch_suspend_cpu(). Does my am57xx_cell_exit() need
> to call some equivalent of that function @v0.10? If yes, than what is it?

units have cell_init and cell_exit hooks, cf. include/jailhouse/unit.h

  Ralf

>=20
> Thanks,
> -Vitaly
>=20
>>
>> =C2=A0=C2=A0 Ralf
>>
>>>
>>> Thanks,
>>> -Vitaly
>>>
>>>
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/227b8454-0d62-ecd2-d052-7a94b4ceb8c8%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
