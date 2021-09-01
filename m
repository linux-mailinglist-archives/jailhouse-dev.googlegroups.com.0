Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFV5XWEQMGQEXN3MKGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E83FD868
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Sep 2021 13:05:59 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id g3-20020a1c2003000000b002e751c4f439sf2649830wmg.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Sep 2021 04:05:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630494359; cv=pass;
        d=google.com; s=arc-20160816;
        b=zdWq4vsCcED6gdXOG6SLjrFVzi2zFerzQGEFsLFFnarNdXZvVjNCR7IQljXuHslq0O
         83cyHmm/6QNeEcHhqsU4WOpkT/hHUK0zPju6OJs6GWaS4zJ/DeA4XVe8x2NT4Ayblhzq
         NH2zvoKCR/uQNM2sN+5JouACD6XyETXqjyuW4Cr5JZPdWYVM+zuWc1DTRDvHw4cuP9Ux
         at867mvxXAT3GA3HLSYQSgg5sW0jtn1Kso7Tseye2gKnqhgz7x26g4mbf+UGxurcjd8E
         mvgHVZH0ZQyiO5dY0vcNbAG9JPscHhk65ajJC/yuQRuwaApMCV44BCsd0+16RaiWKrv7
         /SoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=9QfV57ypOzFFOw0DXbK+f7OPT6Ouw0nkNn8trmIDm2Y=;
        b=gTgVQ7SRp4nNL5u1+fUT76clemZFARDLXgMd+vcI2PYwIFkBV2vqp6j9/IXzlRmdmH
         O7i/5xJpSx42Lx3KxXyZlkxtQKm/kmCtsoKrq4LkgCLojAY5SCrq32q7aEvEestHLSYC
         xM1RMV3RUyHeLrVufhuoGkNAdQtNB10cjPEN0HefTpyras4bdt9g3ok2RaHJTLbDpg0d
         lBZP1PKaQ6oEErvvqjAdlbPVM8AidUjAWCmJYCS3A6h5GjM5iH0lE+KuIcANjtKrR/zU
         rvnGeoCZWiGdj+yewlOKq56TOTJxN/snEKwEJTUZvZN6iXV4d2z5dpVV0y2q+gOXwzN3
         pjqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9QfV57ypOzFFOw0DXbK+f7OPT6Ouw0nkNn8trmIDm2Y=;
        b=n7aAYVP4B3k3ri85+j+OcqkyMhnWMeiLLhs3nh3j0zwFSPnVJGmBgqf4+4l66QOrM1
         2dJfz80788cAQ0EOMmf0u2z32qa8nMrdcOrMC58kT6FaqqsONcSE1G04G6v/7Ip672sS
         jHZ9LS7EfZKg6F5S0/heATQOAE7FYzqnj7NrCIgO91uhE/SCURkEEuS+LMEp2hHgtd7Z
         c2eetERqIi5H6b85N8YwWuMtEaWF5sgNTCflQE0yWD4byCHb563vuEeVNwTTaWU/V4dB
         BYMxAiiZ5bgIYfr6PlM/GjNkMiI2bol3AgLSo2tR3X5rTA6ZyULnyqzxHXUNF+2s+AFh
         deuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9QfV57ypOzFFOw0DXbK+f7OPT6Ouw0nkNn8trmIDm2Y=;
        b=l/MQ06bB8EyyKUPQFXTQ/Cb/9It6ErT72T4aktbVl96+uZbcJT3/mAOYIR1SfsYqro
         m4MiGVp0g1mKn6uKv9X32MChsPWxR7eK/5/6E5BWmTOAIJOZss0Tvx1XeNQZ39aIVZh7
         OiiJUyiQDFFI0/g3HS8mFl5A5Ueq7tBLP2BkARQRbz22QHz6Q0oVqOlr1TIedO8Pcs2M
         BwhZRkknN9k6sPkpChOURAUtpyVhUcqs8VHFKVSHZ5qffvwI5kw24Kwd7pbEvrVZNl9Z
         s0pjt2x3Hxv4fb402alYgmPx+OeAGo+jxqAC8miczsh7O1clr8wonP3Phj/C/+5WoYBc
         uNQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rJBf2QunKT4jm6Hgxij3SF8JgGC27epHwn+qa4oRFz28w1e8T
	cUl5OHi/aa45yg+lx3KzwMY=
X-Google-Smtp-Source: ABdhPJxQqUif8a/dMij7Ex5VUziwevO3lFvgK4jLKw66y4Goh0QF2g9vWRt76kRq+fVASEIvpqGw/A==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr9183297wmj.78.1630494359061;
        Wed, 01 Sep 2021 04:05:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ef0d:: with SMTP id e13ls2608886wro.3.gmail; Wed, 01 Sep
 2021 04:05:58 -0700 (PDT)
X-Received: by 2002:adf:b745:: with SMTP id n5mr38002218wre.338.1630494357946;
        Wed, 01 Sep 2021 04:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630494357; cv=none;
        d=google.com; s=arc-20160816;
        b=YTCKYDrfoJPaJWLzCNB2lfVSL/P3saQ+Cum5s9OFXffAdVkHL4BTMR2wm9s9IKkDZ9
         KXalwDqGjHYI4KVOj5lZToCHt78MoocmpxqYyIFMbho7pamOFvh/cnejeV0bGBwViqj+
         Ku0G+5MtKc2UwvJSLgsmpjJU9PtnDdbttsssfXNanvh23Jrc7EjHSJC2PDW+hwQ+YCYt
         QVSnQpFYfLGEd8TXKwescIslMOpphX2RJ0/TTutzo0BBB2y48k5ytwO+qprjbAEicbW6
         12a1yT3D0qaZWBr3KvR+s08VYTuA0GXyIz+M5ZeqrwApGECJWLPc+kI4jbkoFsBabvE3
         vPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=fxtOqIe6Chmqo+f2720V5gLskWiv/nwcvzSYD5UEdX4=;
        b=K7rbcJimIeCRdI+SJ8aaCIVurixtbGDZJl7MRlFxLK5YwAohIoTxXPjvjtQMc5j8mx
         Q14mzwcqFKw9aKwQK3qRXSyh35/+E63QvKQIrf5dMfq1auEnF8vgq4PqeCnHNUePhHxK
         nAw9HfKFsOqgqF8a6/AxSDK2TeYX6cFD2BagYsNZxls7SpbxxKsYi+oPjZf8qfNHK/9V
         JcWGM5g9Ci+cC1WynWbspAJnV+ALDGZfE5ChrW2Ny1Bm7Y/uROJcSpDSypi7qoGmbs6r
         vQMqQpACDmRrDu0oF2DYvWBJ/2PpZsthSB8JJpHhIOlKNYSd+V4ED7Fk+1dwioiqTIda
         S6Tg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a1si1027840wrp.1.2021.09.01.04.05.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 04:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 181B5vVb013011
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Sep 2021 13:05:57 +0200
Received: from [167.87.73.68] ([167.87.73.68])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 181B5uLc025302;
	Wed, 1 Sep 2021 13:05:56 +0200
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
 <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
 <HE1PR0402MB337106827ECC0CE4ED356C1784CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <2b88eb53-8258-2d0b-d0d1-71c24bf372cb@siemens.com>
 <HE1PR0402MB33713AC7844D1B67AC8B67F384CD9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ab9e7f4c-c52a-4c4f-ee77-c8148763184a@siemens.com>
Date: Wed, 1 Sep 2021 13:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB33713AC7844D1B67AC8B67F384CD9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 01.09.21 05:47, Z.Q. Hou wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 21:14
>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addr=
ess
>> and size
>>
>> On 31.08.21 10:48, Z.Q. Hou wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 15:11
>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>> jailhouse-dev@googlegroups.com
>>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>> address and size
>>>>
>>>> On 31.08.21 08:55, Z.Q. Hou wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>>>> jailhouse-dev@googlegroups.com
>>>>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>>>> address and size
>>>>>>
>>>>>> On 30.08.21 12:54, Z.Q. Hou wrote:
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
>>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>>>>>> jailhouse-dev@googlegroups.com
>>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
>>>>>>>> access address and size
>>>>>>>>
>>>>>>>> On 30.08.21 05:02, Z.Q. Hou wrote:
>>>>>>>>> Hi Jan,
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
>>>>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>>>>>> jailhouse-dev@googlegroups.com
>>>>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
>>>>>>>>>> access address and size
>>>>>>>>>>
>>>>>>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
>>>>>>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>>>>>>>>>
>>>>>>>>>>> In function restrict_bitmask_access(), the current access_mask
>>>>>>>>>>> is implicitly assuming that it always access the whole
>>>>>>>>>>> register, but some registers are byte-accessible, the Guest
>>>>>>>>>>> may get/set wrong value when it issue a byte or halfword
>>>>>>>>>>> access to these
>>>> registers.
>>>>>>>>>>
>>>>>>>>>> Can you be more specific in the affected scenarios? At least
>>>>>>>>>> one example would be good.
>>>>>>>>>
>>>>>>>>> Let take GICD_IPRIORITYR as an example, which is a
>>>>>>>>> byte-accessible
>>>>>> register.
>>>>>>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and
>>>>>>>>> Guest wants to set
>>>>>>>> the priority of 33 by byte-accessing.
>>>>>>>>>
>>>>>>>>> Assuming:
>>>>>>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
>>>>>>>>>
>>>>>>>>> Then the current logic like:
>>>>>>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read
>>>>>>>>> back value is
>>>>>>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
>>>>>>>> 0x00, then finally 0x00 will be written back.
>>>>>>>>>
>>>>>>>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff
>>>>>>>>> =3D 0xff, so finally
>>>>>>>> the 0xa0 will be written back.
>>>>>>>>>
>>>>>>>>
>>>>>>>> OK, indeed a good point. We missed the byte-accessability of
>>>>>> GICD_IPRIORITYR.
>>>>>>>>
>>>>>>>> But this reveals more: We perform a read-modify-write cycle on
>>>>>>>> behalf of the cell with the cell's idea of access width. That is
>>>>>>>> potentially
>>>> unsafe.
>>>>>>>
>>>>>>> Can you help understand why there is still potential unsafe with
>>>>>>> this fix
>>>>>> patch?
>>>>>>>
>>>>>>
>>>>>> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses
>>>>>> for that register. The problem is with other registers that do not
>>>>>> support byte accesses.
>>>>>
>>>>> Don't worry, according to the programmer guide the Guest code must
>>>>> not
>>>> access those registers with Byte-width; even if there is someone do
>>>> that by mistake, it will trigger an exception before the access is tra=
pped
>> to EL2.
>>>>>
>>>>
>>>> I do worry: We trap the access to EL2 because the memory region is
>>>> not backed by memory in the first stage translation. And then EL2
>>>> will issue that request and panic.
>>>
>>> You're correct, I did some experiments, the byte-width access to
>> non-byte-accessible register is also trapped to EL2.
>>> But what I'm not understanding is the byte-width write access finally
>> trigger a SError (ESR_EL1: 0xbf000002) to the Guest instead of a excepti=
on
>> to EL2, and the Jailhouse does not crash. Do you know the reason of the
>> result?
>>>
>>
>> No, not really. I'm architecturally not fluent in that details, and in t=
hat state I
>> would have expected a crash at EL2 as well. Maybe someone else is listen=
ing
>> with more detailed knowledge. Or we are in an implementation-specific
>> behavior region here, and your mileage can vary from SoC to SoC.
>=20
> I did the experiments on imx8mp with A53 cores and GIC-500, and looked in=
to the TRM of GIC-500, it says: " Byte or halfword accesses to registers th=
at do not permit those access sizes are not successful and return a SLVERR =
response." According to A53 TRM, the SLVERR is consistent with experimental=
 results ESR 0xbf000002.
>=20
> The last point I'm wondering is, the actual access instruction is issued =
from EL2, but finally this SError is taken to EL1? This doesn't adhere to t=
he armv8 exception model that an exception can never be taken to a lower EL=
. How to explain this?
> I did one more experiment that in restrict_bitmask_access() check the acc=
ess size, doesn't perform the access if it's not word-width. The result is =
the byte-access to the not permitted registers doesn't cause SError, so it =
confirms that the SError is indeed caused by the EL2 access instruction.
>=20

Hmm, maybe try that with a different silicon as well? Or, to be vendor
neutral, see what happens inside QEMU. Image available via jailhouse-images=
.

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
jailhouse-dev/ab9e7f4c-c52a-4c4f-ee77-c8148763184a%40siemens.com.
