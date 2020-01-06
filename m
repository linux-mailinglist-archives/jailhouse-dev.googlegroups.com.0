Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBYWJZTYAKGQENLESXII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 852841311DB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:15:32 +0100 (CET)
Received: by mail-pg1-x539.google.com with SMTP id d9sf31870715pgd.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:15:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578312931; cv=pass;
        d=google.com; s=arc-20160816;
        b=vl2HafD4Rw0CpPLP9agJzZRxZftzkgHqy+tfM2yyYOPFErCGsmrsXPA638ckDhd+eG
         sH512EmW93UKzqO/B66NIFuVQfNKlF4Sm2KAY2bQ8ppruJa1Klt1EVm3SBE+qD4uK9cb
         Fp1qmBEGIRNnxu3OCVEzGU/bx4aEn60FTRFT/sNFbxRnqnSatyg7s1pfd/8N4DfFWb/t
         LQ9SylIQ3lXjFrUzXbvD1a3P570+tN59XlAdkMPm1qIe8+/XXoyUWdtHvmUSXSv947Zi
         ofCg+2mcKM+1hadQFUG98jh5D2Mm0aZexaqyrMsp1ZmDDAy5gxBIr/xti9rfGzOuIO41
         mFPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=vhJLQKP8Oxh0hp+mqcXH6iiueYLb0WEWLapuk8s/AiA=;
        b=fQ4Dx+3G1UI4fOGQXBN9iHq1vH+lIjx/VBocTcO0bN8zVaYmNHO5qO7OKwOuXbcBDt
         YzF0nQvOoigqr1O33vlDkc+rqFwYcS/nOo1kxtHqkiOaQK5uHovq1wMroEKaiV83eTrt
         KwX9gZcw3OTIPFohP3uMZjq2Y8tcp1Ef7cugq5n/QBxPwvDpzVGAKDfKT+7AdlajoIeK
         2NTEFQcjBFpwY3vl7psd/FLIpSAOB/NGFJfqUNC7/0lxcsV7+BJA1H7M8fbMf/ohdpkQ
         QzNo5Spkoxiym9pMami0+jp6wfBAJ5KqIxRJISyUdAGGjTz4/iqfnmO/KfSuxyyiL1dI
         iSUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bh3WDPfB;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vhJLQKP8Oxh0hp+mqcXH6iiueYLb0WEWLapuk8s/AiA=;
        b=qVe9LEJXjrnnb5OsjFqWH5Bs3nZglH2EhiPmHhkzJfYF+l0k5fSAtqXNIPzfHdqvjp
         wLnaG1H7d1aqMiu/SWfHQgFOFVg+87t3JzM923NQ25PiUNh+D9n3ghIQlhuCg8cQbITE
         Fw9BnczoCFoZi+tHaLM0V7KMXe6oH42egAz2AWIu5sDZZvTyOCne8cyIWotqjocUKoFx
         sf9cijD3lbZQjg+aUKoEsEPRLlYQFfNWbTHyFKxIjQgPy0wzUAsiOn7wXSWIfTYOigyJ
         Aifix8takRbHfkRciZpjBWBFRzfaVJSzn607bTox08COGc8axrn+aB08ZrSBhM8ayyk0
         Blbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vhJLQKP8Oxh0hp+mqcXH6iiueYLb0WEWLapuk8s/AiA=;
        b=scX1vMI31F2gk189dPHjNyKqe0ZhWDtomn/gdYU3Ms+iC/s4Onm6A8bjPA1rbeaf9k
         CSDZ8CoPdbostZITa6zyECsY1/ZzrJMP4VwK0zpCiQPDU5704dRNcR+VUMzfV2H4VAlr
         S78aPKQLixgBiGS/Snak2rnB7cu0/gdz1/yGdON6Z2rqgyEn+0rG1E1qlYziomK2DMPY
         PZ2lELRuzmO/n+VxChE+bQVfSXxMShwncw/MAspO9hOPWuVeHu66KuL7DhAVLu69Z1Tl
         6Qq7VDOMfcdyiavu2YXBnLvidrpWiG+vE3mXEXYO7QMAPZaqFjX7nTrtoOEd/7JMQRbI
         a2kg==
X-Gm-Message-State: APjAAAWyMjnf2xrsFtf/h4gJfCuBHK5dDOcE4tMvBP9GsnI+6Vz0SfW0
	aqTFvID/fqYXpY54MQ1A6SE=
X-Google-Smtp-Source: APXvYqyhtOJz8CrE/hgJWD9Q9A/RJfrjX9VZYMOkrWFpopHtE1L8ugeB0mcc/Sogyald39fxjfuVSg==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr42344160pjn.64.1578312930840;
        Mon, 06 Jan 2020 04:15:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:22e3:: with SMTP id s90ls7385359pjc.0.canary-gmail;
 Mon, 06 Jan 2020 04:15:30 -0800 (PST)
X-Received: by 2002:a17:90a:d807:: with SMTP id a7mr43866593pjv.15.1578312930222;
        Mon, 06 Jan 2020 04:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578312930; cv=none;
        d=google.com; s=arc-20160816;
        b=SFLS6e8vyuuXSHT90EbbuipTfloM5nNsHy601IO5XvLEubw/LnvVb+AJTB/pNnwmLG
         ypYlbh99HQLgJoG+o9Wr5VsWcMp7ZbkDqd8aje4+H0l2fO1ccTPxPuH5A4yCjsz2xOT1
         3xBmFgxikjYzkQo8xrtIl9TxxhwTgaHYwvtaQqZTJELf1OWo1Oo/wKE+tIEoYFAHcPWK
         JDQS4SPjjGageVDLGl7KKtWVd/x+QWXbH+Os4kTSXFVSm6lRKWXuBHGXsqIkA7bwHRMq
         pnOe6xpLRKzkzTKZ4j3wwvQbZlBWSnTRRGIUzJkY1e5gBy3HddlbOf24HMtgUnetMdTV
         crpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=kICpoHcyk/m6M0h01nU4G39dWOVkYMkxL7vaiSReS+c=;
        b=XlsNIuLzWlbN9kZtNFxUovoWqk9tf3pCuelo9PC+oth1NTVnYV8NjdAlghomIQppvR
         C7rA4wkpYZH2UFZSLiQ5n36Mzt7HrCqgALOaBASnPiD1WD08mIN5Q2ffOvd1qpF8ch1V
         U6CsJ+47bttlhIiOMnpZ3+K5tyTy7Hw+h1IUrSa8/dJD1NfEcC9jd+4vmEQRyTKIThai
         HYNqfE+xxi8Tw7GKpA6GquHMCD8o4klgwCznPBEovIMjyqinyeD5BGsTNX/R8b7k2DGd
         1T3oj4IbpKpVHVzYPq1Fl8Ch0UDhb8ksd6BAV0TrBqN2iGGzlbtflLn47lUtASpcmwQZ
         NiYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bh3WDPfB;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id a24si1937590plm.1.2020.01.06.04.15.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:15:30 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006CFTO8095814;
	Mon, 6 Jan 2020 06:15:29 -0600
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006CFTpk072866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2020 06:15:29 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 06:15:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 06:15:29 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006CFRte093429;
	Mon, 6 Jan 2020 06:15:27 -0600
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
 <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
 <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
 <f85ff658-0efc-0e15-1f7c-721cdfa3610a@ti.com>
 <71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <c6fbb714-124d-b142-0043-0c161f5d209d@ti.com>
Date: Mon, 6 Jan 2020 17:44:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de>
Content-Type: multipart/alternative;
	boundary="------------4DDEBE451A695719DC84FD66"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Bh3WDPfB;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------4DDEBE451A695719DC84FD66
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 06/01/20 5:35 pm, Jan Kiszka wrote:
> On 06.01.20 12:57, Nikhil Devshatwar wrote:
>>
>>
>> On 06/01/20 4:14 pm, Jan Kiszka wrote:
>>> On 06.01.20 11:10, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 06/01/20 2:52 pm, Jan Kiszka wrote:
>>>>> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>>>>>
>>>>>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>>>>>> notice, no? And will root cell devices keep access to inmate memory
>>>>>>> that
>>>>>>> is carved out during cell creation?
>>>>>>>
>>>>>>> Is that a hardware limitation?
>>>>>>>
>>>>>>> Looks like a blocker...
>>>>>> Yes, this is a hardware limitation. I it designed for static
>>>>>> partitioning.
>>>>>
>>>>> IOW, we can also not change the configuration by destroying and
>>>>> recreating non-root cells with different memory layouts?
>>>>>
>>>>
>>>> For now, we have gic-demo, uart-demo and linux-demo
>>>> You can interchangeably create/destroy cells in any order.
>>>
>>> I was rather referring to
>>>
>>> 1. create linux-demo with, say, 256 MB DMA-capable RAM
>>> 2. destroy linux-demo
>>> 3. edit config to use 128 MB only
>>> 4. create linux-demo with reduced RAM
>>>
>>
>> This should be fine I guess. cell_exit hook resets the PVU context for
>> that stream_id (pvu_iommu_flush_context()
>> subsequent cell_init programs everything as required.
>>
>> The limitation is on reprogramming while the context is already enabled.
>> You can disable the context and reprogram a new memory map.
>>
>> Sorry for causing confusion.
>
> OK, that sounds better.
>
>>
>>>>
>>>>>> Although, I made sure to not break memory isolatio with the=20
>>>>>> following
>>>>>> workaround:
>>>>>>
>>>>>> When booting a root cell for Jailhouse, you would typically carveout
>>>>>> memory for the
>>>>>> inmate cell. I have defined the cell configs such that, in the root
>>>>>> cell
>>>>>> config, RAM region for inmate is
>>>>>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>>>>>
>>>>>> When creating cell, root cell maps the inmate RAM loadable region,
>>>>>> here
>>>>>> that memory is not
>>>>>> mapped in IO space.
>>>>>> ---> Limitation of this is that you cannot DMA copy the images in=20
>>>>>> the
>>>>>> loadable sections,
>>>>>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>>>>>
>>>>>> When destroying the cell, Jailhouse should map the memory back to=20
>>>>>> the
>>>>>> root cell.
>>>>>> Here, again, the inmate RAM region gets ignored in IO mapping
>>>>>> because of
>>>>>> lacking flag MEM_DMA
>>>>>>
>>>>>> cell_create=C2=A0 and cell_destroy work in regression, tested=20
>>>>>> successfully.
>>>>>>
>>>>>
>>>>> Please add at least a test to the unmap function that warns when a
>>>>> config is violating the hardware constraints. It's still not clear to
>>>>> me, though, how well that goes with changing inmate cell configs.
>>>>>
>>>> Let me explain via the code
>>>>
>>>> root cell config for j721e-evm:
>>>>
>>>> 1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_s=
tart =3D 0x80000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_s=
tart =3D 0x80000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x80000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>> 2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_s=
tart =3D 0x880000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_s=
tart =3D 0x880000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x1fa00000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>> 3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem a=
nd baremetal apps */ {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_s=
tart =3D 0x89fe00000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_s=
tart =3D 0x89fe00000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x200000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>> 4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */=
 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_s=
tart =3D 0x8a0000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_s=
tart =3D 0x8a0000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>
>>>> Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2=20
>>>> gets
>>>> mapped in PVU
>>>>
>>>> inmate cell config for j721e-evm-linux-demo:
>>>>
>>>> 5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_s=
tart =3D 0x8a0000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_s=
tart =3D 0x8a0000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>
>>>>
>>>> * When enabling jailhouse:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5)=
 should be mapped in
>>>> CPU MMU and PVU
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. ro=
ot cell kernel
>>>> continues without any trouble
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memo=
ry is reserved, no driver attempts=20
>>>> DMA to
>>>> that region, no faults seen
>>>>
>>>> * When creating inmate cell:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU shoul=
d be removed from=20
>>>> root
>>>> cell stream ID and to be added in the inmate cell stream ID
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because n=
othing was ever=20
>>>> mapped
>>>>
>>>> * When loading images (SET_LOADABLE):
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be ma=
pped in the PVU map
>>>> for root cell streamID
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips =
this chunk and never
>>>> maps to root cell
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell v=
iew of inmate=20
>>>> loadable
>>>> memory, there will be faults
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU=
 copy the images)
>>>> Correct me if I am wrong here
>>>>
>>>> * When starting cell
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed =
from root cell and
>>>> added to inmate cell
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2n=
d time does=20
>>>> nothing if
>>>> the pvu_tlb_is_enabled returns true
>>>>
>>>> Nowhere, PVU unit reprograms the memory map to add or remove entires.
>>>> Because it doesn't have to do.
>>>
>>> I'm asking for a check in pvu_iommu_unmap_memory that the passed memory
>>> region does not have JAILHOUSE_MEM_DMA set. When that is the case,
>>> something went wrong because the request cannot be fulfilled on the=20
>>> PVU.
>>>
>>> However, I'm afraid that test will trigger on non-root cell destruction
>>> when that cell contained DMA-capable memory. That would mean any device
>>> that this cell owned and that is DMA-capable could continue to write=20
>>> the
>>> cell memory, possibly competing with the root cell loading new content
>>> into it. This gets rather nasty because now you need to prevent such
>>> writes be resetting all devices reliably. But Jailhouse can only do=20
>>> that
>>> for PCI devices (removing the master bit), not for random platform
>>> devices.
>>>
>> Sure, I will add the check, yes it will print while destroying inmate=20
>> cells.
>> However, as I said, the PVU context can be reset for that stream_id and
>> It will cause faults for all DMA requests on that context. No corruption
>> to root cell or broken isolation.
>
> Is the context disabled prior to the unmap calls hitting the pvu? Then
> the check could be skipped if !pvu_tlb_is_enabled, right?

I checked that, Unfortunately, all unit exit hooks are called after the=20
arch_unmap_memory
So the disable check cannot be used.
I will see if there is some way around this warning.

>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c6fbb714-124d-b142-0043-0c161f5d209d%40ti.com.

--------------4DDEBE451A695719DC84FD66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 06/01/20 5:35 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de">On 06.01.20
      12:57, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 06/01/20 4:14 pm, Jan Kiszka wrote:
        <br>
        <blockquote type=3D"cite">On 06.01.20 11:10, Nikhil Devshatwar
          wrote:
          <br>
          <blockquote type=3D"cite">
            <br>
            <br>
            On 06/01/20 2:52 pm, Jan Kiszka wrote:
            <br>
            <blockquote type=3D"cite">On 06.01.20 09:12, Nikhil Devshatwar
              wrote:
              <br>
              <blockquote type=3D"cite">
                <blockquote type=3D"cite">
                  <blockquote type=3D"cite">+{
                    <br>
                    +=C2=A0=C2=A0=C2=A0 /*
                    <br>
                    +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
                    <br>
                    +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynami=
c unmap
                    <br>
                    +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static parti=
tioning
                    <br>
                  </blockquote>
                  <br>
                  Huh!? But this breaks cell create/destroy cycles,
                  without any user
                  <br>
                  notice, no? And will root cell devices keep access to
                  inmate memory
                  <br>
                  that
                  <br>
                  is carved out during cell creation?
                  <br>
                  <br>
                  Is that a hardware limitation?
                  <br>
                  <br>
                  Looks like a blocker...
                  <br>
                </blockquote>
                Yes, this is a hardware limitation. I it designed for
                static
                <br>
                partitioning.
                <br>
              </blockquote>
              <br>
              IOW, we can also not change the configuration by
              destroying and
              <br>
              recreating non-root cells with different memory layouts?
              <br>
              <br>
            </blockquote>
            <br>
            For now, we have gic-demo, uart-demo and linux-demo
            <br>
            You can interchangeably create/destroy cells in any order.
            <br>
          </blockquote>
          <br>
          I was rather referring to
          <br>
          <br>
          1. create linux-demo with, say, 256 MB DMA-capable RAM
          <br>
          2. destroy linux-demo
          <br>
          3. edit config to use 128 MB only
          <br>
          4. create linux-demo with reduced RAM
          <br>
          <br>
        </blockquote>
        <br>
        This should be fine I guess. cell_exit hook resets the PVU
        context for
        <br>
        that stream_id (pvu_iommu_flush_context()
        <br>
        subsequent cell_init programs everything as required.
        <br>
        <br>
        The limitation is on reprogramming while the context is already
        enabled.
        <br>
        You can disable the context and reprogram a new memory map.
        <br>
        <br>
        Sorry for causing confusion.
        <br>
      </blockquote>
      <br>
      OK, that sounds better.
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <br>
            <blockquote type=3D"cite">
              <blockquote type=3D"cite">Although, I made sure to not break
                memory isolatio with the following
                <br>
                workaround:
                <br>
                <br>
                When booting a root cell for Jailhouse, you would
                typically carveout
                <br>
                memory for the
                <br>
                inmate cell. I have defined the cell configs such that,
                in the root
                <br>
                cell
                <br>
                config, RAM region for inmate is
                <br>
                NOT marked with MEM_DMA, this way it never gets mapped
                in PVU.
                <br>
                <br>
                When creating cell, root cell maps the inmate RAM
                loadable region,
                <br>
                here
                <br>
                that memory is not
                <br>
                mapped in IO space.
                <br>
                ---&gt; Limitation of this is that you cannot DMA copy
                the images in the
                <br>
                loadable sections,
                <br>
                =C2=A0=C2=A0=C2=A0 which we are not doing anyways
                <br>
                <br>
                When destroying the cell, Jailhouse should map the
                memory back to the
                <br>
                root cell.
                <br>
                Here, again, the inmate RAM region gets ignored in IO
                mapping
                <br>
                because of
                <br>
                lacking flag MEM_DMA
                <br>
                <br>
                cell_create=C2=A0 and cell_destroy work in regression, test=
ed
                successfully.
                <br>
                <br>
              </blockquote>
              <br>
              Please add at least a test to the unmap function that
              warns when a
              <br>
              config is violating the hardware constraints. It's still
              not clear to
              <br>
              me, though, how well that goes with changing inmate cell
              configs.
              <br>
              <br>
            </blockquote>
            Let me explain via the code
            <br>
            <br>
            root cell config for j721e-evm:
            <br>
            <br>
            1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.phys_start =3D 0x80000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.virt_start =3D 0x80000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.size =3D 0x80000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.flags =3D JAILHOUSE_MEM_READ |
            JAILHOUSE_MEM_WRITE |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
            <br>
            2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ =
{
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.phys_start =3D 0x880000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.virt_start =3D 0x880000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.size =3D 0x1fa00000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.flags =3D JAILHOUSE_MEM_READ |
            JAILHOUSE_MEM_WRITE |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
            <br>
            3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for iv=
shmem and baremetal apps */
            {
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.phys_start =3D 0x89fe00000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.virt_start =3D 0x89fe00000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.size =3D 0x200000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.flags =3D JAILHOUSE_MEM_READ |
            JAILHOUSE_MEM_WRITE |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE |
            JAILHOUSE_MEM_LOADABLE,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
            <br>
            4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for in=
mate */ {
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.phys_start =3D 0x8a0000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.virt_start =3D 0x8a0000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.size =3D 0x60000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.flags =3D JAILHOUSE_MEM_READ |
            JAILHOUSE_MEM_WRITE |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE |
            JAILHOUSE_MEM_LOADABLE,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
            <br>
            <br>
            Here, note that all of 1,2,34 gets mapped in CPU MMU, but
            only 1,2 gets
            <br>
            mapped in PVU
            <br>
            <br>
            inmate cell config for j721e-evm-linux-demo:
            <br>
            <br>
            5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.phys_start =3D 0x8a0000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.virt_start =3D 0x8a0000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.size =3D 0x60000000,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
.flags =3D JAILHOUSE_MEM_READ |
            JAILHOUSE_MEM_WRITE |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
            <br>
            <br>
            <br>
            * When enabling jailhouse:
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(sam=
e as 5) should be
            mapped in
            <br>
            CPU MMU and PVU
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is map=
ped. root cell
            kernel
            <br>
            continues without any trouble
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inma=
te memory is reserved, no driver
            attempts DMA to
            <br>
            that region, no faults seen
            <br>
            <br>
            * When creating inmate cell:
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PV=
U should be
            removed from root
            <br>
            cell stream ID and to be added in the inmate cell stream ID
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 be=
cause nothing was
            ever mapped
            <br>
            <br>
            * When loading images (SET_LOADABLE):
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions shoul=
d be mapped in
            the PVU map
            <br>
            for root cell streamID
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit=
 skips this chunk
            and never
            <br>
            maps to root cell
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root=
 cell view of
            inmate loadable
            <br>
            memory, there will be faults
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe=
 we CPU copy the
            images)
            <br>
            Correct me if I am wrong here
            <br>
            <br>
            * When starting cell
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be r=
emoved from root
            cell and
            <br>
            added to inmate cell
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never =
mapped
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in in=
mate 2nd time
            does nothing if
            <br>
            the pvu_tlb_is_enabled returns true
            <br>
            <br>
            Nowhere, PVU unit reprograms the memory map to add or remove
            entires.
            <br>
            Because it doesn't have to do.
            <br>
          </blockquote>
          <br>
          I'm asking for a check in pvu_iommu_unmap_memory that the
          passed memory
          <br>
          region does not have JAILHOUSE_MEM_DMA set. When that is the
          case,
          <br>
          something went wrong because the request cannot be fulfilled
          on the PVU.
          <br>
          <br>
          However, I'm afraid that test will trigger on non-root cell
          destruction
          <br>
          when that cell contained DMA-capable memory. That would mean
          any device
          <br>
          that this cell owned and that is DMA-capable could continue to
          write the
          <br>
          cell memory, possibly competing with the root cell loading new
          content
          <br>
          into it. This gets rather nasty because now you need to
          prevent such
          <br>
          writes be resetting all devices reliably. But Jailhouse can
          only do that
          <br>
          for PCI devices (removing the master bit), not for random
          platform
          <br>
          devices.
          <br>
          <br>
        </blockquote>
        Sure, I will add the check, yes it will print while destroying
        inmate cells.
        <br>
        However, as I said, the PVU context can be reset for that
        stream_id and
        <br>
        It will cause faults for all DMA requests on that context. No
        corruption
        <br>
        to root cell or broken isolation.
        <br>
      </blockquote>
      <br>
      Is the context disabled prior to the unmap calls hitting the pvu?
      Then
      <br>
      the check could be skipped if !pvu_tlb_is_enabled, right?
      <br>
    </blockquote>
    <br>
    I checked that, Unfortunately, all unit exit hooks are called after
    the arch_unmap_memory<br>
    So the disable check cannot be used.<br>
    I will see if there is some way around this warning.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de">
      <br>
      Jan
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c6fbb714-124d-b142-0043-0c161f5d209d%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/c6fbb714-124d-b142-0043-0c161f5d209d%40ti.com</a>.<br />

--------------4DDEBE451A695719DC84FD66--
