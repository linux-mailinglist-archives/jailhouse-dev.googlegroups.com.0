Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVVFWPUAKGQEHF7KVUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCE4E848
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 14:51:34 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y24sf9133070edb.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 05:51:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561121494; cv=pass;
        d=google.com; s=arc-20160816;
        b=PACV3jtllrXJprap1eqWQ7WNsQu3L36tRagS5Xe7nxf6tMX3SqLycKJBgtNPnA+o0i
         E1O9i5iMg0iGlTtHdLMW03dTqaiNE+nwzzrs31Pia46vDSeuBX0gJOklSZ0MAn58AmJi
         fUuzyMsbB3RGrSzsw8BQsQEG8XYzYFBezQde3RpuvmxvEHFUYUoZMfzVYQHQTPPDWZK5
         RVgqQIY7ULKGnu0ct8SXED5fp/YUW88u4lDzsbKCYNYvq6IJ3Na0p1TCPa8Lkhw014Bk
         8emcnJb4P/izgty8piGnBjTyjqGY5UdGg2/JqMD3hnEiV0+sCLGkbC5zXgsvjmSL3VmA
         DzeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=iUviyedeUNpnpGgqsDUWSmk6HHyMXNS5RNjXJqcmVMc=;
        b=kCS0hjdCdCt5A0ceDmKrGyv0G263q+qCShjT0QuoTWehl9Tf9EeGzLNGy2ltT8v28s
         yRiRlDI5tAsnfP/9MhftGPROQ3H6NQ+iB+oZYWgCKAGJCnUG4DbjvJjV9avOzXeRDmwX
         G1tDr/nlRN2LbObAdK3lN+gbgTCVxfRYJLrPgbJ31CFO+7YN0nF89WV/7hc89pgWwXUp
         UXBUs5nURL2dKdqvJlP8SubxgeQmrq+mV6G5QSgEWOStPH0BGEgCAousga0mLLhpmETh
         9xtyjsrW4W7h6wLwVJCmt5zv//Gw8mIaZqNpfWygIJeYPX7/p3mRaOoZnHx8qknCEEUh
         lNJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c0FtMfwL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iUviyedeUNpnpGgqsDUWSmk6HHyMXNS5RNjXJqcmVMc=;
        b=Flf2rBYHgLyrC7bPBgyB5iL1saQ2ayEzNe0ahAfVH2eprsLyGf7Y2iFMLiM8UvXn4h
         Z/9MQv5CRxuQehXECB5EOEeJ3hAc+ZUQL2S90meFjppSUVkX/8smFZ4nwDf2S5sEnD02
         em1PPKcfPss1hz5SuG0HWSVkU7gtmNNkRcYs4ZkaPphsIe3BjmVXcdb6sF9N4nq7NGko
         fBvJTnd2Hw9hBrh8KkO3f6qCQFduBVrNzQcJaDc2nE0CB24zCzRohWPfm2MAJMbCTdLO
         zzRkvIndfc2xx0cvDxX6pMk42+4/pm7CM5vBZTqOhNxYqSMaZebPxBd8YOY8IFfjkuOv
         WiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iUviyedeUNpnpGgqsDUWSmk6HHyMXNS5RNjXJqcmVMc=;
        b=gt4cZSZeha9RU1PgMwD++UOhi5RnyBrCq1L4KD0G586fvh2SZ+M7TKBPzw9ncqF9Mg
         glX/dw/ISVDFil+87NLyMgGZOaklvCqGMZwkkD4e1qbuX/hkhdngtQQSgTG/V6J9ZtIr
         VtNEAP6S6ka7CE5+I9WeEPARp/Lk5S5cDRmzqKyLdIsOBO+DsACRkYnq63f/PdBpezXC
         Bpnhtw2KBHZtVAw6Q/zw6DhLUFU6OQomNa04v89qur8pkLgwO772goWvEfVk0EvJuqJG
         O7qSR0pET+TU9bFxePC+cITqN2aNPMT7BRwskW4e1jWEMGSc9gFb8oD8SE/lSJJzkxeu
         P6Aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXkwrzmrXQK8gThxscJFrOvt5mQnGmtY8gmIMOy858yyfnKnQz
	/wX7bEF6ijB++/+v2BsC6xY=
X-Google-Smtp-Source: APXvYqzwWM+ahzRdb0qlTuCPT4PTn2vB0MwnOHEd/p87bgnKF9rcRIm7IqD1SiFbf/uqig1uJ1Mxhw==
X-Received: by 2002:a17:906:1e89:: with SMTP id e9mr5531391ejj.56.1561121494324;
        Fri, 21 Jun 2019 05:51:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ac62:: with SMTP id w31ls2804233edc.10.gmail; Fri, 21
 Jun 2019 05:51:33 -0700 (PDT)
X-Received: by 2002:a50:b1db:: with SMTP id n27mr101920311edd.62.1561121493883;
        Fri, 21 Jun 2019 05:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561121493; cv=none;
        d=google.com; s=arc-20160816;
        b=lCTXyAJr8PNDvqpbE/oK0t4bxvcYQyCTj7yzQFhLrzUBG99QxNYqMHpsUyYYh3h71e
         4Qlr9EQyfKFLrqDiQ0dmNk7H73Ba0MYt5FizsJFutN/05Bo4S9jCXAKWdJmT8WtdvOkK
         zOCTzlK0CZ4tsPkBEdxfrMTs6ErazGSwCtjWFDxnDoCOuwSyGlxB8DBfNagwNToS0C2l
         r3tE2dkLU/uYwqJOlFwlfBKQqjA+E5l6JO9XWI2amf3QyBeZHcj++1RKd1bYOuHqHvAf
         SyTqFQUWnpNxyK26/MhWucmY3V20HDe+P8NE3OKBeODBZaajporG1HSU6tTBtWycqEQb
         /sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=JpuweVQuQ0CsL03uOTU/J2xQmQJlSJ6e+ptSyNm/OPg=;
        b=lUrJ87Gx3sAhKK147r9unCtvck5gFVleWC5t/USjyN8lfJlY9PwXDPeMjxYOFI6vCI
         o9xNA7X3LiS2Y7D7tUpZX02637ZRLATDCPtCjnsf06RCA3lIcDxyU38RGQLEpA7wu9Qs
         tOcnBRxz+yX68FS16Uurz9V7dKfhFB1w+ERTvoWWagUlbyX9ptCBVrmfMU9aNlHSsft5
         DGnfFY0i4nTGrJCorvFA9GIKZhy8nAPtBSW1bwulCfoQU+E06bjEx0vs20a2ggTp5/Ld
         B1J3UzgrVrLQW0DnvTEiu+CvCUPvCPypPbCRhoCsMjb54lB6e+6cBFWBAji7lkMpBfXR
         Nydw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c0FtMfwL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h23si266178edb.2.2019.06.21.05.51.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 05:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45Vdq92nxczyHd;
	Fri, 21 Jun 2019 14:51:33 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 21 Jun
 2019 14:51:33 +0200
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
To: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>,
	<jailhouse-dev@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
Date: Fri, 21 Jun 2019 14:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c0FtMfwL;
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

Hi,

On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:
> Hi Adam,
> 
> On 21.06.2019 17:16, Adam Przybylski wrote:
>> Dear Jailhouse Community,
>>
>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
>> Processor. Unfortunately the system hangs after I execute "jailhouse
>> enable sysconfig.cell".
>>
>> Do you have any hint how to debug and instrument this issue?
>>
>> Any kind of help is appreciated.
>>
>> Attached you can find the jailhouse logs, processor info, and
>> sysconfig.c.
>>
>> Looking forward to hear from you.
> I'd say the following line is the culprit:
> 
>> FATAL: Invalid PIO read, port: 814 size: 1

Could you please attach /proc/ioports? This will tell us the secret
behind Port 814.

> 
> As a quick fix, you may grant your root cell access to all I/O ports and
> see if it helps.

Allowing access will suppress the symptoms, yet we should investigate
its cause. Depending on the semantics of Port 819, to allow access might
have unintended side effects.

You could also try to disassemble your kernel (objdump -d vmlinux) and
check what function hides behind the instruction pointer at the moment
of the crash 0xffffffffa4ac3114.

  Ralf

> 
> Best,
> Valentine
> 
>>
>> Kind regards,
>> Adam Przybylski
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b22e6a12-a5df-c698-d4ce-652c5376ee4e%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
