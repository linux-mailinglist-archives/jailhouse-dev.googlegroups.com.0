Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBL4T3XUQKGQESDFMJII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AA71DFD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 19:53:52 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id o2sf9484939lji.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 10:53:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563904431; cv=pass;
        d=google.com; s=arc-20160816;
        b=jYH9LiiD7/iw12l4K8Fw4nCxIwnzUB8DW+33jm0/pxRyYPZBDQ5/vnMqRO3miP0VPa
         VIHHGIu9x43tltRrAGglNcMh4BNv/YFIny6HjP5efm1PopIzAiVSMT6untRfV8oliDVY
         u+5QkurZNff6k4o+eZ4jVXEU41sE9ARAxz0AiFNEynExL81cvoQLeV1usUlz69Rs0Q36
         wXvCdcxb4Q3+hXJcrfWdjHWcELTi68r0oKSkwXUQT5SF1myGd4FVdpL3969QsQgIYvrI
         4UVem/BcnvvwpQnPt8whY1k+Zf3xfPAR3aqtN+ylC1HbpP7QImnC6YezIDkr0ddguzDy
         oTSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:to:sender:dkim-signature;
        bh=9LlftUyO3lTPtfu3lL/gtu5111DwdAesd5s1gybwmW4=;
        b=pCVbfMLNcdq7qt7BoF0BnpvU2NKQLcoIPy8wRbsQAgaBQ57lLuN7vB3GnYwxXp4/+7
         TF6EaCd4uWTFxJICW6CGnhgKODJCMu8tETTnHZo8YtRAF16O5qL21bMuDtfJIBmwIois
         TKGlIfWIAAo7iZ+jb4iRXeLkW74A8I0OUL+uM6T1vQJxIEIhbATOQv663LszkHomgnsh
         yIBJI1QGq/F5xpf/L8sbuHA0kxHG/iORy5xlku4mkGMGcHWuDnnO/trmHbg4j+j0B8pJ
         PUBexYGzhmkERmdudN29caUWPMlZEBCBO7nOcAJgGx0DXKnpM/bntDYDLjjd/GE+3s9o
         kPmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=D2YpLb4V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9LlftUyO3lTPtfu3lL/gtu5111DwdAesd5s1gybwmW4=;
        b=Qk85DCqar8FNu5YegoNcentwVOtBtZZcLArWlNDo3Wx1kPHBLLdpPS0xZb1MViyDZF
         hM7UjzjF9iq9KmDJgACdCLTnQHNUgXPcM35m9mvDHGHT8pHrXH02zCxYDEK66MN4V1YF
         gpoZi5e+qsXw2l/OkdEgmivudfzvjpMy9mrIF7thfnO7h9PIYQmDtmNQABLfAH4zx6yT
         MXT55EOc/2ZgOofHD7FmgyZJo0+jwf21XmswI5ZdDMSOMD19/I3UvRtiZmF7KVCMJsoI
         U3yZ8L2n4AyUYskFIYp+4bYnCkwxMjt2SiA5xSREZe0oqajdbhczBIAJtbjqP/jaQ+hp
         TcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9LlftUyO3lTPtfu3lL/gtu5111DwdAesd5s1gybwmW4=;
        b=A+pw5wWCr2xYyepmNowWo/UCbwmCQLQoPqIcpo80HxWRRpBUVc9oaCRCsZv5mwOaiv
         44mpIsPBoTCmKIf9RNsJ7+OBKdlJhEJYuDMY1E9Nl+5mIiY5z840lxzJqXz0yzByVRTt
         LDUcNGOqav+gidI+xjQpPG5GUzfiFZPZFfa+u7nynNSZ68HpOpbCioUuCpredOtDJX2+
         jFmCOJhN5X0bs+fSAgSPpWAPy2JQ4UluOkJjRmHQ441MNmKqmugQ9UsgdF97KUP3MvFw
         BWtJMmX+aJm6rG9dpM7Ad6IA9Hvka9TsY3mSNCmjDVJ12kyez1xM7e6Z9AxQ4KA6qe+W
         ECgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUh+bTTveYNm9rpTyFgIkURC95KxpI+NWbU0y26eSFicn/2Ezpz
	pZ+Y9wnTeQ+vk+LyBTp79mQ=
X-Google-Smtp-Source: APXvYqwTElQR8pY6GtTf8U7cMpT6kApe1YWVmQPWwK/kJX5T9utVoSki0n4M1Wyz3UaL5G4UL5rnhA==
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr36134289lfm.143.1563904431710;
        Tue, 23 Jul 2019 10:53:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c0c:: with SMTP id o12ls3560415lfd.12.gmail; Tue, 23
 Jul 2019 10:53:50 -0700 (PDT)
X-Received: by 2002:ac2:4644:: with SMTP id s4mr35347673lfo.158.1563904430633;
        Tue, 23 Jul 2019 10:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563904430; cv=none;
        d=google.com; s=arc-20160816;
        b=nPPquPnoC7Hw6PQvO/CjfuE/29qA73pZxXg7/BJYHzavFi6AG5qQeVZyDFK10nDbgV
         oYPAOEfpIo7DJ2L2ki68Wfag40HK+4ZuITAyKlxUwiAg+NsQkVW6izJjhSzs+kCp6Bmj
         LDPO6cTiYGKZ/ESy+1fEMJJUarRqWkKxEBEkuCKiTbBGd0cB4sCuV652DN7MGeN7fMtK
         8VYpHWU8b2poegYVGNe2DelFI4c42SXaVMSe9R5m9VjYmaJr91fj3UjROGXFBR2d5HpP
         aN+KNj+KFoxhWTpYXmZ6N9YlGtTNi1tKkFfPJGeOIjCuEGdfH6B91QkHGbpdeKNLAzUh
         MVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=c7YUOHoWVOVdc3VtPamh9D3cRj2CCoPQyJwWXms6vq8=;
        b=bi7N8N7MSOsyhS1ZKjmtsaDLCQz+RwoQte2RdC1EZfwOlt2I3OP9nHhoaRoIy4SWEq
         9m694TIQY7CeT1rqtyGm+iE+1zbzVfV7Q1WvzRQ4J/BChV7R4EeK1QlSlmX04d4XI/LR
         JOep9Bd4XBrbxB4f/aZDMJN9Nl4IQcaUCmV8iXlCnLiGHeBJOx3qeIVruwj322KgF4rL
         HKJp8cjxvQE47POKHDaubgZ8q16Mr9XC2mvYq+YO90JLOP4RpCHz1nIDCxmS9fPiIS+/
         G0uyVlWCwbE//uwlSO1rfSD0++AjZZVG4w+OJNQJtIRR2fLxp2wuEJw5sdt4EAqvJnTC
         wtiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=D2YpLb4V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id s14si2510644ljg.4.2019.07.23.10.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 10:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45tR191nQCzxps;
	Tue, 23 Jul 2019 19:53:49 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 19:53:49 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
 <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
 <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
 <00a032ec-71ae-8b66-a85d-a8f809e2f17e@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: Jailhouse and PCI UARTs pt.2
Message-ID: <1a789cc5-8c24-9cdf-fe4d-63485379c5be@oth-regensburg.de>
Date: Tue, 23 Jul 2019 19:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00a032ec-71ae-8b66-a85d-a8f809e2f17e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=D2YpLb4V;
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



On 7/23/19 7:21 PM, Jan Kiszka wrote:
> On 23.07.19 18:38, Ralf Ramsauer wrote:
>>
>>
>> On 7/23/19 5:35 PM, Jan Kiszka wrote:
>>> On 23.07.19 17:19, Jan Kiszka wrote:
>>>> On 23.07.19 16:50, Ralf Ramsauer wrote:
>>>>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>>>>> parameter like 8250.platform=disable to disable the probing for platform
>>>>> uarts. Why?
>>>>>
>>>>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>>>>> restricted ports. It does touch those ports, as it lacks ACPI platform
>>>>> information and assumes 'any' platform UART is present.
>>>>
>>>> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
>>>> propagated the information "this is Jailhouse, you may not find platform UARTs"
>>>> to the driver. But that was a hack, so I didn't propose that upstream along with
>>>> the other x86 changes. Plus, there are cases where we do want to use a platform
>>>> uart in the non-root cell.
>>>>
>>>>>
>>>>> I.e.:
>>>>>   8250.nr_uarts=1 only touches 0x3f8
>>>>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>>>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>>>>
>>>>> In addition to that I have a PCI device. And Linux won't probe it until
>>>>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>>>>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>>>>
>>>>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>>>>> to all ports. Yikes. At least I now know that the PCI device basically
>>>>> works, but still, this needs to be patched.
>>>>>
>>>>
>>>> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
>>>> card, but that machine also had no platform UARTs IIRC.
>>>>
>>>> If there no other way to tell Linux the number of platform UARTs, we will have
>>>> to introduce one, for the sake of this use case already.
>>>>
>>>
>>> Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the
>>
>> Thanks for the pointer.
>>
>>> platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
>>> boot protocol to provide Linux with the information about available platform UARTs.
>>
>> Hm. We do have the comm region... It will hold the config's struct
>> jailhouse_console. We could use this in combination with
>> serial8250_set_isa_configurator.
>>
>> This won't enable all platform uarts, but with this we could
>> automatically enable at least one platform uart + hypervisor debug
>> output. This should be sufficient for most cases.
> 
> This is x86 only: If the well-known legacy ports are open in the config and also
> the related IRQs, cell-linux could set some to-be-defined flags in the

Hmm. The config (as well as the comm region) lacks the IRQs of the
platform UART. But they should be static for platform UARTs afaict.

> setup_data, and the kernel could tune the platform UART settings accordingly.
> "Should be simple" (TM).

Yep, that wouldn't require any invasive modification of the platform
drivers.

Three flags should be sufficient:
  - Use 0x2f8
  - Use 0x3f8
  - Use dbgcon

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a789cc5-8c24-9cdf-fe4d-63485379c5be%40oth-regensburg.de.
