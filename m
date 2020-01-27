Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBAVEXXYQKGQE2TRAZKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B914AB7A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 22:11:31 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id g20sf8081838edt.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 13:11:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580159491; cv=pass;
        d=google.com; s=arc-20160816;
        b=jNMle9UwTU2D3ztkJPjrtXePtfZFmUxLo2INA/kx6zJO1CFOEfsc0Jsy6i04RsV/oJ
         KSDQWW7ixCw0YOno4peIukDhvys8aG3EvV/zPXzUi+13wdGMHkn/BSKOFUppyxgIEvzU
         tzeCmRFgaqPf7E+q3y/qyakB/MDEybtnx+YfAeTQxCZdrj3kbWhG1uoXfc1cQqFm6pmW
         2PDQIKRB+DAlWdyZpjXZ+frJiuR4s3PtNBxdcyoF6lb31cLhAgiqUn3QKh+UdE4kVHjO
         ONiGthg966hCL6+fg0R4C6HwwAHTYXfwlR58ny08ZlJAe5s4zIuaJPwi6i7iA0l8G0VU
         nPWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=k4TS/sgSR91pQJtJ995MNPO5tcqyylqz3osKlfrrlAk=;
        b=qEU2Sp/ZYqyLsVzmpYujkt5fZk6u7ecg0UM5q9NJGOZQ5Rmu6s1T3YcLTWprj3P3ct
         yW3kD60JokVih2MuABU6nbWx6QeuqNWn6G8+ZRTwuGVuGLa4Zs/vMRwdWFSiv6hXVE7/
         7LM/C08zqEp/+8laQns0JkDTTHHI0nMqkm6JHDzhNYFng7GIQyQP3suGHmTB1EM5PPd/
         +/dEkpHd3dzNz0XQ0Fz0W2C+yn4FrddSZia/kdMLgNQWmTncbLcq6dvZXLMsdHWWvgB6
         3BCYksYea0hgCUhfO+/9FteDa6QNTgfQiolp6zN5zOIXUP4KZh8G8kMfcJZqj77ltLum
         qqiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Xx4Edhsr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k4TS/sgSR91pQJtJ995MNPO5tcqyylqz3osKlfrrlAk=;
        b=cgv8JVFClfowGJOwKY5EIqTm2kpSNpwgBa2FhGAjXCEbYX2r0PChk8JIqNSKMCUeJD
         nhqDse3HOwjXUSWZ6qovTUN8GFQb8cirDucirXMtTa5GH3bTQk4OF/4yZUILCpW0OKSR
         h4neKI89Llrt2RQDNPqOUfFubODz8d/MfSDp/YNMqtlMmkalFOeF25Ruwv0DF01Bu03o
         h2r8UOJ3qT+QkGCZcU0QF9g1GqstWJn+J6U6NyYPOmqQ3YP87VGbenBqbaNVV+ucEKdf
         jCKK/z2QJE3vSUW0yZ3Qi7VDUBNv6kyhLUc/Y3Fi/9gvDknHowfPs/1GLlCm+Up6FWLt
         gLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k4TS/sgSR91pQJtJ995MNPO5tcqyylqz3osKlfrrlAk=;
        b=Eonazy76k5T7wu/nGTey/cco2b0TVZOnyzkhDPA9ApYrccY77y8wB0q/H3PvrNuKT9
         77tAFtn5ceM8ltaHiq0WbjKS9BYrVwJxqxjRISkoEuYIKexftpKG6UjZlGqh1JoR/JM0
         ZPk0rm7z+gA1wNLXMMaHHFbIgujN9Xq+3DKFiIEqfY0kuTM6sAu5dPXB9+EJtgyMz/aV
         zXKzHv27jpD0rfgrzcDfBvFuuS5/pMVrBdKCWWK2Y6gFl46kIPYqqgZw2UCxYfTOmq/2
         3/jAsFHzl2eFdDh4CBipAIQfWSH3UNL8S0FGsVoAudqgzA4ALerwQ8HAfx9vD6MNmekX
         YCpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdUaxhV1JbzAhw2csLKqCHtazw4/6cHDe9k8SlFEllmNU5/FmW
	BvVtp0WNYLnPgw2Cl3OE7gU=
X-Google-Smtp-Source: APXvYqzR2o3tcmX2OTz2oZHLN4oMRQohTjCx4lW5adz7FaCPdoGTswqLf/NicYIpVTJ/0v5/J/flEA==
X-Received: by 2002:a05:6402:1755:: with SMTP id v21mr607123edx.49.1580159491181;
        Mon, 27 Jan 2020 13:11:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:584f:: with SMTP id h15ls3878696ejs.9.gmail; Mon, 27
 Jan 2020 13:11:30 -0800 (PST)
X-Received: by 2002:a17:906:3786:: with SMTP id n6mr501659ejc.124.1580159490330;
        Mon, 27 Jan 2020 13:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580159490; cv=none;
        d=google.com; s=arc-20160816;
        b=fmbkb1jimPztK1c981obVkQRDrRo4W86gK8Sy04+K6Du0LGGjSuXA8ILicbhY/M/Vt
         EI3VwP3qm1zhYRlRNGj6yIBlnSfwvd8GOmLUddfxvQj0G/itchtw1FK13mbZJFhFWNyP
         lhCKokw63zVf6/Ozbbw0nfxjAf6uP/a8hXoSQ3L7w1Os9V7Etydx3uFDr9VxBPRcwFqA
         o5NHpXBLIRRYG+58z2BmOEUexPRrKn16yxvjfu6iJj+SSMvkxNwQetq21DlXndxt0OhR
         qbYWXf6P8SvVYT53pmjuP1w5WT7H4jds0wKBBau1wiGrBAlayCd+n42DnXIhKOVVOJZB
         IS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=q1lg/PgAjTUIafuenjBsi9xjAzUymPFc+zFuiF34Iq4=;
        b=VQhgAWuOZChv67WcvWhTkyuSVDB6/NrCqSM8pZwiB8otokdFFsUSqg7R7HQNd6WAJd
         bqggQTc6Wc32f5DZA19SmaggsQjQjkKP85ss6EqaL+6nDLuOeWdYC1P0iuEpNsjcteYn
         +7P8SvZCk1p9X0GXVwVrJ6qYyCN6XWSNgW5gNBe8WQrxXWodTI8kJHN3jYlwGOMcI5I7
         rHiU7QvdLAPnYvV3Qsq8R0uDOozUBRmj0b5WqFgAxpKQ9j5kEGbfVGKJxk2q0Lo5uMX8
         dNZsPery6zuM7rAF0gdJmxtDlnRIhWuZOetRar9zPZOiFeeY8nH1WZyec3qd48Jisny4
         8iJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Xx4Edhsr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id k9si670449edq.4.2020.01.27.13.11.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 13:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrs70-1jaRvb2vGw-013gT0; Mon, 27
 Jan 2020 22:11:29 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
 <7222df54-40c7-6958-570e-9eb50365e905@web.de>
 <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
Date: Mon, 27 Jan 2020 22:11:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oCHMerxGZauviw54eooxeKQGeoXMjqnE0h5pQnepcqwOomPfmHk
 cdDRP3l/b4lXJWULwsG5dIGnz40b21A7WVQigCnx1yoBI1YJG9F+AOuY035/eJ+eCJAXNqA
 S41YV9k0tEkpSaVcxQ4ra2/BfB/LxkQABypmLfjeuIuHZtSbPUvpAJCX6Z8okwtti0u4O24
 dx3ws5/OkdcJc/BtYRweg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nhqp4RuHDLc=:4/aQLJ2mPI5ExkiMoJTQit
 ff/xzFN7VDJU/+WTbB7aLJrbf8YwOYuvaz1RczuoAj8LYs6RaNfaOydbyBmaPAG+kUmROO5OF
 qLSGQkqGFWU0QF+TfpVzOk1EbdqOdUQ3zy8Uw3BYOH7MQlsurgyoOhU4c9vgNTPI6x3HbNR47
 nGNqgwkt/9cTOezhGPwdEP698ipVjnwPnmr+U9MHnj7R93kmJdstdrwjDL94W6ez9saOuuiVe
 HQrXDy5gwipDmpV7JYaGzXq/Lrulsssc1q3I1VWm15Sc7WfKo871vCS5wP+dKtHxNrIhwxQd+
 Nt3zAaqMPRrACp2eFStOY0ThT8fMusz9XmRth4frqeAsHMabOrE7maD5eurL31iqxHDRZGPY6
 SrcIsvHHy7PggUtpTKiWE7E+rICJlRTRmOTrHtpITBh/+qpCL+vZq0kNf7Xrml2+Juzo9/QpS
 Df5rOrHHOUfdKiAWMtiGWsdZld88YknxFBnL39m9+xqGoTy7D0qJmi/2Haqq67cgM2KGSxCFV
 JpcVwXP8Yoko00oNXAjsP3RddLek0VQ2LCeKRdrusb1L+6XS0RLN+OJTBuSwqyveRfOJOCcyK
 8F6t64WJttKRzyCWPfhSzdcJOlZJhOydrLhh4xe0Sc2NjXXzhU1UejV9GMCC4eYkFpyV3Af4R
 X5II6FYnYRfmwb63F7fXO9MI9nploFAKtWNeTm40fdQ/WYj0MhjRrQNeTQNCfVkLXhvLj1Y5X
 MHJZO9v/1VPTx1wn8G+Ur89WgrK0NNl16CiDYaRhb4LXyY+DKMU/RLMO/1jwsNAYz/Ssbji3q
 M8l5JGfDQjkbL3oj14xZ/Nyn3In0uVGiCrmFwly0sOVxl7Q0E+4ZoPjtwIy/Oz8BwV3hjoKy6
 YLhx4gZulgP5LHGiedWZsS6kVlvTc00qp5PGGFIG8UuF66DnCibC+oQ+gG1eAm+cg1szilc2Y
 zi3uzpS/W7Ujwrc8jtoRZPORiKm60VBHxffWag33jsEBPUdUi613IphvQn77xWy4UfGS+Qvb3
 yENpXXfgcPDP1vmEEhtrIro61miba8wKdgfhmGh0D/As+26fvQHNLr+3zxh7FbCdirSIpGD/Z
 7OFJVnOhNk1bRbOZLdbBvy06YSE9nlBtDP/q1OQCktKvovdmqwIY/npVU8Qak0W1pH/Mw9aTt
 lH1W4XP7xZKuCNtcpI3PS9VWUqElIAfb1RdS1uzfYbFjeBAQaBW4kdNXN9El+fUFKUBmR/IWv
 MuK/9IdbaNxJDlp4s
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Xx4Edhsr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.01.20 20:41, Nikhil Devshatwar wrote:
>
>
> On 27/01/20 10:03 pm, Jan Kiszka wrote:
>> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>>
>>>>>> This series adds support for partitioning registers across different
>>>>>> cells
>>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>>>> where it uses
>>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>>> aligned regions.
>>>>>>
>>>>>> However, most of the embedded platforms will have common set of
>>>>>> registers which
>>>>>> need to be partitioned at the granularity of single register. One
>>>>>> such
>>>>>> example is
>>>>>> the pinmux registers avaialble in many platforms including K3 J721e.
>>>>>>
>>>>>> This series implements a regmap unit which allows to describe the
>>>>>> ownerhip of the
>>>>>> registers using a simple bitmap. This scales well when you have to
>>>>>> partition
>>>>>> hundreds of control module or pinmux registers.
>>>>>>
>>>>>> Nikhil Devshatwar (4):
>>>>>> =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_regio=
ns
>>>>>> =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for partit=
ioning registers
>>>>>> =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioning regi=
sters
>>>>>> =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG regi=
sters
>>>>>>
>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++-
>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>>> =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=
=A0 47 +++++
>>>>>> =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 258
>>>>>> ++++++++++++++++++++++++
>>>>>> =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>>> =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>>> =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>> =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap.=
h
>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>>
>>>>> Worthwhile to discuss, indeed. The key question for me is how well it
>>>>> could map on other SoCs. Ralf, do you think it could be that simple,
>>>>> based on your experiments? Or could we also face scenarios where we
>>>> The question is what you try to achieve:
>>>>
>>>> Jan, when you introduced subpaging, the goal was to allow to assign
>>>> devices to different domains, if multiple devices are located on the
>>>> same page. We can observe that pattern on many platforms, and subpagin=
g
>>>> provides a "generic" solution.
>>>>
>>>> So what do you try to achieve with subpaging on a byte-wise/bit-wise
>>>> granularity? Make a non-partitionable device partitionable? That will
>>>> only work for some rare cases.
>>> The main intention here was not to partition peripheral devices, but
>>> just the registers
>>> which are not really related to any device.
>>>
>>> Most SoCs will have something like this where pinmux registers,
>>> efuse registers, internal muxes, MAC addresses, and other config option=
s
>>> are provided.
>>
>> Can you point out another SoC that we support which would benefit from
>> this description method?
>>
>
> e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit
> from this.
> There are lots of pinctrl nodes in the mainline Linux kernel device
> tree[0] and [1]
>
> Currently, the pinmux configuration is described in root cell device
> tree [2] but not available in inmate device tree [3]
>
> [0] -
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124=
.dtsi#L334
> [1] -
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124=
-jetson-tk1.dts#L83
> [2] -
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124=
-jetson-tk1.dts#L1035
> [3] -
> https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inmate-j=
etson-tk1.dts
>
> With this regmap framwork, it is possible to define the pinmux node such
> that
> inmate Linux kernel can configure the pinmux when running in Jailhouse ce=
ll.
>
>>>
>>> This series was intended to solve these kind of register partitioning.
>>
>> So, subpaging does not scale when we have a scattered access map, right?
> Yes
>> But can we use this description method to replace subpaging? The latter
>> registers an contiguous mmio dispatch region, your approach additionally
>> checks within that region a bitmap. A subpage entry can handle up to
>> PAGE_SIZE-1, a regmap currently only 256 bytes.
> regmap implentation can be changed to support 4k pages as well.
> That way, a bitmap can be generated to pass to regmap. But there is
> additional overhead of checking the offset.
> But yes, regmap can replace subpage, however, this change should be
> transparant without having to change the jailhouse_memory descriptions.
>
>> I wonder if we can
>> combine both, maybe expand the memory region to optionally refer to a
>> bitmap for finer-grained access control.
> Yes, that is also a good option, This will increas the size of cell
> config though.

I don't think so, at least not noteworthy.

One benefit of combining both would be benefiting from the more precise
access size control features of the memory region. The regmap only
supports one register size, memory region all of them. Also, we may save
quite a bit of registration and dispatching code in the hypervisor.

How about something like this:

/* when set, access_bitmap_base is used for subpages */
#define JAILHOUSE_MEM_ACCESS_BITMAP	0x0200

struct jailhouse_memory {
	__u64 phys_start;
	__u64 virt_start;
	__u64 size;
	__u32 flags;
	__u32 access_bitmap_base;
} __attribute__((packed));

Then we would append access bitmaps to the config as needed, and each
access_bitmap_base would point into that data. The size of each bitmap
would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap means
access allowed. In theory, we would get away with just adding the bitmap
test to mmio_handle_subpage.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/87f662c1-4be7-747f-5017-088c04f75ae0%40web.de.
