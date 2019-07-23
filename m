Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTUV3XUQKGQEW7JKOPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id A911D71E27
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 19:58:38 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id v13sf4179014lfa.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 10:58:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563904718; cv=pass;
        d=google.com; s=arc-20160816;
        b=XnPgrGeRw3SqtSBCziVa4YGsEDWhd6QCW11fRlZ8vfClsj0d0AZpWz/cDdkQ/DVW0/
         PDPY/klMntEJrYdhg0hvaX325Gd5LsQYZwYcJOpgmsRB6oMVNAYG6drQmrxB71GmZc4G
         CHHD7memSgPscqp4Q1sh8lIGNQQqh5FTXsF6ezG9DowhCl42S+yASCoCaay3Ofyk/oKi
         SeXFGtqbm4K0oF35Vm43RX5AtvGmkzUeZULuuSQ4uB7S3r/USB6FkM129WR0uXXFZ+ld
         GWeGLRnJxS1u1xcLXpygJvzzV5XYhqIOxuG68C6JCPsShZNXtJ4UprpeWWdBDkb+rxFP
         /e6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=FJKTPmiw9RD2BEmmSv+/zy8+ALH4TWOzMUYlpzgYaUY=;
        b=OM3AuArW5FUxpTQRY+3eXG2GPsQYTPGiA6233n/DsjY/okh/vBqXsnATA1U8hL7jUi
         +4CjXLU66Qg7D+Z/1d8j+ZGupRoXbieU7cMZewbL8isB/6jUWlRTNQCe/NrSHl8df33a
         XG4yY7KDfnHKyFuZQATDJPVtnhD3JIUS254zHIYFkq4bUGLY0ihHXgT4oLNU4XHUAp3q
         PwXJOPpdBNfr35QEkiwDhpjWhswR2ue3JKPPgvZ5aT9uCj7q5za5tP2gGCtuOkj2ROH1
         9WH9JjA5NZKW6/iDinQ8wvgGZ5+8tLvn+HEvhXoMbYOVe1Or0HVq497ChRYZZFDGWs5w
         FyDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FJKTPmiw9RD2BEmmSv+/zy8+ALH4TWOzMUYlpzgYaUY=;
        b=kK8xUyzgnRdZkdI9esqyJIzdTuFCuymv6w62NRRbjDztAsDMthtWnpcO5OY+up8Tvv
         DOKZ2epk0gkNwUE5+NMGo7qSRrbLBj5/AgkBnnJtVtJeOsBzHht5gduKONfD0k+AjlzJ
         UCxkQIgG1GrlxY/VRintMfg8tgmAlmsQm3vO0hQxF0I6QduwShOEHbEegy0cTNbLfxyn
         CobaDqWJBQwaieMyCAeLLtbLm8NglXa4n+TpIL8L6gKilohSVOvNzr9meJ54SN5PWqjk
         x9k4gFIHeSNsF3RgcMrKp3IPsVnoviQyhKDzRrfVi0L6e3Ce5/e9tm9sorfZHM7NSWcd
         ywTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FJKTPmiw9RD2BEmmSv+/zy8+ALH4TWOzMUYlpzgYaUY=;
        b=BD9Oa4IBK4DQ/AZssRO9VHAnx+k7iz2a9OWZZYY+a407c/MkD7VsXRKtoc5y0YZ/4i
         3fLDl+gpgVpZ9mdm61Cv8R4PdgWL+DIXLDneLye2l9JzVttRyv1Uv3dQR4oRAMitGkGN
         Jehsfn1jnbNd19COTfXnu3lP0oD71kg6aB6vjiBWdGEI3SNmWrx+XxT7hFxoI23ZxVbQ
         /3Qpd0uYjm7U/w0EHRactUOBDv9pIfbT6s9H4zSzcFPeYvydV3+pZBTtd+nB7jOnj/WK
         iQjSOPoU7l9SxqON3ZlxdXjrFH5OTqYAFXCDp4q8QXU110W3m6OKTLVJw/L+HC1PabP4
         mFYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYaYL2TskeTnOP7bZ9Ui8CovB1kMT6CiK8MioMDrp8sA3CHjOw
	mqxEPtdu4M8viaLI5ilOoJQ=
X-Google-Smtp-Source: APXvYqxugAKEPiMUKc5RW5LOOoyuJwSX/VA1jUC+nRLJhPds7acVD2x/sJzXD0ZX57NvDW0SaJqfjA==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr34976383lfm.77.1563904718273;
        Tue, 23 Jul 2019 10:58:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls4971701lji.12.gmail; Tue, 23
 Jul 2019 10:58:37 -0700 (PDT)
X-Received: by 2002:a2e:980e:: with SMTP id a14mr40940142ljj.60.1563904717531;
        Tue, 23 Jul 2019 10:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563904717; cv=none;
        d=google.com; s=arc-20160816;
        b=UwXfi4NkXeSBriKFFIvuwug9zuzS64tNtHNjmc8Adux3KRmadJOqrHA2hsepfT4x/a
         8EfOu8Junwg40AzPTqMNYriFLELe9kpFWrzUNPR3BmB4e4WPqHA9WgkMeAi1rTWqrxbJ
         d2zUouYfMZeMn/691lV+o1TFo5GQBGNPYBpJwQru5FmjJos/g+RRCO8+jmY6GE2O9xxM
         5ZBA/YEt3F9Q92TqS95CiLO50fvtJG1OHg6mQGVp29jX0LvvLtn1RPI5JJFLqRg+oRVp
         a6sg/KdGDtWH+zPw3SVX57lSLzVlU5mPP6hr9V09WYLV6UcgLOVNSsBT1Re50l/1/dZW
         sRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vDCmA7FQQ28fd/GxZDNb/JkhpKAT6ttEwyRTOTX9Xpo=;
        b=dq7SO1hAguwALdHQd8tlmn8sEzPgZSCkt8UqBSTM+GdysY8uDHUg3VI5Qcpy9d3ACY
         D9s1Jn6NcrXoR+wsR8tFrz9ydWWpHkYiB9f2JhMWLsyUY1ITozrVtIFQFM8V7vk2ssqo
         b2lXnOe/cx23AJQzrpY9whzNlBTnyNUSdxn7bkz7z21UQJnWjx2F0VsdKXYJG4Fica/Y
         POJPpg7anmORtl3Dz32hb2ub1Cfjz4+ixRH0lM9X5CIyu2D34KhRv7LX15feJro+xrMC
         zMKSMkRBpfsTrIXSmteIY++A7n+j5Uo9+UHdXBpO2CKKK0T9EhsKQY8AaDgX4otlZ0DR
         DVXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q11si2083012ljg.2.2019.07.23.10.58.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 10:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6NHwaxN024344
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 19:58:36 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NHwaU5014409;
	Tue, 23 Jul 2019 19:58:36 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
 <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
 <11ec656b-e07f-f6cc-12b4-87e20085924f@oth-regensburg.de>
 <00a032ec-71ae-8b66-a85d-a8f809e2f17e@siemens.com>
 <1a789cc5-8c24-9cdf-fe4d-63485379c5be@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <587c7a49-cf58-b9b3-3a80-454ac165636f@siemens.com>
Date: Tue, 23 Jul 2019 19:58:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1a789cc5-8c24-9cdf-fe4d-63485379c5be@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 23.07.19 19:53, Ralf Ramsauer wrote:
> 
> 
> On 7/23/19 7:21 PM, Jan Kiszka wrote:
>> On 23.07.19 18:38, Ralf Ramsauer wrote:
>>>
>>>
>>> On 7/23/19 5:35 PM, Jan Kiszka wrote:
>>>> On 23.07.19 17:19, Jan Kiszka wrote:
>>>>> On 23.07.19 16:50, Ralf Ramsauer wrote:
>>>>>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>>>>>> parameter like 8250.platform=disable to disable the probing for platform
>>>>>> uarts. Why?
>>>>>>
>>>>>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>>>>>> restricted ports. It does touch those ports, as it lacks ACPI platform
>>>>>> information and assumes 'any' platform UART is present.
>>>>>
>>>>> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
>>>>> propagated the information "this is Jailhouse, you may not find platform UARTs"
>>>>> to the driver. But that was a hack, so I didn't propose that upstream along with
>>>>> the other x86 changes. Plus, there are cases where we do want to use a platform
>>>>> uart in the non-root cell.
>>>>>
>>>>>>
>>>>>> I.e.:
>>>>>>   8250.nr_uarts=1 only touches 0x3f8
>>>>>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>>>>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>>>>>
>>>>>> In addition to that I have a PCI device. And Linux won't probe it until
>>>>>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>>>>>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>>>>>
>>>>>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>>>>>> to all ports. Yikes. At least I now know that the PCI device basically
>>>>>> works, but still, this needs to be patched.
>>>>>>
>>>>>
>>>>> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
>>>>> card, but that machine also had no platform UARTs IIRC.
>>>>>
>>>>> If there no other way to tell Linux the number of platform UARTs, we will have
>>>>> to introduce one, for the sake of this use case already.
>>>>>
>>>>
>>>> Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the
>>>
>>> Thanks for the pointer.
>>>
>>>> platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
>>>> boot protocol to provide Linux with the information about available platform UARTs.
>>>
>>> Hm. We do have the comm region... It will hold the config's struct
>>> jailhouse_console. We could use this in combination with
>>> serial8250_set_isa_configurator.
>>>
>>> This won't enable all platform uarts, but with this we could
>>> automatically enable at least one platform uart + hypervisor debug
>>> output. This should be sufficient for most cases.
>>
>> This is x86 only: If the well-known legacy ports are open in the config and also
>> the related IRQs, cell-linux could set some to-be-defined flags in the
> 
> Hmm. The config (as well as the comm region) lacks the IRQs of the
> platform UART. But they should be static for platform UARTs afaict.

The config has this: irqchip at standard address 0xfec00000, pins 3 & 4. If set,
then the UART is passed. The comm region is not needed here, the setup_data is
filled by the loader.

> 
>> setup_data, and the kernel could tune the platform UART settings accordingly.
>> "Should be simple" (TM).
> 
> Yep, that wouldn't require any invasive modification of the platform
> drivers.
> 
> Three flags should be sufficient:
>   - Use 0x2f8
>   - Use 0x3f8
>   - Use dbgcon

Nope, 4: PC-UART0..3. dbgcon has nothing to do with this.

If we want to propagate the comm region settings into some "console=X", that
would be a pure kernel command line tuning by cell-linux.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/587c7a49-cf58-b9b3-3a80-454ac165636f%40siemens.com.
