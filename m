Return-Path: <jailhouse-dev+bncBCB7D7MXMMIMRCFE5MCRUBGSF25GY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id BE43EA3572
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 13:11:06 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id k20sf3776307pgg.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 04:11:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567163465; cv=pass;
        d=google.com; s=arc-20160816;
        b=yOiWLL9Q4CwvAwabSIFJQkywczb6o4QHsPrF5UZi1MYAIQ5b63P+ri38WeWCAUWWBS
         04+fJDxJHbgkZsSP0AOz2D5tDYwIlEjV/OFg8XEqd1LN/YawnLKz6yzDizV4O1Z3Cbgd
         MS8Nhb6mnnCf/5HGEjMjx0ZDDjFN2Tl9orf6y0SluyZ9k0Zi2C/+/SkfYDYNhlIkMoEw
         SeJblCN2PxnuU9LDvNkv+W+5yd6iNFqx+PjeL7YVzTUk/d6k1Pqz3xSxFYyxNkVN/IUk
         7agv9XD4hVZ/bck2OkhFxxGUUxav3vh0IMloqAlUlHELYzkwHxgFtJ5yponrBXkpVYok
         vZEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=xctkX511s2y9nwfgFGVfogbIjipRrVTjInIxHsK5n7Q=;
        b=zs2mVPioBRQKnSPEb8ZKbtqB03KFPze5PcpkGUPueNVksY3kpP7cBnBpJmPVfewjQa
         ugjLZdkh9Ez6L+wHRVvR+Mr0uUMZev2GcuRH90NDLUM/WGSIQD3wjnzciKN+nyLL9glt
         XWEuFdHGkg4Zf8DO59wNFLER11DnN3dioMLt86Uey9zcJeZuz2cwYoay0Z9uH4itJ2bt
         8Ubtj+acQB8kbawD8Gf3qHlG0CwsqcOLMVy40fbOjpO3Duj87WL9dorqKXFcB38+ReC3
         X6TLJFGvEVBGmkeRh+vzJYI8AD8lp79h+/9phBTTMz6SRomr6zvfrVE2KTUNZOe2OGLc
         lZHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="jy/fMQt/";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xctkX511s2y9nwfgFGVfogbIjipRrVTjInIxHsK5n7Q=;
        b=IHHaYMcg8/UR2hnTgGkoaoISYNbXN1hlvO40AynlqCkYzZswXxx5EbbsTI6c8hksiM
         8FkcHNmaX9leQlTTkeb8YEyX5S9h9PKsqgY5t6dEiC52vEqnHc/Vs2nxf+4euKWbi1Mj
         W8URdGPJiL83UWuMonEs25hU/S8QsH4DjWhFRS0BIuQw28TM+t/SEQ+KEBJU0O70J7A4
         lY2l1YkDkTu1/t6u7qFIoE7puObbe/pA9TEXxizXKsxvL9RLrd5XSKrVfYNbiqnheSnK
         kglLnT0IzYf57NpFIte0I1LhTB5OZqTN97pKw439+PP+XQ6KCrNoJZGNUZ+KB+0yedix
         kO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xctkX511s2y9nwfgFGVfogbIjipRrVTjInIxHsK5n7Q=;
        b=lDGqrfj1Dog2d8xTwcdVo7PPLH5yuinh+ImIhe1wHp2iiVJdANixloCosU0YSExaT/
         tMgvuMIFjl3JYibfXolc0yzXdq8l6eayDT0PNpC3aS9UldZ4DcCaCDtxw6XCbEMwt4A6
         ciYU2Tm4+c+NlEm8mHAJN58vyOx9gikvyyUawSELpF5XK03ARp+uhNLboQI31n1VIqRE
         p/DAvRuk2RCt3LHOP70rV9o/TiaSw+HdoA0anUiog/xNJf1DZAN/1Iy7qIA7BYF8mvVy
         GjhnAwn4Bs7jxC3saSXbS6FT//ni2sDI8Io70O853lz3OGIz0BY8w/jCx6IbnF+XSrqu
         T7uw==
X-Gm-Message-State: APjAAAVDt0Zy7cItHy49fC4FHuVot1g/gogiDBZMdTrVRqc41A3rQTvs
	eochQYezGy2iJ8drXeQ3DTs=
X-Google-Smtp-Source: APXvYqyOtrjwlUEJeSHijDnUPwPdKj2t+dQOwCz7rPrEobBM1hLSkZAl7gPjaHTUHY/epTcIno4i6g==
X-Received: by 2002:aa7:8c03:: with SMTP id c3mr17281855pfd.139.1567163464895;
        Fri, 30 Aug 2019 04:11:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:9a89:: with SMTP id e9ls1728895pjp.0.gmail; Fri, 30
 Aug 2019 04:11:04 -0700 (PDT)
X-Received: by 2002:a17:902:d717:: with SMTP id w23mr15398453ply.321.1567163464266;
        Fri, 30 Aug 2019 04:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567163464; cv=none;
        d=google.com; s=arc-20160816;
        b=cjFMKO/18fdiZxp6mkM2xvnxK8SfS9fk+b1wNYmrcXOM9OplGHGKTxlSe1ena4ZTGl
         xbj20bhuIEqMsaOtiQJi7gbFxJPt9QAyy8MjIG+QkS3cTiL/qvd7eP9UkujwjdACwrax
         NlTgPt053A3X3TuatB1RrLC9URES6ItPjZjC0xZVINrHXQ1CbMoaps+eAgJfQXbVcE0G
         vu+f1WtBFkJMPfiQSkkz7gJUc2gT/yd7iZeeEE2WeAjrUi/IS9pxvvKj/hWB85vL7bJO
         +WPLbrGDpMxzJDP9BCwoOBms5MKz2ZzJc+kuPPvykntW55yW7hYMxMtxr6Zs33Nkn4zH
         a2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=fAPSMxcCjDK7wwRNHU8kqyYcttrO2avkRVIEbUrC3FI=;
        b=tUEh4KvSF3wYItzPc9dZGB80F4vKMOqBwwAfXA73r1b2BsOtCEEoyipw5L53PnYIxc
         jwgxvvV4OUtpVp2e75D/EyDzMHo3YsFEcOVheXrmoS2KJxTb5dzjYn75s02+lsVVK3GX
         xthuUB8nkxubfR/D8T07m7rg/FLO6UhbmEMwJnoUAC+WGNO9Q2R+x1YOwf0n2hoouHcC
         LTgcp6MIf7RhdS9+S89PNYu4u4XSFOhCdqsHX1j7q4nGhQY8s7PoTEDbCAP1kI6/EIlb
         gsPJYGJGXBgkSPz1k02GRRg+XMy3Augi43jU1KNrhOTlLTg+pXyfNEkCE0uP+1em6LiY
         3BHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="jy/fMQt/";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id q2si271030pgq.3.2019.08.30.04.11.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 04:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UBB0B5085857;
	Fri, 30 Aug 2019 06:11:00 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UBB0jv061978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Aug 2019 06:11:00 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 06:11:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 06:11:00 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UBAwoL122027;
	Fri, 30 Aug 2019 06:10:59 -0500
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
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <d8b1db29-a239-0a81-65b1-b50aabbc45a8@ti.com>
Date: Fri, 30 Aug 2019 16:40:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fe0f6bd7-1b38-57ed-6e27-ab97a16d751b@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="jy/fMQt/";       spf=pass
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

Hi Jan,

On 30/08/19 11:51 AM, Jan Kiszka wrote:
> On 30.08.19 07:38, Lokesh Vutla wrote:
>>
>>
>> On 29/08/19 8:21 PM, Jan Kiszka wrote:
>>> On 29.08.19 16:10, Oliver Schwartz wrote:
>>>>
>>>>
>>>>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
>>>>>>>
>>>>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>>>>> I=E2=80=99ve now tracked down the error to power management, in pa=
rticular to
>>>>>>>> clock gating when autosuspend is used in IO drivers.
>>>>>>>> The drivers in question, spi-cadence.c
>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/=
spi/spi-cadence.c)
>>>>>>>>
>>>>>>>> and i2c-cadence.c
>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/=
i2c/busses/i2c-cadence.c),
>>>>>>>>
>>>>>>>> use autosuspend and turn off their clock when suspended. This is d=
one
>>>>>>>> using the PMU (Power Management Unit) firmware interface
>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/=
firmware/xilinx/zynqmp/firmware.c).
>>>>>>>>
>>>>>>>> The firmware interface can be configured to take a hypervisor into
>>>>>>>> account, but my guess is that this is not yet handled in jailhouse=
.
>>>>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be dis=
abled by some
>>>>>>>> kernel configuration setting. However, I can work around the issue=
 by
>>>>>>>> patching the kernel drivers to disable autosuspend.
>>>>>>>> This also effects any other driver that relies on PMU functions. T=
he CAN
>>>>>>>> driver
>>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/=
net/can/xilinx_can.c)
>>>>>>>>
>>>>>>>> spits out a message "pm_runtime_get failed(-22)=E2=80=9D occasiona=
lly while
>>>>>>>> jailhouse is loaded.
>>>>>>>
>>>>>>> Interesting. This driver also exist in upstream, but not yet in 4.1=
9 that
>>>>>>> we use on the ultra96. Which of the communication methods does it u=
se when
>>>>>>> talking to the firmware? SMC or HVC? Should also be encoded in the =
device
>>>>>>> tree.
>>>>>> SMC is configured in the device tree (obviously, as there is no hype=
rvisor
>>>>>> directly after boot).
>>>>>>> Anyway, I would try if things still work when disabling this driver
>>>>>>> (CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest request=
s would
>>>>>>> be a task for later then.
>>>>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZY=
NQMP is
>>>>>> selected (see
>>>>>> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arch/arm64/=
Kconfig.platforms).
>>>>>>
>>>>>> My feeling is that disabling ZYNQMP_FIRMWARE would be counterproduct=
ive
>>>>>> anyway, as starting and stopping CPU cores is also done by the PMU f=
irmware.
>>>>>
>>>>> 4.19 upstream seems to be fine without this driver, including CPU hot=
plug
>>>>> (which is power-wise a nop anyway once Jailhouse is running).
>>>>
>>>> Interesting.
>>>>
>>>>> But I agree that patching for that purpose is not convenient. Conside=
r it
>>>>> more like a first experiment.
>>>>>
>>>>> For handling SMC SIP calls (which is what the PM calls are) properly,=
 we
>>>>> would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()
>>>>> (hypervisor/arch/arm-common/smccc.c) and start interpreting the reque=
sts,
>>>>> rather than just rejecting them. No idea yet how tricky that may be.
>>>>
>>>> I=E2=80=99ve taken a quick look at the Xen code - no idea how well tha=
t translates to
>>>> Jailhouse, but the core functionality doesn=E2=80=99t seem to be overl=
y complicated:
>>>>
>>>> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca917=
32971e1
>>>> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilin=
x-zynqmp-eemi.c
>>>>
>>>>
>>>>
>>>> A proper configuration interface may be more work, though.
>>>
>>> Yeah, looks reasonably regular (thought still rather lengthy LoC-wise).
>>>
>>> Lokesh, how does the situation look like on your SoCs? Is there somethi=
ng
>>> similar so that we can think about a common configuration model?
>>
>> This is not an issue for K3 platforms. The communication to System contr=
oller(
>> PMU in case of Zync) is via a secure mailbox channel. So Jailhouse just =
need to
>> map the mailbox address space and root cell can communicate to the contr=
oller
>> without any disruption.
>>
>=20
> This isn't about the case of fully trusting one partition to own such kin=
d of
> control. It's about moderating access, giving a partition only the chance=
 to
> control what it owns. Or is access control configured outside of the hype=
rvisor
> in your case?

In short access control configured outside of hypervisor.

So IIUC below is the flow for ZYNQ SoC for controlling a peripheral:
Linux_driver->smc_call->ATF/PMU firmware-> enable/disable device. Since
hypervisor is trapping the smc calls, pm runtime is failing in this scenari=
o.

In case of TI devices below is the flow:
Linux_driver->TISCI protocol->mailbox driver->SYSFW->enable/disable device.
Hypervisor is not in picture in this flow, so this is not a problem.

Let me know if I am not clear.

Thanks and regards,
Lokesh



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d8b1db29-a239-0a81-65b1-b50aabbc45a8%40ti.com.
