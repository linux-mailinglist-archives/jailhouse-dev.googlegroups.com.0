Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUGQTDXQKGQEWQ4DG4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBE10FA91
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 10:18:09 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id h30sf1455271wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 01:18:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575364689; cv=pass;
        d=google.com; s=arc-20160816;
        b=sFhxUv6waY/Phv4V0Fbq20SImMvVUzF856k1Z8dpVuym1QnfsI/56nB+M18/hLO9af
         lA+tvu6BHBkdt8GuFDM4vTlzxF+ajaAkix5NSsYy71kNlubRVejwZ7XafXtZGd2JRViY
         nQLHmxJTU3o558P22eJg17Fo1klhVAaSlOCv7D1fuRRvKB11GM2ZhjseRHCc0eOYSsnP
         T3SfYLn8lJNTxMF1y21wE7utwuhKnyaRPF3xzJS0IoJXBTfu/iZW4CluvMMa0ylp2vlJ
         GhSxJbnVZETowR1TgO6Bo0MmXeOAr/zECTlo5TEcWxYDTIrEaQKjN1eybjgMgb76rU06
         UHUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=i/kXF65ezEuTRniVwHrWKVAsTEJsrVBeWJJ0endXNDk=;
        b=fo4Mltqb/rhrtXw0/fLjV9XT9hI9PUUQUPVoaIM0Ma33jDC9jj47bppbXHc9vE6lG5
         +D9ERURl7xPssiYpJGp9vBfZODG9ad8JhuQOJcZqOBoYcQgln+XINLkmrzuQpOe6NYWP
         Ol6XN4yIcXRby3pzCJ8R+1vFaUnd/7fwLkPt6gocjadz2G0aApqV8SH13bKfXKY9U4Td
         CdBQ51pggCAMbT+oE8/Y20i9d+BXRPQU+IsQWn/SxJJmmRX0RJVWZFILcwBhgJVgqzrI
         ZPWpZO+ZdFoxAXW7o6gCvTiNOyclpNys9Uwydb0RknYxZBYsEVChON9l/gvuLJ1t6iDX
         Zc1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i/kXF65ezEuTRniVwHrWKVAsTEJsrVBeWJJ0endXNDk=;
        b=HPCTI16G24MAi6r2f2dfVj9qr47TENU0+1CPk9Xz0bDrGdiGafNXbqyZEsglyKkvw4
         WNfCHN5t9y5KhCR9qIc6CwI590BLG6ViBsZZL4EEPCA6PL9I2s0E2N7tLKRm6xHHME2u
         kCo2bGRcu9nlXkpT0yzZZ30cQQd4X5fb2na3nvnnZlUVRCEKITCbpS8wC7CVfbhTkqO2
         azdDalooiKpTh1VMXfuogCct+Bwk5hibkYFVwmJ4vyaEyqfs6laIVsU2L5c99++Q3u8Y
         iXFAiLwo2RjPKIA42no2CryqTx/Y2A5DMuLEZsIZ5nnU6RkkKSej5/q4GQ7UzAK4lE9W
         xEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i/kXF65ezEuTRniVwHrWKVAsTEJsrVBeWJJ0endXNDk=;
        b=Nuoxn1gwGXlpurR4W7zM3hi7QnLAKL6KoeqwktOBbUDFkzWryzgeUduyYQ4vtPwGZO
         FtpfudqPGep5DWJ8/0MlR8k3y1rxFb5dHz+ogElBol8pZPprjmnA3KOnI01hoM4hIiki
         81OZpxvcdbbvZq8eQQvme3aa7SV5B9kCUFHk9EuHg0JRYmQlafRc232B7M/3ZDBrt/XL
         2rFvNF1BQKiwcyYY1/WpyDI1/uwY86Lsl5LrcT4H0gL1Zlh6N7xahZFrAMBKP/VWO6NM
         Nky/3J2oQ/kClsNptTyKK11NJFUYzEKmgAy3aUxcFZpTuLXmZxSpBg//FQ3U5/7QBYAi
         Mk7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVV7B5AOz3j60EizvgROJ87fQ2H9w4wjN9tOoOUM4OirT2mQLZ7
	5pVC3noqK6JkWWdgKMitznQ=
X-Google-Smtp-Source: APXvYqxAqgV0FKXD6M4rTUPYBcy7wQhGwsu541dBGBAu5TPiitA5S1s2o6Kc/88qX4nt9zM2vFU5VA==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr3825885wrp.110.1575364688960;
        Tue, 03 Dec 2019 01:18:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls872293wrm.11.gmail; Tue, 03 Dec
 2019 01:18:08 -0800 (PST)
X-Received: by 2002:adf:e547:: with SMTP id z7mr4057330wrm.258.1575364688333;
        Tue, 03 Dec 2019 01:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575364688; cv=none;
        d=google.com; s=arc-20160816;
        b=zMBBNkdvQ7zBuQ5F4sl/ox/xmEY9/wC0NrgqPnAtxQXIsOraJk2SuRQWbMVi/Zlv3K
         IgIvS3Va9T+PxuYfACeU/3PhVEKt0EmTugXqm75WzD9hpGwl4f7cxUbZytbU9+a48RFE
         WEVKBA/uMJ22/SvCIrdi922NZ2uPNXbsDKgDx4owmiSTnzAlGSUHZnKDHmqVJHUJz1xL
         75PrGqylL8u0kqpnDsTbEFCjaij/iFFIzz8nVuLQPkMdU4rMVybY2PHR0KFZzKA/EYNk
         541XazlhhbCffVMhdq6q7NrT0m+s/xVpRC5ePKo/GylZ0u9fYwaT97Fqp52Xi8e77Ntb
         BFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/+7EsjiZdsDaoOGjGivtv59vvnqZO+gDiMUzIDgxkTw=;
        b=oy9cgKHc/dUWAWuNYYMA3bcVYeWEW+IrFtIwCw5N0ZiAob8zn8Z4KU7nNSkGKDnqXo
         5/+q8teVt2fMrRpcljC8MXtkET8uP6y1whNCmUCsnLkJMLyTQuDkgi68X9NCKEVS6xW3
         e3GPhNwqJ1HAATqDfub0jEd9n5Z+mhwc64aXnoNYxFw1JGtDAUwaG+/TfACeqVQrogsU
         Ngf/LLxQz58+V9NcX1ctLtD9yyLf3hPt1zA3wiYubakTDNK8f+iN+peC2KpHaCxdwXn+
         1ji7qY5BySeFGAP1MMaYwgU1YqEvvQKBdy3ev6yTEOETpDxBj8MkUSOvk4VEpubat6wL
         i4zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x5si115038wmx.0.2019.12.03.01.18.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 01:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xB39I7Uh009200
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2019 10:18:08 +0100
Received: from [167.87.51.101] ([167.87.51.101])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB39I6Dt027679;
	Tue, 3 Dec 2019 10:18:07 +0100
Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191203084553.20669-1-peng.fan@nxp.com>
 <3408fd87-22fa-31bc-657d-8661ad3998f3@siemens.com>
 <AM0PR04MB4481FCD642715C2D03DA78EB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <81533a5d-8385-9872-ef22-4bcaa30c98f5@siemens.com>
 <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <46f71ed9-d4a2-d695-2ce5-307bfd13d1ca@siemens.com>
Date: Tue, 3 Dec 2019 10:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB44811BEC3EDE072313C1F3B888420@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 03.12.19 10:15, Peng Fan wrote:
>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in irqchip_inject_pending
>>
>> On 03.12.19 09:58, Peng Fan wrote:
>>>> Subject: Re: [PATCH 1/2] arm: irqchip: add lock in
>>>> irqchip_inject_pending
>>>>
>>>> On 03.12.19 09:27, Peng Fan wrote:
>>>>> Thinking about core0 is inject SGI to core1, core1 is handling SGI
>>>>> interrupt.
>>>>>
>>>>> That means core0 might be in path to enqueue SGI into the
>>>>> pending_irqs array, core1 might be in path handling SGI and pick one
>>>>> from pending_irqs array. So need to use lock to protect unqueue, not
>>>>> only enqueue.
>>>>>
>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>>> ---
>>>>>
>>>>> V1:
>>>>>  The best case is only lock one entry, so no good solution, because
>>>>> there is possibility that inject fail.
>>>>>
>>>>>  hypervisor/arch/arm-common/irqchip.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/hypervisor/arch/arm-common/irqchip.c
>>>>> b/hypervisor/arch/arm-common/irqchip.c
>>>>> index 1c881b64..fbaa3099 100644
>>>>> --- a/hypervisor/arch/arm-common/irqchip.c
>>>>> +++ b/hypervisor/arch/arm-common/irqchip.c
>>>>> @@ -279,11 +279,14 @@ void irqchip_inject_pending(void)
>>>>>  	struct pending_irqs *pending = &this_cpu_public()->pending_irqs;
>>>>>  	u16 irq_id, sender;
>>>>>
>>>>> +	spin_lock(&pending->lock);
>>>>> +
>>>>>  	while (pending->head != pending->tail) {
>>>>>  		irq_id = pending->irqs[pending->head];
>>>>>  		sender = pending->sender[pending->head];
>>>>>
>>>>>  		if (irqchip.inject_irq(irq_id, sender) == -EBUSY) {
>>>>> +			spin_unlock(&pending->lock);
>>>>>  			/*
>>>>>  			 * The list registers are full, trigger maintenance
>>>>>  			 * interrupt and leave.
>>>>> @@ -295,6 +298,8 @@ void irqchip_inject_pending(void)
>>>>>  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
>>>>>  	}
>>>>>
>>>>> +	spin_unlock(&pending->lock);
>>>>> +
>>>>>  	/*
>>>>>  	 * The software interrupt queue is empty - turn off the
>> maintenance
>>>>>  	 * interrupt.
>>>>>
>>>>
>>>> Did you see real corruptions?
>>>
>>> No. just code inspection currently. We met some SGI inject return
>>> -EBUSY, so go through the code, and think this piece code needs a lock.
>>>
>>>>
>>>> The idea behind this was that the injection to the lock-less queue
>>>> happens in a way that it won't make changes visible to the consumer
>>>> that are inconsistent, hence the barrier in irqchip_set_pending.
>>>> Looking that again, though, we possibly need another barrier, right
>>>> before updating
>>>> pending->tail.
>>>
>>> Barrier could not prohibit enqueue/unqueue contention.
>>> enqueue will check head, unqueue will update head.
>>
>> Some topic as with lockless enqueuing: We need a barrier to shield the
>> readout of the head entry from the update of pending->head. So, we are
>> definitely lacking barriers here, but I don't think we need the spinlock
>> between producer and consumer because there is only one consumer.
> 
> Lock-free should be possible, let me work out a non-lock solution.

This is what comes to my mind so far, but please re-check carefully:

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 1c881b64..a83cd81d 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	if (new_tail != pending->head) {
 		pending->irqs[pending->tail] = irq_id;
 		pending->sender[pending->tail] = sender;
-		pending->tail = new_tail;
 		/*
-		 * Make the change to pending_irqs.tail visible before the
-		 * caller sends SGI_INJECT.
+		 * Make the entry content visible before updating the tail
+		 * index.
 		 */
 		memory_barrier();
+		pending->tail = new_tail;
 	}
 
 	spin_unlock(&pending->lock);
@@ -264,6 +264,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	if (local_injection) {
 		irqchip.enable_maint_irq(true);
 	} else {
+		/*
+		 * Make the change to pending_irqs.tail visible before the
+		 * caller sends SGI_INJECT.
+		 */
+		memory_barrier();
+
 		sgi.targets = irqchip_get_cpu_target(cpu_public->cpu_id);
 		sgi.cluster_id =
 			irqchip_get_cluster_target(cpu_public->cpu_id);
@@ -292,6 +298,12 @@ void irqchip_inject_pending(void)
 			return;
 		}
 
+		/*
+		 * Ensure that the entry was read befor updating the head
+		 * index.
+		 */
+		memory_barrier();
+
 		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
 	}
 

Thanks for bringing this up!

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46f71ed9-d4a2-d695-2ce5-307bfd13d1ca%40siemens.com.
