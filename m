Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZOD7P4AKGQEI2ZWVQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE0522EF82
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 16:17:10 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id m13sf4435520lfr.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 07:17:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595859429; cv=pass;
        d=google.com; s=arc-20160816;
        b=e6KyXEyejVuGrKRcwBeKYd37rU56dFzjsxbhjfM2tYe6/PxVh4Db6r6rkNf1xR+KTI
         T/OK0bHgQCiRe54MfA0w3hKUfaBRrVKh9MPlMikq8NsheEMjLbzGwZUdRTu1h8mQULbO
         pwZwY2X9ERlwdkS65KCnJHTD6YHSDe6wYCsCYzw9+5AeDUlllzqlhbGR1hlHm0mQs7+o
         B56ZcRoGcpUzMx2jl4WvxOnAlMeF1sY2pQ1w75QBSmFru6QWAzt94ceDjAozxDQTuq+n
         +pgy4tnMV9ge7CO4nLmeKl1droN8EDU2qizixBqW3l9LD5Y9LS0+L0IooukpgHTWPpd1
         OJ9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=tWRpHvEzxNdb6Ag8JiMwdlcDytQSw/5IbShmmwnWij4=;
        b=nAmgNTO1QNON5Xa1zuLhgaw7p72uU/Hbs9CZKykJxyjWFoJyfcoZ7XPVofJQHTt3Hd
         b6u9yb13mW8bPhbjag4qtJJ95PmwunihDYXqFlg5z7FDjQCn8WJdOa3V2aQZT1LPZU/A
         LKxGeqWpnyZs10C++misb/NIZCSR+ALzang9rTaH1xK2ePKCsU6lpy+gTuY0ArEFuJsT
         lBtdn3bO1VxGr15xtbE1IzlAtrHVXBst3OZ1QBYY3Wo2FQcuCfUPLjiQ+RMWSXS2hyXD
         6VjQKFuRXZ8awUefo9prjblsrqoofT8ZaR2JAj8ZEIwxTR9Wr36rS1ItOzklkQf+6/Ke
         EJWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tWRpHvEzxNdb6Ag8JiMwdlcDytQSw/5IbShmmwnWij4=;
        b=d1zwXLStXHumO93CKBkHb+t7u9yM8r+wi3rEFcwMw7EJaP3SGCE8Cy73VwMJSdu9Le
         17wuZlR/oV4mMt/fnL6sXsMGHDjmn8Yk2yajkDfUZwp97tVUwuu/yrIu5QVLd/1k725R
         5uJrMHCB/GwWwdWs7L+3hARailMoBrZuBpoDx7PzjW0m3S8dZKY8bZ04JqG6T7c+eOIc
         VHisGRFvQnu/4Q8atu3CHyykiIdv49YrvLMtHnvULXBLomFtnsqrJztt4Wumow8irMhz
         AbW36lorAfftuyQtHaWzx37jyNMshCKdoMTlMp+6so+dcYXk+zVVppu+PZpEAOYX/lb3
         neCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tWRpHvEzxNdb6Ag8JiMwdlcDytQSw/5IbShmmwnWij4=;
        b=T2+nAA0BQE3CrkQmO34GDM741iS5i/0UjThCSdv6EKHtE44eFfbUkhr3XWhd8muYph
         rQyOFE8t8QAdmQVZxdbY62CPfmEfeVPKoXOdfyfqJGGBYUeoPD/9rLwmGAudvuClZJU0
         f28ZIzhH+SNmMFS6ebW5pUYjiDkVsozUOM7oIa0fYZRznXZHtN8kzFRxAZ2iPnsudV9D
         QHTLsHY3qDVgZJGV8+IkN6wWO7Pw+2gRlVkCKqwFSmy372oBZnQVC3L9dPKcjKCn4eJO
         o+/S+Es0kCt9/RodCV9uukEwvKf7SGbfuka6RpTQaHOkft8szBQyG2lNqXrGFZTVsLfZ
         p76Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GPGXJfGLIFcowC/4biWV2yjF4wdeCis3jR479G/ExSCMX5VYD
	aTLbsNvUuUuiT49IDZH+sWU=
X-Google-Smtp-Source: ABdhPJxnD43mHsGtbHF9AqlC8LLvZaLcxQLQrS6c74NDgWrvh4q1Yx5Ja9tcShlJJzSiiFxb6mYQ8A==
X-Received: by 2002:a05:651c:102d:: with SMTP id w13mr10470117ljm.29.1595859429437;
        Mon, 27 Jul 2020 07:17:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b09:: with SMTP id u9ls2975375lji.3.gmail; Mon, 27 Jul
 2020 07:17:08 -0700 (PDT)
X-Received: by 2002:a2e:b00a:: with SMTP id y10mr10168623ljk.266.1595859428623;
        Mon, 27 Jul 2020 07:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595859428; cv=none;
        d=google.com; s=arc-20160816;
        b=nKMEYRfny6LPi9WLPqaNP1+uzB2M+ZorGIgrWayIhL+8C0bn3OTwQdPDvgJmrUr+tw
         ryDJBYRS6BxbNrCfBZzLWzuiXiEBOfScaz8KpH3ClFJpW6EPQrA555lbku68qLEqMyg9
         dN8zUFLESSfnSTRCwh1eZI658XHy5CisXtAdx1Z9w7mQFBKxn1EFO3jxPFsuvhpiEGWI
         u4VTaJf1ic9LrQU+5y9w3t5HRrK0Rfvw5HDbZPkOJnjfKtLoQXduoTKzWZOkDrEVWjUR
         6qqrt+LCWWoScL7Blope+20qvq8kDLQGu4iriL/DM7hjDexQcHTD1xUtH5Vin6VYR0th
         2JLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=bGBpvbsTFXD1Qn05zZrmKPhOsm/hPOdfNauol7R7M1w=;
        b=XNYdRoRzbsuBjq1asO7+KTh9ze0m6C4ZvDKNPaM/zPPqfJdpyLtrA4OIOoDRm+LjQQ
         TLaYvjjaoeLv2amSO5O7eZg9Y+V75o7YiemRqlGB0jzeRxjUHsaQ9YoYdtVHKN/PAd5c
         Gm+spZf5pm0r5wYQO5aCN6UiiUybAwV3EutAcAr82SC8VAZhz9vochJoI50iNxz2dVSa
         Yc9Z3Gnq0ouZLDjyPU1JOq2e0QNyS4xt88KtTxS49NBbTV4KBHCTgFPvaFwtv3hGWGYz
         dkmOq6PHalnG87q/1gn+ukFWcAGlgssrJyx09/QH9GFmE7UctGuuzLcFuEjoKP/ym0q6
         znaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e2si497385ljg.8.2020.07.27.07.17.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06REH7tQ019024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jul 2020 16:17:07 +0200
Received: from [167.87.246.21] ([167.87.246.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06REH6wZ029966;
	Mon, 27 Jul 2020 16:17:07 +0200
Subject: Re: [virtio-comment] Re: [RFC] ivshmem v2: Shared memory device
 specification
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        liang yan <lyan@suse.com>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200727091802-mutt-send-email-mst@kernel.org>
 <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
 <20200727095239-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ac7ceefb-99d8-0662-8863-c90c20b2f31a@siemens.com>
Date: Mon, 27 Jul 2020 16:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727095239-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 27.07.20 15:56, Michael S. Tsirkin wrote:
> On Mon, Jul 27, 2020 at 03:39:32PM +0200, Jan Kiszka wrote:
>> On 27.07.20 15:20, Michael S. Tsirkin wrote:
>>> On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
>>>> #### Vendor Specific Capability (ID 09h)
>>>>
>>>> This capability must always be present.
>>>>
>>>> | Offset | Register            | Content                                        |
>>>> |-------:|:--------------------|:-----------------------------------------------|
>>>> |    00h | ID                  | 09h                                            |
>>>> |    01h | Next Capability     | Pointer to next capability or 00h              |
>>>> |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
>>>> |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
>>>> |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
>>>> |    04h | State Table Size    | 32-bit size of read-only State Table           |
>>>> |    08h | R/W Section Size    | 64-bit size of common read/write section       |
>>>> |    10h | Output Section Size | 64-bit size of output sections                 |
>>>> |    18h | Base Address        | optional: 64-bit base address of shared memory |
>>>>
>>>> All registers are read-only. Writes are ignored, except to bit 0 of
>>>> the Privileged Control register.
>>>
>>>
>>> Is there value in making this follow the virtio vendor-specific
>>> capability format? That will cost several extra bytes - do you envision
>>> having many of these in the config space?
>>
>> Of course, this could be modeled with via virtio_pci_cap as well. Would add
>> 12 unused by bytes and one type byte. If it helps to make the device look
>> more virtio'ish, but I'm afraid there are more differences at PCI level.
> 
> I guess it will be useful if we ever find it handy to make an ivshmem
> device also be a virtio device. Can't say why yet but if we don't care
> it vaguely seems kind of like a good idea. I guess it will also be handy
> if you ever need another vendor specific cap: you already get a way to
> identify it without breaking drivers.
> 

I can look into that. Those 12 wasted bytes are a bit ugly, but so far 
we are not short on config space, even in the non-extended range.

More problematic is that the existing specification of virtio_pci_cap 
assumes that this describes a structure in a PCI resource, rather than 
even being that data itself, and even a register (privileged control).

Would it be possible to split the types into two ranges, one for the 
existing structure, one for others - like ivshmem - that will only share 
the cfg_type field?

> 
>> I do not see a use case for having multiple of those caps above per device.
>> If someone comes around with a valid use case for having multiple,
>> non-consequitive shared memory regions for one device, we would need to add
>> registers for them. But that would also only work for non-BAR regions due to
>> limited BARs.
> 
> 
> OK, I guess this answers the below too.
> 
>>> Also, do we want to define an extended capability format in case this
>>> is a pci extended capability?
>>>
>>
>> What would be the practical benefit? Do you see PCIe caps that could become
>> useful in virtual setups?
> 
> So if we ever have a huge number of these caps, PCIe allows many more
> caps.
> 
>> We don't do that for regular virtio devices
>> either, do we?
> 
> We don't, there's a small number of these so we don't run out of config
> space.

Right. But then it would not a be a problem to add PCIe (right before 
adding it becomes impossible) and push new caps into the extended space. 
And all that without breaking existing drivers. It's just a cap, and the 
spec so far does not state that there must be no other cap, neither in 
current virtio nor this ivshmem device.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ac7ceefb-99d8-0662-8863-c90c20b2f31a%40siemens.com.
