Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMOMSLWQKGQECIPKNGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6FAD679C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:45:37 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id l13sf3539196lji.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:45:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571071537; cv=pass;
        d=google.com; s=arc-20160816;
        b=zSN4oier9r7OqYJeT8HDuQiCH20sT9cXCOKed+Yuy/nvMyHGPru9giVK8Z9hhdkUZz
         F08x91R1pFEE+/4wjstfZTr4A50sZmpjFP/cj5/V7KYHIEKQTiiurAkpjIxRz/ijKobA
         /GrUL6MolIvPMLTLVnzIoRwg8kdwrThRVH8kiGcxDHbTRGGihJvUQbM7pc1qat/6G+HI
         q6XkITmjYmSxMIXFZDL4QydjGT+smk40ZokYa95Btgx6Lc6sb9ZkToUU5OCwEKr2eBGK
         /htVyK5j3gg4eSDDtp/fKh11Kz9ko2BJCbPW6KxR3tmKbgDcbV0tFi1DwBwvfxWZERPp
         9Pxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XOaBSzb/zAe4wYNApfos0bgCynXxB/N5O0u0o9iMoj4=;
        b=h+GOA9OQZws+YbcDK9iQ2BujZqmdzKuxJkyRUTPc9vLRRRYOb737zT55aw861wU4X8
         l1Ck693Kzx4PQ8NSkdRZb9u9gNI7tiyD1EKhxuB9FTi0g9l53NHACGJwoXOiPftjwBMb
         HmGQ3QqGCTMaB4V58cb6/lufNGrlVz+UzZx0CGc7+VpU0eUuKJzDC+A7bKEeOktaUyrx
         YOVjxAuDwPRA/cXjhauKFf7NAlSLaSCzhMXSLafqW+WW+UEuYflnGr5UhunXnRTfrsi3
         J+IlcdCekEB9wSXgVyPa0l2WfcbBOKpGI9JS0H9u39Q0cIwyib5u0B+KqOVxCaduWbK/
         mDPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XOaBSzb/zAe4wYNApfos0bgCynXxB/N5O0u0o9iMoj4=;
        b=IOJxH4YMGUZJKfsbaGp6RHdEcR2w1vxt0fbM0iZjwZfykzEQ0G1SHxeBqzB6LdcGZ0
         Osd/7HIHeEZK/wEjN6rWXgBqqPGLt6pMGDnRdKuq373ON/3c7Ptvl6YTLNpLwK78qvu+
         KJ+atPM+4rrCg5a8weXh8RXJjUHqZGX652eW+/4ObufEbz03r13iCJOAsV0LO68bRo9x
         Inbpp8kNZpGV452ICfP8/RkdKQqwBzU9Upxfommne1yUDGZPehRtlBDfvs2KYOkvXX16
         hsWfmGu9+C+IgD/7l5lg1cEEGlPURghS3UmshsFe6CaP61/0idnxB5fFe7YAT19OEhCf
         BB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XOaBSzb/zAe4wYNApfos0bgCynXxB/N5O0u0o9iMoj4=;
        b=XiU8KA5XIS/Nclneqsi0Zu0mwIQAVSwvnXxU5QXqSvSOMRgXInsxfnxpSBjH2vCJV5
         7g+VH7okmyLeTPvz+ABOXr3hOtxVMpSPZIkr5txaXFypS1klT8YawrMh5BwP3IyjSagk
         DUNGmPiK40Y2fwV5uIABnxz2byhMOdFAXp6gFN4q2nsPlUzD3lNfoEZO95FmRIMbtcRG
         n7t4P065fjZa+tP5yOUwime0bQX4KRk+loBv2wsVAU58BMgSRT8lCZWadL3fM2mSOe7B
         X7TW2nujY6QcGy5HfTjKn65sP/qd13rsjF9lO0aW6OlqOjzyvNHY31kUWo3llXA+q4a3
         9ZPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVwWiY8eEUX6QZtnaM1M72Ahw1y9U30vBcz4eEqMzTN9qC8sr70
	bOo96eJkyuGRq59AzlKn57U=
X-Google-Smtp-Source: APXvYqwRDctXrwf+7xO2GjCnPlobOcYKx4Pkx8aXWHTIFsV7u/YavSJUjr5EdRp4gE9x1/rLbGBJsQ==
X-Received: by 2002:a19:4849:: with SMTP id v70mr18278830lfa.40.1571071537482;
        Mon, 14 Oct 2019 09:45:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8803:: with SMTP id x3ls1883000ljh.10.gmail; Mon, 14 Oct
 2019 09:45:36 -0700 (PDT)
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr11407843ljk.113.1571071536692;
        Mon, 14 Oct 2019 09:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571071536; cv=none;
        d=google.com; s=arc-20160816;
        b=ElJ1qym312vlebT8dE4ZqfYpE3jMRxw1Lb7S7kFtADoBq8gt2cTb4tdLiPoLTbSZbv
         5JX7cYNi/VCaA81iHsRujc/LeoMVu1lnl3wJzlbLlBRM4muOFOfokBTSWGyKaeWP7hnZ
         G1PWBmMoP37zKvvyo2yMLzt3DqopucLe2oU160QYzX7fhDrm8WI8t0rsjbvsrBb8U2p3
         7dH0ust80h07+rQaL78vnhxtmqvQsNM7RpW3u1eJr9OrnW4AG5+fpc6/16z5F93WBhY1
         +iPwvjA8Qm6egGY6t5ULj+hEMXO3jd4J6FJsrctIXKH1mVSoDTfhPWE/Zn41A/fooeNS
         oPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WHTdkJbH7YJHc5sAZzYsMr71vpTj2mJ8mPW0iKTMk90=;
        b=QAk/x9rGVZhX5ZQMN5tmTFVfyFmMkjYZJQ+RpPalDSj0HpPEiLjVS5VwL+67WU2XoF
         BpgdyEs/ovfJYRMgjofpZBGtVzQPckPE32CY5sSOFr6SdUS9LFNaSWF/U52sjYp18eus
         G9QfabfjkuPi6RBVpu/PaF9yEcwiTLcSebXXe/kDe4ked7cfSOZOlF3nrRl5fPzLrgxZ
         N53L3qvZqWayqiSldnRujGp6JT4bo5BIKs/zLEpZ7PZWohadqVDFTNwm92CY9JKVy4UE
         6ndWppDCjZnGKBnULD/kI4ayviec1zgXyyEvQt0qwkAY3hKur1BlQSVbH4SsfEe6M4xT
         iNqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o30si357332lfi.0.2019.10.14.09.45.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9EGjZR8001712
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2019 18:45:35 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EGjZDR024116;
	Mon, 14 Oct 2019 18:45:35 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
 <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
 <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
 <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
 <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
 <d9906900-5d69-4784-9c9e-ab6e7fc55c72@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2ae44a1e-75be-a335-932d-6ffcd385d29f@siemens.com>
Date: Mon, 14 Oct 2019 18:45:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <d9906900-5d69-4784-9c9e-ab6e7fc55c72@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 14.10.19 18:35, Vitaly Andrianov wrote:
> On 10/14/2019 12:36 PM, Jan Kiszka wrote:
>> On 14.10.19 18:22, Vitaly Andrianov wrote:
>>> On 10/14/2019 12:02 PM, Jan Kiszka wrote:
>>>> On 14.10.19 18:01, Jan Kiszka wrote:
>>>>> On 14.10.19 16:31, Vitaly Andrianov wrote:
>>>>>> Jan and Ralf,
>>>>>>
>>>>>> A while back I tried unmodified hypervisor by just adding
>>>>>> am572x-evm.cell config.
>>>>>> Basically everything worked except cell destroy. I repeated this
>>>>>> experiment today.
>>>>>> When I issued the cell destroy command I got:
>>>>>>
>>>>>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>>>>>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>>>>>> [=C2=A0 187.112795] CPU1: failed to come online
>>>>>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>>>>>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>>>>>
>>>>>> After that Linux is running on ARM0 core only. Basically I can creat=
e
>>>>>> another cell for gic-demo.bin, I can run it and shutdown. I cannot
>>>>>> just
>>>>>> destroy the cell with getting ARM1 running Linux again.
>>>>>
>>>>> Yeah, this is a familiar pattern when things go wrong during
>>>>> cpu-hotplug.
>>>>>
>>>>>>
>>>>>> As far as I know when we issue cpu_down() the CPU is calling WFI
>>>>>> instruction (Linux kernel page) and waiting for event. When we
>>>>>> create a
>>>>>> cell the hypervisor switches the page and runs the ARM1 at the
>>>>>> same WFI
>>>>>> loop at virtual address 0x0. I guess when we destroy the cell,
>>>>>> hypervisor shall return ARM1 kernel page and cpu_up() should continu=
e
>>>>>> from that point.
>>>>>
>>>>> Yes, basically save-restore of the CPU state, at least /wrt its
>>>>> relevant
>>>>> parts.
>>>
>>> I thought that is hypervisor responsibility when it executes the "cell
>>> destroy"
>>> to restore the cpu1 virtual memory to the point when it was on the "cel=
l
>>> create"
>>> state. As I understood hypervisor calls cpu_down() and after that
>>> creates the cell.
>>> On cell destroy it restore cpu1 state and calls cpu_up().
>>> Looks like my understanding was wrong.
>>
>> No, the model so far is that the hypervisor emulates PSCI CPU up/down,
>> and that implies a (virtual) CPU reset. On x86, there is an
>> architecturally defined mechanism that works via IPIs but it otherwise
>> identical.
>>
>>>
>>> So, how to resolve this issue? You said I need to add the "soft
>>> cpu_down".
>>> To where? kernel? or hypervisor?
>>
>> For the am57xx, this needs "only" hypervisor changes. The kernel already
>> has to support for soft-offline/online. I would say: let's make the
>> save/restore working on that device, and then we can think about if we
> So, we do need the AM57XX unit at least temporally to implement
> save/restore functionality?

Well, we will likely continue to require it for the AM57xx-specific SMC
calls. The save/restore logic should eventually be moved into generic
code. But let's demonstrate first if that concept works.

Jan

>=20
>> make that a root cell property that controls whether to emulate PSCI or
>> use save/restore for the root cell CPU control.
>>
>> To reuse a generic control on the RPi4, it would take also kernel
>> patches. But that would be the task of someone else, later.
>>
>> Jan
>>
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2ae44a1e-75be-a335-932d-6ffcd385d29f%40siemens.com.
