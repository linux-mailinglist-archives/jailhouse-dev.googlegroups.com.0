Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4VF5DUAKGQEUB6ANDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F435BD90
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 16:04:35 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id i2sf5719463wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 07:04:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561989874; cv=pass;
        d=google.com; s=arc-20160816;
        b=URFwdZ4o2PJeobkqNZaC2ykXuMWwggvJ6rvxb1bRFwn6Ja5Iue/Lb6/ERnEWGrFFzn
         nDN54Y8ZeaMcaeX4XHWeJfEN0e8pGWNAJHG5i6rPOGQiS8KdgTiKrpz116ZtIbyUq39l
         H7WcgBkY25Begq2TtI2wEUcjfeDubksJJ4aj51tUDa/DynAJSuPbiuPzGXmzUc0Pc4Wh
         WmzOZGo8y6ewdV0vJAIJCb71Mj+qbG5VdF9VSce3r87dXcFtHkcNGRxeaz1KKgfnFiFU
         UlmvHqaOoVwzJQYeKLaBdSAaO0C2wa5WR72QL2B4cPGgCRtwdrTeMvnDXWKbUfEIJGPZ
         lc+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=7D6PNi2uneaC+OyPbEG96R9C0+W1KP7AJgLhePre1QU=;
        b=LpQNXRTIURzbn5Qus9jpodakFqY6T9pId/EgUACnYg/yH1APGDrxoFOcwp2Nu+LaMV
         8QlQdbsQN80o3+Gp0Cw8X2lYlUXwO+MuxLOgnuYQ5OVyrWAdpJw3uLT+t9hNFaNM+fUW
         f2RtkUSw2k7Pvio/R3XLstNzEsIXebzesjAqBn3v/Mk6fTzUtGFe6+XtTPgji5E9xdUY
         DaATaHsFuwkk63/81UJw9/hsVxbUTixj9e7dYGXiUJe4y6/jVQbSF5gIqp7kWIvfuRqH
         dxpwwvgNoQBFbRTQ73A3T27EFSNynaBtzuRcfRE5F4Z/EpDJKFoAF/Q156aSz/MgjlI/
         0tAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7D6PNi2uneaC+OyPbEG96R9C0+W1KP7AJgLhePre1QU=;
        b=b1tLgdJE1DikfztoMtbsdlAq7uP7tcRazHiH4oIZnbJZoXpFbMCHwCzJu9Q2kbY8bH
         /LmjZSQ4TPZ2UE75nG6JbIPwaM2CSdWeBJYTqYXdqZvRrVBL1RBdOLp1zf9yQncyIT94
         iLGRFQXxaqfFiyz9uIMSCI8XMdZVsIxurEorYA4VulpgEOIShuVtYeTCfP8BSDpmDgs8
         7XBKce3eLoGF/Cpcp5Byy/uNL5QXa1yoqLU8qwfE+FKtCPfQzjFKqWRo4E5zWCToEH4e
         gMKcoq+NUGU58WQl7fHyu2OCwubbeZawQgYSe9RkAmBX9YBOaNsfDqbcrtRPwEihDwfA
         9LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7D6PNi2uneaC+OyPbEG96R9C0+W1KP7AJgLhePre1QU=;
        b=hcvEh5cFoEdLiBfd8xLjmn5dcO9/5tQsai9Kw64Saqk6wHsbo/4jPBXVIPeSRZJG26
         a2ztioHVWu3b6+8wIFJSVlQNT5MBQbGa6jM7wSum/U9Ww2zZ3sy4h7aLcRiKPnI24DhG
         4Euo5J6DnryC7IGRXJl7bOcbuzy1d5RBzqV1FSR4GmFuXyZLBHh7UYdAroOQS6fTNhFi
         3Kq3XIcvf300YuFJQ/hCSkuoQ0FoztnizhPHmPdOIPr+sCwrbhuWhKB0HeGTy07OZJ1h
         Le5iA+2WAnQwlYwD8uugUmdnZY0fkJbUseW48AythdfkzccvJ50FoCSN7q74tzePl9mx
         naVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUQhQNXtiSZxqGxU6xxe18Dn4qgtkbyhL6Uy16Zontf4sAxXmeg
	l3mpxAiX447dUtQlcJNnYjk=
X-Google-Smtp-Source: APXvYqxeCIVBU1Y0Gw9Ay85Uy6HsuondHJVZU8xOHx/oPyJl9cHNDsVMvroiLisK/2NgUgd6qAS3HA==
X-Received: by 2002:adf:a19e:: with SMTP id u30mr13670610wru.33.1561989874796;
        Mon, 01 Jul 2019 07:04:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb4f:: with SMTP id c15ls2350016wrs.11.gmail; Mon, 01
 Jul 2019 07:04:34 -0700 (PDT)
X-Received: by 2002:adf:a305:: with SMTP id c5mr19620642wrb.29.1561989874229;
        Mon, 01 Jul 2019 07:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561989874; cv=none;
        d=google.com; s=arc-20160816;
        b=UEgdfBlt83ITbAIggNx8ZHrFMPDXWNyKXLsf5cV2AFPtC9KHdgT+4Jeyb5Q8AEjJJ0
         R0M656iuDwB7A1mKr72Xdz+U2/sePoED4pEyCmkJl9QNN2/M71D5us6H15eZp+OLYWYI
         pzys//X/S83WTQUWHCpeyZ9mGewOFLOGKPu4lic+GNPNSRO7yTuRkfq1hTfNEFEbHxVb
         A9ZG25OwHlJ91UQjSzr3ipTka9fQlgHF6MAzOm+fIJi2YDEzZdmKlxGRuZ/Pkaln16Jc
         kSpllF1vwMOrNqG68u4G40qkQflByBetqckHhNJOw/EhGF4oHVxcbTrTUUBbDtmZyBec
         r0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=o6uoL80GV6Qlv115eLNgZ4I3myVsJM8aZ1LZHVBa0lI=;
        b=Ng4ATTD42NzcPW1xZdNQU1djZHEQg6SdGBMSccEsnvEWoU67hHdJEibREigBB9mEMY
         hdY/ZBKYPOgeLF2aRt9Pm3cWtlM3mjzO+qqJTDOG5OG3ZaI/p4v0K6g2OMITm9NvMZju
         vo4zZH45KRp0iPOoIW89/dLlHux8RMsqnJl/MAs4gpoFQiF6iVW5N6SrtvsfOwSLGMur
         2SJPkZ7/CWdFMFJUI71jvGHKfZP1ltGzWjkKcdvjBe3n9PDMm+HDbl9q87XmpgsA6PRn
         Um1oD5WKfPE6WpVFLIEcfrnhuMGVmkLqyQbmso0oZ3q6jnZpklhDsUPaRkAtpMo7gECg
         Y8sQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a1si4106wmb.2.2019.07.01.07.04.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 07:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x61E4Xcj029510
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 16:04:33 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x61E4XDN028550;
	Mon, 1 Jul 2019 16:04:33 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
Date: Mon, 1 Jul 2019 16:04:32 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 01.07.19 15:52, Ralf Ramsauer wrote:
> 
> 
> On 7/1/19 3:09 PM, Jan Kiszka wrote:
>> On 01.07.19 14:59, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>>> Hi,
>>>>>
>>>>> for the completeness sake: it's about ivshmem-net. The PCI device shows
>>>>> up in the root cell and can be discovered via lspci, but the driver
>>>>> fails while probing with
>>>>>
>>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 -> 0002)
>>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>>
>>>> The register read-out failed. Maybe a mismatch between driver and
>>>> Jailhouse version: Which revisions are you using on both sides?
>>>
>>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>>
>>> The bar_mask was copied over from the qemu demo. Other than that, the
>>> only thing that changed is the bdf. We simply chose a free one on our
>>> system.
>>>
>>> The memory region behin ivshmem is high memory above 32-bit. I
>>> instrumented and checked the code, but that shouldn't be a problem.
>>
>> This is rather related to the MMIO register access. Check if reading
>> that ID/IVPos register actually triggers a VM exit. I suspect it doesn't.
> 
> Hmm. Correct. I guess we should end up in ivshmem_register_mmio() but we
> don't.
> 
> For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
> the kernel:
> [ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
> 0x380000000000-0x3800000000ff 64bit]
> 
> That's odd. Actually we should trap. Instrumentation of ivshmem-net
> below gives me:
> 
> [ 2044.832898] regs location: 4080053db000
> 
> Huh? Shouldn't that be 0x380000000000?

What's "regs location"? What does "lspci -vv -s 0000:00:01.0" report?

Hmm 64-bit... FWIW, I'm going to remove that "feature" from future ivshmem 
again, moving things back to 32-bit address space.

That said, this constellation may have triggered an issue in ivshmem or even the 
MMIO dispatcher that wasn't visible so far.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/065b2f28-c115-41eb-5f3f-8f99fdcbeb91%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
