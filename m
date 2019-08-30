Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIUNUTVQKGQEO5QN2QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615EA3597
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 13:21:07 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id f11sf4026167edn.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 04:21:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567164067; cv=pass;
        d=google.com; s=arc-20160816;
        b=WboLF8qkdyHPmu+GK5xfCDpJdbXpZF/c0yCN65l06XbsgGpz33kxRmAQFqWVgx031B
         hjZB7Ob3klo0vM8p+U9bdTax8As2N39vbuqwYRCS3VomHhBEvLJTBQ/pnKpiePX8wDfO
         A58XlWZ6qJ4rWrPPVNtXhhxYFgB5tvEW23X8sJ+HAsEV1UDtFPJ7l//a49jmVKodexg1
         RbdhEKjMbjQYZ+I6TgNi6xcj41ts9wLRYW7IlkX70I8WfcDXH7Mxbj4PwtMqrRIxXN9G
         LtUKxvVIkV/YsubGMlpsqwJRuYX891k+mKVe4GwoFfNijmQpCwYEt5M0oCS1h89DVFAX
         v/ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=+PLvph4sF74hAw3MPzJ4aWxzcfWMLL9+QoL2FT5Wcgw=;
        b=TswzT+6kjk8+UgoOPPVpfoR6C72PCS1sfoZJJDDOmRMpbnU8j5iQMt7YSjpvfijb10
         lxBX2ZM6hQhJe5AmgRTI/x3jU+ZCQ6TTv3Z1HcxqRjINmXzEl/V85mqeP5Emyxfjz6ZI
         CtEZ6w1hXTS65K4EEbbitICz15aMsDQc3SYK/3qI97CMgRjYW/HgVeKnQHpDVtFNNMkA
         w047ddx6Ou+Ih/pvFmr4WAhqmIFvIvoMNQ+Pn2jALV/1sq03H+R1esVaoQ9CivYWbH3m
         35QqGzARuvKclU+zxrFEur3L1dfs11a2DpdTRFrdvegDWFeknW5kljjr29ChlPtqvfFY
         YGXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+PLvph4sF74hAw3MPzJ4aWxzcfWMLL9+QoL2FT5Wcgw=;
        b=grV8YrqMyFDP2APzSgK3Lwf7DT/XGQcz3QgdicPki+/yJ9Xv9L0cbzjNRfT0UNmeUV
         6JQqK5uqqFWPN63kCZgH2B/VZpl/4zIXE7XCKSBWN2VY8kZcH1CAEWXgv3jsfddbqIG8
         C/v70Dyx62yEBXSpRZ/0GGUL+G1Arc/1gK5Zg02HkYNqbY9WK5ZzAX64/K9MqRQfa9e/
         mykQEVDNe0nXBduWO8b1KS0WyM0dH9tuJ6dhk48claA7NygqNtisBKPS0+eGB5mb9KNN
         thKIPAH439kV5KhlZOHIqB0C1wyIKC8WlSDyiHCOp9E9lHRZS7KYZxupT+HzT+ysgd+l
         h91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+PLvph4sF74hAw3MPzJ4aWxzcfWMLL9+QoL2FT5Wcgw=;
        b=ckHKPkW2YR9xPy8Rf6PHuKP7p1X8uFPzUKObOTnGAq9viylcrK+tyBPRRwyo5TMfg7
         AllRvyVCLzI2ML8sj001SvdzlCsZODnV5pilL0q3RkjTNIN4Nzwf0TO/FD1rhxUg8Bny
         SbMQ221+KxVgmAyKh/8Ka4mKAetwYaOh0A/7wu+jU1lio9WrYqIr49stIMf14Itn7IRF
         B05ITws70PrSeDxyg1wofg7y3zs9EuHMeq2oSKrfvVYOdtd+LVsLCWZLuc9rO5Jz7Gg5
         09tiyX5s0oLpsrq6taTmjM1KkYTk68Ayc39+j0hRNxUinNnlnErHM93p6DqcO9s9w6mU
         jVoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJCbm9a7pEDHGYhnHptiXE3RV6D2y2JvnwAuXOflSQu16uNKB8
	Tl3LSmHXLjzIkAeon31Blzg=
X-Google-Smtp-Source: APXvYqz2CMv83tecavDxj/hbetKBGbsu1Cr7igHj7+y2Uoe8QxXu7Z1ML4mGDvGhh91KEUlgm27PVA==
X-Received: by 2002:a17:906:9383:: with SMTP id l3mr7534232ejx.140.1567164066909;
        Fri, 30 Aug 2019 04:21:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8052:: with SMTP id x18ls1684371ejw.10.gmail; Fri,
 30 Aug 2019 04:21:06 -0700 (PDT)
X-Received: by 2002:a17:906:7c4f:: with SMTP id g15mr12621276ejp.236.1567164066206;
        Fri, 30 Aug 2019 04:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567164066; cv=none;
        d=google.com; s=arc-20160816;
        b=zV/qXkQmKMG526AV/FFNQf7gqMSUguR7wUNfTQzRKNcSHeM4hQMxmyxgLx6LGxo4V3
         5RHyfGPMxrRAqyQNvSyCcsSPvlLNTTCHvWZubfPhuQGBjZxEjadHy9ym9+sTIb/DUGQJ
         xgogq9W7hxepv5rbq+M1RiHNtmiOaxsOSGJNzXx3K12YDKSHVCXVcUwQc3JJabsX5g48
         yDvnORX6uwrEM4RZDSW0fszpXbZPGAw3Czi5ohvTWSTIogjZ8VONZcrasvpyeIQObXij
         XeV1SxgqqbveCsuY6B+F9n8y4Oo73TrmEAPm57+HEKDfDF8FVj6YQ1VBeHQaKCNVfz3J
         fYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CctBi7a/TySmbUsBJaWBEWZBepNTIUlNHe0flo9HMcA=;
        b=nDsabUQ/XbI/vDfPL4WyY20Jeew0NEE8fKYFPye0uDkW2SEUHZj4tgUQpbeAfpAz57
         Pf8YbU/5DX6kCluhKVgv088iAzOTMYBac2epnvacliAxvg4mYCUPA+ThnBytmR3qWJih
         9oDvGS3xdyt4Ns9K0Fo3UJPvrF1D3uvg5MMaHgLayAsMuNCeUicBR0o68v9uypTOChdc
         I15+iLHjHrUYblZmiK934xrcd99MZKfF5+X71hcTU0xabrE07z9+QhaGL3iOIUjdj/3r
         ssRwyQuv8l+SaYFuXQKIVBJNiehS7e8Z+JYV1bW2N1Mw+WgaRUHiPWpQC5Z8WKbisk1w
         nNZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m16si359609edv.2.2019.08.30.04.21.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 04:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7UBL4ZP011289
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2019 13:21:04 +0200
Received: from [167.87.8.202] ([167.87.8.202])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7UBKDVI014830;
	Fri, 30 Aug 2019 13:20:14 +0200
Subject: Re: IO access in jailhouse root cell
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dbb8b90d-3933-84c4-5340-6c1d03759438@siemens.com>
Date: Fri, 30 Aug 2019 13:20:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d8b1db29-a239-0a81-65b1-b50aabbc45a8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 30.08.19 13:10, Lokesh Vutla wrote:
> Hi Jan,
>=20
> On 30/08/19 11:51 AM, Jan Kiszka wrote:
>> On 30.08.19 07:38, Lokesh Vutla wrote:
>>>
>>>
>>> On 29/08/19 8:21 PM, Jan Kiszka wrote:
>>>> On 29.08.19 16:10, Oliver Schwartz wrote:
>>>>>
>>>>>
>>>>>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>>>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrot=
e:
>>>>>>>>
>>>>>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>>>>>> I=E2=80=99ve now tracked down the error to power management, in p=
articular to
>>>>>>>>> clock gating when autosuspend is used in IO drivers.
>>>>>>>>> The drivers in question, spi-cadence.c
>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers=
/spi/spi-cadence.c)
>>>>>>>>>
>>>>>>>>> and i2c-cadence.c
>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers=
/i2c/busses/i2c-cadence.c),
>>>>>>>>>
>>>>>>>>> use autosuspend and turn off their clock when suspended. This is =
done
>>>>>>>>> using the PMU (Power Management Unit) firmware interface
>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers=
/firmware/xilinx/zynqmp/firmware.c).
>>>>>>>>>
>>>>>>>>> The firmware interface can be configured to take a hypervisor int=
o
>>>>>>>>> account, but my guess is that this is not yet handled in jailhous=
e.
>>>>>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be di=
sabled by some
>>>>>>>>> kernel configuration setting. However, I can work around the issu=
e by
>>>>>>>>> patching the kernel drivers to disable autosuspend.
>>>>>>>>> This also effects any other driver that relies on PMU functions. =
The CAN
>>>>>>>>> driver
>>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers=
/net/can/xilinx_can.c)
>>>>>>>>>
>>>>>>>>> spits out a message "pm_runtime_get failed(-22)=E2=80=9D occasion=
ally while
>>>>>>>>> jailhouse is loaded.
>>>>>>>>
>>>>>>>> Interesting. This driver also exist in upstream, but not yet in 4.=
19 that
>>>>>>>> we use on the ultra96. Which of the communication methods does it =
use when
>>>>>>>> talking to the firmware? SMC or HVC? Should also be encoded in the=
 device
>>>>>>>> tree.
>>>>>>> SMC is configured in the device tree (obviously, as there is no hyp=
ervisor
>>>>>>> directly after boot).
>>>>>>>> Anyway, I would try if things still work when disabling this drive=
r
>>>>>>>> (CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest reques=
ts would
>>>>>>>> be a task for later then.
>>>>>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_Z=
YNQMP is
>>>>>>> selected (see
>>>>>>> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arch/arm64=
/Kconfig.platforms).
>>>>>>>
>>>>>>> My feeling is that disabling ZYNQMP_FIRMWARE would be counterproduc=
tive
>>>>>>> anyway, as starting and stopping CPU cores is also done by the PMU =
firmware.
>>>>>>
>>>>>> 4.19 upstream seems to be fine without this driver, including CPU ho=
tplug
>>>>>> (which is power-wise a nop anyway once Jailhouse is running).
>>>>>
>>>>> Interesting.
>>>>>
>>>>>> But I agree that patching for that purpose is not convenient. Consid=
er it
>>>>>> more like a first experiment.
>>>>>>
>>>>>> For handling SMC SIP calls (which is what the PM calls are) properly=
, we
>>>>>> would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()
>>>>>> (hypervisor/arch/arm-common/smccc.c) and start interpreting the requ=
ests,
>>>>>> rather than just rejecting them. No idea yet how tricky that may be.
>>>>>
>>>>> I=E2=80=99ve taken a quick look at the Xen code - no idea how well th=
at translates to
>>>>> Jailhouse, but the core functionality doesn=E2=80=99t seem to be over=
ly complicated:
>>>>>
>>>>> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca91=
732971e1
>>>>> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xili=
nx-zynqmp-eemi.c
>>>>>
>>>>>
>>>>>
>>>>> A proper configuration interface may be more work, though.
>>>>
>>>> Yeah, looks reasonably regular (thought still rather lengthy LoC-wise)=
.
>>>>
>>>> Lokesh, how does the situation look like on your SoCs? Is there someth=
ing
>>>> similar so that we can think about a common configuration model?
>>>
>>> This is not an issue for K3 platforms. The communication to System cont=
roller(
>>> PMU in case of Zync) is via a secure mailbox channel. So Jailhouse just=
 need to
>>> map the mailbox address space and root cell can communicate to the cont=
roller
>>> without any disruption.
>>>
>>
>> This isn't about the case of fully trusting one partition to own such ki=
nd of
>> control. It's about moderating access, giving a partition only the chanc=
e to
>> control what it owns. Or is access control configured outside of the hyp=
ervisor
>> in your case?
>=20
> In short access control configured outside of hypervisor.
>=20
> So IIUC below is the flow for ZYNQ SoC for controlling a peripheral:
> Linux_driver->smc_call->ATF/PMU firmware-> enable/disable device. Since
> hypervisor is trapping the smc calls, pm runtime is failing in this scena=
rio.
>=20
> In case of TI devices below is the flow:
> Linux_driver->TISCI protocol->mailbox driver->SYSFW->enable/disable devic=
e.
> Hypervisor is not in picture in this flow, so this is not a problem.
>=20
> Let me know if I am not clear.

So, the SYSFW is configured to accept enable/disable requests for a specifi=
c=20
devices only from specific set of cores - which then matches cells in the=
=20
Jailhouse world, correct?

Thanks for clarifying.

Oliver, then it looks like we will need something ZynqMP-specific, a list o=
f=20
permitted PMU device ID per cell.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dbb8b90d-3933-84c4-5340-6c1d03759438%40siemens.com.
