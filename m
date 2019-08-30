Return-Path: <jailhouse-dev+bncBCB7D7MXMMIP7DVE5MCRUBD4DJG4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE1BA3599
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 13:24:48 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id q62sf6963025qkd.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 04:24:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567164287; cv=pass;
        d=google.com; s=arc-20160816;
        b=jU8nUO/amKTFEDihAKVB9k6DNEyVQRINs1W7O3NJPIpasMNBuohO5KYXIbWTIv8OPf
         kZXGyRUdJeK9NIwdzzHBpKkDuEqrUkR+m0xa5MOvxlCH6n8m6xvtFEByzz2oS+IRh54L
         zxLu25TmK0Lk9wJWrua+unVP353BkEBkuP6EoThvEgI7LzgSktKO5m4CwaZf2EvnSw+N
         edIKOcqbcnH1sgpsH6qU4z4vAh83Kb3ii6fsBhM23gQApoSHMp1kNdhTtX6e2qY5gFt6
         9Ovt3KPKi00bCrbCSVvoRQVHpOzxEBc58hw8fcezmCg96cFWmdJg8k+ymFI3RaBYsrNN
         siSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=/eUcmefLb8KhnMpSD0t5gKFGtMJ867kseSyXuLKzPQg=;
        b=iBxma58fyEm7Y+mcTUbibQXpG9JfxmRf+FhQFBg8ciwXfxWKyTKlBEz4syAcB5B2hr
         hV9au/zzjXBcvolczcJl+UqmHfppmfawFBNlGAhxQ7P7IZ/iGz+a3VpWBSpG1wUXpjb0
         3QJXNQ2f19CfmI1yw/4azst9Ix6YblYwVpM0tHbO+/L9McM2aIPGVNxQ/IL6SJ53W0ZQ
         HQHCtyctHHRmuj2+FSxSaQlTS225dHqgK6L1IcBYK/lp6rS3W/7Vi7u++sXuPgIqA/tL
         OUYoJDJx+oRgzBHYvry7BHMYGq3OiYI1uovgGzi9XAMKYRSiGaxWocsGvAiDfuoTp8eG
         +tDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CV2nviLw;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/eUcmefLb8KhnMpSD0t5gKFGtMJ867kseSyXuLKzPQg=;
        b=oXm9gM7nDdCtrpbvuuEZzT/eFVDW+Lf4S4bnZ/wIhSI7go0ufoy+TU5mbAZbv3wYH3
         bNnNGRVPxFxHkbxBGMqIbRxQjwSKCmeuIbRNZsQ110i64plJi7WB0k/atzVH6cH0EZIr
         EKvfZeUZ4iLZCaFeoNKJb4UCuTg+4F6QmZcTNcHuLMlEUXysaO+hlZQDDivNcQ+8FZv1
         ueJ86SjUPk2S0KRL6i6ZncHnhdEfOcQiUIVG8WXxJbWMhjPjgD3XVOUnBQ/QY219vFBQ
         G4R1H6CXbjiZ3cGk/ko2DKHeTirowaseyNX2nxsTREnVel439Mki00HlcHNMlCrazBMN
         GlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/eUcmefLb8KhnMpSD0t5gKFGtMJ867kseSyXuLKzPQg=;
        b=jEXn8YAXLU44BPYgdGDR+X9EuPRbI6rUIozCawdJmN0fkTU4RJqTgcmjBGFGojcn76
         wR/TsHmKFK5PKyHW5xBBsBdv2j/zDCtTNlEgxVhUyu44qpcV22lrsQt4G8EeOx+PoV16
         1IB20ReSTKW4aCBu6u9OM272A8BrderZFjrYWsYqbPZPm/IqKMQhwECXXWtB+n6rkuZ+
         4E7hhkH5p9Uvy5akr5R4Bc4UBe4v5b+aYnQP6KNtCy2uTGKhu7afMPfoq0gfhurKdGJQ
         2ljAeKSRz9zPO4gBvmYRoXOA84OSR0VPbOaVL1cUmz+gGmjP7GgunUtNz+vf1jXmc7CX
         Rc4w==
X-Gm-Message-State: APjAAAUsxSJ/pvwC90dWCwj08tK5pibWJEOnc1eHOPuKydtLPeyQtpSM
	pumDhM18xM82LuQZgxMgCvw=
X-Google-Smtp-Source: APXvYqxDIxwpc3Pyzk4bfqlGKgFy2/alO9MeTo6IDv41CKkC9OK5Sv11ISiLDsTchDCwJMtG9AJGXg==
X-Received: by 2002:ae9:ec1a:: with SMTP id h26mr14629227qkg.80.1567164287561;
        Fri, 30 Aug 2019 04:24:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:25d6:: with SMTP id f22ls766495qtf.12.gmail; Fri, 30 Aug
 2019 04:24:47 -0700 (PDT)
X-Received: by 2002:aed:3327:: with SMTP id u36mr14332825qtd.94.1567164287119;
        Fri, 30 Aug 2019 04:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567164287; cv=none;
        d=google.com; s=arc-20160816;
        b=aONWOSsm2tmhzF53jsojxh6x3PQYL8ONN0aRmTn8Rx8YbsiwvTGVEx4aJeEH++mnRb
         wlUffcsL1J5WDU2pu3VdKDDsBetgio6zlgQdpvScfSmPFRcyiRrbHi9ivaTa+tRDQNnn
         PPwzofpPa53r0/YNO5DO3Y/HNWyhRng/rYRThznU+lo0ry5JcBZ9Jfj6cgWenRj5XKmY
         4ZBehqE9GYIw6VLHZ3aBi9BEpHRvd1WHYvLojVPmfr1C0cXYdKVPDkE1p/AhlOJLtupu
         ROovjvnSHsgw0Pm9RK6MVOmYv3Ipky102f7bHKma2m5T0F40gaF89v4mUYqwlWhq4G0v
         QPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=H/VYVov6YNY9JmbH8+swBdMHG9MN/HNNZ91qMdywYp0=;
        b=rJvx47PHCwilZ0+9kyr0MFXM1j52hpK1GlayceCtBDPehcf+CvENtrUXVdCYnFn2rT
         E4PpPnW8VI4szCqlgBTFpcWQU639hlnFMklyg2XGgRjhJ7R8jbaPOR4NGf9rkldOGM+t
         Bp95U+a8ZC52vLSil7zVlrJya87gXLWUDtGwKQJHFUIzFFBAQmzzARSc0KnadBTG4EKB
         lBfL9VB2l/17cm/wqn7/NDM2GwwG/lf7gew7jGhntXk81rhWiXnyk+amJMVepYjDhkZV
         zpcGIEYB2tK4T/FCzERRfwVmwoFMejrie06o5jOW3Pog39OJNWZYjYfq7Y/md6JGIliN
         foUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CV2nviLw;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id r68si181514qkb.1.2019.08.30.04.24.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 04:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UBOiaA089046;
	Fri, 30 Aug 2019 06:24:44 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UBOiOw069930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2019 06:24:44 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 06:24:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 06:24:43 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UBOgZ3052651;
	Fri, 30 Aug 2019 06:24:42 -0500
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
 <12948446-f755-3846-4cc0-9cbea4908291@ti.com>
 <fe0f6bd7-1b38-57ed-6e27-ab97a16d751b@siemens.com>
 <d8b1db29-a239-0a81-65b1-b50aabbc45a8@ti.com>
 <dbb8b90d-3933-84c4-5340-6c1d03759438@siemens.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <0c7d478f-7712-a81a-e194-cd54cd9fdbc4@ti.com>
Date: Fri, 30 Aug 2019 16:53:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <dbb8b90d-3933-84c4-5340-6c1d03759438@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CV2nviLw;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
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



On 30/08/19 4:50 PM, Jan Kiszka wrote:
> On 30.08.19 13:10, Lokesh Vutla wrote:
>> Hi Jan,
>>
>> On 30/08/19 11:51 AM, Jan Kiszka wrote:
>>> On 30.08.19 07:38, Lokesh Vutla wrote:
>>>>
>>>>
>>>> On 29/08/19 8:21 PM, Jan Kiszka wrote:
>>>>> On 29.08.19 16:10, Oliver Schwartz wrote:
>>>>>>
>>>>>>
>>>>>>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
>>>>>>>
>>>>>>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>>>>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wro=
te:
>>>>>>>>>
>>>>>>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>>>>>>> I=E2=80=99ve now tracked down the error to power management, in =
particular to
>>>>>>>>>> clock gating when autosuspend is used in IO drivers.
>>>>>>>>>> The drivers in question, spi-cadence.c
>>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/driver=
s/spi/spi-cadence.c)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> and i2c-cadence.c
>>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/driver=
s/i2c/busses/i2c-cadence.c),
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> use autosuspend and turn off their clock when suspended. This is=
 done
>>>>>>>>>> using the PMU (Power Management Unit) firmware interface
>>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/driver=
s/firmware/xilinx/zynqmp/firmware.c).
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> The firmware interface can be configured to take a hypervisor in=
to
>>>>>>>>>> account, but my guess is that this is not yet handled in jailhou=
se.
>>>>>>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be d=
isabled by some
>>>>>>>>>> kernel configuration setting. However, I can work around the iss=
ue by
>>>>>>>>>> patching the kernel drivers to disable autosuspend.
>>>>>>>>>> This also effects any other driver that relies on PMU functions.=
 The CAN
>>>>>>>>>> driver
>>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/driver=
s/net/can/xilinx_can.c)
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> spits out a message "pm_runtime_get failed(-22)=E2=80=9D occasio=
nally while
>>>>>>>>>> jailhouse is loaded.
>>>>>>>>>
>>>>>>>>> Interesting. This driver also exist in upstream, but not yet in 4=
.19 that
>>>>>>>>> we use on the ultra96. Which of the communication methods does it=
 use when
>>>>>>>>> talking to the firmware? SMC or HVC? Should also be encoded in th=
e device
>>>>>>>>> tree.
>>>>>>>> SMC is configured in the device tree (obviously, as there is no hy=
pervisor
>>>>>>>> directly after boot).
>>>>>>>>> Anyway, I would try if things still work when disabling this driv=
er
>>>>>>>>> (CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest reque=
sts would
>>>>>>>>> be a task for later then.
>>>>>>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_=
ZYNQMP is
>>>>>>>> selected (see
>>>>>>>> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arch/arm6=
4/Kconfig.platforms).
>>>>>>>>
>>>>>>>>
>>>>>>>> My feeling is that disabling ZYNQMP_FIRMWARE would be counterprodu=
ctive
>>>>>>>> anyway, as starting and stopping CPU cores is also done by the PMU
>>>>>>>> firmware.
>>>>>>>
>>>>>>> 4.19 upstream seems to be fine without this driver, including CPU h=
otplug
>>>>>>> (which is power-wise a nop anyway once Jailhouse is running).
>>>>>>
>>>>>> Interesting.
>>>>>>
>>>>>>> But I agree that patching for that purpose is not convenient. Consi=
der it
>>>>>>> more like a first experiment.
>>>>>>>
>>>>>>> For handling SMC SIP calls (which is what the PM calls are) properl=
y, we
>>>>>>> would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()
>>>>>>> (hypervisor/arch/arm-common/smccc.c) and start interpreting the req=
uests,
>>>>>>> rather than just rejecting them. No idea yet how tricky that may be=
.
>>>>>>
>>>>>> I=E2=80=99ve taken a quick look at the Xen code - no idea how well t=
hat translates to
>>>>>> Jailhouse, but the core functionality doesn=E2=80=99t seem to be ove=
rly complicated:
>>>>>>
>>>>>> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca9=
1732971e1
>>>>>> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xil=
inx-zynqmp-eemi.c
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> A proper configuration interface may be more work, though.
>>>>>
>>>>> Yeah, looks reasonably regular (thought still rather lengthy LoC-wise=
).
>>>>>
>>>>> Lokesh, how does the situation look like on your SoCs? Is there somet=
hing
>>>>> similar so that we can think about a common configuration model?
>>>>
>>>> This is not an issue for K3 platforms. The communication to System con=
troller(
>>>> PMU in case of Zync) is via a secure mailbox channel. So Jailhouse jus=
t need to
>>>> map the mailbox address space and root cell can communicate to the con=
troller
>>>> without any disruption.
>>>>
>>>
>>> This isn't about the case of fully trusting one partition to own such k=
ind of
>>> control. It's about moderating access, giving a partition only the chan=
ce to
>>> control what it owns. Or is access control configured outside of the hy=
pervisor
>>> in your case?
>>
>> In short access control configured outside of hypervisor.
>>
>> So IIUC below is the flow for ZYNQ SoC for controlling a peripheral:
>> Linux_driver->smc_call->ATF/PMU firmware-> enable/disable device. Since
>> hypervisor is trapping the smc calls, pm runtime is failing in this scen=
ario.
>>
>> In case of TI devices below is the flow:
>> Linux_driver->TISCI protocol->mailbox driver->SYSFW->enable/disable devi=
ce.
>> Hypervisor is not in picture in this flow, so this is not a problem.
>>
>> Let me know if I am not clear.
>=20
> So, the SYSFW is configured to accept enable/disable requests for a speci=
fic
> devices only from specific set of cores - which then matches cells in the
> Jailhouse world, correct?

Right.

Thanks and regards,
Lokesh

>=20
> Thanks for clarifying.
>=20
> Oliver, then it looks like we will need something ZynqMP-specific, a list=
 of
> permitted PMU device ID per cell.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0c7d478f-7712-a81a-e194-cd54cd9fdbc4%40ti.com.
