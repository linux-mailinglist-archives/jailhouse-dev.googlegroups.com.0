Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBDELUHVAKGQE5JRX3OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79E81FBD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 17:04:45 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id o9sf17489905ljg.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 08:04:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565017485; cv=pass;
        d=google.com; s=arc-20160816;
        b=tiaWxcOFqCyokFmh2x/sQhuFMbv2XSfM41J5ZSAmI4zNVXB5T0IB7Hv8hJr1jnLqGC
         Z2kngMrv/vcOKeYC2TVwnYYwfU8l5wwqvZKIfsOwjGszJmg4bN81n9hsRKex2A0OOyxt
         CWmco6cj9IGj+D2GqipR4UhoDcHifoH6/eJU2Uuf4PgGWDQ5I0iddPyJTUNea9IX+fkb
         8Ia2hV2eWojSI2VU1BKWxazDZTLoiFSi4VupwJa9xOnz95rwAL028OBR55F0ihN8aGBR
         oVG2yvUj95ZuspPiNx6LJgANtE2VkLs2p76rejo9kwiG+rGltSqSbiL9Yk3RbZCiLUNo
         HQWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=oG1LfIyIMmhIu/j01RqL0AujoBKCUJqay3P17fuAkiM=;
        b=VTx+2IUKVK/nnRBKuxUHhtaWvHwFbLnXVrX03eS1PP2stzfP311/gtBNsRQXMS7Jcu
         ppUW6pBacybq0e3ewVO+caoLlhebpxODBxVIo4AvuKOs363hcMQrq5GGmNxxxVOFi7Uf
         WlFkzXL1eD9vRIr8f5ijrNkxfFteKWFXpKFZTyWD0fl2eDDgRQV6iflXO2pMSfye6lsZ
         3uPxeysux8EqS6HjlH1ZROeIDWTJQAuzxy7LUAf8/cIY4QbzJ12rqhfkmz+Z5asiieiJ
         f156lwuF+XTyGt80E0p+ClnITAXsVqb0XOtzCiVbe4PfKchoAsd3BXYCwDAo4JkESUOo
         xpcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MzFyUFh9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oG1LfIyIMmhIu/j01RqL0AujoBKCUJqay3P17fuAkiM=;
        b=IC9DzOmufsgrL4zKxWy125MkbBzbVmCJS9feX2P4cHQ2gaUKKj0xGYiMKTF7Vn6Yha
         9nxrT671fgCTjMqEGqRtFgBmKz/Ys/ZTdfuP+f9qdXJ2ShjKdbsSXt0U0tmtlLcMasBH
         G9XypIT1iaurZLkKC2P5GKayk/ckqcchovKX8rdldBZlfk+0DOpMfiFG5KEvi8Y2hxjV
         tX4vF9K6VefzEj24uOrrVdbzT4yaO43GEALPY4rNSiHyZD03dVnI+TonzVDueJwtQLQX
         5F7wHwDvOHmsCkdyRpf6D2Q4kV56KOpQyci2/zxKE2BUXFvZORIKcWbzxD/sJ1jiHYkU
         7QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oG1LfIyIMmhIu/j01RqL0AujoBKCUJqay3P17fuAkiM=;
        b=N+hy5/kMGfLs9K5+VTIuE75t1nidiFGk9uYPz0P8mZs9uArFIhmm5gU1RhIngKnESo
         weWHrxK0gQGfjJdrfOqz1pfUx2L3mktWBaSRghqDR1ZJXqkNED3Aq5z8KTPiqj/Xa0ZG
         4tRdF58Tj65LVLWvCeLVSdlyCrgULKCDJ4RvolaSAqBRxqds0B83YefiBtkg5VLJZ29d
         43I8uSgcYOu1NB009uJPulHHykydLBcYstNrVq5XVQcIc3uWtFeMi1jgUzpO2C7s5D8a
         V6K9lEtX75efpog4G4dmyY+MpJwZbqsaNI4fTsXde7m4WPIMT9jW9agOO9o0oP91Gcy+
         GxwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLuhf3Yyqhy9RGybvbVkrkUzg7DhPwG1I6Pq56NCIV0KvRL9JB
	VJDvsUHgQOvzUfoYGHubG4M=
X-Google-Smtp-Source: APXvYqzrCHbR5eBG5sKC6WzexTYku9fug5tceqc8kzt3z/CpIfKwBySK5GeMWQ+kOrceUphNY9CwVg==
X-Received: by 2002:a19:4aca:: with SMTP id x193mr66642142lfa.146.1565017484960;
        Mon, 05 Aug 2019 08:04:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5b91:: with SMTP id m17ls9522330lje.10.gmail; Mon, 05
 Aug 2019 08:04:44 -0700 (PDT)
X-Received: by 2002:a2e:9753:: with SMTP id f19mr78390792ljj.113.1565017484379;
        Mon, 05 Aug 2019 08:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565017484; cv=none;
        d=google.com; s=arc-20160816;
        b=pVk8+u4b/Ovf0UJEhOONNQNeNxFqC/2Qejvmobcd+bTflhp1gaix/3xPjc+u3aigGJ
         TkbK/EhdjqwJCNVgs6vxDjD0TpREZKdyZ2qIGu82qYuSVOCxHoRv5MiPg6wEAnX4sFUu
         VDlT6KpHklwBj2rfTAxkewIhvos6wxEgUiPcwILTfakEFpyjhCLUq64WA3AIfrlEQu+g
         EhlEd/7fFfk0AScL9EKmEgPHzV4cn0GbR31lNZLCBxVG25fK+WuEgJ/PfRg+WDZo8bRo
         6eISLaUWPup5DXgBfff/HJmz3auCis3/Rq/QUaSH0dFxAVG8Ki2TXxSFV3GpDVm0gvW0
         GUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=zaxxF758gWMSwUy1BQCG9ues1TgF3EULgKTaEO70bvU=;
        b=Nw99wTgFNY4q0VxFISDSsz04bze2quyBJ5f2rPmTdfiuy8qw3KqDXLQzrwOfNjKz+8
         KjJWSVoi4Zxb3nsIISoHUFO2P5o/9ytS6riPkJl5e+ZQBSXRcJ+Ue1CyfS50Vz4hMp4l
         hmh+OXWOtk6Dc5a9Pdppq/a4+67LqrSadUnlyjQj9I7H8QN/bjthsO6hE0nEG7QoowKo
         XhaHDJjZrtZ7s5pxf6LBMLIh0bLd0f9qpnUrycsK/jS8U9cvB149CMQvtcf9+8+7NSRT
         DkPEP9W1Tw+FUTlHCxLRphR+5p/YICQ7ybP0LNVayrkXvjAv0U2NoBcT+HRwBYa6xlU5
         jsvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MzFyUFh9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id m84si3431409lje.1.2019.08.05.08.04.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 462Lf30hQBzxws;
	Mon,  5 Aug 2019 17:04:43 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 5 Aug 2019
 17:04:42 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
To: Jan Kiszka <jan.kiszka@siemens.com>, Lokesh Vutla <lokeshvutla@ti.com>,
	<jailhouse-dev@googlegroups.com>
CC: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>, Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
 <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
 <e31985ab-b95f-d493-01e5-883a6c94cc31@ti.com>
 <4d6a7a70-6c8d-7a25-a674-03142e112caf@siemens.com>
 <d7aaf90c-94ff-9356-d1e7-db1ca5183a29@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <ec624c9c-02d9-98e7-edfb-a0071c807afa@oth-regensburg.de>
Date: Mon, 5 Aug 2019 17:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7aaf90c-94ff-9356-d1e7-db1ca5183a29@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MzFyUFh9;
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



On 8/5/19 5:00 PM, Jan Kiszka wrote:
> On 05.08.19 16:54, Jan Kiszka wrote:
>> On 05.08.19 16:35, Lokesh Vutla wrote:
>>> Hi Jan,
>>>
>>> On 05/08/19 7:15 PM, Jan Kiszka wrote:
>>>> On 05.08.19 15:25, Ralf Ramsauer wrote:
>>>>> Hi,
>>>>>
>>>>> On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>
>>>>>> Right now, jailhouse only supports iommu for x86.
>>>>>> Generalize the data structures to support iommus of different types
>>>>>>
>>>>>> Assumption is that each jailhouse_system can define iommu
>>>>>> instances of different types. Extend the jailhouse_iommu
>>>>>> to add type info.
>>>>>>
>>>>>> Update the x86 config files to reflect updated data the new type fie=
ld.
>>>>>>
>>>>>> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD an=
d
>>>>>> VT-D]
>>>>>>
>>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>>>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>>>>>> ---
>>>>>> v2:
>>>>>> - Undo removing iommu_count_units().
>>>>>> - Remove the union from jailhouse_iommu.
>>>>>> - Remove the stray blank in amd_iommu.h
>>>>>> - Revert to using n instead of i in amd_iommu_init().
>>>>>> - Fail in Intel and AMD when any other type of IOMMU is found.
>>>>>> - Remove the accidental Intel configuration check.
>>>>>> - Update cell config template and pyjailhouse
>>>>>>
>>>>>> Jan, please take a close look at the template and pyjailhouse update=
.
>>>>>> I'm not sure if I missed something, or did something wrong.
>>>>>>
>>>>>>  configs/x86/f2a88xm-hd3.c       | 1 +
>>>>>>  configs/x86/qemu-x86.c          | 1 +
>>>>>>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>>>>>>  hypervisor/arch/x86/vtd.c       | 2 ++
>>>>>>  include/jailhouse/cell-config.h | 7 +++++++
>>>>>>  pyjailhouse/sysfs_parser.py     | 2 ++
>>>>>>  tools/root-cell-config.c.tmpl   | 1 +
>>>>>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>>>>>> index 315d0e29..849c5756 100644
>>>>>> --- a/configs/x86/f2a88xm-hd3.c
>>>>>> +++ b/configs/x86/f2a88xm-hd3.c
>>>>>> @@ -50,6 +50,7 @@ struct {
>>>>>>  				.pm_timer_address =3D 0x808,
>>>>>>  				.iommu_units =3D {
>>>>>>  					{
>>>>>> +						.type =3D JAILHOUSE_IOMMU_AMD,
>>>>>>  						.base =3D 0xfeb80000,
>>>>>>  						.size =3D 0x80000,
>>>>>>  						.amd_bdf =3D 0x02,
>>>>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>>>>> index fdfa8915..2df2807a 100644
>>>>>> --- a/configs/x86/qemu-x86.c
>>>>>> +++ b/configs/x86/qemu-x86.c
>>>>>> @@ -50,6 +50,7 @@ struct {
>>>>>>  				.vtd_interrupt_limit =3D 256,
>>>>>>  				.iommu_units =3D {
>>>>>>  					{
>>>>>> +						.type =3D JAILHOUSE_IOMMU_INTEL,
>>>>>>  						.base =3D 0xfed90000,
>>>>>>  						.size =3D 0x1000,
>>>>>>  					},
>>>>>> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/a=
md_iommu.c
>>>>>> index 02712571..2fc6d033 100644
>>>>>> --- a/hypervisor/arch/x86/amd_iommu.c
>>>>>> +++ b/hypervisor/arch/x86/amd_iommu.c
>>>>>> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>>>>>>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>>>>>> =20
>>>>>>  		/* Disable MSI during interrupt reprogramming. */
>>>>>> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
>>>>>> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>>>>>> =20
>>>>>>  		/*
>>>>>>  		 * Write new MSI capability block, re-enabling interrupts with
>>>>>> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>>>>>> =20
>>>>>>  	iommu =3D &system_config->platform_info.x86.iommu_units[0];
>>>>>>  	for (n =3D 0; iommu->base && n < iommu_count_units(); iommu++, n++=
) {
>>>>>> +		if (iommu->type !=3D JAILHOUSE_IOMMU_AMD)
>>>>>
>>>>> This is a comparison of an __u32 against an enum.
>>>>>
>>>>
>>>> Oops, the enum is still around?! I requested to remove it but didn't c=
heck again...
>>>
>>>  it is fixed in v4 :) $patch is v3.
>>>
>>
>> Ah, ooh... Ralf, please use your time machine only for funny stuff! ;)

Woops, picked the wrong series. :)
Let me just warp back and=E2=80=A6 Forget about the enum comment.

>>
>=20
> ...but Ralf's suggestion to tune the values for easier conflict detection=
 or
> resolution is still reasonable.

Yep, that part still applies.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ec624c9c-02d9-98e7-edfb-a0071c807afa%40oth-regensburg.de.
