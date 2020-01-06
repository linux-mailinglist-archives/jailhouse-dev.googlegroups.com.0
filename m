Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXONZTYAKGQEJNMDRLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83313121A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:23:58 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id y7sf27152671wrm.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:23:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313438; cv=pass;
        d=google.com; s=arc-20160816;
        b=UbStlS2P0xImeL7HMaY8BEmHqcoEkv+IUzA5Jg8V49cteZOWcmxSjHBj79lPMqaTVJ
         ELzi7C2lr26NJWQQ9T25LjhnBviQYxH7QvtSLN2QSzmVEGdzLXNuqvikeyjDKYMZh45I
         Ok6n4/29HUJo9Q9W7gAyOjcU6Q/kpXWd1kL//w6A2hvDuc/3Psdo9/m/ICHnZXveWanK
         uXmBQtLY4/VppHBk+avfFhpgOgYyB6wlRe3v61vWttOIVHtw+4mj6WTFk98P4W8DZ3er
         aYTRjCr8ZUGyc9VkXNGn3ksUX9tX+cbVxyPfWXO6D7hedFwBSAcZK57zE5ZzVKxB9Mss
         trXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=165hPZeZ8ztHEDl4LAN6Iq1RhQMQ3m5BOj/FzN0Cpk4=;
        b=ayn7zxOSftUyWk0FNq2IAri2mZ+G6fJqYN5AqwSlvg+ATMJAviJFg7rAZT4Uho9uSA
         4x1uvrN2baBwL8qeBXbxs5ydaDsl5asoJDsS52/snbn12hiKL0scoH8HHHiLtzvuOR2M
         p9IB8AfgCjieD5h8VEtuhTlVHX1KQF5Hr/EK70tT1JChEtbhmPpYd8o4Nk272zfBHxPr
         MoiFwnNAaidpdMk+BbEECoHoHHTacpsitsH1Lgngm9/fWnch0yj/aim46I2tDVxRvAn5
         Y91s0XT+8PGGNVw+ddEuZbXE5KM85HSUCxnzVvUJX11UHx6eAW2dKdvqv6iSAK4lZL/a
         0lnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XCnptx4c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=165hPZeZ8ztHEDl4LAN6Iq1RhQMQ3m5BOj/FzN0Cpk4=;
        b=BUHT/aflL/KrpFAWHIjVhgBGfX0flaUYfr4FnFImax9O342f8YXXgL5jVE2tMuDV86
         cgd7gx1g4wYPxXiFM5HXQ395r9Eq99Z5rYglJrCguyTAcPZfFwZcknKlkfJ3TvvzVTo7
         V7C13RIvYEOCwrFNjwHTrqOkm95dggiHd5pIceJEYvg2M5Zal1/CPQCiwPVvw5SDPDdi
         7MkSHy7fBo6yFsGwBrlmTD/wLO2xYfjSwGZ+YkLHUeS6EoBSwytgjKqmd5UOQjlfN5rv
         mQxWJj3FuIzbhgR2bKOmxvjIn8e72W1iZ28ryM3TC23nRTG7sCUeaX4tiX6HIkUkY1sw
         zbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=165hPZeZ8ztHEDl4LAN6Iq1RhQMQ3m5BOj/FzN0Cpk4=;
        b=HldA3sCYow5kf8GZDz6grgw1SQx72sHS0RROAW+NpYJolBGhwGjZQFRslNFmJCFdsX
         1hbDm6HNHT+SSiqtxhaO4WY1gweLI88tZfI4mc4V+W+Auc3LlbWJcRNPDgNAas8+Woal
         yXdthFUooD6feu7ot1sTmmyh82CBQoPFAy3sAWQ4t6r1BQC/ePkZM74o9FXRYoICOk8G
         Eub+SKtBTpVeQPDmHlXrLMA6oUjl2F9eVnol7jOYg+7HnJxK0FzmJeCMdlVkZEVHfhc4
         xapsrdINzRY4abnm98tU+2i0QrO2n8PDyWh6F661r1r5lCsplYg5n5bwRGGTDEo0Gg8V
         6vGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUM/4izFTQGjEKmF4+mICs8Ihr8FesigHVipAZyPmrKcwYdcQBN
	Qx2YGckdVbFpAF1obRd5nIA=
X-Google-Smtp-Source: APXvYqx5QEcu4emqDcWRMhEB8i77ilU6juQcAj/OpEfeu6Htu5wyTPs8GHXw+Hf4dsTmY5CE+JK3IA==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr86409487wro.128.1578313438174;
        Mon, 06 Jan 2020 04:23:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3c43:: with SMTP id j64ls5258052wma.5.gmail; Mon, 06 Jan
 2020 04:23:57 -0800 (PST)
X-Received: by 2002:a7b:c190:: with SMTP id y16mr34783904wmi.107.1578313437547;
        Mon, 06 Jan 2020 04:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313437; cv=none;
        d=google.com; s=arc-20160816;
        b=uIt+MDrAwgc4/Bq3/IV3aP9s7DvqdoOLlCcNyqhECbg5tXEme8NyC13bkSOodEmDGF
         24xR75WQf0vQUnzo5LYwYpu4H4DSeP2xZHr+9tuZV0HqJoZyPPMSmhhSL9e/f1/gJpZq
         3/x3o6ceQSHLE5O9K7RhwXITzy2d7gpgXr/AF5XbnFEvVKqcThU5IoPINYCj46gSlepF
         WkBhH4QJYjl/buwzwDlsax/7Ls0MFckHa87Y7G8kwBUyH1oEc/r+HjksSFwto0oAkCZM
         07dpER32SOZA2+xY59ls35ls8uZE9Q04e4HcAJke1fOXHtX5B6dW4NRxO3lwuQX9Gakc
         6GwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=QWRc/Q5dhGRtyvTNxLN/qM4ZZe5JxEC5bFv9C0uDya8=;
        b=HWdRFfAijGWapuS+dpMU4tZBHY4sGviJ8QQEL3ZvLsL+hmnq1C1/okpQDB5jagp4yg
         HtRMHrTsfK32IxUmC9Ad7yEXlDCoLBf5Kti+jMxHBHfN23TAol3KFHyGYMxBmTYDPJiJ
         00nniyDTQyJ3mIvVJ9MP2OeNHwUa/Edoq6PuUYF+STeeFpTq7s9aE3Va0ZG7sFy8QwrA
         6RbINoB/72t33mclhuGBEjdmNLvEXO4P/Ul4E1LpWbjAphOEh3pPXnvfOtnr3p0PO9m8
         q81+X3Cyj1dS1Oawv4/rU3fqApVEc4RuztqmSfvU1j38sBkn7b6oW7gz1ahtUOSed973
         rJgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=XCnptx4c;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id u9si2275458wri.3.2020.01.06.04.23.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lba5z-1jXvKJ3sWh-00lHCX; Mon, 06
 Jan 2020 13:23:57 +0100
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
 <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
 <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
 <f85ff658-0efc-0e15-1f7c-721cdfa3610a@ti.com>
 <71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de>
 <c6fbb714-124d-b142-0043-0c161f5d209d@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <323c6a6d-2481-967b-01f3-8ce24f016aa5@web.de>
Date: Mon, 6 Jan 2020 13:23:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c6fbb714-124d-b142-0043-0c161f5d209d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5gm/S4l+gieLoIkHwBR7/G9rVLB1/W7YBUUUGXKMMFgMb/AC3ZA
 plqZU30yk8Ma9/QxCAU2MdbprcwqkyTeQ3mjiimMKb3A/VpNq9Ur0KHbmWUJOw7vmWxzQME
 DaPo4r1lZ8z5N7U9OyGN4u8+5khE7JP2GY2UhYSUQaTNIKtX52v7d+ArtszvcuYMbt2g5Nk
 qNbYD+TxH9a3kHz23xSzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vSIkaNiPEnE=:LvnezN5VYxks7Eauph4319
 H25YsWxHqhjz8P7tcLDapvyQ+0fDPB+eqRnOaTdT2cyhzyjtrdfH8X/etznpm87vLZfXmDn6Y
 8NADu8vJEJsN6BI0YzLVVyY9I0Kfm6PFVW80uWazXD3AD1LpGXvN+k7RO2k93WRoOdj7tGW9l
 BAhs1RzlAYvlh7yrT8xxkhkcIQjLu82WmlA0nU06CnI44hhM4e5A5FdC8exv/EAN/1vrwepBW
 /WcsQgbp9MLfVAO1vRezCL4QMyLQcbJhM2EhxFBp3jqeeN3z3s+MF9iMGMLxLUv51sYFQ8DM0
 5PkERlTkaniwTVH+MMgiukluBkrP71zarIopRwmeJpybiMPRATjkFx3MwUwx81BmQEa1NvYx8
 ejVcPlL9cwF93PBTCG2WgiZvD+fWbeEKsxZtkPoCcLX3QEcG9S71Ymyfhr7SY3TZbim2R0Pj/
 KLZNmJac+6EmNJNPyiqDpbj0/V0d0w99zqjy7qHhAku12+r25kPAPyOx5arNmdI5QrdwQ1WMy
 37OW+6acGKLnd4gGMndgapzyPbkfyEj6D2t4YWI7Lq3u/czt6TwKK/a43N10ySbaCceJlxCiz
 bCGSdX8sPHItqIYLyP1aN7n4d7z0B5kdgYA77ZRt+JSeu6RtKP0De2V0AgB3NEr7uP42RUx8c
 08lp/ZIaiiAaaN3SB4m/bMXQyJ2WkqoIYJleCX8E1Zj3WUYXaBjf2FZd11Eog5vB7jMnFtl9N
 DCRdekrnRnoLoDA5OkWxCys5sDBmnnqyitEKIfaz1ldximPqLbLmcIYsRy0DLcDuA4gq74UO+
 v5BsQCF+wOZDspKcGqdkrW2RjkcbeWDCgVfm3W3GIW/dKbsJCHqcO5JucZYU/GxKHyGffZeX2
 vOsxlU7D9t4eClqL4Csp1dEwD3QCjG9sh1u68uZE1QaasNMNoiEhfhoqP2dxQbRTtVBvLlsM4
 D2Z6I+IFQpp0bSr9YCbtCaCW4ijcEliopp0ZQFVSnydqZqNLLJ6gfptcNjXfr+G/Glgt6HD4Z
 2twpbQp4ybCdwujzGhnPqe9Q9D4vugwsMnw+R2an5QuipPSUVejrP7s3Vrm0FgW5sGUWEpwz9
 1xJ1G2mwo5gGHGcZgZd5gf55cd544iiGu/DUcUFDlhnzHQqP3l/A/vrQeb6MQn7smlAsyBMXF
 uOsgE+wfAI2Kah6HTMloev06hXzfMhWPIgVomfdq7jTU/jaZ7hSf4sfWnQCJUNpPq9BLcf7EI
 Hm0wMH/i/bmEXVtU8/r6lP+meWg8F7+Sm5x7ckQ627KLHMMxvptuTiLDcsF4=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=XCnptx4c;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 06.01.20 13:14, Nikhil Devshatwar wrote:
>
>
> On 06/01/20 5:35 pm, Jan Kiszka wrote:
>> On 06.01.20 12:57, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 06/01/20 4:14 pm, Jan Kiszka wrote:
>>>> On 06.01.20 11:10, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 06/01/20 2:52 pm, Jan Kiszka wrote:
>>>>>> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>>>>>>> +{
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>>>>>>
>>>>>>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>>>>>>> notice, no? And will root cell devices keep access to inmate memor=
y
>>>>>>>> that
>>>>>>>> is carved out during cell creation?
>>>>>>>>
>>>>>>>> Is that a hardware limitation?
>>>>>>>>
>>>>>>>> Looks like a blocker...
>>>>>>> Yes, this is a hardware limitation. I it designed for static
>>>>>>> partitioning.
>>>>>>
>>>>>> IOW, we can also not change the configuration by destroying and
>>>>>> recreating non-root cells with different memory layouts?
>>>>>>
>>>>>
>>>>> For now, we have gic-demo, uart-demo and linux-demo
>>>>> You can interchangeably create/destroy cells in any order.
>>>>
>>>> I was rather referring to
>>>>
>>>> 1. create linux-demo with, say, 256 MB DMA-capable RAM
>>>> 2. destroy linux-demo
>>>> 3. edit config to use 128 MB only
>>>> 4. create linux-demo with reduced RAM
>>>>
>>>
>>> This should be fine I guess. cell_exit hook resets the PVU context for
>>> that stream_id (pvu_iommu_flush_context()
>>> subsequent cell_init programs everything as required.
>>>
>>> The limitation is on reprogramming while the context is already enabled=
.
>>> You can disable the context and reprogram a new memory map.
>>>
>>> Sorry for causing confusion.
>>
>> OK, that sounds better.
>>
>>>
>>>>>
>>>>>>> Although, I made sure to not break memory isolatio with the
>>>>>>> following
>>>>>>> workaround:
>>>>>>>
>>>>>>> When booting a root cell for Jailhouse, you would typically carveou=
t
>>>>>>> memory for the
>>>>>>> inmate cell. I have defined the cell configs such that, in the root
>>>>>>> cell
>>>>>>> config, RAM region for inmate is
>>>>>>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>>>>>>
>>>>>>> When creating cell, root cell maps the inmate RAM loadable region,
>>>>>>> here
>>>>>>> that memory is not
>>>>>>> mapped in IO space.
>>>>>>> ---> Limitation of this is that you cannot DMA copy the images in
>>>>>>> the
>>>>>>> loadable sections,
>>>>>>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>>>>>>
>>>>>>> When destroying the cell, Jailhouse should map the memory back to
>>>>>>> the
>>>>>>> root cell.
>>>>>>> Here, again, the inmate RAM region gets ignored in IO mapping
>>>>>>> because of
>>>>>>> lacking flag MEM_DMA
>>>>>>>
>>>>>>> cell_create=C2=A0 and cell_destroy work in regression, tested
>>>>>>> successfully.
>>>>>>>
>>>>>>
>>>>>> Please add at least a test to the unmap function that warns when a
>>>>>> config is violating the hardware constraints. It's still not clear t=
o
>>>>>> me, though, how well that goes with changing inmate cell configs.
>>>>>>
>>>>> Let me explain via the code
>>>>>
>>>>> root cell config for j721e-evm:
>>>>>
>>>>> 1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x80000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x80000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x80000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>> 2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x880000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x880000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x1fa00000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>> 3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem =
and baremetal apps */ {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x89fe00000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x89fe00000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x200000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>> 4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate *=
/ {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x8a0000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x8a0000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>>
>>>>> Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2
>>>>> gets
>>>>> mapped in PVU
>>>>>
>>>>> inmate cell config for j721e-evm-linux-demo:
>>>>>
>>>>> 5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_=
start =3D 0x8a0000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_=
start =3D 0x8a0000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>>>
>>>>>
>>>>> * When enabling jailhouse:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5=
) should be mapped in
>>>>> CPU MMU and PVU
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. r=
oot cell kernel
>>>>> continues without any trouble
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate mem=
ory is reserved, no driver attempts
>>>>> DMA to
>>>>> that region, no faults seen
>>>>>
>>>>> * When creating inmate cell:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU shou=
ld be removed from
>>>>> root
>>>>> cell stream ID and to be added in the inmate cell stream ID
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because =
nothing was ever
>>>>> mapped
>>>>>
>>>>> * When loading images (SET_LOADABLE):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be m=
apped in the PVU map
>>>>> for root cell streamID
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips=
 this chunk and never
>>>>> maps to root cell
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell =
view of inmate
>>>>> loadable
>>>>> memory, there will be faults
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CP=
U copy the images)
>>>>> Correct me if I am wrong here
>>>>>
>>>>> * When starting cell
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed=
 from root cell and
>>>>> added to inmate cell
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2=
nd time does
>>>>> nothing if
>>>>> the pvu_tlb_is_enabled returns true
>>>>>
>>>>> Nowhere, PVU unit reprograms the memory map to add or remove entires.
>>>>> Because it doesn't have to do.
>>>>
>>>> I'm asking for a check in pvu_iommu_unmap_memory that the passed memor=
y
>>>> region does not have JAILHOUSE_MEM_DMA set. When that is the case,
>>>> something went wrong because the request cannot be fulfilled on the
>>>> PVU.
>>>>
>>>> However, I'm afraid that test will trigger on non-root cell destructio=
n
>>>> when that cell contained DMA-capable memory. That would mean any devic=
e
>>>> that this cell owned and that is DMA-capable could continue to write
>>>> the
>>>> cell memory, possibly competing with the root cell loading new content
>>>> into it. This gets rather nasty because now you need to prevent such
>>>> writes be resetting all devices reliably. But Jailhouse can only do
>>>> that
>>>> for PCI devices (removing the master bit), not for random platform
>>>> devices.
>>>>
>>> Sure, I will add the check, yes it will print while destroying inmate
>>> cells.
>>> However, as I said, the PVU context can be reset for that stream_id and
>>> It will cause faults for all DMA requests on that context. No corruptio=
n
>>> to root cell or broken isolation.
>>
>> Is the context disabled prior to the unmap calls hitting the pvu? Then
>> the check could be skipped if !pvu_tlb_is_enabled, right?
>
> I checked that, Unfortunately, all unit exit hooks are called after the
> arch_unmap_memory
> So the disable check cannot be used.
> I will see if there is some way around this warning.

Otherwise, make it depend on cell =3D=3D root_cell, with the reasoning that
cell_exit will disable the mapping.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/323c6a6d-2481-967b-01f3-8ce24f016aa5%40web.de.
