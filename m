Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAUSWOEQMGQEQZSENZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066B3FB4E8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 14:03:15 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672sf6397375edu.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 05:03:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630324995; cv=pass;
        d=google.com; s=arc-20160816;
        b=CYBOBRTr4yTPeSOqv0zehRP5KRhT7Alwuhi3rnVv2FJxC5elpwgdHH66XntIrbvlIM
         a2S53RVJfAPGd4ZdoJ7gUqhZS1RkUTV/lDDvRPCG4MVTeC5Hk+WU4ZB/Fy26IvK/wdhK
         t/TDCbbU3bhShqIRD8IWsT+e6I5tSobNsQ3S5DkPJU8/+mU2XtOC/lZZ7g0arxNCCHNl
         0aP+/WjiSSl2SqYMQdGzaTX+l3Md2DKXPMXlX13Czu5XvXI4obmx6lHi9RqvBYAL0IRb
         KkF47a79To+/1+slXsKtaIDOrqILts9eBpMi5DtOfNFIILYqr27vGAM+QDETQNh0mW7e
         Qcyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ixRYOlYX6cw+a0MPuxNoM12h9WXTucQFXjJ3j0O30TQ=;
        b=FJCiVgAhvj4w+8xEFkWTrC+cO+r+BbWs2beYzv+jmmdBiUCpR4Hb98ZxunpglKJJyw
         dEzuXA7x7k9P2byinDE006atmZSlL2+PFpUOylMjHoO2iiX0PvgA1TaGWriqI0bTfnen
         /FnquLZDioDqvE46p9DpFaWhoAnjt0YXqqm++orew60EEG8Y0bJvNqiXNuiHZyOLUzyA
         2LUo+TyFbqys9XCC/GfW3zlj0VuVXkgagB60bHUdcqP7n2vwxS1U9hQUzqr1kk1fherp
         PeJ5yN0n6btF5hMF4grrfvXbbLrXO9XkwfvxnFPmgDnYq0LaSNPs7TnUPp3pJbRhdK0m
         iikA==
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
        bh=ixRYOlYX6cw+a0MPuxNoM12h9WXTucQFXjJ3j0O30TQ=;
        b=ozJoZvwDABWx5Kxm97xCcic6ki2ce/GhCKYROzecRw7EmI23LoA7df9S+VW9GGcrEo
         IbTWxEQwr5wn3Q2E9IDsEWpzbczjnhXI2dejVN6/zfD6dV7Z1tlbdnLiww3Pod3mGpVf
         uMgIsW8FUN03e4yMDC0kB0RU1Z4gef9OvPVagFU31OFXUQ69645lAl49Sd5/qSfmwqec
         7vteXYBvpJlv6EjN+FQYhm4o0JBFixfz0BCSpihvdCg6E4OjMVrRgYYjZQ2w30fGkOd0
         kFV+qduM2IA0+vjd+JR7nSDRtHuRwtDcnvwPID2Zwy5wtIetc0VDy7TIGXFL/NaKeZK3
         c8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ixRYOlYX6cw+a0MPuxNoM12h9WXTucQFXjJ3j0O30TQ=;
        b=Od53yYYTzQuLeH40ES348vjzqk+tjANEQtKCzqHXJ+bSh8BYNRb+CRjGb8n0bdmy5x
         P9w7Km36iG11PFd5cS4Zp84MoH1uo/yMmS9si2OJSt8JWCmd6B6q6CwyVUBwKGoYeaP6
         GWXGZpJaI6Pa4uY/vRBA5oeByTPQC6bAnAj8BIKbs/GE5V8bFNu19NNTpSNWE/YMxngR
         grG7GkCTK4W81Q1SMj8b/QeOpPSM1PEtGdnLF9rFoQmp0719Lip/MelqtP3Njz8E1z1O
         xDQ6eenTLLDZ1e6uE10u12jHvz4IMZOZw+dHhpIK50irjnociHL755bNx65eUcw88WIo
         X6tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533N8OKEbmwO5c4mX1c06LVNTB4HmvnVaaxN2N8h8TpCVkfsXvPQ
	nDiZKwcIyd+PyV9UheuolfM=
X-Google-Smtp-Source: ABdhPJznNMKztpApPlQA7xXAS71025nQfxYF+yd54l3+pg5pMCKonU9jqhNZJJTE2hT1QkXhj71lIA==
X-Received: by 2002:a17:907:98e3:: with SMTP id ke3mr17759174ejc.317.1630324995031;
        Mon, 30 Aug 2021 05:03:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0d1:: with SMTP id bq17ls7774628ejb.8.gmail; Mon,
 30 Aug 2021 05:03:13 -0700 (PDT)
X-Received: by 2002:a17:906:584:: with SMTP id 4mr25147349ejn.56.1630324993870;
        Mon, 30 Aug 2021 05:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630324993; cv=none;
        d=google.com; s=arc-20160816;
        b=oJlejSokzO6SYY4r65mTPtQu1VMVX+IN3XQ65QXsZOkTEoO//l3p76pE/hpnSKgJZs
         uT/2cujlr55RPPf/CZkbery7nIZtJMW2tYoIZmm0BD0Az0ksCWlBvfRw+nQFNQPTEcg4
         TsTQ8BxHHMGrqt1L073xzk22HFlI14qzIMrEdM7z1aMHBC+997a6nfyk3r/fO2dIB7Cx
         A12jXw5iwB+4VF8R686jBDjiQicsfDsV8ZqywWI1q4FLSHzsRYRLu7W/HR6Kf4L0YtmN
         C6dq+GUCTwiLJrpEqK54kjAiz2x+QeM071UA1wnkv0oTrpFrvuBmboHwH+RPyrvMmTqd
         I0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=rP2a+kXMpThFB6uhsfnlYlKQVqydhGHFcU8lNpq4fxg=;
        b=Hp1Ar6WGBZ/hpAYtRibN4DbOHq7TMk1/U+8vzvUKo6md5RsL2NyIdbuhsbpcCcRmM3
         T5hjxOscfqyY/c3nddZMhBu5f8LbmkadekmkZLI8KcRAWJ7LjHtBrCxqbF1EIqgaQJZj
         NbDqV+TEBjwS6AplIPtBRMBzLNyBZLxCeZ2vS7WjHeXupd7ROv8IwL1FPVbPS3SZ6gQL
         wjWJZvkHrUWUffQmq7JhDdDmqqR1Q+u/ugeDeOtIEVJKjI4L34Pzuu0htvRgJZOun56C
         IfoJtrHihHxydfUJHSpKNcCYRY1TytWFi8xSEzLCi/KyS9dWZba4ZyzPeFVKK78HkB2z
         0oYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id co13si754535edb.3.2021.08.30.05.03.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Aug 2021 05:03:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 17UC3DLl000471
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Aug 2021 14:03:13 +0200
Received: from [167.87.2.75] ([167.87.2.75])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17UC3CEa001590;
	Mon, 30 Aug 2021 14:03:13 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
Date: Mon, 30 Aug 2021 14:03:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
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

On 30.08.21 12:54, Z.Q. Hou wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addr=
ess and
>> size
>>
>> On 30.08.21 05:02, Z.Q. Hou wrote:
>>> Hi Jan,
>>>
>>>> -----Original Message-----
>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
>>>> address and size
>>>>
>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>>>>>
>>>>> In function restrict_bitmask_access(), the current access_mask is
>>>>> implicitly assuming that it always access the whole register, but
>>>>> some registers are byte-accessible, the Guest may get/set wrong
>>>>> value when it issue a byte or halfword access to these registers.
>>>>
>>>> Can you be more specific in the affected scenarios? At least one
>>>> example would be good.
>>>
>>> Let take GICD_IPRIORITYR as an example, which is a byte-accessible regi=
ster.
>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest want=
s to set
>> the priority of 33 by byte-accessing.
>>>
>>> Assuming:
>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
>>>
>>> Then the current logic like:
>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back valu=
e is
>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get 0x00, t=
hen
>> finally 0x00 will be written back.
>>>
>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D 0xf=
f, so finally
>> the 0xa0 will be written back.
>>>
>>
>> OK, indeed a good point. We missed the byte-accessability of GICD_IPRIOR=
ITYR.
>>
>> But this reveals more: We perform a read-modify-write cycle on behalf of=
 the cell
>> with the cell's idea of access width. That is potentially unsafe.
>=20
> Can you help understand why there is still potential unsafe with this fix=
 patch?
>=20

The patch is fine for GICD_IPRIORITYR, so is accepting all accesses for
that register. The problem is with other registers that do not support
byte accesses.

So, to make things simpler, we convert to always performing word
accesses for all of them. That means no extra effort for the other regs,
just filtering of size !=3D 4, but GICD_IPRIORITYR now needs upfront work.
And that provides the chance to address also the issue you found.

>>
>> Handling of GICD_ITARGETSR has to resolve the same issue, and it does th=
at by
>> converting the request unconditionally into a word-access. I think we sh=
ould do
>> the same here as well.
>=20
> I think this fix way is more simple than converting to word-access uncond=
itionally, as this fix way only tweaks the access_mask, while the word-acce=
ss way need to tweak both the addr and value.
>=20

We could stack the two changes. I'll take yours first, and then we only
need to decide who does the second fix on top...

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
jailhouse-dev/9ecc5d87-c7b4-ce84-6621-f88cf05fbeff%40siemens.com.
