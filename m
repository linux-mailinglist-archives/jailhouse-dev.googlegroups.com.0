Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHTULXQKGQE3MHWFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id DE985113CBC
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:03:44 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id z23sf588798ljk.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:03:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575533024; cv=pass;
        d=google.com; s=arc-20160816;
        b=N24Ksk63XVSwgObv7DkRQTXJAvxR/sjA1e0MCH6GqJ9KMcXa1MVBNlVuzx2jUkjwAI
         kdVWO+Ato019Wb7oipT9323sAUSAD51O3lpHA3Pm1KfqgCgucrI7o+09OG5itmNqZQYm
         31VwhCTL8Ep7txFlxFY7btZ8WyzpCwcrT4HiaUWCZHBZxU1+t6A7lY3z8a4yr56DcW+3
         z3k1PHUN2rkSozzURMQk5kJfym/kEspt0BpTQzwCsKinLODk3Zn06mNHJ7yscR6AOJEx
         abtyJMW7LThu2Ix/rlwta4g09WRAz0pZe7l3B1snJd3LKBrcg7C4fThvU+gUoBhCFMDB
         ZTUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=m+GWnvLEMQFBKPIuVJq3E1N+q052izuW81eFI6MM5LQ=;
        b=KM0yEI5qOlPM/mEVd0QXh5gRJ8pdYUHTOdYAoeSsCTUtu6Cj6vmq5teVl/4j5p6RYk
         9mLuNmVb4/cw/PVd0UhANiujY3cqDdiIX1NdmHoZimr9Q0WVQtc9jVUhI7VI6xyEz5bK
         N37xb4HeSfIierp/VGj7Ukz9YCuPK/rfhkE5nHTL1SY2SVhLaThh1/0w9qJg5SAfj4yA
         b6WzXa87iUsSt57PWoyrO0Ic250F+kB0hKTHKDHbaLNL+FfT/xY/gje9oOMb2PdiTgdH
         TPbK1u26liqu8spsT/ecyL3J/I/jsoD+qBZv6ZfZOSB0NMsCZBRTPd6zDQxoEGEMvSnV
         O/Og==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m+GWnvLEMQFBKPIuVJq3E1N+q052izuW81eFI6MM5LQ=;
        b=Fc71h7hKnu4ihYRbw5vsFqiv2Rldz3cyjn8cM3SHE/12aXjQLDb397/ytqaAVdXpeO
         F3JDMw93v8a91p90jZ1mmdSLmfrg+8O2QfabBWLvEMKSAar0Mt5dToKlXm6JPU1CACsm
         eCrPYZ3LD8shegyVDo6o9xfuPxsXD6Y3mZpRAULDdWzuI0wvqWGq1vvp7uhzwqXn1Rz4
         yoUnqh9RSY6Njvvhvr5VboZ8InWbMqwX+lostqO986Nl4tXISovrlRzMayX4CEeEMFS+
         rdK4FJicTnHIp2aA98LxHiNqJtWw3x4/z9S/N+bJpWJ0GIp9bmsu5NhACw/3GO5h0fAw
         240A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m+GWnvLEMQFBKPIuVJq3E1N+q052izuW81eFI6MM5LQ=;
        b=p6dYcWEcSMS1y70MAeQAmRldiMAx//WE8uJS0c5MZP2i6mlkwA3RuEEPaX7Z/OzKws
         oG/4cegyO19x2K+f2xBH2mcUPrPsxwVGAxbKM8UrqMhUeoyPuNsYvzM1XuGdXNQmBS/h
         Tqlq54nUZb7QHtwBcUO4BLfcaA4l+KX6563fXBKAZmjEShebtL0Q0N1AMiwDqgk1sWYn
         dmZBmgDFH1AGggIXEnECQQCzh4DU99ptylKOyrbekUOxRtvD8pNY8jU+i3bVfZUmemTY
         VbDzCirYeabAdZZCf6cNHt1pTRmGfOUT5KCUkFZebhp5SjMLosqNDbcOW5Yw5SRzfjdd
         458g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpFY2g+M04+35Wx+Jr84tGSXCntpCgCkbKmThlQpAoUhalHjkD
	TQQJxGol//PHly9w+pZBsU8=
X-Google-Smtp-Source: APXvYqyxvwV3x2tXEsO7fQz28M8qTFQcPKPNlM31Cbby10g6nZphQYUr0BguGVKBdBO+WWNkU7UcMA==
X-Received: by 2002:a19:f00d:: with SMTP id p13mr4600912lfc.37.1575533024421;
        Thu, 05 Dec 2019 00:03:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4acf:: with SMTP id m15ls198847lfp.13.gmail; Thu, 05 Dec
 2019 00:03:43 -0800 (PST)
X-Received: by 2002:ac2:5623:: with SMTP id b3mr4121299lff.10.1575533023632;
        Thu, 05 Dec 2019 00:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575533023; cv=none;
        d=google.com; s=arc-20160816;
        b=TR9bkDdcyhyBwH5TDbcPm/NnqdFc5n4VNmYLvSgX1u86h35+xi2DUcB88Hue5oT7dZ
         hrrvOsmJFeCKfYx8WQuPd4IgHJHCNrVuNiAZTikQ6zjfELfNueYVC7Po0PMCa+nayd2T
         dOiP8tL/C2ikAkEhtgVB3WgWJc0a/qaIDKxJBmzL/Ejh8kXWRxAwXLmTou9q+LnqrqIY
         f+4mO/bwCiMrXc8leiB/PZ7j1UC1X1WGXYNcLpkXsPbno9Ad1TC17IOoZ4Epq4Be080U
         yS5utN3qC5/r70KAz0kHXtXmzUiQADi9S8af1YEHQBy/LAJGdwq+RLeMntAtQJQyK5Gy
         hHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=e9evYVY5Y0vEEax7rKL7DVGA89RLvl8b0JqKmDWnbZs=;
        b=wYRm6Jfw5aQ/DtUOxVULazMSEla1m5uDkT2D7rbUfOQDdTrC0VBdHIri9zoriAP97H
         avTwF9LkX7w8x3EWvEqwuBN/o+18UpYQhoEG4hr8RpioZ2299AjkWuA0++Hy/fy9nIDt
         Djlr0okoo95M7ZLGjbwhI23omtjE/oDFCOHUy9F6NS/PAabuADR7EerEr+0oaprP47RI
         b2aWfdCJShBOJSfsKxH2m0q720Q8Cn2EY5gz0vKXLF3QQMtyS5CiKGeEC5m/8KCwWZ/i
         OvtjscaiLHjH4ybmYIZO9uyNoZStEg5Ci+s9uSb+RxSpxsMKbbzh6wgmLcof3BEUt2ii
         3fCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f1si502893ljg.2.2019.12.05.00.03.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xB583gZp027710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 09:03:42 +0100
Received: from [139.22.77.67] ([139.22.77.67])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB583g6p028002;
	Thu, 5 Dec 2019 09:03:42 +0100
Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
 <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
 <AM0PR04MB44813A2E63BF7C31B34C4E1C885C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5@siemens.com>
Date: Thu, 5 Dec 2019 09:03:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB44813A2E63BF7C31B34C4E1C885C0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.12.19 03:28, Peng Fan wrote:
> Hi Jan,
>=20
>> -----Original Message-----
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>> Sent: 2019=E5=B9=B412=E6=9C=883=E6=97=A5 17:18
>> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
>> Cc: Alice Guo <alice.guo@nxp.com>
>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pendin=
g
>>
>> On 03.12.19 10:15, Peng Fan wrote:
>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>> irqchip_inject_pending
>>>>
>>>> On 03.12.19 09:58, Peng Fan wrote:
>>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>>>> irqchip_inject_pending
>>>>>>
>>>>>> On 03.12.19 09:27, Peng Fan wrote:
>>>>>>> Thinking about core0 is inject SGI to core1, core1 is handling SGI
>>>>>>> interrupt.
>>>>>>>
>>>>>>> That means core0 might be in path to enqueue SGI into the
>>>>>>> pending_irqs array, core1 might be in path handling SGI and pick
>>>>>>> one from pending_irqs array. So need to use lock to protect
>>>>>>> unqueue, not only enqueue.
>>>>>>>
>>>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>>>>> ---
>>>>>>>
>>>>>>> V1:
>>>>>>>  The best case is only lock one entry, so no good solution,
>>>>>>> because there is possibility that inject fail.
>>>>>>>
>>>>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
>>>>>>>  1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>>>>>>> b/hypervisor/arch/arm-common/irqchip.c
>>>>>>> index 1c881b64..fbaa3099 100644
>>>>>>> --- a/hypervisor/arch/arm-common/irqchip.c
>>>>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
>>>>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
>>>>>>>  	struct pending_irqs *pending =3D &this_cpu_public()->pending_irqs=
;
>>>>>>>  	u16 irq_id, sender;
>>>>>>>
>>>>>>> +	spin_lock(&pending->lock);
>>>>>>> +
>>>>>>>  	while (pending->head !=3D pending->tail) {
>>>>>>>  		irq_id =3D pending->irqs[pending->head];
>>>>>>>  		sender =3D pending->sender[pending->head];
>>>>>>>
>>>>>>>  		if (irqchip.inject_irq(irq_id, sender) =3D=3D -EBUSY) {
>>>>>>> +			spin_unlock(&pending->lock);
>>>>>>>  			/*
>>>>>>>  			 * The list registers are full, trigger maintenance
>>>>>>>  			 * interrupt and leave.
>>>>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
>>>>>>>  		pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
>>>>>>>  	}
>>>>>>>
>>>>>>> +	spin_unlock(&pending->lock);
>>>>>>> +
>>>>>>>  	/*
>>>>>>>  	 * The software interrupt queue is empty - turn off the
>>>> maintenance
>>>>>>>  	 * interrupt.
>>>>>>>
>>>>>>
>>>>>> Did you see real corruptions?
>>>>>
>>>>> No. just code inspection currently. We met some SGI inject return
>>>>> -EBUSY, so go through the code, and think this piece code needs a loc=
k.
>>>>>
>>>>>>
>>>>>> The idea behind this was that the injection to the lock-less queue
>>>>>> happens in a way that it won't make changes visible to the consumer
>>>>>> that are inconsistent, hence the barrier in irqchip_set_pending.
>>>>>> Looking that again, though, we possibly need another barrier, right
>>>>>> before updating
>>>>>> pending->tail.
>>>>>
>>>>> Barrier could not prohibit enqueue/unqueue contention.
>>>>> enqueue will check head, unqueue will update head.
>>>>
>>>> Some topic as with lockless enqueuing: We need a barrier to shield
>>>> the readout of the head entry from the update of pending->head. So,
>>>> we are definitely lacking barriers here, but I don't think we need
>>>> the spinlock between producer and consumer because there is only one
>> consumer.
>>>
>>> Lock-free should be possible, let me work out a non-lock solution.
>>
>> This is what comes to my mind so far, but please re-check carefully:
>>
>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>> b/hypervisor/arch/arm-common/irqchip.c
>> index 1c881b64..a83cd81d 100644
>> --- a/hypervisor/arch/arm-common/irqchip.c
>> +++ b/hypervisor/arch/arm-common/irqchip.c
>> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu
>> *cpu_public, u16 irq_id)
>>  	if (new_tail !=3D pending->head) {
>>  		pending->irqs[pending->tail] =3D irq_id;
>>  		pending->sender[pending->tail] =3D sender;
>> -		pending->tail =3D new_tail;
>>  		/*
>> -		 * Make the change to pending_irqs.tail visible before the
>> -		 * caller sends SGI_INJECT.
>> +		 * Make the entry content visible before updating the tail
>> +		 * index.
>>  		 */
>>  		memory_barrier();
>> +		pending->tail =3D new_tail;
>=20
> The spin_unlock implies memory barrier. I think no need memory_barrier he=
re.

We /might/ be fine here for the archs we support, but Linux is more=20
strict:

"(2) RELEASE operation implication:

     Memory operations issued before the RELEASE will be completed before t=
he
     RELEASE operation has completed.

     Memory operations issued after the RELEASE may be completed before the
     RELEASE operation has completed."

Now, the x86 is ordered anyway, ARMv7 indeed has the same barrier in the=20
unload as in the memory_barrier(). However, ARM64 is not that clear to me.

Jan

>>  	}
>>
>>  	spin_unlock(&pending->lock);
>> @@ -264,6 +264,12 @@ void irqchip_set_pending(struct public_per_cpu
>> *cpu_public, u16 irq_id)
>>  	if (local_injection) {
>>  		irqchip.enable_maint_irq(true);
>>  	} else {
>> +		/*
>> +		 * Make the change to pending_irqs.tail visible before the
>> +		 * caller sends SGI_INJECT.
>> +		 */
>> +		memory_barrier();
>=20
> Not needed, see above, spin_unlock already done this.
>=20
>> +
>>  		sgi.targets =3D irqchip_get_cpu_target(cpu_public->cpu_id);
>>  		sgi.cluster_id =3D
>>  			irqchip_get_cluster_target(cpu_public->cpu_id);
>> @@ -292,6 +298,12 @@ void irqchip_inject_pending(void)
>>  			return;
>>  		}
>>
>> +		/*
>> +		 * Ensure that the entry was read befor updating the head
>> +		 * index.
>> +		 */
>> +		memory_barrier();
> No need. The index update will not be speculative before reading pending-=
>head.
>> +
>>  		pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
>=20
> Need a barrier here, to make update visible to producer.
>=20
>>  	}
>=20
> My version,
>=20
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-c=
ommon/irqchip.c
> index 1c881b64..5abf1c37 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu=
_public, u16 irq_id)
>                 pending->irqs[pending->tail] =3D irq_id;
>                 pending->sender[pending->tail] =3D sender;
>                 pending->tail =3D new_tail;
> -               /*
> -                * Make the change to pending_irqs.tail visible before th=
e
> -                * caller sends SGI_INJECT.
> -                */
> -               memory_barrier();
>         }
>=20
> +       /*
> +        * spin_unlock will make the change to pending_irqs.tail and
> +        * entry content visible before the caller sends SGI_INJECT.
> +        */
>         spin_unlock(&pending->lock);
>=20
>         /*
> @@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
>                 }
>=20
>                 pending->head =3D (pending->head + 1) % MAX_PENDING_IRQS;
> +
> +               /* Make the change to pending->head visible to enqueue. *=
/
> +               memory_barrier();
>         }
>=20
>         /*
>=20
> Thanks,
> Peng.
>>
>>
>> Thanks for bringing this up!
>>
>> Jan
>>
>> --
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
>> Competence Center Embedded Linux


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5%40siemens.com.
