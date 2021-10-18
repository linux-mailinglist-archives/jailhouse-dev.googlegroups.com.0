Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMVYWWFQMGQEDRMY4RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180E431784
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 13:36:19 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id t7-20020a2e7807000000b00210dad8b167sf1489539ljc.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 04:36:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634556979; cv=pass;
        d=google.com; s=arc-20160816;
        b=mWy7lmaboI5FPN1AtAgT2hhcedftgAvYj7DggtqkLE8d0GhzK6PdSCckgNoQ28oIQD
         uBI+NmxEs+UZI6P9fRqUhheHzMSTKgGuau+tztma3sSKlrxic5RwVLcw5UTqxy+Kq29Y
         v1rQ155v516hEnWoUBrm/vaczn+gQYhR7hXnwNCviM3lG7ezvexWmOWV3/+QWsuuRU+h
         kE+b1+zr5Z7ickDIvLGw49e7iYnt/ybzJIpoIwhOhUrc8GrzNNsaE5U56ZSewL1KQu3f
         XawwNCecP5TeZfNuhabTKAiwskpQpJEbA9Vbrp3MZv0gb1xwSmRf911HlzCC888m+hsc
         xtBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=QbqgEfR0fVXDjToULH0M6L/G8Hyqa/ZY7bI42xWi3C4=;
        b=r7tmw6OjRgCGHYIjJiLdWo4ylFValgLqQAgP07hddITs6hW3wHdSLVlB9jKSR40EW6
         LfSH8sOlabYSUuyJNnUX/FC2lKP0W2bhmuBiH4rEP9NpLaMz/77y/qY0g1/QXCHfTeL6
         HydXmiO8tPIRHEgwr+YoDvc5/7VQ+TI6aVtaaNkbTQ4h+UyTdXoNJ5VjnW7F/pMo+gef
         5MXGuGVJv6tIc/sJg+7guOVThKy986bzoAijKirdvrkvKwsXaXBbsyFftQE2dD/BX96h
         o0ioypr2FDcUnkUBf/QrgkwRMOYca1SXtLrmapZqL+ELQDkcweJ0295ra5ZiKrRTSI4q
         y3LA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QbqgEfR0fVXDjToULH0M6L/G8Hyqa/ZY7bI42xWi3C4=;
        b=ZKt+ijJAoECvlGDk9Eeq2WCVOOw3CQTvlNj6An+rDtOPMOpZigBE7PjOgDmOP3ZTHR
         qbvqZWFnBz9rQh9WaZ7BnFCtQv07sjU66d/mkWXs81atiSSuUFrLRwKNKmjrzCqpTUSU
         ymvQbtY3PhiZFuoID+DwhAm7HD+0HP136uc6aRrwV3N81SxlNbkGwjrogs4t6RKrOtO3
         6I31F6euCx6BOdSIw2DoFzUKhFr8eyBQ5cYaD6+SQL6MHd2Afsbb+v4OBncbW5Ur55T/
         Nw1BEwpwJsYGaoJmvBMD5zYbeNhWAAipX65jNUm7pu9KOl2XBDjsemE758dLIJY9XGOZ
         kC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QbqgEfR0fVXDjToULH0M6L/G8Hyqa/ZY7bI42xWi3C4=;
        b=eeN/LUYvWvXnVE30CeIp4nEY3tyBBj+/jLlDz9iWHkaNJKCP13cClmqnnUdtT675hm
         yT+u2u4Rag8wo6+ZmLLMJ2yBUpIlVsA0N3lKyWcp6KHN85SJ7Nh/niwB995LQKmG9WHW
         QEr9y1XlYKVzdJvHCuducQCxkAbY6Agcqp5nsCb7lDcx+sf1LMujM19POi3vSt9BSqA8
         LRr/mBnjw6WpQfT1dRmf6VDmWVUzIkUDp2RMxA3LUUljbLJyPS/OXT97hBZMUqkW4KGf
         pDqYtOovlSwD1V24jQ4FTArfrMhxLTZCG3XLR/OLfSekedQKgVqh0Ds0KxblqIOQy/qo
         H81w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531i9E9E0Uoc+LVFdxVvALUal6S+Cxb30HxxIy8fmSGXtoU4y6L5
	KBPB1R4WxHsGQKvWI/BGHSE=
X-Google-Smtp-Source: ABdhPJyFf0OjGXODucxDivshmNYRTYd7WCVD/4qxHlt/UuENVqycRJw5TN5AisEfa4Eu9Gs7N8JAUA==
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr28626381lfp.127.1634556979057;
        Mon, 18 Oct 2021 04:36:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:760d:: with SMTP id r13ls2683910ljc.0.gmail; Mon, 18 Oct
 2021 04:36:17 -0700 (PDT)
X-Received: by 2002:a2e:9106:: with SMTP id m6mr30553598ljg.24.1634556977738;
        Mon, 18 Oct 2021 04:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634556977; cv=none;
        d=google.com; s=arc-20160816;
        b=p8TeZIHFB4rvahva1bwkx4qgddmjJz5s7yuZK4L+Juz3a5XUXrGWtWugb/eDZMHPBg
         qgJAuMSBSRJge6ROoa1KYNO689yjSI/0fW787+IIPuhQpLm92tHN+iARBb6jPVi1MBwE
         A3Jx0IgzSEkfwFbqZ5OTrjaIk5rxxD2y5NZa0LuHMsu/qnzYoHTX3bosCLmP+6rKk62w
         +hUlWtfK59IaEFNGjN1ozpsCaa9cVDu7XZ8Q0aArbQRPuXCPx5Y6ZiLza8/JuwBjT6nj
         Q2u0iUA2TfGrqsTYkaq5qqvV5/JdMk50KD4fsb3xc+BZELO2P70a/i6eEJPEnCef8nEM
         sTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=faKa+Epm26bDUAN9WDm5rgRSpKtkJ8UNZ7zrZLv6zjQ=;
        b=Im2o8PYFOkWpTV/cUP1cpbVCPPWGukG3vKpoQCx5W7pUCxysrAKyknmsG3d06RYhGP
         S+e3jJ7k26TbMHkwnhpBx+THCIGcMSC44ZYLRpKkHWnmf/43FpGyJFpGCEDPml0bvK8i
         kFfdujdl7MbPm66hGa03x7n9MliwnG5JO7FLbmL/+wvT4zG23gwJH++Sit6cCRfmUa+J
         Fv/Dd9DqhrW9PTfVsFjrRqesT/08B0srUikWZHbiIAD0T1mUjqUwtUHL7610M+TPW1wr
         /Tk4siLnCTHM6ziaLGzNGs+AoidbeKKeao+y+AzebhJGPZMGaIKjuyr6Ym2PBnUfD3sB
         7jSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q4si932861lji.6.2021.10.18.04.36.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 04:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 19IBaGQb017901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Oct 2021 13:36:16 +0200
Received: from [167.87.73.119] ([167.87.73.119])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19IBaFa5011620;
	Mon, 18 Oct 2021 13:36:16 +0200
Subject: Re: Questions about Jailhouse
To: Zheng Chuan <zhengchuan@huawei.com>, jailhouse-dev@googlegroups.com
Cc: Xiexiangyou <xiexiangyou@huawei.com>, changzihao1@huawei.com
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
 <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
 <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
 <1c48728d-c3f1-a30d-3c52-0ae68f11b040@siemens.com>
 <1ff4c02a-d29f-98de-907d-0954bd3ae3b1@huawei.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e90522c-9cf5-dc34-f8e6-d1c7abb2ddf6@siemens.com>
Date: Mon, 18 Oct 2021 13:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1ff4c02a-d29f-98de-907d-0954bd3ae3b1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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

On 18.10.21 09:00, Zheng Chuan wrote:
>=20
>=20
> On 2021/10/18 13:41, Jan Kiszka wrote:
>> On 18.10.21 06:24, Zheng Chuan wrote:
>>> Hi, Jan.
>>>
>>> On 2021/10/14 17:34, Jan Kiszka wrote:
>>>> On 12.10.21 13:57, Zheng Chuan wrote:
>>>>> Hi all,
>>>>>
>>>>> After reading the code of jailhouse, I have a few questions.
>>>>> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If it=
 is possible to run VM by KVM(nested mode) in the root cell?
>>>>>
>>>>
>>>> Nope, but you can find traces of an attempt in
>>>> https://github.com/siemens/jailhouse/commits/wip/kvm
>>>>
>>> OK. I'll look into it.
>>>
>>>>> 2.I wonder why the root cell need to runs in guest mode? Whether jail=
house can run root cell in host mode, create KVM VM inside
>>>>> root cell. So jailhouse can support both partition and VM.
>>>>
>>>> Two main reasons:
>>>>
>>>>  - security/safety: If you leave the root Linux running in host mode, =
it
>>>>    becomes part of the trusted code base, increasing it by a "few"
>>>>    orders of magnitude
>>>>  - functionality: only by intercepting certain I/O accesses, Jailhouse
>>>>    is able to emulate the ivshmem devices
>>>>
>>> OK, I got it
>>>>>
>>>>> 3.When create a non-root cell, the jailhouse driver executes cpu_down=
() to offline CPUs, but the offline CPU seems to be running
>>>>> and respond to interruptions. And the hypervisor seems to have done n=
othing to wake up the CPUs(assigned to non-root cell),
>>>>> or did I miss the important part of the code?
>>>>
>>>> The offlined and then "stolen" CPUs of the non-root cell are first
>>>> parked and then finally started again at (amost) architectural reset
>>>> state when doing "jailhouse cell start". On x86, you can see the SIPIs
>>>> being injected for that in the Jailhouse log.
>>>>
>>> Yes. However, I am still a little confused about the status of "offline=
" cpu.
>>> i. On x86, is it at real mode or protected mode after we do cpu_down() =
within vmlanuch?
>>> ii. is that different from cpu_down() of host?
>>> iii. on x86=EF=BC=8Cdoes it conflict with the bootstrap of linux guest =
since the kernel will do transform from real mode to protected mode?
>>
>> We hand over the CPUs in real-mode, as architecturally defined. The only
>> differences are:
>>
>>  - reset address can be configured to be different to 0xFFFFFFF0
>>  - all CPUs are started at once in a new cell, not just a single boot-
>>    strap processor
>>
>> You can study that by looking at inmates/lib/x86/header-{32,64}.S. This
>> is the code run first after cell start when using our own inmates.
>>
>> Jan
>>
> OK, Let me list the initialization of non-root cell in my mind.
> 1. When we do cell_create, the cpus we wanted are "offline" by the root c=
ell module. now the "offline" cpus are in real-mode with vmlanuch.

More exactly, jailhouse module takes CPUs of upcoming non-root cell
offline (just cli; hlt, not yet real mode), but Linux could still bring
them up again at this point.

> 2. The jailhouse sends nmi, and the wanted cpus do vm-exits into jailhous=
e (well, i am not sure can cpu response the nmi in real-mode?)

NMIs are handled only in hypervisor mode (root mode). They serve as
hypervisor IPIs, take the guest into hypervisor mode, and let the
hypervisor do what needs to be done.

> 3. The jailhouse will park them and point the rip into parking_code, and =
then the cpus will do hlt code after vm-entry

Yep. From that point on, Linux will no longer be able to bring the CPUs
online again - INIT/SIPI for those cores will be rejected.

> 4. When we do cell_start, the jailhouse sends nmi again, the wanted cpus =
do vm-exits into jailhouse.
> 5. The jailhouse will reset the rip into 0xFFFFFFF0, and the cpus will do=
 vm-entry after arch_reset_cpu().
> 6. ok, the /lib/x86/header-{32,64}.S turns on, and also the jailhouse wil=
l work while the inmates sends the sint and sipi.

Those INIT/SIPI calls are actually emulated. Allowing the guest to issue
them in reality would bring the CPUs in the wrong state.

>=20
> Is that right?
>=20

Generally, yes!

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9e90522c-9cf5-dc34-f8e6-d1c7abb2ddf6%40siemens.com.
