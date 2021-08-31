Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA5MW6EQMGQEK2QDQLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFCE3FC317
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 09:11:00 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id m16-20020a7bca50000000b002ee5287d4bfsf968474wml.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 00:11:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630393860; cv=pass;
        d=google.com; s=arc-20160816;
        b=gHqjKps/jq7enhJT+78DfTxdNlBgBflSbBRimqDKRdo27cc9z1+WkUkpUFqqm3bKF5
         ZUfcF3rMwohg/ycXLR+mqwaa1m9QfO///c/4NhatX3pJpg+U3prhxX2+ufGmZsm/J4uH
         sXELHpeihewxzx9knM05pRsBu+4mPnR/LZlB9T77DIofOZ1iCpfwLM1SoR1Xuw2NGonG
         +W8BLw/RHJLAPTMwyH/zeygjsgklyTIAOD1NeFnwz+lF+aNeUQsglvPLje8bRSQNmau+
         BwkicOlfJc1Q2HVhQeYEeAS6Mn2pfRp+NCicstNM9ww/oNR1nagpHm5zaaMAhnMiA689
         cOxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=FFiqzZ8rb0tHcoumkn8JGZuE+2CsmVi3TiqGZV0XCOE=;
        b=ArMSEgWYngKyQDS/RveG1VlO+YFJTfI1lWpEfc5+h5MBSGNxqAjjKf+kYoU0nTKXk5
         7R5QrR4bIY992vuUXmb26W/WqP1KJnCI708Z9YSJq5OC/97sKbd5Vf+35gfxLL9xXZdL
         Z4yzrz1oOPSibFL0PvOfKISoHJ9IWZOMymFsVsLn08ZGByn4HQIYZLSirLdP8gEMx1Nv
         ycnAh3WlYlOCCUpPPkOf8lgDYs6E5ANgQKDyeHCx4R5fe/SMHGiyznrzOdJUAPDqwSjZ
         a8Gp8rLzl3KaRv7KVbzlc/NxPZ2k+21XKYMrFeHleTaQMVFiFn85wuvft0CFUvqqeVAO
         EX/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FFiqzZ8rb0tHcoumkn8JGZuE+2CsmVi3TiqGZV0XCOE=;
        b=nmGU0PhsBIt/lRwhwB63SkkALAkbLpSgJ+ylzet9Ya3GifHyji2MMahRS8dZwjUrA1
         qP8ttGNp2CkvGG7me/XtnswCsWggQqhs/zbgTv6199urAK4E78xRb6q2xxMtUQijv7hi
         +jHyitjEm+4lPtAOCQW2yu8JHlyw1Rqlg6aUKOIViX9VoVdPEl07qGiOxE62vqeLHWoy
         /qmpS3LtgYvJWJSIrQjJVzfvWAhmrO0qgqheB0UTSwPCJU5EtE6GElpGc61eQWZEwgXG
         didi1LU/4w7QtDGa8mO3NeuE+/Y0T2dQQo0iELG9ToTlVYMWb43ad3KVZiQa6hhl8hKQ
         9wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FFiqzZ8rb0tHcoumkn8JGZuE+2CsmVi3TiqGZV0XCOE=;
        b=eVHvdASMlm/yEKciOvnB6th/xZJ4+aEKmyaS3C2TkBWy8SN1azwMDQ2T1oz2Yc6f41
         JzYv93ET1RdA7ZHA4sxPhzFAFSIdnMrB/Tk9vWnkhjdvLXcjnOG2h9j3YfmHLNQn7nXs
         qud1uttTzbAbQ85EoKcbVBFIJHzoLQjOX7+fDqfwc9uxxCZ1H+Rb/n/6sLjEzEnYXH3j
         9YfV7xwTZmoXY6KQejmauBc0roAB7lZzE5+aSQXq5B4jZUdVw1s6VTBKoNtsDQfQVo9r
         NRi0JWYgntvic4a4BhuM93vt1lKVHSDx75JMinYbok17GPZihp0wSgNErPDEXwYqaZNV
         npxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533HK32/uUpCn3kBGo0vOaK6zPN3ZdONtpArBbd23elqWF56guuW
	Y8b3rKe5hufSQ6OFwvuyGIk=
X-Google-Smtp-Source: ABdhPJyvIf+THh7ZyHsEVoxO7/Xbs4dd6+JdNGDc3lBP5mTZHy1hvXtPgGoccCK35ed9oXQB4bx8qQ==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr2594565wmi.155.1630393860066;
        Tue, 31 Aug 2021 00:11:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b84:: with SMTP id o4ls174846wra.0.gmail; Tue, 31 Aug
 2021 00:10:59 -0700 (PDT)
X-Received: by 2002:adf:f50a:: with SMTP id q10mr29375307wro.271.1630393859054;
        Tue, 31 Aug 2021 00:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630393859; cv=none;
        d=google.com; s=arc-20160816;
        b=MQp/2p+DOWnbOAcOFe2eEnATVskVztNrxuLiHf94/3Re4Wvth1SgBoBTH30OqM6PxC
         CvONJHFjKXY2Rtx1Zzmcbi17qtsIidmRCfT4NEqYEcXf71KggCohFOZZXkBlJ9F8LhnH
         vbKAR/9ywHSWtHgTclTjgU7kCkFZGL23mFkGQVhsXqGc6vkjuxhSFKH3SIM2yhQqB9sG
         EOTJLr07w5sFeNtlafHprHhUzsNe+mOPwrDvDfNeSI/OfwYh+Z+z9por5yPzHJIsYdrv
         0hAKP/BBZsNxaD3FMjgKTPwSJFBEWPX4fOHrMZseC+l6Q9UUoBZegB7n7BRoU7OrfA9m
         6YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ywCOCB1ZCu0rkYtht8BaTgTkDrU+jjs04EpW9vDjaCs=;
        b=Qf89BAKwhAFT/o9ZMnZ/5AffWAVQXYkkvnBdKRAyLZf2rN5xnPZ8+YFeWGCZJQ1ati
         8KYPW6uIQFE07IgI3qQVYL6j1uh5JXk8sLFtC+0vHYj+COfwy1I9nE0A7FCqJbk62Pv4
         +z3+0ZNnxPi/zYiL0RcRms9N45FKSEA+d2p+SLZpy/JRczMhZ0TrId5FpSDBbx2zXoIq
         BFvEqEFyhFiMo6zfMB8bmX8gFPgCgX6Ql+O7Dez4Plmq4ytYW3sY+8aiRaDWz75W82Nn
         ngQDumEh3sWX+7RXOdx+chjFaD0UdYZhN2dhzbroKzwTA6L7PKIKYwAIZrXjKf62zDiR
         wPSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q137si99964wme.1.2021.08.31.00.10.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 00:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17V7AwHe014037
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Aug 2021 09:10:58 +0200
Received: from [139.22.37.21] ([139.22.37.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17V7AvTK011552;
	Tue, 31 Aug 2021 09:10:58 +0200
Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
To: "Z.Q. Hou" <zhiqiang.hou@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
 <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
 <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
Date: Tue, 31 Aug 2021 09:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 31.08.21 08:55, Z.Q. Hou wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addr=
ess
>> and size
>>
>> On 30.08.21 12:54, Z.Q. Hou wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>> jailhouse-dev@googlegroups.com
>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>> address and size
>>>>
>>>> On 30.08.21 05:02, Z.Q. Hou wrote:
>>>>> Hi Jan,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>> jailhouse-dev@googlegroups.com
>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>>>> address and size
>>>>>>
>>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
>>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>>>>>
>>>>>>> In function restrict_bitmask_access(), the current access_mask is
>>>>>>> implicitly assuming that it always access the whole register, but
>>>>>>> some registers are byte-accessible, the Guest may get/set wrong
>>>>>>> value when it issue a byte or halfword access to these registers.
>>>>>>
>>>>>> Can you be more specific in the affected scenarios? At least one
>>>>>> example would be good.
>>>>>
>>>>> Let take GICD_IPRIORITYR as an example, which is a byte-accessible
>> register.
>>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest
>>>>> wants to set
>>>> the priority of 33 by byte-accessing.
>>>>>
>>>>> Assuming:
>>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
>>>>>
>>>>> Then the current logic like:
>>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back
>>>>> value is
>>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
>>>> 0x00, then finally 0x00 will be written back.
>>>>>
>>>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D
>>>>> 0xff, so finally
>>>> the 0xa0 will be written back.
>>>>>
>>>>
>>>> OK, indeed a good point. We missed the byte-accessability of
>> GICD_IPRIORITYR.
>>>>
>>>> But this reveals more: We perform a read-modify-write cycle on behalf
>>>> of the cell with the cell's idea of access width. That is potentially =
unsafe.
>>>
>>> Can you help understand why there is still potential unsafe with this f=
ix
>> patch?
>>>
>>
>> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses for =
that
>> register. The problem is with other registers that do not support byte
>> accesses.
>=20
> Don't worry, according to the programmer guide the Guest code must not ac=
cess those registers with Byte-width; even if there is someone do that by m=
istake, it will trigger an exception before the access is trapped to EL2.
>=20

I do worry: We trap the access to EL2 because the memory region is not
backed by memory in the first stage translation. And then EL2 will issue
that request and panic.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4d107c19-ba44-c5db-9452-1552e0b66c93%40siemens.com.
