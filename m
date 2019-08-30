Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6UAUPVQKGQECTNRZJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA5A2FAF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 08:21:47 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id c11sf2117906wml.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 23:21:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567146106; cv=pass;
        d=google.com; s=arc-20160816;
        b=fTmiCiYpzfnlPIVbKxE7enn+1VFproZXOwpF8LI0WUdVsM2epiBGghXQvUv5Bck9FL
         8SKVHFL9fQxD0yt/CH7B5PSCd/8HzkZvfEwyNXsVqqDrGvQb2zyGkH2j/z82Y9qSX7hH
         4VT7J527yhY5WimtdC0rxvH8199meTFIl0eqZae0tNuOTQ/WW7a0MuA1GlWh3lHImWej
         vx1tqoKxYTDpo7F2d6eVC3qw7loBoObkKeysde+0CPPAndaI9gfepW6oLySeablzLDGu
         pd4ZhBVppJBHy2PZjBKH9Fs5P2ZZCaMnpJV149SpahqblWlBLUp8TlnDelqHCM7nEyN3
         xjuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=8t692Sjc6Sa/X7FJMKOkI74FWLK7N/ENe9uN89UsRvc=;
        b=abo+L5DNcC537mfWO9jGEYTQ26oCzLHc/WqypHK8JwI3y4K3ZupOA4InXYy0BPf+K/
         EnkcImwgrcAmR6qwyYzJANLX5mCyfqi38vt249C3b833l83fIJDVw1CUZ/MSjVc955Lp
         pwVZq3YnUoIfp3/iz9J+Dh5dZD8W7zPpY34XH672ecqlDI7fRlHZXbcCo60IxC5RCXgk
         sKXa88YJyC/96sXXsWQ9HK19r2J2/5GYwUJXhebgWj/TqcriMUbKBQcYJMPNM1fuHMHd
         UYGlTer9wPyFGL+vq6hM+ZYoZ//6l7DaqV2l0+UJzHJJnTsIe3nEBknfDh9kcCNlINRt
         WcXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8t692Sjc6Sa/X7FJMKOkI74FWLK7N/ENe9uN89UsRvc=;
        b=XVwRgUPqvME6aqWBPC95k/Z3x6lejhzfbAQQy6eaoiLqUYswCyP97dLnIwxNJTM31H
         OkNXVAiIUkl1UqTutaXGhbFwmpz1eqBHBbrw4Im8GudgJWgeMJ57JH1WfarKRkceH9Dx
         kAXkftmMwMmx1usXNNJ/0g7Z2826F08RhYEUaVhezdGDZkddIM2WiYcwVLejD9KoSc4/
         81GYa/xMDlz+ZE2XzNTJwfXINKJ7XkBhz4jx4X4z572lsOk9v9KmcINhxG6de1dXcfoG
         YrCtie1bKjppN93qkrxLPMkJCHui6i/kMZP7IB52/Gj0r6LxEokF36BVbCncmBUIahYG
         ESMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8t692Sjc6Sa/X7FJMKOkI74FWLK7N/ENe9uN89UsRvc=;
        b=bQm5Qmz82m1KJMKas682PVOIPnRKrs4+KZENOtb64q5IomllNzD96Y5iBi73w+6+v/
         CtBx+HOLLxE7IABpbT9umpE8niwed1YrtAuc0HUP7nS9Bb66ywNmMhXYcTXjuh3K5D28
         0lGv8ny+sRKVfQ7l4F9+HL1+0zGYDYdm16HySXDN5qcLEfGWj1U7ndi+sJxQZ76Xadtz
         N//ofyhH5pxFi4g9g0NeWgN6L2aWGPaEUa+7wBUiAE0gtVYvtWsaAEhR0khy0igIxgTQ
         5V7MnFvUS913tFThgnIjIerLRSQxnS/xFCelRNL1RCQ6PLougH6JunoOFVm3vuem6t0l
         yv2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW50HhfDr5uL1VHwFgfsffnB04LyTjD92ULNIxTMG/TLG05b4q2
	kQ/q+5L7RDBIMoD0YIv2Kd4=
X-Google-Smtp-Source: APXvYqx/NRJEvcbpNwzP0aD8w/g+o32gGPK0vjAlPUwoaq5din3JQngLKImbKMZ4kUKdAEDC2F+dHg==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr16272095wmc.131.1567146106828;
        Thu, 29 Aug 2019 23:21:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c141:: with SMTP id z1ls2143952wmi.5.gmail; Thu, 29 Aug
 2019 23:21:46 -0700 (PDT)
X-Received: by 2002:a7b:c758:: with SMTP id w24mr5637269wmk.143.1567146106173;
        Thu, 29 Aug 2019 23:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567146106; cv=none;
        d=google.com; s=arc-20160816;
        b=omnfSmdC5MjVEOczmSLW0OXdfCA74KHKLcqg+3Gn+YRCNWKDe1Pp0hxDVIgU+3hntV
         gcZfLBo9OXQsHMfykC1MfOjlk8kLdtcOvYWRyJE/bKYXKgTJ/E6/iV/K77AShjqK3ck2
         NQcFJ9JH6POzgAvizOcUa61gy0uTFr5hv2M6oxW0CAcde0UWiKWA7PAk+Ymaw+9onu92
         5UsKkGAqyklnq6hMK3z0HTY8E+WvoFOmjV+rE02Lq88iMhbzK9x5G9Y7pSU77rvkZE4S
         uStBYoOW/qNmSAFh8uskJWUhf8sU1QdkuLAbTJLv88LQmE7FON7JFZWARYvDNsMiDwVa
         IOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=OgZ2OH/QAPymsh5WmO4lL5tn96BTnJwd1zQHPjbcgbU=;
        b=g7gZfdLhoqGlBX0j1g3nYriyj4CaRobe9ljgxBmBZI23URsSgxcQsmniqFpTLKSGRI
         O9kjBo/Mz0EORucGjvAm5eXLFDgZWdRBVVFl3aRKI6qAnXEHE4flqRCvz4toK1uFJt1/
         QGZs/v/u5p1q6h7baCAZHWI27bJtUUeIWm7PXYEk1PfAOMGo2sfee39uJCsVO9uFon4T
         hJ7Tw0zErn9tLWJIcWAMa0g2oMSIy504VevymF6WnffeigYIdQ8pCVxSWziDX311AwCl
         Vtp51iTTI93kuZrbJ8FCr5jT5xRkSjAVBfiRNyKyBN2eL7qTyO2sgqcPzznz4qoVowuJ
         LznQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w17si260700wmk.1.2019.08.29.23.21.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 23:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7U6Ljw5006723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2019 08:21:45 +0200
Received: from [167.87.14.242] ([167.87.14.242])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7U6Lhdi008567;
	Fri, 30 Aug 2019 08:21:43 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fe0f6bd7-1b38-57ed-6e27-ab97a16d751b@siemens.com>
Date: Fri, 30 Aug 2019 08:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12948446-f755-3846-4cc0-9cbea4908291@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 30.08.19 07:38, Lokesh Vutla wrote:
>=20
>=20
> On 29/08/19 8:21 PM, Jan Kiszka wrote:
>> On 29.08.19 16:10, Oliver Schwartz wrote:
>>>
>>>
>>>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>>>> I=E2=80=99ve now tracked down the error to power management, in par=
ticular to
>>>>>>> clock gating when autosuspend is used in IO drivers.
>>>>>>> The drivers in question, spi-cadence.c
>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/s=
pi/spi-cadence.c)
>>>>>>> and i2c-cadence.c
>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i=
2c/busses/i2c-cadence.c),
>>>>>>> use autosuspend and turn off their clock when suspended. This is do=
ne
>>>>>>> using the PMU (Power Management Unit) firmware interface
>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/f=
irmware/xilinx/zynqmp/firmware.c).
>>>>>>> The firmware interface can be configured to take a hypervisor into
>>>>>>> account, but my guess is that this is not yet handled in jailhouse.
>>>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be disa=
bled by some
>>>>>>> kernel configuration setting. However, I can work around the issue =
by
>>>>>>> patching the kernel drivers to disable autosuspend.
>>>>>>> This also effects any other driver that relies on PMU functions. Th=
e CAN
>>>>>>> driver
>>>>>>> (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/n=
et/can/xilinx_can.c)
>>>>>>> spits out a message "pm_runtime_get failed(-22)=E2=80=9D occasional=
ly while
>>>>>>> jailhouse is loaded.
>>>>>>
>>>>>> Interesting. This driver also exist in upstream, but not yet in 4.19=
 that
>>>>>> we use on the ultra96. Which of the communication methods does it us=
e when
>>>>>> talking to the firmware? SMC or HVC? Should also be encoded in the d=
evice
>>>>>> tree.
>>>>> SMC is configured in the device tree (obviously, as there is no hyper=
visor
>>>>> directly after boot).
>>>>>> Anyway, I would try if things still work when disabling this driver
>>>>>> (CONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests=
 would
>>>>>> be a task for later then.
>>>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYN=
QMP is
>>>>> selected (see
>>>>> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arch/arm64/K=
config.platforms).
>>>>> My feeling is that disabling ZYNQMP_FIRMWARE would be counterproducti=
ve
>>>>> anyway, as starting and stopping CPU cores is also done by the PMU fi=
rmware.
>>>>
>>>> 4.19 upstream seems to be fine without this driver, including CPU hotp=
lug
>>>> (which is power-wise a nop anyway once Jailhouse is running).
>>>
>>> Interesting.
>>>
>>>> But I agree that patching for that purpose is not convenient. Consider=
 it
>>>> more like a first experiment.
>>>>
>>>> For handling SMC SIP calls (which is what the PM calls are) properly, =
we
>>>> would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc()
>>>> (hypervisor/arch/arm-common/smccc.c) and start interpreting the reques=
ts,
>>>> rather than just rejecting them. No idea yet how tricky that may be.
>>>
>>> I=E2=80=99ve taken a quick look at the Xen code - no idea how well that=
 translates to
>>> Jailhouse, but the core functionality doesn=E2=80=99t seem to be overly=
 complicated:
>>>
>>> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca9173=
2971e1
>>> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilinx=
-zynqmp-eemi.c
>>>
>>>
>>> A proper configuration interface may be more work, though.
>>
>> Yeah, looks reasonably regular (thought still rather lengthy LoC-wise).
>>
>> Lokesh, how does the situation look like on your SoCs? Is there somethin=
g
>> similar so that we can think about a common configuration model?
>=20
> This is not an issue for K3 platforms. The communication to System contro=
ller(
> PMU in case of Zync) is via a secure mailbox channel. So Jailhouse just n=
eed to
> map the mailbox address space and root cell can communicate to the contro=
ller
> without any disruption.
>=20

This isn't about the case of fully trusting one partition to own such kind =
of=20
control. It's about moderating access, giving a partition only the chance t=
o=20
control what it owns. Or is access control configured outside of the hyperv=
isor=20
in your case?

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
jailhouse-dev/fe0f6bd7-1b38-57ed-6e27-ab97a16d751b%40siemens.com.
