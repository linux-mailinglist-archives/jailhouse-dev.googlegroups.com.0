Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLXPSDTQKGQEFIFS3OQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD3256DA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 19:38:55 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x1sf8344156wrd.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 10:38:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558460334; cv=pass;
        d=google.com; s=arc-20160816;
        b=xSht7j5JHT7FlryQrGgJyanuCXr7rJf0c2w4apdVm82Czccf8HTId+3zscClErShAb
         9Xbh+C94xdUBxuXBvU/DpIxSvRLRz0pEoVqTlR+qRDfAEtlEaC30zW1gDgUWyUN/+G3i
         6wi1aGxdp6rfeSyDbTOqaJ38QJuNNWYXa5mrcYLPQWleGo5bl1GeXamiCqcKjzvHli1e
         3jmDHoDkArVmGEtV0ZMo/JGQuB0kCKhQy9bPC8drHoNO1MELXdT0bu15TPaHRyOLOUT0
         jWH+sMYtoTvoKBAlaDdaMoDraVr575lDb1IoJeTtHI2qc7BygNYB019yzlG+IDKJ8aUS
         5dVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:cc:to:subject:sender:dkim-signature;
        bh=6Slbpq8KmnZbpF4jKKz54mV0x8lf6Xq/FuZLc/6fyzk=;
        b=EB71HU3yQo1aicbrg9YiXIJoarbdXKrEm8NrRutF5jXMVQOKvfLA0hNIEfkOaprfg+
         bXS6TR3m4vzpODmmTfTlFkF8O781K/LMhcPWm2FbWYZbsrlrQvEe3VdFGDHze7gpsAbu
         meNbCt2HM22WufqpQZS9QpqtYUVv0jgrv+309H4pcGtQj0PAFs1qHxOULeb+aD/L95xR
         PKR8FwA5YgCQP/8APPtb8zKVyeRZK9bup1WijgKT6YSa2mt3ob7jwbbIKtTkaDFZIlp2
         gdddDXHIucy0YYTFhp4lL8AYrtCxZHH4o8vEVnwU8aL3xzLV7YPDXeaP65YqVGKnYMOC
         oPuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pRoDEU6M;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Slbpq8KmnZbpF4jKKz54mV0x8lf6Xq/FuZLc/6fyzk=;
        b=NRvJZhk2OJKpxZXGxLfO0qMzWMEfcnIx5+6slS1DUTTIwYbuTK/D61ho/9BZYkenqi
         4bUFaEoIMQNcBttORtDlp4E2LqobS+PkOV7seiiKlZ/vWeJasVE1rOnso0kyT7xjrYXm
         0MvKPQ5UUIHnyYXwicTHoKVhrBnOENB0X239elxd4CJDuDn48+521Fa22Dc/Awmg+7/K
         Q9WUcLgk+lkAtBNJbT+w6SLSpXXhGJo1+pU47J5dpmBrVdzdscU5AnEW/MXOxQzaqBR2
         JYroLH+PV+yP+Ap2BJ1hDch8EVZC7lDHzec75G1JFyHtnkcAlEyMMFLCmyb3a25jy7lb
         grsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6Slbpq8KmnZbpF4jKKz54mV0x8lf6Xq/FuZLc/6fyzk=;
        b=dRE5oRdSs01M0g1LldNUN5ZekQCR3M5u1IG/o8QNwLlboS55SZZYlRRSOX/v4HZShr
         OZ/DnOcoYNLjoPD3KgScvxZFFIBFysLmxJ9WD8/oemqhYi4mXrOiOufP3hyGmZCCe0SW
         Kj4/KkhGBXzo3MndGBeFQ51gBqCDom79wVPoRIMSeNJOojDupeKcJInNKCTrBFuc+yjo
         8lBuqf7c4NVsED0NZnQMY9Q/RmjK62OdkB4D+CbdQpOAzlMOm09s2ntcE/T50gK3VPe0
         vv97DwAZ5EcH6qUTYup0JhIarSbPt4B0LDvEDuqz6tlx0o6zKNDpDl/+/hyIFMsqjpa2
         F+6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIS6owKmLXEv+lqmS2HoB50lF6Ot6h+WUaIjbfL2HXjnOPaoNp
	WK2+gM0zyMYzzv+NwciSKfI=
X-Google-Smtp-Source: APXvYqwZCKUL50kpPMTkGFSJEPAIPC9/6TgJQ2nRjpoBCB6p4V0pOUe92Wz5teOHvke+4aVEqNoMhw==
X-Received: by 2002:a1c:700b:: with SMTP id l11mr4593618wmc.106.1558460334738;
        Tue, 21 May 2019 10:38:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c18b:: with SMTP id x11ls5277611wre.15.gmail; Tue, 21
 May 2019 10:38:54 -0700 (PDT)
X-Received: by 2002:a5d:4647:: with SMTP id j7mr16245838wrs.280.1558460334156;
        Tue, 21 May 2019 10:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558460334; cv=none;
        d=google.com; s=arc-20160816;
        b=PbwsDW7zHNwav1aZrFCUNcCUiSaf3gFrMw9zsl/cL+HzMDHWdZYeymKxTe7eJpyct9
         8LwBSic0okhMCCQG/mD2QlbZVFOE8r4RfRagFhyxLdBcx0f4ZkwX/c8+wiUGMb5zjyRv
         sx9lZH06TpdgDGXnlwH/infmgFgg9LRFOsClh6TNF6YPd6i+8aTs4CUnfOQ/OYjjeoII
         +Xs43gtz4XF3M8u7f357IBOEkfWW5vFU34ru0LOuE5PS01uL6TGGxN2BP+ED+kndnPKx
         0pQ9rxDYRJ0lQ1vZyI37oj3t6uoeCOApoCvELeSzHOZGOEpqnWM17A91g0Q4GZM63XqE
         DJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=9zI4EnOT13k9WUKo9KgjAVA0HMlq7ebXU+ul2xKGPec=;
        b=x+a615oR/VwNhQCKd8hSCobt+o+i9BkCyJWaZyMouBs5CCgFy/B5AM8NKrkJmqxDul
         Mvg9PPoBLw9AoBh6+1/uwC+SJsK3qHg/JxDw1MzQh9ZU6H99ghdVdiXf6j6ILJdPcyTe
         XKTJbN7C/0fM3Q9WIkSP2JxEWwRRLpAs90zVwGvT8iL0M5UUxqQJi5tONWCnkGHsEAcm
         0hWa391ScCFI+RkPEqN+oUyUA74FsSELhO8VgqOblQ8HLEVa01Ga+uLsfb6QIY8aPuuz
         ulMx8nie7NC/ID+le+xo9sz0zteWf/fNGCkSdLCCoKlq8Iu+xR1/flwjIIwdpQRsemy/
         LvGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pRoDEU6M;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f18si182210wrm.0.2019.05.21.10.38.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 10:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 457jg14z6mzyHy;
	Tue, 21 May 2019 19:38:53 +0200 (CEST)
Received: from [172.23.4.153] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 19:38:53 +0200
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Jailhouse <jailhouse-dev@googlegroups.com>, Yasser Shalabi
	<yassershalabi@gmail.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
 <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
 <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <6a8fecef-27d7-b300-4a14-e874f459ea4b@oth-regensburg.de>
Date: Tue, 21 May 2019 19:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=pRoDEU6M;
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

Hi Yasser,

I hit the same CR4 PKE-bit case as you did a month ago.

May I ask you to resend the patch (with a Signed-Off line) to the
mailing list?

Thanks
  Ralf

On 5/21/19 6:38 PM, Jan Kiszka wrote:
> On 21.05.19 17:55, Ralf Ramsauer wrote:
>>
>>
>> On 5/21/19 5:09 PM, Jan Kiszka wrote:
>>> On 21.05.19 15:45, Ralf Ramsauer wrote:
>>>> Hi,
>>>>
>>>> we have some issues enabling Jailhouse on a Intel with a pretty new CPU
>>>> (Xeon Gold 5118).
>>>>
>>>> First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
>>>> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED.
>>>> Didn't
>>>> have a deeper look into this on how it affects the hypervisor or
>>>> allowing it needs some special treatment, so adding nopku to the
>>>> commandline will keep the feature disabled and suffices for the moment.
>>>>
>>>
>>> Known issue, see https://github.com/siemens/jailhouse/pull/23
>>
>> Aah, I remember that discussion a month ago...
>>
>> So I guess it is okay to allow this feature.
>>
>> What would you say, is it better to use a configuration parameter that
>> indicates the existence of PKE (as noted in the github discussion, we
>> should only respect that bit if available), or online cpuid discovery?
>>
>> I guess the latter one is a bit against the philosophy, but much simpler
>> to implement.
>>
> 
> Checking the code again and the comment I wrote around it, my remark in
> github that we would need discovery was actually overkill: The whole
> purpose of X86_CR4_RESERVED is to filter out future unknown bits. But
> CR4.PKE is no longer unknown, and it is apparently safe to allow it to
> the root cell. IOW, that commit was fine (if it had been submitted with
> signed-off here).
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6a8fecef-27d7-b300-4a14-e874f459ea4b%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
