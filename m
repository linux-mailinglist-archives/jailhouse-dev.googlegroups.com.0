Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCEHUPXQKGQE75OYMVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D6113D40
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:44:57 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id d8sf1205033wrq.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:44:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575535496; cv=pass;
        d=google.com; s=arc-20160816;
        b=oiwQ0Hhp08Zp53g31Lzu4O5WYX9rSVg8QDpupBfO+xWhE8GQVpP985W8qohRviUXDj
         9UdLZElCJhog+EgNAlAxhOhsuzhnJnG8oe5BbWdhj44ysMcaTAFBygE4455eP2HB0tR6
         IkGfVgdJaioXdtll3fqiMBDD3vsSkeUaVoQHgZIu8EO2CkfCD9AIKk6PAtN5bI5JSyp0
         GKqxhx6JKoMzcz7kpAfy8YOX2k9RhTDZECSfg4B9pLUXl9Iloy18XSAsVkFfGp2zu6Dr
         eUNo8m0bW6jkbpBR5ErlA5WJAdCLigr/7hhhjcYWdVuP1x6KjndRtpm70hcSMeMQgDNZ
         RtBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=6ymEHcMX+RMp+nmUPSyPUhSg146hmxJzfhmBCBg0mBw=;
        b=soxYpXK5x72rS0lBqoZ3gCoqt3IyiWx13Gf4NX/P16WU1g72DyIh6YnUA5Q7d59q+f
         ci5elqKpnTp0kwsVDn2o95WVDIuOqMUxiTqlmkhNbm4N6DRBI1EBb74ELA1vOANTwlq1
         GLDzjI8OWwWnG9M1KfYOa7dGfYePopdFzo6pmSvpx7JHwzIhG4qRFoPkIG27e3Ru/uso
         2b83x8KVayyIKr03S9Drz96lfnXOdwRTKX90HsOMGbmr4f+MdUtV2Qz+YeXvDS89OHKR
         PMB8wF+S6NRMeLGtpmzgTkRLxmVLWPVLFl8lwL0dbRyFqcpAqEiWVCZghQ8OHeL/IPNi
         Dmlg==
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
        bh=6ymEHcMX+RMp+nmUPSyPUhSg146hmxJzfhmBCBg0mBw=;
        b=Ae4Ta58ZmYCV9jvQSzn4GbmKgND1gkoWWKYbcVMtrLdGfv49ECmPWQNsaJTtAPKe55
         OK/EybPkNScQL51XqakkFUVZhXQL1Wfi6huE7P2fDW4w3XPjSri1R5sSBxHL44yIQomL
         oeNBvV+FKpNjx+TQniLISh3IAdTGUw5mA0UM5Ii4JhVt7kfhVaiFZ6XiTV6dZLS3cghs
         f9tSYG9nXTOh0x5uA75CCTFo2DSg+PPwL6pe0zCApb2SIixXT22e2rRKRtKomHcPQoDY
         aQMpU8HOl5GylZcydoC83S9adGHOKRWJFxSQ3X4CK0wuIhwYXz8NrOe61A6DmlRNLihC
         3Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6ymEHcMX+RMp+nmUPSyPUhSg146hmxJzfhmBCBg0mBw=;
        b=TnQuCAJH7N+ZmMPxkvUV/irCe6fKJlE5Lc7QwYEUo6X1TTcRELfu3HjVC8VClrTbv8
         3MFdSNw7bipR/eTXpkyr5TDXsVMp9QCuz+fy2YyEBGa+vuAZbXI7oaTcGo4V4OEdlkQV
         p7jnnrtcB0jjqM1oHkkeclZAwiPAi3DtE9eeX/qodQdpWolKp2AJBzWqaaTsShspLuzW
         DMA8d6DQ45rSZyiOdbnmXLAR+7Dc3+gTgtyPKkKGP382PCVztDgmAmiGvxJ4UIgt5bxN
         avsRVqj39hb803ZLmzZSn0XF7F2zxTVNqEcFVyqptIC0zZKRKQJFFocVcL9h5R0UyWMR
         xfQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWb3QN5fq9quLYmk27Kvp4hv/HzWjdCUvCRJGjpXol65vSBrxdb
	R/XvsBWCzeeX7ZPxa9IZE7g=
X-Google-Smtp-Source: APXvYqxsqxEn/onLXyjUpLLrIEYT0Qy97HqT3aJySvO75JdCuzPNd463TybOHi/FRUdHemqjmWgvUw==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr3972266wmh.21.1575535496788;
        Thu, 05 Dec 2019 00:44:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5446:: with SMTP id p6ls1076890wmi.2.canary-gmail; Thu,
 05 Dec 2019 00:44:56 -0800 (PST)
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr4071539wmc.125.1575535496157;
        Thu, 05 Dec 2019 00:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575535496; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsNt0EzMlnthzWsKfP/MbE/0jivVQtQ1Wyc0nbnTTafjDpDK/+koHMOYkj1kIG02UW
         nIY+4wHM4SG4yQCx1CJVfB5xZE9pEMQHjouoavvk1wpZU8JWdlCfFU+WS0OuyS8oaimn
         53E6zr0a8AnsEtlt3VhK7mDG8bkgj6jJopv0bK60mgM/5yDEBWa41klItFWP56aW2ByS
         BX/grTIBxz4eP/zp0xwut0e5yEiURiAGx+BQBEA15/k4O9fhN6TtDaFdc7cZ/0VRXfHv
         azaHbjMnXA5c5+Hh4EJZBpDTOrId4nAk/QmDeTyb1FG6fwcCMNJ5BesxudjxW6ISBxMr
         cCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nA59XN1Cb4lIX5ZiSE+Szdy26w35nCFrCL3W2dNEIrI=;
        b=TM179xmFSRGHhNe+u66PJgOtW7pSeivsfm7y29VBxuv+IGSCK+hhDTTWdCArDS6xI9
         eOyxfNFHrjVaNlmM8OILFBalIkY6BCgoGfeRcm3PiqxJtBi6LI+bL/etdmEL88XZzASL
         I00DDE5Lorjuer4Ixwc4HOMAgY+3xe6h0Aks1WGGKfxgtJy57Ea1Ajd+1YMTBCv6QvUE
         92cpouFjPFDxmJCh2N+7bPZD2eGZoY4Kr3DdX3bT7MIO0Uco7Jb4+cLBML96bL5X9FFL
         PIKsKpSME9fdKVhswfdXzt/lzipPyFZ+gEGWVWvRq60Y7sp+QX1A0TJCIAJ8MHED/4aJ
         A+tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m12si596470wrq.1.2019.12.05.00.44.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:44:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xB58itD9004844
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 09:44:55 +0100
Received: from [139.22.77.67] ([139.22.77.67])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xB58itV1027700;
	Thu, 5 Dec 2019 09:44:55 +0100
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
 <bef9b0b0-3bc0-4982-3b3d-aa829ad6ceb5@siemens.com>
 <DB7PR04MB44907526C0E8FAB7CEECA8B9885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b1309642-8acd-1d7c-310f-07b64e5a2940@siemens.com>
Date: Thu, 5 Dec 2019 09:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <DB7PR04MB44907526C0E8FAB7CEECA8B9885C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 05.12.19 09:41, Peng Fan wrote:
>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pendin=
g
>>
>> On 05.12.19 03:28, Peng Fan wrote:
>>> Hi Jan,
>>>
>>>> -----Original Message-----
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Sent: 2019=E5=B9=B412=E6=9C=883=E6=97=A5 17:18
>>>> To: Peng Fan <peng.fan@nxp.com>; jailhouse-dev@googlegroups.com
>>>> Cc: Alice Guo <alice.guo@nxp.com>
>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>> irqchip_inject_pending
>>>>
>>>> On 03.12.19 10:15, Peng Fan wrote:
>>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>>>> irqchip_inject_pending
>>>>>>
>>>>>> On 03.12.19 09:58, Peng Fan wrote:
>>>>>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>>>>>> irqchip_inject_pending
>>>>>>>>
>>>>>>>> On 03.12.19 09:27, Peng Fan wrote:
>>>>>>>>> Thinking about core0 is inject SGI to core1, core1 is handling
>>>>>>>>> SGI interrupt.
>>>>>>>>>
>>>>>>>>> That means core0 might be in path to enqueue SGI into the
>>>>>>>>> pending_irqs array, core1 might be in path handling SGI and pick
>>>>>>>>> one from pending_irqs array. So need to use lock to protect
>>>>>>>>> unqueue, not only enqueue.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> V1:
>>>>>>>>>  The best case is only lock one entry, so no good solution,
>>>>>>>>> because there is possibility that inject fail.
>>>>>>>>>
>>>>>>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
>>>>>>>>>  1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>>>>>>>>> b/hypervisor/arch/arm-common/irqchip.c
>>>>>>>>> index 1c881b64..fbaa3099 100644
>>>>>>>>> --- a/hypervisor/arch/arm-common/irqchip.c
>>>>>>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
>>>>>>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
>>>>>>>>>  	struct pending_irqs *pending =3D
>> &this_cpu_public()->pending_irqs;
>>>>>>>>>  	u16 irq_id, sender;
>>>>>>>>>
>>>>>>>>> +	spin_lock(&pending->lock);
>>>>>>>>> +
>>>>>>>>>  	while (pending->head !=3D pending->tail) {
>>>>>>>>>  		irq_id =3D pending->irqs[pending->head];
>>>>>>>>>  		sender =3D pending->sender[pending->head];
>>>>>>>>>
>>>>>>>>>  		if (irqchip.inject_irq(irq_id, sender) =3D=3D -EBUSY) {
>>>>>>>>> +			spin_unlock(&pending->lock);
>>>>>>>>>  			/*
>>>>>>>>>  			 * The list registers are full, trigger maintenance
>>>>>>>>>  			 * interrupt and leave.
>>>>>>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
>>>>>>>>>  		pending->head =3D (pending->head + 1) %
>> MAX_PENDING_IRQS;
>>>>>>>>>  	}
>>>>>>>>>
>>>>>>>>> +	spin_unlock(&pending->lock);
>>>>>>>>> +
>>>>>>>>>  	/*
>>>>>>>>>  	 * The software interrupt queue is empty - turn off the
>>>>>> maintenance
>>>>>>>>>  	 * interrupt.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Did you see real corruptions?
>>>>>>>
>>>>>>> No. just code inspection currently. We met some SGI inject return
>>>>>>> -EBUSY, so go through the code, and think this piece code needs a l=
ock.
>>>>>>>
>>>>>>>>
>>>>>>>> The idea behind this was that the injection to the lock-less
>>>>>>>> queue happens in a way that it won't make changes visible to the
>>>>>>>> consumer that are inconsistent, hence the barrier in
>> irqchip_set_pending.
>>>>>>>> Looking that again, though, we possibly need another barrier,
>>>>>>>> right before updating
>>>>>>>> pending->tail.
>>>>>>>
>>>>>>> Barrier could not prohibit enqueue/unqueue contention.
>>>>>>> enqueue will check head, unqueue will update head.
>>>>>>
>>>>>> Some topic as with lockless enqueuing: We need a barrier to shield
>>>>>> the readout of the head entry from the update of pending->head. So,
>>>>>> we are definitely lacking barriers here, but I don't think we need
>>>>>> the spinlock between producer and consumer because there is only
>>>>>> one
>>>> consumer.
>>>>>
>>>>> Lock-free should be possible, let me work out a non-lock solution.
>>>>
>>>> This is what comes to my mind so far, but please re-check carefully:
>>>>
>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>>>> b/hypervisor/arch/arm-common/irqchip.c
>>>> index 1c881b64..a83cd81d 100644
>>>> --- a/hypervisor/arch/arm-common/irqchip.c
>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
>>>> @@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu
>>>> *cpu_public, u16 irq_id)
>>>>  	if (new_tail !=3D pending->head) {
>>>>  		pending->irqs[pending->tail] =3D irq_id;
>>>>  		pending->sender[pending->tail] =3D sender;
>>>> -		pending->tail =3D new_tail;
>>>>  		/*
>>>> -		 * Make the change to pending_irqs.tail visible before the
>>>> -		 * caller sends SGI_INJECT.
>>>> +		 * Make the entry content visible before updating the tail
>>>> +		 * index.
>>>>  		 */
>>>>  		memory_barrier();
>>>> +		pending->tail =3D new_tail;
>>>
>>> The spin_unlock implies memory barrier. I think no need memory_barrier
>> here.
>>
>> We /might/ be fine here for the archs we support, but Linux is more
>> strict:
>>
>> "(2) RELEASE operation implication:
>>
>>      Memory operations issued before the RELEASE will be completed
>> before the
>>      RELEASE operation has completed.
>>
>>      Memory operations issued after the RELEASE may be completed before
>> the
>>      RELEASE operation has completed."
>>
>> Now, the x86 is ordered anyway, ARMv7 indeed has the same barrier in the
>> unload as in the memory_barrier(). However, ARM64 is not that clear to m=
e.
>=20
> ARM64 STLRH:
> Store-Release Register Halfword stores a halfword from a 32-bit register =
to a
>  memory location. The instruction also has memory ordering semantics as=
=20
> described in Load-Acquire, Load-AcquirePC, and Store-Release on page B2-1=
08.
>=20
> DDI0487D version, B2-108:
> The Load-Acquire, Load-AcquirePC, and Store-Release instructions can remo=
ve
> the requirement to use the explicit DMB instruction.
>=20
> Hope this is clear.

OK, let's document this in our spinlock implementations, to ensure that
potential future ones (and there will be at least one further arch added
in to mid-term) will read that and follow that semantic. Then we can go
away without the explicit barriers in my diff.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b1309642-8acd-1d7c-310f-07b64e5a2940%40siemens.com.
