Return-Path: <jailhouse-dev+bncBAABB55WWSFQMGQETOPUXAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3b.google.com (mail-io1-xd3b.google.com [IPv6:2607:f8b0:4864:20::d3b])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B34310EF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 09:00:08 +0200 (CEST)
Received: by mail-io1-xd3b.google.com with SMTP id s18-20020a5d9a12000000b005ddc91c47f4sf9938662iol.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 00:00:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634540407; cv=pass;
        d=google.com; s=arc-20160816;
        b=RecPe0QXQRS7W9ju5Nk6rNCkIvaTVJbuO/pvm3cUyzsKjKDjsK0Y09LMRnSa7vincK
         gViwcH9IwRsOXtczNnOOQvu8oaN22cdyzWef8frqxoruhqDWPw/Wj+jepfmFJhzL0LSW
         IKydM5lXDHV400sDRG0LTTDY/5Wcdl4/opWkNTPPEYsI5YxcZqYGoWdGwGbIHmjGYqTC
         YhKeGFj+Vo94kGvJiPtf5HrLhhH8gv0zGyzkc09m/bieP5YCxN3iCvzR2n6kB8ntfWEa
         O6OsnbMzk4MzyJ/LdUxgCKhZY7sY9PMLNyMuY0bs1hz8GkQSgc1JoyOAe8IhyXovlgvi
         Em4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=iQRJBocCY1bbgHCB85MKVDOHg78siLiRQvB0al/7Og0=;
        b=neEaoAFsA+GqfAjBd+YCWqn9WXDeFRh1FyYg30FvpfgaiHfjBkKJn5TxdElYzeBXZq
         6eJFrMpVWVYGlJQngFQaMv3HiH7c6OzamsesLMfc9mZvVILFEKgTVANLHwAFDtUHlJ4k
         bs7KUP2DzNqm9mNl316aUD8g81BWTOlVdge/ZX8u7OF5eH5CLbcuz7VUo/Jxu4amI5PC
         AdUvf5m4NYqRIfl3xHgJcfvG5BSfLP9KeV45IvMvTsNurEg7IgGo5oZ7ydPIoUOTZauQ
         u+R3w1QXuyCoqcNFBC6kK/IjVx4YjzgVlxp0wxZ5nJca9UC11/fVTzk1NHKENyoMJoO6
         oLyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iQRJBocCY1bbgHCB85MKVDOHg78siLiRQvB0al/7Og0=;
        b=oGCH3pcw6Cx1ntBdvXHZ6snn2HPw0pKGUZBeEeN04Ep+nnR4yNIwoUiwhmujWsXNW9
         bTk5InhoNl+qAIXkQs3ID0lsaLD/4L1LJjvIE2MLwkA5K+ABzyWUV7iGeJg0xw9vRcdz
         pC4CRmybqOGJhGWlzq9IonJuixZ3LsS0kV6xuYH29a5QrTFjWF6uZztGuHRZsEIvFiTB
         ZzLxNrCPQ+28eyK56oyFl17s4Ad1boisYt9zVkWCOygKObmeK7bal6cf694dcll3l2mm
         bS2HdSDJCYgXo/Ptk4d5c3NT2UVnF6b+XL1e1Ki4497YSeUFtIkc5gB4ft0V1Sm9OCkS
         Z+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iQRJBocCY1bbgHCB85MKVDOHg78siLiRQvB0al/7Og0=;
        b=H89WebCoUdCkucdFhshE8+xpSmscXOq+3bhwmLShV+1ewqH2+ik+xqF1OLmjruzoR8
         kjnRA+pfr+7y2hvVjC2MQ4lBhvNB2pJAxNhJMZQl29HU2PjNQyyejKpGuX56UvFMrcUC
         SLe8dS/+Xyz9ofPGg7dplrM2Bvy9xMtVcSKblypc4jO9bx/NOlMaiO3qOo1xtrJlfM60
         SHKzGu7WhuWqnlLaAEeEiso2wcdcgyRUhJgBfRWL3ExL6BOsSQDPDfxK9+YFb8nbUNuD
         Br+PKXoObT/LnvIJPRQcppEbRudZo0Nqj5XaJIe3NExcCzVJJySYYnbdekgnJghhuPi6
         6plw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lHO2Qh9Pp6IB4bwrFlwvZrTUokc5GdCn1xNXmqstwszHpuXAM
	gAC3e94r0oj6AbY/a/RpVz0=
X-Google-Smtp-Source: ABdhPJz5843CJQkOMRhkmIUA2qzQzAiX55ME34AcfVDYInccAf3axhwjFYqf1458S7XGlwn17LakLg==
X-Received: by 2002:a02:712f:: with SMTP id n47mr17004166jac.82.1634540407544;
        Mon, 18 Oct 2021 00:00:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:2724:: with SMTP id m36ls202263jav.10.gmail; Mon,
 18 Oct 2021 00:00:07 -0700 (PDT)
X-Received: by 2002:a02:7154:: with SMTP id n20mr16965288jaf.77.1634540406987;
        Mon, 18 Oct 2021 00:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634540406; cv=none;
        d=google.com; s=arc-20160816;
        b=sKE1lxDowuIYvhpQcsnoR7RGVdJgylcGww3ZcYfHA2VQoRL884jz2MeBiyaTYd/Cro
         8ntdxY+dYetbonpj7W+K6kU5Se/p3deUYwZv+7eTmVb5sisXzPUkXNmrwnIIQEjx+5PV
         EI30dhOYbIJJI6TO7kgrcbIt4ARGs7/R/qdmTmBzp4Y1ANIE2gafotNa0KpyVzsSmSs9
         Txt/B2L+PNKU1XOLeKM93qmX8KS0rr6i9VJU7kT9zpIN0xrYpMRp0RSyrAgHfN6tOfHB
         RHm5UEOqPy4h62Ngw8rGPuD8Xy6XASmUYQxpj58Qj+AMY6LhbgEoIjgGqu4YHukZvLZP
         eh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=O0UPIeDwdp8gP6nFyBuRWxwg1jMG/vmVrk638J07yTA=;
        b=ye655OPDUE+kaenYGT1bFK+AXd4BL1B4s8YOBLdUIkYGsHCZoFuLaljYVYDjvMk9u9
         HSCUhSoosMe9+We3nH7kF2ikJCD+bCDG5DwRyx4ot2OA1WMcFTj6uEdCJ4xXtE0TFtFQ
         DQvpXL22QBck9AEL2bafmftdJJKJS0BHWbX4eKiTgeF4sMY5LC/H3TraXvH512kMAC7C
         ERw6lzz8cMGH33mnjK692y59KTO8Xwcls9URDfd0hdND0VSV6obkYYaCsDIoEGwqY5PG
         lxyMb4s3WONt29V3DYogHCDKPLjBaEYyp43FF4H/WMSXI8/oyVdB+xGWKoflJypjkO5m
         RbxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com. [45.249.212.188])
        by gmr-mx.google.com with ESMTPS id j18si1107710ilc.4.2021.10.18.00.00.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 00:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as permitted sender) client-ip=45.249.212.188;
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HXngZ5SVCz905q;
	Mon, 18 Oct 2021 14:55:06 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 15:00:01 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 15:00:00 +0800
Subject: Re: Questions about Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Xiexiangyou <xiexiangyou@huawei.com>, <changzihao1@huawei.com>
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
 <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
 <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
 <1c48728d-c3f1-a30d-3c52-0ae68f11b040@siemens.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <1ff4c02a-d29f-98de-907d-0954bd3ae3b1@huawei.com>
Date: Mon, 18 Oct 2021 15:00:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1c48728d-c3f1-a30d-3c52-0ae68f11b040@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
X-Original-Sender: zhengchuan@huawei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of zhengchuan@huawei.com designates 45.249.212.188 as
 permitted sender) smtp.mailfrom=zhengchuan@huawei.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=huawei.com
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



On 2021/10/18 13:41, Jan Kiszka wrote:
> On 18.10.21 06:24, Zheng Chuan wrote:
>> Hi, Jan.
>>
>> On 2021/10/14 17:34, Jan Kiszka wrote:
>>> On 12.10.21 13:57, Zheng Chuan wrote:
>>>> Hi all,
>>>>
>>>> After reading the code of jailhouse, I have a few questions.
>>>> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If it =
is possible to run VM by KVM(nested mode) in the root cell?
>>>>
>>>
>>> Nope, but you can find traces of an attempt in
>>> https://github.com/siemens/jailhouse/commits/wip/kvm
>>>
>> OK. I'll look into it.
>>
>>>> 2.I wonder why the root cell need to runs in guest mode? Whether jailh=
ouse can run root cell in host mode, create KVM VM inside
>>>> root cell. So jailhouse can support both partition and VM.
>>>
>>> Two main reasons:
>>>
>>>  - security/safety: If you leave the root Linux running in host mode, i=
t
>>>    becomes part of the trusted code base, increasing it by a "few"
>>>    orders of magnitude
>>>  - functionality: only by intercepting certain I/O accesses, Jailhouse
>>>    is able to emulate the ivshmem devices
>>>
>> OK, I got it
>>>>
>>>> 3.When create a non-root cell, the jailhouse driver executes cpu_down(=
) to offline CPUs, but the offline CPU seems to be running
>>>> and respond to interruptions. And the hypervisor seems to have done no=
thing to wake up the CPUs(assigned to non-root cell),
>>>> or did I miss the important part of the code?
>>>
>>> The offlined and then "stolen" CPUs of the non-root cell are first
>>> parked and then finally started again at (amost) architectural reset
>>> state when doing "jailhouse cell start". On x86, you can see the SIPIs
>>> being injected for that in the Jailhouse log.
>>>
>> Yes. However, I am still a little confused about the status of "offline"=
 cpu.
>> i. On x86, is it at real mode or protected mode after we do cpu_down() w=
ithin vmlanuch?
>> ii. is that different from cpu_down() of host?
>> iii. on x86=EF=BC=8Cdoes it conflict with the bootstrap of linux guest s=
ince the kernel will do transform from real mode to protected mode?
>=20
> We hand over the CPUs in real-mode, as architecturally defined. The only
> differences are:
>=20
>  - reset address can be configured to be different to 0xFFFFFFF0
>  - all CPUs are started at once in a new cell, not just a single boot-
>    strap processor
>=20
> You can study that by looking at inmates/lib/x86/header-{32,64}.S. This
> is the code run first after cell start when using our own inmates.
>=20
> Jan
>=20
OK, Let me list the initialization of non-root cell in my mind.
1. When we do cell_create, the cpus we wanted are "offline" by the root cel=
l module. now the "offline" cpus are in real-mode with vmlanuch.
2. The jailhouse sends nmi, and the wanted cpus do vm-exits into jailhouse =
(well, i am not sure can cpu response the nmi in real-mode?)
3. The jailhouse will park them and point the rip into parking_code, and th=
en the cpus will do hlt code after vm-entry
4. When we do cell_start, the jailhouse sends nmi again, the wanted cpus do=
 vm-exits into jailhouse.
5. The jailhouse will reset the rip into 0xFFFFFFF0, and the cpus will do v=
m-entry after arch_reset_cpu().
6. ok, the /lib/x86/header-{32,64}.S turns on, and also the jailhouse will =
work while the inmates sends the sint and sipi.

Is that right?
--=20
Regards.
Chuan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1ff4c02a-d29f-98de-907d-0954bd3ae3b1%40huawei.com.
