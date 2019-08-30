Return-Path: <jailhouse-dev+bncBCB7D7MXMMIPH3FC5MCRUBFCX7KAE@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B57A2F0D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 07:39:00 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id f71sf4486399ybg.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 22:39:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567143539; cv=pass;
        d=google.com; s=arc-20160816;
        b=FWcK7nlityp4upP17ONnWJvyuuyDCBGgPSwlJwzuOITzSfv7OwmQOhhy+DGvVgMSsy
         Nr6+Nx09LgUss4HezJoDE1eb4e7ohCs/K/uC4HG4ASw3II1kwcoLB+n7dgaPZbAUvggQ
         hx3AWiUQrAiO5uuRkp5E8IzGRhZfsS2zrOhHR3KEsXK02s13Ckg7+QmB3BBOQrqr2Yl4
         2U8ZV0/2fjngpI23sqL6ZoyKdfR4w+oqcz4urwDryA+MhSk9ly7uOKwnf09Twx7dnK3W
         JEiISpVpubqo1Kn1IoXxNG8jPnWhflI7kyEDgVcEjYAEu0K+1pdTh9Jb7QQeR0B9QOfg
         UeRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=gqRQP4N9VW1+s7/mAS+0RQqWe64tB4M/8x5IlcVlQm8=;
        b=ectnO3gQW5jmFWqfR8OvvfO+YbSz8MnEyGzltHssNIiE7o+P3TSBum9nuWYcuiEDol
         J62zRCDz8po2qe5HH0Y1VhK5Y9CRzKq1U049H12V1sBV6ZCTITYkGCBfUN6o5lq21nti
         WBke+gY9P45XLUdCPVrn76ZnJXT9EDNQSbvWkNHBp13aY99x1P18CqoRbW3I8RqFvbMd
         koofeBy4XtBeqcXekjyrTY1oNDLCc6JTnkl3TSzYIqq/SPdEvyTxzjM9x7DNXof/Oess
         KT90LS8B15TtIGJ5VApiXMZHv96SD4DnU823nScwmxFNGpP3kvjEY8ig7W9/FLQ5z5WI
         TreQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FjrGQaTe;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gqRQP4N9VW1+s7/mAS+0RQqWe64tB4M/8x5IlcVlQm8=;
        b=gqpgvVzxKabeJaEhdsj0EvTx2pg8Y/SW2lIFMs+5LB4VRyTqiaVjmsZxrUz85y9S0k
         wGRHhUNzrZJk1547OJcrnCASAkFTmyDCmvssTx8gDQFaDqYbcIxI++EYuYrGjFVXuM19
         N6joDAdqRKLDEEZDDfeef0NE8yU/AR5uMDeE8Yrhr3JE/KEO4cUYiTodtFo11eE32yQu
         c43cGJ3tgMZR5RhFbOjpgCRH5QGDHJhudMfRjLawnsma5+2Oq37QJvdXoGH0zUZ9TpGw
         rhTOgIiUEQwBLqWynU5GMo4Q5dM9M40zhG69bfCJJySDvkRPuiDHhyBQ/6OJufNHP7k0
         MsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gqRQP4N9VW1+s7/mAS+0RQqWe64tB4M/8x5IlcVlQm8=;
        b=PduSfLt/wwoRKPEZU24aU6FZWYsADSuYnWBPirl6coedBkcLmGx9Bn+tDw/gR1DdFV
         4FhbNe/067uPSzG27jbRrDBZ+BZyCbDiNeEvhq4dJ0RZ+4eiA58yQwR/IpymOeO80xBM
         FApJ+9yxuqJwB7ok2BSVjyc5fjdyj0SZsljQqxhdEq0sirTLuk1DvuHaZsJniVb614F6
         6/70blcGWmLefYHlEmNMDSUWQR+f93gbBTBvJVbrkfLyUE2nYzAeVY1Kyen8opIpJ6bG
         3t0nC+140rpk3xQYMInhxwOApAZcaHfA7rsiSCRcivf7ntsCO66/EbrvDinJLlGVCrUH
         bbgg==
X-Gm-Message-State: APjAAAVL0siQHnNkp+GLLTaugfzOISHaj0reGaglp2tzXgzj7W5QzCEI
	lHJt0LPhKz1HSElnwvcFyk8=
X-Google-Smtp-Source: APXvYqwtwSUcAxK70ifSX9IX73RycIx5YwdbemDhqIm0st1Y6KiWK7aqeSF25wOj68BwFI/sxk4hGw==
X-Received: by 2002:a81:84d4:: with SMTP id u203mr10137964ywf.106.1567143539733;
        Thu, 29 Aug 2019 22:38:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:d994:: with SMTP id b142ls278160ywe.2.gmail; Thu, 29 Aug
 2019 22:38:59 -0700 (PDT)
X-Received: by 2002:a0d:db42:: with SMTP id d63mr463001ywe.227.1567143539088;
        Thu, 29 Aug 2019 22:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567143539; cv=none;
        d=google.com; s=arc-20160816;
        b=RBanAdPXXGR3QNTIA6JH2UbhpMYf1hBvS5ywB1L6h+jbXiapw4HJPx/UBphbUQVvmn
         z2v8E5pMLTMXx30AI9lrswmIDNrpRBP1d9mQo325O1FUUMFiTE7vWZgK9ZAdMaGe9Wsz
         f395QnHFL166OHfFc3FiIVD2ccbXESEpsF91tAqrlvEOnHsA2zoh+5KT8iQbscVETyvw
         hjIHsasm6vCWSMGhE/3tYUdJcrJ6DCbUTJ/1rHewAARwJYMAp5nbxgG0N4z88aTPeC/c
         lXoR/6c6EXiKfJmiYxVTMBZPbay9ZCRgDXHbGTmCX2HVI8SW4/Hgwi9IbigTqQ5pRbfb
         U6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2yaUsfLbfl+dEAXSLnietNtRAYOQx0aODVNic0bWA/k=;
        b=Fake0jI90mUarktXvgSxafsuex3KKJQZG0RqzCRplzFYp3OMTOgq2uKb4NR3xLdOJi
         gVFIhv44zBS/UeFHAkg6lml+hNa9ITCI+DmywqLFlNRuokAHTvZA+21QkYgwA4vvvcpE
         Q5lLcYbiIgvJEY5VDcGDMxGsCnqt9DuBkhEkkH5iCDIcsoHQl8SMRTR2TmW9a8thD42u
         fTKxeJOQFz9iDs7i57jT8LoQcBiilb9fhXDNlmp6TwxuJenORglHA6rDML01EIDxskmE
         /XoZ+cp9bJWsKZt+gRB7HFlrk3qP9DjLBllQHHVoLMqQbKCl9gf9+hiGYswNECpKbWmg
         W8Iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FjrGQaTe;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id r134si431235ybc.4.2019.08.29.22.38.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 22:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U5cu9K046192;
	Fri, 30 Aug 2019 00:38:56 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U5cusp049431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2019 00:38:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 00:38:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 00:38:55 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U5csDq084950;
	Fri, 30 Aug 2019 00:38:55 -0500
Subject: Re: IO access in jailhouse root cell
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Oliver Schwartz
	<Oliver.Schwartz@gmx.de>
CC: <jailhouse-dev@googlegroups.com>
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
 <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
 <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
 <8d357767-95eb-eb14-7c0b-785f532e0023@siemens.com>
 <99CD5EE5-DE59-4EE4-BC0D-73CEAA506DFE@gmx.de>
 <c35a9902-9187-ebed-6bbd-4b7c0947de3c@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <12948446-f755-3846-4cc0-9cbea4908291@ti.com>
Date: Fri, 30 Aug 2019 11:08:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c35a9902-9187-ebed-6bbd-4b7c0947de3c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=FjrGQaTe;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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



On 29/08/19 8:21 PM, Jan Kiszka wrote:
> On 29.08.19 16:10, Oliver Schwartz wrote:
>>
>>
>>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>>> I=E2=80=99ve now tracked down the error to power management, in part=
icular to
>>>>>> clock gating when autosuspend is used in IO drivers.
>>>>>> The drivers in question, spi-cadence.c
>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/sp=
i/spi-cadence.c)
>>>>>> and i2c-cadence.c
>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2=
c/busses/i2c-cadence.c),
>>>>>> use autosuspend and turn off their clock when suspended. This is don=
e
>>>>>> using the PMU (Power Management Unit) firmware interface
>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/fi=
rmware/xilinx/zynqmp/firmware.c).
>>>>>> The firmware interface can be configured to take a hypervisor into
>>>>>> account, but my guess is that this is not yet handled in jailhouse.
>>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be disab=
led by some
>>>>>> kernel configuration setting. However, I can work around the issue b=
y
>>>>>> patching the kernel drivers to disable autosuspend.
>>>>>> This also effects any other driver that relies on PMU functions. The=
 CAN
>>>>>> driver
>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/ne=
t/can/xilinx_can.c)
>>>>>> spits out a message "pm_runtime_get failed(-22)=E2=80=9D occasionall=
y while
>>>>>> jailhouse is loaded.
>>>>>
>>>>> Interesting. This driver also exist in upstream, but not yet in 4.19 =
that
>>>>> we use on the ultra96. Which of the communication methods does it use=
 when
>>>>> talking to the firmware? SMC or HVC? Should also be encoded in the de=
vice
>>>>> tree.
>>>> SMC is configured in the device tree (obviously, as there is no hyperv=
isor
>>>> directly after boot).
>>>>> Anyway, I would try if things still work when disabling this driver
>>>>> (CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests =
would
>>>>> be a task for later then.
>>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYNQ=
MP is
>>>> selected (see
>>>> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arch/arm64/Kc=
onfig.platforms).
>>>> My feeling is that disabling ZYNQMP_FIRMWARE would be counterproductiv=
e
>>>> anyway, as starting and stopping CPU cores is also done by the PMU fir=
mware.
>>>
>>> 4.19 upstream seems to be fine without this driver, including CPU hotpl=
ug
>>> (which is power-wise a nop anyway once Jailhouse is running).
>>
>> Interesting.
>>
>>> But I agree that patching for that purpose is not convenient. Consider =
it
>>> more like a first experiment.
>>>
>>> For handling SMC SIP calls (which is what the PM calls are) properly, w=
e
>>> would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()
>>> (hypervisor/arch/arm-common/smccc.c) and start interpreting the request=
s,
>>> rather than just rejecting them. No idea yet how tricky that may be.
>>
>> I=E2=80=99ve taken a quick look at the Xen code - no idea how well that =
translates to
>> Jailhouse, but the core functionality doesn=E2=80=99t seem to be overly =
complicated:
>>
>> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca91732=
971e1
>> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilinx-=
zynqmp-eemi.c
>>
>>
>> A proper configuration interface may be more work, though.
>=20
> Yeah, looks reasonably regular (thought still rather lengthy LoC-wise).
>=20
> Lokesh, how does the situation look like on your SoCs? Is there something
> similar so that we can think about a common configuration model?

This is not an issue for K3 platforms. The communication to System controll=
er(
PMU in case of Zync) is via a secure mailbox channel. So Jailhouse just nee=
d to
map the mailbox address space and root cell can communicate to the controll=
er
without any disruption.

Thanks and regards
Lokesh

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/12948446-f755-3846-4cc0-9cbea4908291%40ti.com.
