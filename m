Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVR7D3AKGQE3GVRQMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB701F1700
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:53:50 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id s4sf5920338eju.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:53:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591613630; cv=pass;
        d=google.com; s=arc-20160816;
        b=S1i96y8B+NJwYIE3qqZNvNDnKPe8/4AoixDSyL5DWxu4jqflYZyrAfwJ5d4Mlk7geJ
         Ydak95McwllYQSQj+iuJV52qksw0LC2jI8k8t0HlytUSjBYFsp/joRiIx0oa0m59MKwi
         cLV9cIpAHDaccrCvWzLIIKMpOIJcK3dYk28PFyEZmPQYZJQ8CPhVNptvfuRWmqIT4Nc2
         Ob3N81uSi+nX1dD3al865LVJiunoo5ODwOM1RE6RiUh1KX/DLNrJ9vuX+JaHUVEChvMY
         WxYFLR/MAZjr7wuALWyxsIP+KivatBTRKaIXRFDvuvBEClXvBB2WdMyiyVBsufJjIoKF
         BExg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=S5vckvviu+N52Z9WiIJW9PZQysTruYIvzylJLwPrgkk=;
        b=TWU8GLHOU8o/369//FZJynLny5jkOizkonbROm4FUJZf2rZ/A4Cc3ktTuip25fztFY
         CNsYP/CPF5A7hF3en7quirA5/kicIZ8qKY6VCjMqOSyi72dK+BX+RmPkbmTy6Zn2vkF+
         N+mrMC8QzztDZVDp5S4JdiRhVLSTQNFE/WjReZZgNKSx1y4fhrqSq8VQWSGU5lC23whh
         ZDN2y8kiIOev88JvJiTnYnpJHwb7MDrqwu2SmNBwftzuVEFlJkVEdqW2X6+q1aOM7R6M
         gl+6hjwXy2iwgRb1dYE05NnNwWpd+90T0a0jwWiVMbebE/sdKpnkb8GR0lpoQef04B3n
         Nj1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S5vckvviu+N52Z9WiIJW9PZQysTruYIvzylJLwPrgkk=;
        b=K4yzCV/sKYbkR+CemWlvrbW3ZS9f16+5K9lJ5FCzZY89+gUd9+RmSlNTdPsXZtUcjo
         PnKDqgUqwln+79XA/Rr9dCG+45GjLU/UWt0o3Eh4Bx7A9N2m3Am1ens0mi3sQb2EzOTP
         ZxaLBE3mRyDac1EjTDrOUuGj8CNsq5v0bMx718QJCj1kLfL17og/a21cZPUoPHOOCfQz
         2OWtopa2ok4gadNQ5x5+zPeHMCyh2Xan3W3G9q3YoWjURlJ4gKIggv/HGwz9bJNtmsKP
         DOeVuuGwuHMh9eiLbxVyuMIQQb/7qnIEfQbIrlYTBZ3IfFWhSU+iXDGe8M+k7m7Z4hnC
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S5vckvviu+N52Z9WiIJW9PZQysTruYIvzylJLwPrgkk=;
        b=OE3f2w1g0U8mISUsFijF4GOMQ+XTrgFhrCoFfyTcwNKeOHFvz7ae5ba+2mG4Xdqj5S
         +u9IjbThxazId7dsbs5DMcissu0FyNoNwJAdI0ABrlVztPvGL/QvnvlOTq1ay3J0k4qM
         5kr7Kvc6EYPo/ZlvdMedQptVzIRgtu2d+MrsBPcl9Ec2bdk+7aJ6V4xaRKhtHRe8+6ZM
         ljgvH88BiGH+d2Da7SEO9KdQMcLHZU6fMJha0xee4phARirz/eONfiTqgpkEgpnFqY+m
         utB2oCsV1KqNJ8wWgvYozZVy8RMxQa+Fei85rUlXkJQJv273D+oxSgQV+GJoVxUHn3ds
         7h1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533180QZn612AZ7xKRRLOIbr2X4Jsb+d4lld48IC2VwNARYyNhon
	yOdl4Xy/1obmjnPjAbBZlAE=
X-Google-Smtp-Source: ABdhPJxT5qxG44+hTmQUGdH7s5ZDkHZtMot7CltNFqt4taDued3qlEZNki7W0FxEbRFFcxtoNHzalQ==
X-Received: by 2002:a17:906:370a:: with SMTP id d10mr20033632ejc.433.1591613630424;
        Mon, 08 Jun 2020 03:53:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:71cb:: with SMTP id i11ls7227961ejk.11.gmail; Mon,
 08 Jun 2020 03:53:49 -0700 (PDT)
X-Received: by 2002:a17:906:4cd9:: with SMTP id q25mr21231730ejt.175.1591613629534;
        Mon, 08 Jun 2020 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591613629; cv=none;
        d=google.com; s=arc-20160816;
        b=yf8OnwyPwHlRYCyfSLUwwfkLtTeR6s+wdWD9rwPl76+tqS2L2xfhZ/KxKcACeafQuz
         qyFEcYv4R367jet73R9SkRx5VXISkUAyeJ7LQlPxTJa7OSGcG2ZSGYth44/q9I4ql1Fl
         rB29nRys2V/ow+Rb05MNF8Dmatvo2h8n1qSQ4XqdHGcILViNzV+iz9k5WoS/c0Yisr2/
         jKaI57F75QQQ8lczNNadvcjZUQHOq7CS8lwRlVU0jePKsvZX6B0dK3Aklp3Xz3YejpEm
         fi1XTMZZdFd1gtSbN87cujjHORW0HWZyUfyFx6PqsOGm/hzglh0OyPltCZRftzSmwazd
         2xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=QE6J7PJSzE1yPjgrELqdQM1iqTjni4al0z9pMIqrpdE=;
        b=t+juFghVx3EfIw9O+Ea0DVtKC3mKioed0aM1Uv5jvTX7tbbHlhHytMxMh1ZtZ/gTML
         HZbGPuMZSO5zllOlXcKqGaK+qPUFFg35syu51QL112kXrdn4Cz9aoedMAboR39vKXODc
         73XmjswQyMWV1pLmQzZ8j599xI1ZIz13vkva2k5ykWQhP35ubGMpzNkhNl7i6pFaIlpa
         zqs74ENB1xCixQksJtdocjFRXrzRG21L09fGOBp+iabndaSWqMiXBgOm8meDkjLF8teB
         sqR3qgUgvXqz4jrwEwM/BZ68FMHg85Z4oGHL3alwWJ2ZiaAUxzJhy8SwwP3YJdF+UHoa
         zbDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a23si625422edn.0.2020.06.08.03.53.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 058Arm0i026107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 12:53:49 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058ArlbY015965;
	Mon, 8 Jun 2020 12:53:48 +0200
Subject: Re: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with
 PCIe
To: Kishon Vijay Abraham I <kishon@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <20200527122358.14723-6-nikhil.nd@ti.com>
 <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
 <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
 <3947221e-c8a1-66fe-4f6c-21edda8b5ef1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <43eac381-8a67-36d6-c01c-68555d20907b@siemens.com>
Date: Mon, 8 Jun 2020 12:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3947221e-c8a1-66fe-4f6c-21edda8b5ef1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 08.06.20 12:24, Kishon Vijay Abraham I wrote:
> Nikhil,
> 
> On 5/27/2020 7:16 PM, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 7:01 pm, Jan Kiszka wrote:
>>> On 27.05.20 14:23, nikhil.nd@ti.com wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> PCI kernel framework requires that all the instances in the
>>>> device tree either specify the PCIe domain or none does.
>>>>
>>>> Currently, Jailhouse dynamic overlay describes the PCI domain
>>>> which causes problems because root cell DTS does not describe
>>>> this.
>>>>
>>>> Fix this by not specifying the domain in root cell config.
>>>> Also, fix the size of the PCI target region to match with the
>>>> correct description in TRM.
>>>>
>>>
>>> Please rather patch your DTs to use the domain ID (upstream). This here
>>> means that you will get a new domain ID on every Jailhouse start.
>>
>> +Kishon,
>>
>> Can you please let me know why are we not using hard coded domains for PCIe
>> device for J721e?
> 
> Linux PCIe core itself assigns a unique domain number for each of the PCIe
> controller instances. J721E SoC itself has 4 PCIe instances which can be
> configured in RC mode or EP mode. Hardcoding would mean users will see holes in
> assigned domain numbers if a particular PCIe instance is configured in EP mode
> or a particular PCIe instance is not enabled at all. It'll also need users to
> manually add a domain number which is not necessary.
> 
> There is no real usecase in J721E to hard code domain numbers.
> 

An alternative could be fixing upstream to do proper recycling of
domains. The primitive

static int pci_get_new_domain_nr(void)
{
	return atomic_inc_return(&__domain_nr);
}

is biting us.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/43eac381-8a67-36d6-c01c-68555d20907b%40siemens.com.
