Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WMT7VQKGQENGJJTKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id B290FA1DA2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 16:51:34 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id o11sf2200212wrq.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 07:51:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567090294; cv=pass;
        d=google.com; s=arc-20160816;
        b=kXzDqqKZDpghgYr2jt9xYzqJigHecNGoHX8b8JQDA8zrBVz1UDrDXIN3IMnu5eqmfC
         bAcigXs6a7rHq/ZevyrHFNt77UifLsR/zM7GV4Lt6d6EFwoTdGhw5cMvix3njuUCyibQ
         ttn8x7U9/x8/S7DNJT5EwaxtJ5x1G3dYXcFhDr7gBAoG52bgzZsAAnW7eIcItXZu8vXA
         fyGQIT2WssC62zCnKauEv2kdwBKDRA6r/nJeJ3fufv/4tA97UczAeOAPlkxftfaeacqC
         hdwNw4fyI8eYQkpmuZMSVNVkjeA//zR1j/y5y6geygIQg015x6UQ6AeIY6AItL7JGHsv
         uMBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=0+/f4KOiNdbVDBqPJSw1122ziYCuKibNvIfYgPxJy50=;
        b=WAv5rYvvL4Z6YCTzTbezm8eF7if3XDr4bL0eXJtsitv4plUlD2AwltSj59HSFoLMn+
         3Y6C8xbkaiG8yyEBtGPeBXA5l1q/Vxn5W61q6fACN8XX+AGhLZMV1fO813KCSuma0CrX
         9rvYAyGNqbGoiQCPYIXR07hLdvWM1gE/wPMzy2Ddo+mOkHAtwLlzAf+W+Yv2mF73UEAb
         gaKFx5QvPLGxPfjqf5ddW3Gy0ELWxMvRnaynUyB/QKySa/reD6cBbwRjrvFhDcmccuPD
         k6wPFMrdcltGB4ayDBSiQbB7HmL58GJIWbIkjUk57YzgpyCDkTbMWVgFpADDWO2cJu92
         /HUQ==
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
        bh=0+/f4KOiNdbVDBqPJSw1122ziYCuKibNvIfYgPxJy50=;
        b=PbB3mPDN87BcAV9O/pYX5ZLvxNeqSESBfcJztfjb4cmeK5JfT/dhWDAMq6qPOYhV13
         WaSGla7aRL9wG/V/t2BzolEl0jCg0xYFpXPbXshUzRSMIOlOA501LXl0ovtLx5Irmeqj
         t/LtrFDXkcGe81PnOl+GUsH//lgWUHrTeDpnNEvQ9sSMCM+ZYMfVf1byN8hEHviyeA5N
         m4M+xKx+SR6oROdZtVfig3qaOJoWn/RMSmkCNfsEGALCtnKFsipTih2iVCfU7b7m9XHC
         6VjBR6yON+Li7rwX0Ny3JqQmf4y2OrgAWpjuEYE8he1gDVK/8jUmYuHuufCYhrE+OG0q
         Y7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0+/f4KOiNdbVDBqPJSw1122ziYCuKibNvIfYgPxJy50=;
        b=ufJMsal/9SwMrLpHEITHRH8+WcBtk8H/Q3Fb3BeMsqbI1iK2yQ2xMV1JDgd3Ko4NsZ
         JWLJKhZzQXzqHKeDfaB1l/vCusQCZd2L3r4pr9AtmE821Cn4fYDH1vuscnLLLsfz9Le4
         47E9Ux0+5B2y846WEiLUGgCVExibEzmHaIzQ9DAjCYkCcHIFj/c4huXA8PqG2rh7WkD4
         s3l4o9VEz84jLcK5SG/oSRyTpLnfuQkpBQIlwxVGjkYNGLrog6rTW/ak9jTBFV0fa4g6
         NH7B8btBATXAQ3MVQapVtw9OJGqS1rLubXEab3qwJIxkUBxkyzyQv7qYucVA8wBYJuup
         Abgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVz28Wc0vdde1aMqCXX5FalhsggMH3/M97t+XXEQMxMAiaFh7hu
	BjLM7Yzp2/PlXztGUCHoJ9c=
X-Google-Smtp-Source: APXvYqysjyX0AsVPJX0xEJ5GsUOC0uv+GFaAG3sptT+jAza6paRb5thTgBjJBTfNIAUUfGnYCRAR6g==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr2130923wrw.90.1567090294330;
        Thu, 29 Aug 2019 07:51:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c141:: with SMTP id z1ls1157845wmi.5.gmail; Thu, 29 Aug
 2019 07:51:33 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr3786014wmk.26.1567090293577;
        Thu, 29 Aug 2019 07:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567090293; cv=none;
        d=google.com; s=arc-20160816;
        b=zJH2DR+FxGuKe37ToLdeqYdtXHUAf+HIeyjor6LlU6k5wrJ4AnLevKqGW/OOC+Ape8
         PwsXzxuJOQ02dVb+XlUaz6dGEJD/lkrShKVn8pkJkXQMTvz1HXJm5h6c4kyNA8iKHxQV
         CCQ8vIlQ3pqAo+ZVFx7WcYuMbLqFc5AbORM/Ztix+x4EbpfYPvaAO8kY2Vo31/yZ5W4i
         Vp/zkHmoiEOWuzwQVwrvK/kW+Ai12h+vDq6nAEZK4RPXjsH3d7P0Yt0R75Y0+jnbj1rr
         cLaHvzJmvIEqsweJOLapL9hIfLtyTos0jC3uGtCW+MADiOjuVgpvP5yyImF33f68L97W
         Jolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gl/Rele9e/VzmCkVPqqQX0Wx2uFBIpHSI9Z6ZhYRcoo=;
        b=IehKW5ylugr8YIhg76XKq7e7eABM3GGB6A4onYZQOA0++pFbHdABRFk/a3T0D9GPwy
         p48TkkMWZR3hoeLHK5pC2yQ8qWB6gpU1ogYYnI5pf4szHhC2xPwYOcvXFiyZgEVtX3Bi
         5e4IrAT6brW0RFuKVGwx0t9DqgAStyuEqDHieotQ9gVgvxRw37VOplDv3Nh5OewI7DgL
         4Kr53FnzhijmrxSrHudV2ouCXeUg9pzxrnQl1jo71b27Raa5FbMiYpurSl47b8TsQdDe
         pR4D2Hegv5b6i276EJbul6umbtEoqBdGtCc6GT2aCG8XeFyKAU+OoGatAuoN4X36tTWf
         XyPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s194si204759wme.2.2019.08.29.07.51.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 07:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7TEpWLw010736
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 16:51:32 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7TEpVoB018019;
	Thu, 29 Aug 2019 16:51:31 +0200
Subject: Re: IO access in jailhouse root cell
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc: jailhouse-dev@googlegroups.com
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
 <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
 <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
 <8d357767-95eb-eb14-7c0b-785f532e0023@siemens.com>
 <99CD5EE5-DE59-4EE4-BC0D-73CEAA506DFE@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c35a9902-9187-ebed-6bbd-4b7c0947de3c@siemens.com>
Date: Thu, 29 Aug 2019 16:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <99CD5EE5-DE59-4EE4-BC0D-73CEAA506DFE@gmx.de>
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

On 29.08.19 16:10, Oliver Schwartz wrote:
>=20
>=20
>> On 29 Aug 2019, at 15:14, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 29.08.19 15:06, Oliver Schwartz wrote:
>>>> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 29.08.19 08:41, Oliver Schwartz wrote:
>>>>> I=E2=80=99ve now tracked down the error to power management, in parti=
cular to clock gating when autosuspend is used in IO drivers.
>>>>> The drivers in question, spi-cadence.c (https://github.com/Xilinx/lin=
ux-xlnx/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (h=
ttps://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/=
i2c-cadence.c), use autosuspend and turn off their clock when suspended. Th=
is is done using the PMU (Power Management Unit) firmware interface (https:=
//github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/=
zynqmp/firmware.c). The firmware interface can be configured to take a hype=
rvisor into account, but my guess is that this is not yet handled in jailho=
use.
>>>>> I haven=E2=80=99t yet figured out if driver autosuspend can be disabl=
ed by some kernel configuration setting. However, I can work around the iss=
ue by patching the kernel drivers to disable autosuspend.
>>>>> This also effects any other driver that relies on PMU functions. The =
CAN driver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/driver=
s/net/can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=
=80=9D occasionally while jailhouse is loaded.
>>>>
>>>> Interesting. This driver also exist in upstream, but not yet in 4.19 t=
hat we use on the ultra96. Which of the communication methods does it use w=
hen talking to the firmware? SMC or HVC? Should also be encoded in the devi=
ce tree.
>>> SMC is configured in the device tree (obviously, as there is no hypervi=
sor directly after boot).
>>>> Anyway, I would try if things still work when disabling this driver (C=
ONFIG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests would be=
 a task for later then.
>>> CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYNQM=
P is selected (see https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2=
/arch/arm64/Kconfig.platforms). My feeling is that disabling ZYNQMP_FIRMWAR=
E would be counterproductive anyway, as starting and stopping CPU cores is =
also done by the PMU firmware.
>>
>> 4.19 upstream seems to be fine without this driver, including CPU hotplu=
g (which is power-wise a nop anyway once Jailhouse is running).
>=20
> Interesting.
>=20
>> But I agree that patching for that purpose is not convenient. Consider i=
t more like a first experiment.
>>
>> For handling SMC SIP calls (which is what the PM calls are) properly, we=
 would then need to hook into ARM_SMCCC_OWNER_SIP in handle_smc() (hypervis=
or/arch/arm-common/smccc.c) and start interpreting the requests, rather tha=
n just rejecting them. No idea yet how tricky that may be.
>=20
> I=E2=80=99ve taken a quick look at the Xen code - no idea how well that t=
ranslates to Jailhouse, but the core functionality doesn=E2=80=99t seem to =
be overly complicated:
>=20
> https://github.com/Xilinx/xen/commit/d5608349ba4f4a03b749af525c7bca917329=
71e1
> https://github.com/Xilinx/xen/blob/master/xen/arch/arm/platforms/xilinx-z=
ynqmp-eemi.c
>=20
> A proper configuration interface may be more work, though.

Yeah, looks reasonably regular (thought still rather lengthy LoC-wise).

Lokesh, how does the situation look like on your SoCs? Is there something=
=20
similar so that we can think about a common configuration model?

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
jailhouse-dev/c35a9902-9187-ebed-6bbd-4b7c0947de3c%40siemens.com.
