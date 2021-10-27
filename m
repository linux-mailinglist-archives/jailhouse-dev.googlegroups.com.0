Return-Path: <jailhouse-dev+bncBAABBH7A4OFQMGQEA3RVLJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE243C2E7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Oct 2021 08:22:26 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id v14-20020a170902e8ce00b0013fcb85c0ebsf807675plg.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Oct 2021 23:22:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635315743; cv=pass;
        d=google.com; s=arc-20160816;
        b=klNZP/fhZJyNnYLqBj+9vnI6REtvwNkrQDipE8w7G8A4B1+PevLfwy1JZbZciRDJDs
         2plQ5e2mItYTAVAY+r5/l2S1x+awcEozSrP5obd2sLuee+Czy9WktXIHkgCStdtL3DVh
         KcvIyX/m69m5FHrIQVJqIFezwu0AOr8sID0Ju1Fx4onoEZtS+ajTFqFpYFJLm6dKJe6X
         2tWv23YwXQXGkHraoL6P9P5MfJB8hcL1j2w7lKl8ydQ0948wkeqyjgrTe4GLhEnle+H9
         +x53fyppb63fYUc+Ls8NP7xIVmjOxFhkRNkxzaTrL5FRTumu7q6i3Ydc4cxDCB3B4UJZ
         ydWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=zwZ4Ii7hQIp/03EsbL1FtwDM2T1wK3fsI+Cje1LV8cw=;
        b=U4Y6D0SxDdiHRp97CxjdLKlGAJLdyuiU2C3vOEggMfa8FYngV/46Dy/MIFQDmQtJSZ
         MyHyE83ODQEarW1vbK+UQzRhQWfSPd9mf9EQY9/yoHtPlTIjvnX4dpmkx71T9OSzawFa
         CO4AK0nCCwnAjan5JSiunLzD3eavZ8Qjr9/LJsNKW9/h2XxH+e7RuybYRcZ2Q6iMvCFj
         uYlucgEDwdeRHcEJ5K3TnmyAYhmP2snaBD3xWcFTecrKhJwrIUQ3MAWgvgAX/aTX/mPl
         qZ1YI271WvHTtadiP6xiB52/n5rA++iH4AIeZHtS2HFviooTmIcd6FEnKOqbqxHRaJGK
         MFaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.189 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zwZ4Ii7hQIp/03EsbL1FtwDM2T1wK3fsI+Cje1LV8cw=;
        b=AuZ1PKDcVjgeHi+hV2+hL0aovSow+Sbr6NWFwA85bwcjoRtApH2azc13aEt8n4Fwzt
         mbprr4Vd9epvucWmr7uuGVcQHDZuuF8nYl+dbLlNjMqz1rswUwlpok2gdKyrlY2pOGiJ
         Eim27Ct6rKlo4hk6D5V3L5vPDPzkLaFQpEq6w1fSNdI0adFEGY2UvSYC+KYUg7HAba89
         /98dqiQShbMb6LTVd8IWaib+cAcQwGJyGoWKAeth+pRxRm9cQh2kSaFZHKfic8iDWcex
         IwiLIP5BuhOhTTk8s7+eL7dE++yHokm4a9quS18Kz2Kr6yJTJHz9bbAAS5FIME6+xH+S
         KwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zwZ4Ii7hQIp/03EsbL1FtwDM2T1wK3fsI+Cje1LV8cw=;
        b=KY4EEJohWHrBmqM9SHOldxTjuOIygtvsd+BQq3zpqizarsIDK4IaBYKDY5IXruYO21
         XvKj5/qAVwboNf50zGxRjBvSEg0OZzD1ckQzQbBG3GTudPl1NU9IuqjqaPUJpH1qDN98
         BbdVEdFO1fpgj6n3s53h0h08ysY/y7EUMf3SvUJxqrYz2JPM8YV+caISMZ46r+ww6Zti
         QnJ6DzX0xCgCE7XVPUrQanfwWm0L7fDmezVS2MhCOs82wFXXm+liXS/2Vp5Ors3++Q2G
         oViRKMg9mDRDkgz0lGNND+Tm9uBw5DZWeOYWDaYG9azBHEWi5ltHdItZu2pubpunCcZZ
         00Cg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532t9k8HVEWL7qgx7Y1Yy312yScHqJVn4n22S0YmVQl21RiYeCcC
	43GDrhLDtSNyW5z32QmZerE=
X-Google-Smtp-Source: ABdhPJwmOk906V1RPV6UmmWpt8gNPKzxVcsQ1NH3LogiggsjwjT76CxQepEYHpGM62B641GiE+z6HA==
X-Received: by 2002:a17:90a:2c02:: with SMTP id m2mr3749571pjd.109.1635315743686;
        Tue, 26 Oct 2021 23:22:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:a03:: with SMTP id p3ls10069702pfh.0.gmail; Tue, 26
 Oct 2021 23:22:22 -0700 (PDT)
X-Received: by 2002:a63:88c2:: with SMTP id l185mr20500822pgd.277.1635315742826;
        Tue, 26 Oct 2021 23:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635315742; cv=none;
        d=google.com; s=arc-20160816;
        b=CxHekDfhte/F+ouPVecJGaleKlJjf2OppwVZYqNm+74NfHmdtLU/LtnKD5KctYkeNw
         HVLTTau5bh4GrEU99O5U5OKzLfzal+PyjpTIyOQzBaRaPs4/S2uUEA61+ygaJhPi1u24
         7I9HurAyzXa/b7Ps7ddEfhw+KqooNo6OeKFqYqP8h1TdSxGdaqZg9y6USq7W/PdHzbPt
         0lhz7PS53e7/VYd7uDIvDfURBx5BixaIT1s04wT+pm+xkGGBX9V6gvn6nGp5i2CupUjw
         Xfqf/sC8XiwxCiXF8kx0tS7hVD95lUwodAzph3j0pCDVO1IGJ5PVy5OgrU68xTmzdGUY
         kHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=TK+Myfc99TbUt2LnQADLmeG8kVg95odfUeUiA2aXqF8=;
        b=IadBCRWwF0X0Ug6qUSJTM5maXgD1PzPnUZ18Py8jitk0hUocHNKpm6CIPpU/kb5a42
         weZm7sybd/zynqeYtr5bTzKbdbOwjlagrX9pXuJeKVgfRWK0KqbvSUWWz0dhxnoNiThs
         a5EMtA/TqIxNbgtUcr+MOIdF8Hd4w3qJPXS1dGZnGcaRVQPMXLaAG3ULwmdH4fx1s28v
         Z3wclm5ttTTEXg5ebS3Gt8xCQr+HyvpRqD1AErfAmUUxfFkBfSLJtI4rPxXg0ttgHRdI
         4XQhc12a4vp1tmiUFcx8tjIaWcEauNSjp+T+y++pg3Z+bmVYpvdsjrJ1cQkkvnnq49Em
         9oyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.189 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com. [45.249.212.189])
        by gmr-mx.google.com with ESMTPS id lb8si1635484pjb.3.2021.10.26.23.22.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 23:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.189 as permitted sender) client-ip=45.249.212.189;
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HfJTz6B5tz8trB;
	Wed, 27 Oct 2021 14:20:55 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 14:22:17 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 14:22:16 +0800
Subject: Re: Questions about Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Xiexiangyou <xiexiangyou@huawei.com>, <changzihao1@huawei.com>
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
 <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
 <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
 <1c48728d-c3f1-a30d-3c52-0ae68f11b040@siemens.com>
 <1ff4c02a-d29f-98de-907d-0954bd3ae3b1@huawei.com>
 <9e90522c-9cf5-dc34-f8e6-d1c7abb2ddf6@siemens.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <df8c5de1-1062-cf73-2060-601934a30e9f@huawei.com>
Date: Wed, 27 Oct 2021 14:22:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9e90522c-9cf5-dc34-f8e6-d1c7abb2ddf6@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
X-Original-Sender: zhengchuan@huawei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of zhengchuan@huawei.com designates 45.249.212.189 as
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

Thanks, Jan.
I am pretty clear now.

On 2021/10/18 19:36, Jan Kiszka wrote:
> On 18.10.21 09:00, Zheng Chuan wrote:
>>
>>
>> On 2021/10/18 13:41, Jan Kiszka wrote:
>>> On 18.10.21 06:24, Zheng Chuan wrote:
>>>> Hi, Jan.
>>>>
>>>> On 2021/10/14 17:34, Jan Kiszka wrote:
>>>>> On 12.10.21 13:57, Zheng Chuan wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> After reading the code of jailhouse, I have a few questions.
>>>>>> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If i=
t is possible to run VM by KVM(nested mode) in the root cell?
>>>>>>
>>>>>
>>>>> Nope, but you can find traces of an attempt in
>>>>> https://github.com/siemens/jailhouse/commits/wip/kvm
>>>>>
>>>> OK. I'll look into it.
>>>>
>>>>>> 2.I wonder why the root cell need to runs in guest mode? Whether jai=
lhouse can run root cell in host mode, create KVM VM inside
>>>>>> root cell. So jailhouse can support both partition and VM.
>>>>>
>>>>> Two main reasons:
>>>>>
>>>>>  - security/safety: If you leave the root Linux running in host mode,=
 it
>>>>>    becomes part of the trusted code base, increasing it by a "few"
>>>>>    orders of magnitude
>>>>>  - functionality: only by intercepting certain I/O accesses, Jailhous=
e
>>>>>    is able to emulate the ivshmem devices
>>>>>
>>>> OK, I got it
>>>>>>
>>>>>> 3.When create a non-root cell, the jailhouse driver executes cpu_dow=
n() to offline CPUs, but the offline CPU seems to be running
>>>>>> and respond to interruptions. And the hypervisor seems to have done =
nothing to wake up the CPUs(assigned to non-root cell),
>>>>>> or did I miss the important part of the code?
>>>>>
>>>>> The offlined and then "stolen" CPUs of the non-root cell are first
>>>>> parked and then finally started again at (amost) architectural reset
>>>>> state when doing "jailhouse cell start". On x86, you can see the SIPI=
s
>>>>> being injected for that in the Jailhouse log.
>>>>>
>>>> Yes. However, I am still a little confused about the status of "offlin=
e" cpu.
>>>> i. On x86, is it at real mode or protected mode after we do cpu_down()=
 within vmlanuch?
>>>> ii. is that different from cpu_down() of host?
>>>> iii. on x86=EF=BC=8Cdoes it conflict with the bootstrap of linux guest=
 since the kernel will do transform from real mode to protected mode?
>>>
>>> We hand over the CPUs in real-mode, as architecturally defined. The onl=
y
>>> differences are:
>>>
>>>  - reset address can be configured to be different to 0xFFFFFFF0
>>>  - all CPUs are started at once in a new cell, not just a single boot-
>>>    strap processor
>>>
>>> You can study that by looking at inmates/lib/x86/header-{32,64}.S. This
>>> is the code run first after cell start when using our own inmates.
>>>
>>> Jan
>>>
>> OK, Let me list the initialization of non-root cell in my mind.
>> 1. When we do cell_create, the cpus we wanted are "offline" by the root =
cell module. now the "offline" cpus are in real-mode with vmlanuch.
>=20
> More exactly, jailhouse module takes CPUs of upcoming non-root cell
> offline (just cli; hlt, not yet real mode), but Linux could still bring
> them up again at this point.
>=20
>> 2. The jailhouse sends nmi, and the wanted cpus do vm-exits into jailhou=
se (well, i am not sure can cpu response the nmi in real-mode?)
>=20
> NMIs are handled only in hypervisor mode (root mode). They serve as
> hypervisor IPIs, take the guest into hypervisor mode, and let the
> hypervisor do what needs to be done.
>=20
>> 3. The jailhouse will park them and point the rip into parking_code, and=
 then the cpus will do hlt code after vm-entry
>=20
> Yep. From that point on, Linux will no longer be able to bring the CPUs
> online again - INIT/SIPI for those cores will be rejected.
>=20
>> 4. When we do cell_start, the jailhouse sends nmi again, the wanted cpus=
 do vm-exits into jailhouse.
>> 5. The jailhouse will reset the rip into 0xFFFFFFF0, and the cpus will d=
o vm-entry after arch_reset_cpu().
>> 6. ok, the /lib/x86/header-{32,64}.S turns on, and also the jailhouse wi=
ll work while the inmates sends the sint and sipi.
>=20
> Those INIT/SIPI calls are actually emulated. Allowing the guest to issue
> them in reality would bring the CPUs in the wrong state.
>=20
>>
>> Is that right?
>>
>=20
> Generally, yes!
>=20
> Jan
>=20

--=20
Regards.
Chuan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/df8c5de1-1062-cf73-2060-601934a30e9f%40huawei.com.
