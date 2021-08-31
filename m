Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD6WXCEQMGQELLCMBZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8743FC7F4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 15:13:52 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id r4-20020a1c4404000000b002e728beb9fbsf1228108wma.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 06:13:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630415632; cv=pass;
        d=google.com; s=arc-20160816;
        b=q7eRQRA7se1xS+wP/2l2+iMyUWdoOutFt+W3SD4N53FtslFJgUPmBdRkKtQHUB5veC
         WElh4tj0BRLOJ/43V79Sh7ydLTb0p0QXPQJf5Liso5CG3DE8iDy+IDKMwMWvlRslwEhV
         XzyfJ8IymyiHfnmEF9YldE0kVR41ljpU78XBZD7arz/lSQbvUfqeiNNpdI9G6PToplLi
         czUVxQNTfPSW906zToPceAmmS73F7DOMmupHYmWbcxqHA3X+vKHz6dWvxwm5CkDx2Gpm
         HTHuSWj/N72RnWZNJn8aeJ1EDjNNGn5Xf4WkRn0iASuLADvIKM8vtGCqvnpOSlOHYkSE
         OImQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=JsReMJmhoZXTzfez0TptRz7E3a6OyZBAm/NsHtCcJwA=;
        b=UbmA3vmkqfP3vJHvyZyP5s7bdvw3u6mnO0iGM+J9ikk6FDQu24e1R7bnePnpZTLo6D
         FPBgXFdEj9XKXIbsu6yCMpQlMAO47u3piWbtBj3oSX3pEFoYwlXTkwLMZhK+5SxwzNWy
         08DeGU/cDXqx547g2LiemBryyr4TRq6wpE5x4Rq5cpMXzHqLYNeHdugVNJAOQPTO4304
         YAeqmhCbaDEOusgjD4FILME5BkRnbCcDu3gy7q7dh6D0nr6zX3lts3og59wJWle4ZrhV
         uCa29yVu4lmUf4kGMIinRf5AHfa6Jmw3AAjvu5megN3flCf/hzFj24pNBblnvwHBvJsq
         /51g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JsReMJmhoZXTzfez0TptRz7E3a6OyZBAm/NsHtCcJwA=;
        b=V0IG9cqToifj1QtlQ35AWJt8OixhkHAqYEkfK2pRFTez2bUO4Q1Xiy+SoZvocfdDK+
         WolCrtityfkvsU5ox1VOG4dxgTL09rlF9olmLvUq0moyrMXqjAyGq0dpd5CVAIMYZFgN
         VTwGUB8CGtQxjFpYB7Uwnf7FoiboW+0xeNcMXMhHDWfd4ol0zxx8UlGBsCZx6vM3EZC9
         vTkEXQYYlcWjaFFhYabbhIOxkQcb+6MwGOrbYmxOQg0t2uzsIh1M7Y6764xkpN6spECS
         o5tTVGWxG8SKuZRSGgqw8Gl7fHgVqEPzYTt4Q+GE2pGnjpTcTV85KlvnbyEJDLwFbcrJ
         xNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JsReMJmhoZXTzfez0TptRz7E3a6OyZBAm/NsHtCcJwA=;
        b=iWD2JlX8ToosTluKZx92EyloP5aDFkAmksVIliQKY6+QwbKcBMYQxxeUh5ktswwvLa
         W7OzaSWXam5Uo+lmuzin0NToUIeEXRdY3eZK5nMun6UqGZZhdawP5tSkfaI4Vz6xTJkf
         NvsqIzCIQSn8JdLaAkpiBL1Khn3fElCkHBYogXNYychexCIBnh/ZH6r48O6AFsg4OGDC
         7kiGbuBLgqHPmxy8sID09A6i+SLuJvrzt/GRpuCRfcxj4mDVBRThi1i2ISY/FpUUXevX
         Y8f7zXrOhU0VM4MlDeEzICODjg/dF39XhvQdh0pIZe+46Dm7zABBqGgBL2WhjcEEwG0s
         sB3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zM/Qgb3oemjaz/pge1uFhwKCtWV1nXn4LTycG089O3qdtY7e4
	3Cm3QWxW3NgYTTmb3/z8PrA=
X-Google-Smtp-Source: ABdhPJw4d/MSY3XcfXQ9WF55uCsYsAc4i6iPJBwIfSSSkFAiDOGkVTviXmVcCas72MLj0SzJes85zQ==
X-Received: by 2002:a1c:a544:: with SMTP id o65mr4180556wme.53.1630415632026;
        Tue, 31 Aug 2021 06:13:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1:: with SMTP id g1ls1517007wmc.3.canary-gmail;
 Tue, 31 Aug 2021 06:13:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4109:: with SMTP id j9mr4220555wmi.88.1630415630841;
        Tue, 31 Aug 2021 06:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630415630; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9V6ZJhgAH3uS7cqYNNuDN0bKKSXiiVO8dr7D4Nghxu3+18Y4V0z7oXLmi42R+1zmH
         hRUliATR5kQ53Zu3VQeZNWUGkZeH3l0BPioAtdsJG/QxFaHb2fa1vo/pFDo4hwTvSKI8
         ButDot+P03TJ+yCunTvEiafD7myqOAgWfRLf+jFz9zhOaH7p5Q3tgojIJ0G8QTHX/ZE3
         JKI2Y1QnvulwlHxL6EbBrfWQYf9jzSN+v38TYo7ydSQTAINsbTXNMALAyrIJQ7t3LAE0
         8VbF/HTY798fQuwZ9YcBKruWmB+mqNnijZHO+wjvyhKDTfC+78tUsAuqQfOC8Pz6HudB
         8HgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k6y7ropJq0Iux7/QdyawWerdVViYeFCN7zj+HtXSutE=;
        b=BUe6N6K2zOlXIvCYW10j8ae9wg0W3CvpwVGwhsjXrcMJ5pLY38X4MwdV3Db0eTfvXA
         6h5NX1PSQ52Fe1pRVV2TzhjMbbHX8vS42EsfScQxinxNCm7OdngUPPswWtqJ9yOAJQPB
         4RdLZey9BQffcTMR3CxI5t3Cg8qVqV21DP81Wa+mnQYrWL/8XdSZuE071xiUI8pT98ZT
         g/x88HOWXQO994hxCxz+MVoRaQEVqpxRIlP9K6FnJQ40Y/mqZDhSsdA5NaWkHfZm+6Gd
         mx68oSi2tRm1oFk+VKATip3/TTIO/Pg72Nlg2H6DXrOneKTJPzyDG8cN8aUK1HfPf5N6
         FzTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m185si149060wme.3.2021.08.31.06.13.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 06:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 17VDDoYT016842
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Aug 2021 15:13:50 +0200
Received: from [139.22.37.21] ([139.22.37.21])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17VDDn6g026136;
	Tue, 31 Aug 2021 15:13:49 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b88eb53-8258-2d0b-d0d1-71c24bf372cb@siemens.com>
Date: Tue, 31 Aug 2021 15:13:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB337106827ECC0CE4ED356C1784CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 31.08.21 10:48, Z.Q. Hou wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 15:11
>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addr=
ess
>> and size
>>
>> On 31.08.21 08:55, Z.Q. Hou wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>> jailhouse-dev@googlegroups.com
>>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>> address and size
>>>>
>>>> On 30.08.21 12:54, Z.Q. Hou wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>>>> jailhouse-dev@googlegroups.com
>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>>>> address and size
>>>>>>
>>>>>> On 30.08.21 05:02, Z.Q. Hou wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
>>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
>>>> jailhouse-dev@googlegroups.com
>>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
>>>>>>>> access address and size
>>>>>>>>
>>>>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
>>>>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>>>>>>>
>>>>>>>>> In function restrict_bitmask_access(), the current access_mask
>>>>>>>>> is implicitly assuming that it always access the whole register,
>>>>>>>>> but some registers are byte-accessible, the Guest may get/set
>>>>>>>>> wrong value when it issue a byte or halfword access to these
>> registers.
>>>>>>>>
>>>>>>>> Can you be more specific in the affected scenarios? At least one
>>>>>>>> example would be good.
>>>>>>>
>>>>>>> Let take GICD_IPRIORITYR as an example, which is a byte-accessible
>>>> register.
>>>>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest
>>>>>>> wants to set
>>>>>> the priority of 33 by byte-accessing.
>>>>>>>
>>>>>>> Assuming:
>>>>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
>>>>>>>
>>>>>>> Then the current logic like:
>>>>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back
>>>>>>> value is
>>>>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
>>>>>> 0x00, then finally 0x00 will be written back.
>>>>>>>
>>>>>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D
>>>>>>> 0xff, so finally
>>>>>> the 0xa0 will be written back.
>>>>>>>
>>>>>>
>>>>>> OK, indeed a good point. We missed the byte-accessability of
>>>> GICD_IPRIORITYR.
>>>>>>
>>>>>> But this reveals more: We perform a read-modify-write cycle on
>>>>>> behalf of the cell with the cell's idea of access width. That is pot=
entially
>> unsafe.
>>>>>
>>>>> Can you help understand why there is still potential unsafe with
>>>>> this fix
>>>> patch?
>>>>>
>>>>
>>>> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses
>>>> for that register. The problem is with other registers that do not
>>>> support byte accesses.
>>>
>>> Don't worry, according to the programmer guide the Guest code must not
>> access those registers with Byte-width; even if there is someone do that=
 by
>> mistake, it will trigger an exception before the access is trapped to EL=
2.
>>>
>>
>> I do worry: We trap the access to EL2 because the memory region is not
>> backed by memory in the first stage translation. And then EL2 will issue=
 that
>> request and panic.
> =20
> You're correct, I did some experiments, the byte-width access to non-byte=
-accessible register is also trapped to EL2.
> But what I'm not understanding is the byte-width write access finally tri=
gger a SError (ESR_EL1: 0xbf000002) to the Guest instead of a exception to =
EL2, and the Jailhouse does not crash. Do you know the reason of the result=
?
>=20

No, not really. I'm architecturally not fluent in that details, and in
that state I would have expected a crash at EL2 as well. Maybe someone
else is listening with more detailed knowledge. Or we are in an
implementation-specific behavior region here, and your mileage can vary
from SoC to SoC.

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
jailhouse-dev/2b88eb53-8258-2d0b-d0d1-71c24bf372cb%40siemens.com.
