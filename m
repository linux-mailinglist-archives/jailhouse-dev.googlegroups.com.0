Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPS5DUAKGQEXPMDPSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AD5C169
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 18:46:58 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id b12sf17340986eds.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 09:46:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561999617; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jkf2AN3JKfHJh22XzJwi8LE6YdKIAFDPDffeSdNoxR7ri3oywRZQB9W2Lgpf9UOGtT
         T0eGXQfnUNxCUI4a8wj7S1LHXkVHAeyk1ejHbx82oJx5mDxGRGIMe5qgdOf4WrInP2du
         c4e5RLVbI26zFlWaXh4/mzGKPAWARvHwhaVrMaW4NmTcSFPLQ9mj1nljR1Ji6y2g78G+
         KrdVkRl5C81/knHuW4Tqn0asR0khCq2UDh6mGEmyEP6GE50GWIpNwOtHP8sxq6eAcbIV
         OnhzDEufvOxPPRdf5KAcBKCIfp70nM4RItiX3o434gw+xeSNtXJv/iGF6onKbY032Tjq
         0FCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/smn9FVLPEY/NyeVTVlOkBVKlp7e9i++cTr5eQb+nwk=;
        b=SE9ropl1YYxuD+BhAWsvGZ/ey+EXsJ0haB/Na+w8p51MOL7+Css7tGc9ZbHzh78Rho
         K+dRFYZP17msCpE3vrOIp+v5dh7tj2oq8+HHhFGDc7N79kM3Ka2CIQFqSYSPv35BP96S
         lxj6TNjcJIBz+fxpkujNwDgp/iPYftyDqsQZQ0Jcd1ItaA3CeV7F7zkwN5WPIC841onp
         hXdBxKJueUauPv74PFVPey0X9ZvWj9b4s/o6/PDNIdNWpsJUW89YmXT4KiQ1yjk+nXES
         cwDnWp3UUBGEXQG29aB8xMIDYEwLBw6XreQus5aOYDzrHTBsazs0ZV4jQoZnKr2Wd151
         T/VA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/smn9FVLPEY/NyeVTVlOkBVKlp7e9i++cTr5eQb+nwk=;
        b=au3Igl4+N/2LiuK1Z7sJsCtcPD+rmkVZCMHoBrEFNiISAJ2r6W0dFhx4y/NEn0egB/
         sx5DAwVRlKn7pTTJ6Tztfb3zP9zK5UcjYbX3nQ1sZo27047yyRPspLfpvCnm4+9QBf6U
         YBqxV3BFXykyOiITypegrqIclM6aBf8XzkExKvXP5+zBsV819hvCA8lgziC5xaTwifdV
         8lA//6xs8YD4waZrPFM/3wtFMMnHEfW8TDgCTXusgTW1TsAbN6GXpjzxnVtD3DWhA5n8
         V31FcGT4cnfby3EpANcaL06DUDxgQgTqVtzl/8ldptP08r8PCOe84+SgxNn5cZkHSMPX
         EMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/smn9FVLPEY/NyeVTVlOkBVKlp7e9i++cTr5eQb+nwk=;
        b=dkaH/KmO53QRv4R+oRMqCEYt73+man+tzKk02t4Y79yNxsdpfmytDeYxXlj4HA66Ku
         I3cFsQSf5ACGkC4NUfJsSRiyNChxicIdcDvAbDvsckrlfSsr1F9wsjSdVS71gSIziOZT
         3k/kN3gdxYkJYlxzDdwCT0PApguOATD5qDjql2AklYvDodNmCduezNtmq+mJ/fYM9gSS
         a41z3XQuYwbzTDBYLTSYWNKOIiDvS/M3KK1qFXRyC28tPeU4yATjpILl9Awipra1P6CN
         3F8uDDGIL3TBBKdDwNx17+AWOSlwg8E5U1AiEK1VC1JDiK1+6EqMew+8n4o2HGnWQS8O
         jKog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUfvG2N4xf5FM1NS4cgPVkLJTtHJFcpiZ46Qf8mIhiFmU591T2p
	ns3U4vD9MnBl20i6vJ2idEo=
X-Google-Smtp-Source: APXvYqwq+zGVQSjt3pyThbvNTsO23HRH5RZRQZmhgzeKKpawUBHBUToALeXiMY4E1quJaBNUZxh0CQ==
X-Received: by 2002:a50:ad0c:: with SMTP id y12mr29685801edc.25.1561999617851;
        Mon, 01 Jul 2019 09:46:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:404f:: with SMTP id y15ls2641809ejj.7.gmail; Mon, 01
 Jul 2019 09:46:57 -0700 (PDT)
X-Received: by 2002:a17:907:20a6:: with SMTP id pw6mr23823069ejb.111.1561999617281;
        Mon, 01 Jul 2019 09:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561999617; cv=none;
        d=google.com; s=arc-20160816;
        b=S8Ehca4w2WvJGgSM42oKC8WN1deFUELep6okgHf/CDDinh0GwgF7zVvgRtITysSosK
         zgl8XEVBJzB/VEK+dIelYN740+0P8DIEnA8JZCb+QMFfBaPBd7ZgXXnD6tgVWobAs7m3
         3O9dUUViwpgF09yl4WTIqvGlA/e3Co789n9lG0uXu4jKTSODDoLMPABltMrJn+jJ2n5m
         zYTL4qL9LP+CQGJOlOnAA9GK1d9n7NIZ1p9R9aCvLOYBxTPZp+21axaor2s9qXfG/don
         rxt558atdeFa6rpk9UuFrP0h+4tz44v2IEGMyAmx6E86YAi2hTxN8zJ5xJd9YEOTss5x
         8fMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=A2hdIz2wnsNhJOXRJ3fKde21mnWk4ZKL7fNcAlCFwz4=;
        b=abtzyhpHdv8rHqixbsqzHPIsv71WK/skLteKVgrW0VQdf5wUFEveyUUYtznMzb0abt
         SkUg/fGQyeQBUT6AoNWLxcAIVm3feJSVPLnY7edi0b6jFQqrzXGAUTuZbNKJcUHQKz91
         Ydb+YO7wZtCmTS3h6cQBCJ/QGD4nP3U++l6emWlmiJtdlHx1f3AU9nZdXIJnrNyoAfjb
         8nCBsCUmC8a7mfGQ8ogNUVzxXr4fHAIc+KIGNgPlikw0SfIXkMyJqxsth+HXwPpUVZjm
         3bQuOWNew2U+Ozya6a4hksm5BQcxXhxqCAoaoyvnXx1faPT+G74LlohrZ2ncIV7qDXUY
         Fi0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w57si696946edc.4.2019.07.01.09.46.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 09:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x61Gku2q031425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 18:46:56 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x61GkuPa026318;
	Mon, 1 Jul 2019 18:46:56 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
 <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
 <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7adc75a2-c777-6f35-6652-99dd5212926b@siemens.com>
Date: Mon, 1 Jul 2019 18:46:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 01.07.19 18:37, Ralf Ramsauer wrote:
> 
> 
> On 7/1/19 5:44 PM, Jan Kiszka wrote:
>> On 01.07.19 17:11, Ralf Ramsauer wrote:
>>> On 7/1/19 4:04 PM, Jan Kiszka wrote:
>>>> On 01.07.19 15:52, Ralf Ramsauer wrote:
>>>>>
>>>>>
>>>>> On 7/1/19 3:09 PM, Jan Kiszka wrote:
>>>>>> On 01.07.19 14:59, Ralf Ramsauer wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>>>>>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> for the completeness sake: it's about ivshmem-net. The PCI device
>>>>>>>>> shows
>>>>>>>>> up in the root cell and can be discovered via lspci, but the driver
>>>>>>>>> fails while probing with
>>>>>>>>>
>>>>>>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 ->
>>>>>>>>> 0002)
>>>>>>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>>>>>>
>>>>>>>> The register read-out failed. Maybe a mismatch between driver and
>>>>>>>> Jailhouse version: Which revisions are you using on both sides?
>>>>>>>
>>>>>>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>>>>>>
>>>>>>> The bar_mask was copied over from the qemu demo. Other than that, the
>>>>>>> only thing that changed is the bdf. We simply chose a free one on our
>>>>>>> system.
>>>>>>>
>>>>>>> The memory region behin ivshmem is high memory above 32-bit. I
>>>>>>> instrumented and checked the code, but that shouldn't be a problem.
>>>>>>
>>>>>> This is rather related to the MMIO register access. Check if reading
>>>>>> that ID/IVPos register actually triggers a VM exit. I suspect it
>>>>>> doesn't.
>>>>>
>>>>> Hmm. Correct. I guess we should end up in ivshmem_register_mmio()
>>>>> but we
>>>>> don't.
>>>>>
>>>>> For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
>>>>> the kernel:
>>>>> [ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
>>>>> 0x380000000000-0x3800000000ff 64bit]
>>>>>
>>>>> That's odd. Actually we should trap. Instrumentation of ivshmem-net
>>>>> below gives me:
>>>>>
>>>>> [ 2044.832898] regs location: 4080053db000
>>>>>
>>>>> Huh? Shouldn't that be 0x380000000000?
>>>>
>>>> What's "regs location"? What does "lspci -vv -s 0000:00:01.0" report?
>>>
>>> pr_err("regs location: %llx\n", virt_to_phys(regs));
>>
>> Calling virt_to_phys on ioremapped memory may not work. virt_to_phys is
>> primarily (if not only) thought for calculating the address for a kernel
>> piece of RAM.
>>
>>>
>>> Please find the output of lspci attached.
>>>
>>
>> That looks consistent.
>>
>> Did you check that there is no accidental mapping of that virtual
>> address so something else? If not, check earlier in the interception
>> path if there is a VM-exit, but we just do not end up in ivshmem for it.
> 
> Got it running. The issue was that the config generator fully mapped all
> PCI Bus regions:
> 
> /* MemRegion: 380000000000-380fffffffff : PCI Bus 0000:00 */
> {
>          .phys_start = 0x380000000000,
>          .virt_start = 0x380000000000,
>          .size = 0x1000000000,
>          .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> [...]
> 
> So access wasn't intercepted at all as those pages were fully mapped.
> After commenting out all of those regions everything works as expected
> (well, not tested against another endpoint, but at least ivshmem-net
> successfully probes).
> 
> The config generator created those regions. Happens on master, next and
> older versions. I guess this happens as those regions don't have any
> siblings -- they should probably be filtered out. Find the iomem attached.
> 
> BTW: This behavior can be reconstructed by running the config generator
> on the qemu virtual target for x86.

Ugh. Needs fixing...

Seems the longer I wait with the release, the more pieces are falling off 
(currently fighting against broken dt overlays, thus virtual PCI, on ARM with 
latest kernels, including stable ones).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7adc75a2-c777-6f35-6652-99dd5212926b%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
