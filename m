Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WTXT7AKGQEKXK34EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA72D2448
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 08:23:35 +0100 (CET)
Received: by mail-qv1-xf3a.google.com with SMTP id b15sf13594602qvm.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Dec 2020 23:23:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607412214; cv=pass;
        d=google.com; s=arc-20160816;
        b=lfF+C0A3d8SSeB7j37j20MxXqRPPyFLKs7H/ExC2OVGOvqfa1clN71XlDsmR/uHok5
         leYi3djH1kptc6lYGqB+AadobU5BBVTYK5g14go1sp5pzwHFs5KCZjdQqV8tRNx/PST1
         t3dgZ9DqXJJKB7sa98DGDAn4M4dMiFmYfuGUJckpOvnjL1zc3KRVPVhFkbuwFFLNQVSH
         W7H5uabrPmv64Y4NoFdvZ38nnExe881ZySs8wrt2rXULZHrYwjpxMHO2rQ9MomM/4cxn
         hcOFbhtDjXuXCkwcEnjpxMXFXxMSa58lF/4pN4tz+F/7w9sXsXfXbAmAsxdrcfV5KkKE
         6wZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Lq6Gv17AfadbS4o2Cwdj6cUlSKBmvdyVbwmrIQjjzDo=;
        b=tAEhxThU5oFdQ7eyhqAZlwdBxyaftS1jno0SOk2c6cxy18VYmb6OV46wYzOejAW+Wu
         87a7WVOpq8Pk1IQp8iamMdT8AIZ0cLUvqX4Z70K5c6jqOOzW2wkfqBZ+cQX0Gdl1ngpR
         +C6LdSGF2eHeQZEfJ+tRao36hCh5XB05CoOyUkVvwHfaL4g1IJzD7XTRo4/UsuYqMT8O
         5UxS2KnWWA7pXzWuaM2snkHcA81ysaRLYL7OKGKbr2YMDu9FaS5rWYbVL1JWfBLT84ty
         nfbwXhv72ZranLapII3b1XWHN9z3KHZDJS8u+2sDMEqb1u1UAoidvV7KgiGdZizaGnqy
         V09g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lq6Gv17AfadbS4o2Cwdj6cUlSKBmvdyVbwmrIQjjzDo=;
        b=BaE20xdQczMZ1ByeckVIZnCnm4+hQIvsfzTdNju7G6MAtnwjDjHZmDaAhAL/NQjmna
         pXwTxTLxbqwlCJA2rDyt2owGl6g60hXlVnHL1HhNwzv6DxPL+7FfVjb4q6ci8eUWX6dt
         dVBjJK//U7SgV3ci8bJ8lmK2yJSzIYCl9zlfnOThTg/7TARDmvuJXJ1dH2SKZ4WSau5g
         1TQDqWqyNoK6rVANg7iVI+bZpfPtorJ+/gx4GlUWYmonSWwyoR0c3ToCmdABhI4NPuzq
         bg/MnswUQ3/XJnek7IUVBmm9nFnYJR0Mc9cWR8gg5f9D6xg9CRmSDCjpmMEWo98c3kvW
         aGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Lq6Gv17AfadbS4o2Cwdj6cUlSKBmvdyVbwmrIQjjzDo=;
        b=UqK6KOyzcbnvFC6Amw7ecpNXrqFrSv5P5By6o9qqjS9wl8Dc3vLRqlZTZISMcy7pwB
         UPJH0OLSUlG9WA9kaJS9vvutU11JTjgumH3IjM3+dGX8CP0zMQTfO6B/ldNEAlQW4Nrp
         cMJx8sLK3O26wU5BHk7/8NhyosEZBVEePh81EiKg8kcY1hwW1tM9zwaFoHexzzNBtads
         s7z6RWe3CJQCQ5dlXdJMWVifSafYp/4hv29HeA/oVtKWx3vQSuGkvH9dfsi7Bmo5coZd
         fCTsa2hs698PJU9ghXX6YwjbtLykeZmw3byNGwhH85BfAPHx+QDew0lfd9u0L9fGNEuW
         VNGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530noEKXjb19x6/YWoKx6++gE7/LOTlG6rJ2limycO5jUpk7h8w/
	vnaSvPCikkl5gBVF8UEmOB4=
X-Google-Smtp-Source: ABdhPJySTK4LBkuy9Cx4Co9+aTEdF4F+m7L8PnxET41mb9RRZ8gH/+B62Nkdndi55jotvvl6xcF+VA==
X-Received: by 2002:a37:4b97:: with SMTP id y145mr4335997qka.7.1607412214382;
        Mon, 07 Dec 2020 23:23:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:242:: with SMTP id q2ls331606qkn.9.gmail; Mon, 07
 Dec 2020 23:23:33 -0800 (PST)
X-Received: by 2002:a37:4796:: with SMTP id u144mr27430934qka.235.1607412213724;
        Mon, 07 Dec 2020 23:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607412213; cv=none;
        d=google.com; s=arc-20160816;
        b=ozF8Jtiioy3vodU2TwKj4FvwSYr0l5fJJYN3xEy38pNPUHIMKqiMPdqfUz7KKti5ZS
         vwlaDYWeG+FDIA3tRpqKCiVifsY0ljcOPnVoDJCPtsysHMzHd/iQ68sfw9/+1BAXTksl
         Jz67ntfcK3cObvaFWulBPX6ZUdS+OCisJsZTHaBSGUjQ7KaR3eBLHY4fb7NlUh5xRCFB
         6Utr1P66nuCiKH8M91lyMjs+jcFLZ65ogVHb4E5xZz+EQQIWsVyg2QEgCiGk1F79a04n
         +ho2uqbh9AKg1eADT6ajXaIG1XRlYPbdtk1DYgrAyiM1uhfOZIGmxY7wyh8h/tsHr/wF
         r15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=La8gIPKnNxAs2CB17I+gdNSwvbBHgwm8HhO4YGr+L+w=;
        b=HhWUST3zWQir/UOpht6pbwNcKpO7IDrONFR7CeyTuOf8BROLnWlAeE3APnAKmo2rN9
         TF/IfQxmJM1gPTd79S/kwDwzoJA+ozQtYmygNPZuvLZDczbOrm+wmVjQdMz8LoEGRbvN
         WUjgXePdbQoHL8YRLqYobR9yZE2swkg8nMcdJcTwnYVeWayeS4FayoJZ3TtdPP6iSNML
         eN7jjtm88fUY9Rw/CQM0+X5PTbgOmIXcZyNeS6FecfGaVf0hXql10dYd7zVk62+/Kvil
         e2/ulrE+OgfrQS/IovGg9xukE2bG+AiY1b8YAz/tpVNHtXtxPdj7wdPoT38tGlwPrC3x
         SVLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f21si1070996qtx.5.2020.12.07.23.23.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 23:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B87NVle025025
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Dec 2020 08:23:31 +0100
Received: from [139.25.25.46] ([139.25.25.46])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B87NVJ6003103;
	Tue, 8 Dec 2020 08:23:31 +0100
Subject: Re: ARM64 MSIX enabling error
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
Date: Tue, 8 Dec 2020 08:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 08.12.20 06:28, Peng Fan wrote:
>> Subject: RE: ARM64 MSIX enabling error
>>
>>> Subject: Re: ARM64 MSIX enabling error
>>>
>>> On 07.12.20 08:46, Peng Fan wrote:
>>>> Hi,
>>>>
>>>> I use MSIX, not INTX in root cell file, but always met the following error.
>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
>>>>
>>>>
>>>> I am trying virtio ivshmem on my board, but seems virtio ivshmem
>>>> vi_find_vqs not work with INTX, so I change to MSIX to see how.
>>>> But met upper error, any suggestions?
>>>
>>> MSI-X for virtual devices only works when injecting them into a
>>> physical PCI bus which is using MSI-X already. Is that the case here?
>>> If not, you need to debug the INTx case.
>>
>> ok. Thanks.
>>
>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
>>
>> But it responds to input very slow, when I press enter key, it takes long time to
>> respond.
> 
> After correct the interrupt number, it responds to enter key fast.
> But if I not press enter key, the virtio-ivshmem-console /dev/uio1 will show
> nothing. If I press enter key, it will show one line boot log.
> Press one more time, it will show the other boot log.
> I need press enter always, then could see the boot log printed out.
> 

Still interrupts issues, I would say. The GIC MMIO resources are not
accidentally passed through? Does /proc/interrupts report events for the
virtual device?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/543a61e2-e521-5c89-0d96-9f06946f0aae%40siemens.com.
