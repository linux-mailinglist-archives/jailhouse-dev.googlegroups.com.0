Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI6LTDXQKGQEKHQN6RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7110FA69
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 10:06:43 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id q17sf1577484edr.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 01:06:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575364003; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ys446sMfXKX5MAb6eRcfQYJ0EofmCDfGXhrFa5UMuU8NjCBPm+iUUCmx6fBCJsHBGh
         65JoNJw8e/Mb10SWS5lx5GNwONTgOYqdiemvXLln8A7T3w/7BepQ9Nu1QMgF0FGEDBE4
         hPW2YuF37R4v3hy/LoPbWsk8TBFOu9SD+qltvqGfE4bAdDYcyE1pQA/M+X39w304RC+h
         v4iVMmN2/HXRTNVyv97jz9mV7tNIVbuWYtBBRaMPcSxwTRmcH+689A51T8APnIXADB3k
         WolPlBA8nnLeLnoLQPBV7UtOo9NQYcOeRXx93JNL9H7uMAAwV8D1gXMlE0u0kN38Chwc
         j8aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=+9eTEyZD0b+HTz+tjeSvtr2aYTGwPKUEKa+q8+5tWGg=;
        b=FkIbCyi4J8MOJDEP5ByuAPBE+Udmcsc9h2xmROSiU/z8GJ7Hi9O5bOQiU9bYfieP+3
         9ZqJo254Rx8YbOnWQd6vNWDzil6+vWKXIs8GXLKSBw4ygYWcJ0W0y+38UeOD8YMSZzTr
         dYghlaeTRYTWcfVKuqXw6usS5EC6iCixLWvFAnO88lsG8RVHvFic3iySY/9IRRabcLEP
         cQOt4jv9jY8+k5/y3MnG9fPc9Wa8t01FvN3EoLs02UAKxSuXMNtGjNGimFlkK02DsNoD
         0CztDMsM8dNoQw2eaB6TK5/79+lgul3hgRvP/QhGQ8QvgJQzvIYI42shnUmrourWhL9W
         7kyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+9eTEyZD0b+HTz+tjeSvtr2aYTGwPKUEKa+q8+5tWGg=;
        b=opa9iBoTRapAsUCWsENC3TwoulL60DL83IeEO0+NDY3nKR80szyYs2/+u/DGUQLH/8
         vOBAy38nQ3nx+nC7PwvdUJHVhgGm+P7mhhMATusKA6ggsz+JLt9Oexhf9RUd5pvSoj8L
         lnTL8l1Ts//M+f2nlKDd1Mrii+QV+93afnNMUZzPmqlCbUiJl+eHnekiu9QNq51WNKL9
         SrIzsiDAVfiRXQic1qGPtyVxmbVN3k9qOIb7R+uZ4Q+s1sandAibrBQU03f6ncbQYitc
         lzGfLXDGVqNU9eurUpgFSieVJNP571xjIEmPr/4M3k+tDnknPU00r9CcSLwMGNdHSKos
         +IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+9eTEyZD0b+HTz+tjeSvtr2aYTGwPKUEKa+q8+5tWGg=;
        b=jwyQNlmL69t3rZZ2uS4G6Aav293vsoGFzXFEgOwnUm0/DeL7M95RW4CW9Z1f++A6TM
         Ix3Fau1n3g4qmNkLRML3HlcTCnrzNFYu/9wotCF0ZNjYKDSGq+Dmec+D9fo+/nTVDzK8
         c54IMoWwpnEJS4Wc8kPLi1QzYDYLaUnWIYaRtVDwef+dFADTENqtB9Bnd9fR1mbtXzUW
         XzOiRxVwwvZBiOz7RGMm15v6mns6jii5RmYeya7gLdsDKUSxY6V8lAvYb8BRwyZnI8ne
         nrMpZo6vpa4zzA1bfeqMGBjXhSb+CbnlIksHPW6OK4NUxwqqpsjUKxEqGOVXRDVu0fVR
         dleA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWMIeMTSwj+bqps5SvH7mpBMgBHLE55qvjUxmo6g9CgSdSR+UKG
	h35HaNylfPqIL0+6g284ibE=
X-Google-Smtp-Source: APXvYqzNBXpRTYCn+Z5WjP+SE46DJ1XqeUquNK243hG+ELw5YacqYTQu5Op+Gn4Gk8wtQVy3o7FUFQ==
X-Received: by 2002:a17:906:4c41:: with SMTP id d1mr4821564ejw.240.1575364003540;
        Tue, 03 Dec 2019 01:06:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c98d:: with SMTP id c13ls575561edt.0.gmail; Tue, 03 Dec
 2019 01:06:42 -0800 (PST)
X-Received: by 2002:a50:91d0:: with SMTP id h16mr1877398eda.203.1575364002818;
        Tue, 03 Dec 2019 01:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575364002; cv=none;
        d=google.com; s=arc-20160816;
        b=arKFTmikcQ9dVULPuDOyQNI8iDEXRJs0Oo77pw3QbnuG0jrpKCKqin0jreLxgIknpN
         KtJcv0hc2iw9Wjk6VBNWs4g4pD7vq1ggMs3jEp6k1T98nlcK8uRJI8/sBLxCp3/rfybQ
         8T4olaRzP3u8gjYwobh6V51rE5Zq4uiQpGPyMuZ4rYVMT6ztXuH4+WJuc61Xt1kW1B1+
         DBJv/pUcAskmMzDsQaf6Kmfj/V1GjIwlMB/I5dW+REzN82WuTtSJtCPsWfR32/N/ZmZC
         DnFlWgkwU1GXt4YFe6mdKsBjjoXPHVt3wZ957w7gPqwOkD7eOJa0gUh6/JwctOVKPUdl
         OAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YLOrS0gsibViNHBv9XsmI5Rma566Eo6tqZ3uakgteng=;
        b=JOUlvlZylJkgyF9Dcbd5S6gkqRSWNBCo4HPP0g/n3sueMedwFUl8O2Q+Kc/dBbsvvP
         wV/sHltziu+sJHrgSWfk6v9MhzpJS4xACVHQkiKEkNj4SVGt0f22PAxr1ZcKVOBIm2Un
         4l3GK3NOsCpA82XQIeqv4ulXGylAP0fKlmRK7yRNEejFDS7chXMk1W4qRcnLNuMFfp0z
         234jjE8KqCwg9aIQi2JTV9c3++gDMPu0g5R5zbJ5zD67g0g0zgfaVCn8r5B6umVT0fag
         u6QhisqbitUBEO146M/N9jrFp11TDh/KaSiyD4zrraCWSiggPc/qQOjEP0wOPDgIZUtw
         0s6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id cw7si175496edb.0.2019.12.03.01.06.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 01:06:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xB396gf7004574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2019 10:06:42 +0100
Received: from [167.87.51.101] ([167.87.51.101])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB396f1U005987;
	Tue, 3 Dec 2019 10:06:41 +0100
Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
Date: Tue, 3 Dec 2019 10:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 03.12.19 09:58, Peng Fan wrote:
>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
>>
>> On 03.12.19 09:27, Peng Fan wrote:
>>> Thinking about core0 is inject SGI to core1, core1 is handling SGI
>>> interrupt.
>>>
>>> That means core0 might be in path to enqueue SGI into the pending_irqs
>>> array, core1 might be in path handling SGI and pick one from
>>> pending_irqs array. So need to use lock to protect unqueue, not only
>>> enqueue.
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>
>>> V1:
>>>  The best case is only lock one entry, so no good solution, because
>>> there is possibility that inject fail.
>>>
>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>>> b/hypervisor/arch/arm-common/irqchip.c
>>> index 1c881b64..fbaa3099 100644
>>> --- a/hypervisor/arch/arm-common/irqchip.c
>>> +++ b/hypervisor/arch/arm-common/irqchip.c
>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
>>>  	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
>>>  	u16 irq_id, sender;
>>>
>>> +	spin_lock(&pending->lock);
>>> +
>>>  	while (pending->head != pending->tail) {
>>>  		irq_id = pending->irqs[pending->head];
>>>  		sender = pending->sender[pending->head];
>>>
>>>  		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
>>> +			spin_unlock(&pending->lock);
>>>  			/*
>>>  			 * The list registers are full, trigger maintenance
>>>  			 * interrupt and leave.
>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
>>>  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
>>>  	}
>>>
>>> +	spin_unlock(&pending->lock);
>>> +
>>>  	/*
>>>  	 * The software interrupt queue is empty - turn off the maintenance
>>>  	 * interrupt.
>>>
>>
>> Did you see real corruptions?
> 
> No. just code inspection currently. We met some SGI inject return -EBUSY,
> so go through the code, and think this piece code needs a lock.
> 
>>
>> The idea behind this was that the injection to the lock-less queue happens in
>> a way that it won't make changes visible to the consumer that are
>> inconsistent, hence the barrier in irqchip_set_pending. Looking that again,
>> though, we possibly need another barrier, right before updating
>> pending->tail.
> 
> Barrier could not prohibit enqueue/unqueue contention.
> enqueue will check head, unqueue will update head.

Some topic as with lockless enqueuing: We need a barrier to shield the
readout of the head entry from the update of pending->head. So, we are
definitely lacking barriers here, but I don't think we need the spinlock
between producer and consumer because there is only one consumer.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81533a5d-8385-9872-ef22-4bcaa30c98f5%40siemens.com.
