Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDET3DTQKGQEBXIZNAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D933EB2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 08:02:53 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 20sf7103923wma.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 23:02:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559628173; cv=pass;
        d=google.com; s=arc-20160816;
        b=cEEkcWYtdGnmiGmnd81i5fV0LcSOVwO5qps0D6IRhZPTVXgOHEJ8qCS8S8BXdJo852
         NWn/F0MhsSkfGGMS3EqPv5Y+O/oyQRjFlZ2ndO3ZpxAbgNpx9sARnszmB/OZjZtEe/vy
         yIh4z4reiunV1MaW6jnB9jNQ3iptMTrh7Hdi+CornERwUOGdVRCQjIo+srk7AidTaWYZ
         6MHEiLYhzj44vRd9ZvYWU1xNW2IGxb0VQ0VKhHSd6VQhBOwB/iTcifG8ZQWeqVgwQnnq
         cO8AzQ6s+TnLkaG9PfrD3rsm1TscIqyCSR0L7r6A8tNjmx+HEpWFS9+Zr5RRUzhlcRIZ
         PuFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=eiLpdGcmHdHJi6Rn7HT8raHJQsDTbnHaRx5H6fClPsM=;
        b=B+FgU8FleTSGzrfNDElFg6CalXziWPb1c5gAtJTq7ZqzolTld9tP1FUeet25ovjyUm
         OC8vTzCE24WrskFiWPnY8VDafiZLTCnvDneW9C2zAB3GhjnTsQNC1x3/AhLSS8Yx+2SZ
         GKqwietgmYorg62WBH2sx0M2QwrpMxkrzyo5KlEhCTprvk9yM8aDGo8pcDOyncns3hX8
         96hHIwfJYnYpp+V6/ImFfKQ3SYwafPvbA0QMqOZMPjFEScWJDwuKKxg3AqoxqCzJB6C5
         rwBC7r+D3//Gl+KBRBEqp7ZmGuZ2ybAtlezFssgFiY5nEadjbeFk6wbjeJT1BtGxA+ee
         aqAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eiLpdGcmHdHJi6Rn7HT8raHJQsDTbnHaRx5H6fClPsM=;
        b=gYJYNykaDHS95SknOuB0MmYy1M8+OtVVtfHWksHapaWo0O+DgMf3/OjWBY0DGCA/u3
         BXAFpI42nuP7O966weYaH7fk9+IPTP0Qnf64uCyQyDFzKY95E772InKyfvW8EDE3FrZl
         ueOoWQL0+jezfq0xLYKxZ5Ewsc3WYsaF2Pos6ceCzo1ZlnDHAhG0TdThcB3t+ZuPYooH
         oF89XZX2npi5hj0hmOyNUjSbegG5aP5pqk/FdlJSeFioskyYQqPoqiazSisczvr19IBm
         v8zBaHaDe1TEznkq2TYnpIpXO0cV0/GHeDVeFlVkuLJaFgS7c6z8zKKktIqKr/RgKBEe
         VxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eiLpdGcmHdHJi6Rn7HT8raHJQsDTbnHaRx5H6fClPsM=;
        b=AU9NyX1PvArWRdMQczbNLU0/F3BK9gtJc7FncWuHyLe87g1fgFzdHP+9m995UkvPOT
         PVT9tr0XRUyEJPAbk6Yda601ahcYhs3BLSQx44kRcI5DlkyedvVoTMtU6rbo7EELIVN6
         lpeDF9KHucqh7Pee6dEAFq7qCD9TsGZZpKHT2GZAavwFYrEusckfcOCELJOMmN67EOzR
         pc12ejpxcfgMv2jIm94y8wVqSFylwo3jnayym7IOvwoUKC4m54kmnFQwGI5SwWKjZzAg
         sau6u4NTxHE/c+W+pNWZ4t7p6BGB9gNkEHfuO4W11ng4lbxf6OFrWUP4sXqplxt8L7Iq
         sDhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWYi3hIqcwxa5BYQQq70d0ZVUc9oO+MTclvd0Edu+Hh6quV3pTv
	MTOW3KEbJM6PTXlYapjX6wY=
X-Google-Smtp-Source: APXvYqxFHOxDKjc1YxwNswCgbtldds5mCD36dBlzC2r+zojY4TqFO5D7T4H0Ib7ej//xgENgdR3ptA==
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr17593419wmu.92.1559628172990;
        Mon, 03 Jun 2019 23:02:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls516444wme.1.gmail; Mon, 03 Jun
 2019 23:02:52 -0700 (PDT)
X-Received: by 2002:a1c:4054:: with SMTP id n81mr17059649wma.78.1559628172279;
        Mon, 03 Jun 2019 23:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559628172; cv=none;
        d=google.com; s=arc-20160816;
        b=Y53Z2Lf7Dfk2bcljiWNqN9xHw+BbIYp29dBDzVQHuUGLHAvvmT99T4ikND0O64CV61
         yi10hoxkgZqFw2CPn3e/p9B3ZE8bmO//WwkFLsLR4RacY3Kpz8VsGgkpqwshRlwP8HCs
         vs5+K/YeGLLjDscrw9IC2i4rf+1DT4j32NFcjUVNmrxbtQefThNK40VD92FRfhkaEv4y
         gQcME6dQdYqu0fFfpIPIcOWXjf8PJ3omKhXDyFe11vmU6tCD4bQ+6R5kygHiVNhfkjjt
         koojuimI/wNY1tOvpZWWZ84P5W/gFKiqIwlotnPwu0DmQLup7fyY6jSMtUhnq7XxKYiU
         yWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+3LlNNSm4Shp6egpLi8BzqVmFX17Lm9w5FM8DoHDQMc=;
        b=kzRTyeiNZFNKuSTrMeSLqm8mrsdyVRs/Q7fjJmgJbb4zVWnGVDPMjnKX2m4dH5yBL2
         MJ0Pgu4nauYRSxg4f18ANdkm6C2Je7874a3+6ncRM9cj2kwscL7uv6JeF3ImYQBeyju8
         eMSIU9U0q+gEsRUgpW8qKX8hmDbidnO+wXkTvRC3cYT3c2lmXauaGLI4F1y8hj3tmFHW
         7Hlf89ZxnrEno3j+j651sdoV13VrVk0Oz8k0etUUf1ANdVFf+wb5gVitM2g0O5NT/6Ar
         uL4bg0+DLFMcw29gMiol2ASQ70ZXr7FMTIzl0HxS0A3agPOlIsOa8ldwK9DHlTSHdyBc
         rB5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c6si774135wrm.4.2019.06.03.23.02.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 23:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5462pxX024858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 08:02:52 +0200
Received: from [167.87.7.197] ([167.87.7.197])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5462pij021321;
	Tue, 4 Jun 2019 08:02:51 +0200
Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
To: "Xiong, Lei (CT RDA FOA ART-CN1)" <lei.xiong@siemens.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
 <9b0508b3-d040-4093-2b69-e3db932b0b51@siemens.com>
 <9ddd1411-e67a-f87e-58ff-280fbec53fe6@siemens.com>
 <C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6@CNPEK01937.cn001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eaac6e64-72d4-d130-0a2c-cdde85d04194@siemens.com>
Date: Tue, 4 Jun 2019 08:02:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <C6C9DF0CAE5FD841919323C24BDCCA91D3A33501A6@CNPEK01937.cn001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 04.06.19 07:47, Xiong, Lei (CT RDA FOA ART-CN1) wrote:
> Dear Jan
>=20
> In fact, my hardware platform is banana PI M1+, I do not find "Banana Pi =
M1+" in the " images.list ".
> Is there a jailhouse-images supported for "Banana Pi M1+"?
>=20

Not explicitly. We support the classic Orange Pi Zero, but that is also=20
A20-based. Maybe you can use that image on the M1+ as well, only tuning som=
e=20
boot parameters and using different Jailhouse configs (all available ones a=
re=20
being installed) in the end. I don't have such board in reach to cross-chec=
k,=20
unfortunately.

In general, ARMv7-based setups with Jailhouse need to be considered more as=
=20
demonstrations than as production platforms. Those SOCs typically lack SMMU=
s=20
that you need for full isolation, and most activities on ARM-side now go in=
to v8=20
designs.

Jan

>=20
> Thanks you very much~
>=20
> -----Original Message-----
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: Tuesday, June 4, 2019 1:14 PM
> To: Xiong, Lei (CT RDA FOA ART-CN1)
> Subject: Re: How to disable CONFIG_VIDEO in the U-Boot config
>=20
> On 04.06.19 07:10, Jan Kiszka wrote:
>> Hi Lei Xiong,
>>
>> On 04.06.19 02:46, Xiong, Lei wrote:
>>> Dear colleagues,
>>>
>>> In the =E2=80=9CSetup on Banana Pi ARM board=E2=80=9D part, it mentione=
d that =E2=80=9C*since
>>> v2015.10, you need to disable CONFIG_VIDEO in the U-Boot config*, or U-=
Boot
>>> will configure the framebuffer at the end of the physical RAM where Jai=
lhouse
>>> is located.=E2=80=9D
>>>
>>> My question is that how to disable CONFIG_VIDEO in the U-Boot config?**
>>>
>>
>> Via "make menuconfig" during the manual u-boot build - which the descrip=
tion is
>> not covering in details. If you do not want to fiddle with that, I can w=
armly
>> recommend jailhouse-images [1] and a board that is supported by it out o=
f the box.
>>
>> Jan
>>
>> [1] https://github.com/siemens/jailhouse-images
>>
>=20
> ...and we can also discuss directly if you have further questions.
>=20
> That said, generic discussions via the mailing list are always very much
> appreciated as they strengthen the community. Thanks for taking that rout=
e!
>=20
> Jan
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eaac6e64-72d4-d130-0a2c-cdde85d04194%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
