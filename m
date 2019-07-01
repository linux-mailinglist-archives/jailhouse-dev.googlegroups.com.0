Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4H47UAKGQEIAIKG2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A45B6C5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 10:26:32 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id c4sf966280lfh.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 01:26:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561969591; cv=pass;
        d=google.com; s=arc-20160816;
        b=kLn0D/we3tRmNj/cHVv75WMDbqTRhjWvlJnuG2Kcg3SX0x2x6nJh5S9wHtldhYgDzB
         /uz926oPsBLmcJ54A+Gsm6+vr9xdSuvY6pk3YXifX99864dfIVVlyYUja8I5YDdEYl4Z
         waDTbd348u4sUflxykUw2nJNfAWfm2aZ8v15Ohp40CEqiLiBnduJfEzxe/QSg6vBgAlK
         ankMMnV5pawvYPTr94sQbGzfmoZ69IVqELwakMG/VcWEHVDVm+6Pxv7qMa09TziM6Q9F
         jJJF9T7AvLCc6MPc0dUiUsPU3MNgLurYflLdv/iEsreKKmeELRvBX4lHm/4CZT04swBE
         RBlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=75bbJ64fJ/To72b6/hq0bCZHU3gRj0mVUHSrhfGbfC8=;
        b=jZjGVjWB1qBvftjIbzeQ96fReLJM6XqHTD5HMs3Vbfzpejrf7q2qcfdG7p9ptAB/UE
         oMONboIEwWpE7jNv96NznXlBlPzxCnwLVmwNmNMuJxa+QJzEiQEgg/h9XXw5tg0f9W23
         KHFL908ZxVS8MC9TiCsWv6xoBBKXT77MjHN0TwdiIHT4SXFjwLZpwTrOnnIGW4rhRMlr
         acGxXJIwIJ8q+08P34/gC8/d245zbgiJJqzRxyDyl1eHeHT/8wo8jusaOc1q9mvIvmjI
         G8Io2ZXKba0ej3whV8Owp94xflEQl67JG5Y2DHPnMUExOo+pRUfjrtT/fxgiwoMTgEWw
         1ejg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=75bbJ64fJ/To72b6/hq0bCZHU3gRj0mVUHSrhfGbfC8=;
        b=ix4eKOsiSau1o+cGrUI/l6St/+tRw9O6gxBe7sIqnKB2TEA3OGQJFlPHhR7nOQBzu4
         uDmsHfyHcvfCyTFmZc9fyxcytx9dvKDjV+3vByFrfsAz0pbZDHRoI5OMY5T+rRWN+Fl0
         yG8vygCLdO+33lCFYPkqDR6lV/Fw2ZehSDzZN7fsF2X5H7Owg+Japa7IxpQQGUCh4vY0
         rmnXgKr5WgH9TFAiFrd/101ih1+GJVf0X9IphfSEnWy1E61OUBpEZKf25NqeJrA6mXbR
         Fg5kqgH0Vl+eec0Yep6o4LxlDqFgEBuaFsPK+WeSxoPU3RKZEQFPvHRDRmlqq6uAVcTr
         49SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=75bbJ64fJ/To72b6/hq0bCZHU3gRj0mVUHSrhfGbfC8=;
        b=gR9dkWSqOa4zfFCZuMq932NB9HiLFxrCYM0sI5EyNiWm73Dup7ZGPHmhUllevy9Xhm
         g0zPz6770A4LmQF68HiuopNv2EbK+I/wDRyTy2MmsGlYaA1yP3xCmmLzwxRB2g7CfCzq
         ptQ5jpov63+/lnDB0hOzZ6tFxYna9WNW4af86Xm0fqC15P7YgrzxuCwcCEAv4C6KLGAj
         +x32B5nyjqJRy3COLlKensl1bGfCgwiDR5gA8fgZnpFivGaBC14jAGxzlEasZRebkXw0
         bFS3HUh5gEeyXxzPEgHvWYphp0ZICLRAds2bfWJ+OZOMocTaOfcfyvBnaI/+P0+MKIpt
         ysJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVN6A6swiwr8wdDiy6So5BDRo36qr1zZ1VUZ4kGRihH3x6U2q4A
	Dsu+x0D+SBW4hWWa6uN67HM=
X-Google-Smtp-Source: APXvYqxUTLRpNCOeDmmMzeBRKTuEpY7WCoeB3s/duDcPQAvlC1ucWaALlT6DykF137SXYoqziKUGEA==
X-Received: by 2002:ac2:446b:: with SMTP id y11mr10991427lfl.158.1561969591580;
        Mon, 01 Jul 2019 01:26:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9445:: with SMTP id o5ls1008223ljh.9.gmail; Mon, 01 Jul
 2019 01:26:30 -0700 (PDT)
X-Received: by 2002:a2e:8999:: with SMTP id c25mr13228378lji.169.1561969590830;
        Mon, 01 Jul 2019 01:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561969590; cv=none;
        d=google.com; s=arc-20160816;
        b=jhmXKEVZwSG1PXWkzaKm7aaw78kRQnEOotNh13L4fBF+p3g3C1b11BFlZggz2U7Yc9
         Y3iyEfx55lE0UzuDc18H7Fs2WOs6/3J0J4fXW5VYxFkRxbTTfTeZfW3NwQ8Ws0Hmx/Xi
         3Ss3KuqSsGCNyBVJlHTQ0dTix9OEZKQdTW9hkJvL2u/SMU4UEWMXR7bM2LqGE5mzKHgl
         5nuYzvbYwx4rSv0+HASS6hoim0S8IX2iDXTvgJ5MCY85rorwHDrBvq+3sLeQdwVsKje7
         MfPUQzVQeX0y9Brqb6cvlQypM921IkXDJUUgw8PaOesa+aDG1N2slKDDqk53MD/wxdYc
         p2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vTXV87IgkjmnLwjHfcbG9q6I/3A91SXpQRfIC99fHa4=;
        b=qNVWmkw9s0gzf9T8f+I7v6gOsLQSI/Uf357+U3eHdl1/pmmGXumD0foyFhB/EA1qf1
         g4t6Fq1auoSAXHUF9vTeugigO9fQejP39lrXDX1XhySdrzKeGAKFmBudRcRpg8QbDdBS
         5kzpzIpY+f7ToKowia9AWepT1XdmboyCfL/S+2b0focrSsQHfJCg8wHh6z4mzDVaUo3I
         QTN+WMJkiCSvCo6XcjHosE7Ro6VDH2vtV+cFD6TjE3OWQAeU/1J78SbN/jqUvXjmkkei
         Y4yxhl/olMh1wKW2lgDO8afxUqMCcJI36HaHMMUJ/Ss+y1HT+Lu4wQcU5FNHh2+cwHvN
         mcXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h1si526821ljm.3.2019.07.01.01.26.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 01:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x618QT6V009385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 10:26:29 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x618QTFZ015911;
	Mon, 1 Jul 2019 10:26:29 +0200
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
To: Adam Przybylski <adamprz@gmx.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
 <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
 <af790385-ad03-9fcc-33bb-60dfed20e169@oth-regensburg.de>
 <510bf146-8ec5-414d-8a22-33d61476ee1f@googlegroups.com>
 <e0d7a082-bb03-195a-d146-4ba627a93be4@oth-regensburg.de>
 <27b260ce-0dcd-4019-8dc5-c757500422c1@googlegroups.com>
 <121ab35d-79ab-5b00-9b27-473809a02707@oth-regensburg.de>
 <f3fc160a-01dd-44dd-998a-a8f1e48c03c6@googlegroups.com>
 <eb09293c-1b9d-8e4f-dc7a-1a0bd1263b5f@oth-regensburg.de>
 <1d116579-e641-4383-ab8c-2747e4e869ab@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <511ad017-350d-6cae-b1ae-bce3fc0052c3@siemens.com>
Date: Mon, 1 Jul 2019 10:26:28 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1d116579-e641-4383-ab8c-2747e4e869ab@googlegroups.com>
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

On 01.07.19 08:23, Adam Przybylski wrote:
> Am Dienstag, 25. Juni 2019 15:27:41 UTC+2 schrieb Ralf Ramsauer:
>> On 6/25/19 3:21 PM, Adam Przybylski wrote:
>>> Am Dienstag, 25. Juni 2019 14:50:44 UTC+2 schrieb Ralf Ramsauer:
>>>> On 6/25/19 2:46 PM, Adam Przybylski wrote:
>>>>> Am Dienstag, 25. Juni 2019 14:14:41 UTC+2 schrieb Ralf Ramsauer:
>>>>>> On 6/25/19 1:31 PM, Adam Przybylski wrote:
>>>>>>> Am Dienstag, 25. Juni 2019 12:10:03 UTC+2 schrieb Ralf Ramsauer:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 6/25/19 9:38 AM, Adam Przybylski wrote:
>>>>>>>>> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
>>>>>>>>>> Am Fri, 21 Jun 2019 07:18:14 -0700
>>>>>>>>>> schrieb Adam Przybylski:
>>>>>>>>>>
>>>>>>>>>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
>>>>>>>>>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
>>>>>>>>>>>> schrieb Ralf Ramsauer:
>>>>>>>>>>>>    
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:
>>>>>>>>>>>>>> Hi Adam,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:
>>>>>>>>>>>>>>> Dear Jailhouse Community,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
>>>>>>>>>>>>>>> Processor. Unfortunately the system hangs after I execute
>>>>>>>>>>>>>>> "jailhouse enable sysconfig.cell".
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Do you have any hint how to debug and instrument this issue?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Any kind of help is appreciated.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Attached you can find the jailhouse logs, processor info, and
>>>>>>>>>>>>>>> sysconfig.c.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Looking forward to hear from you.
>>>>>>>>>>>>>> I'd say the following line is the culprit:
>>>>>>>>>>>>>>      
>>>>>>>>>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1
>>>>>>>>>>>>>
>>>>>>>>>>>>> Could you please attach /proc/ioports? This will tell us the
>>>>>>>>>>>>> secret behind Port 814.
>>>>>>>>>>>>
>>>>>>>>>>>> Not always, the driver doing that has to be so friendly to register
>>>>>>>>>>>> the region.
>>>>>>>>>>>>    
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> As a quick fix, you may grant your root cell access to all I/O
>>>>>>>>>>>>>> ports and see if it helps.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Allowing access will suppress the symptoms, yet we should
>>>>>>>>>>>>> investigate its cause. Depending on the semantics of Port 819, to
>>>>>>>>>>>>> allow access might have unintended side effects.
>>>>>>>>>>>>>
>>>>>>>>>>>>> You could also try to disassemble your kernel (objdump -d
>>>>>>>>>>>>> vmlinux) and check what function hides behind the instruction
>>>>>>>>>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.
>>>>>>>>>>>>
>>>>>>>>>>>> A look in the System.map can also answer that question. On a distro
>>>>>>>>>>>> that will be ready to read somewhere in /boot/.
>>>>>>>>>>>>
>>>>>>>>>>>> Henning
>>>>>>>>>>>>    
>>>>>>>>>>>>>    Ralf
>>>>>>>>>>>>>    
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Best,
>>>>>>>>>>>>>> Valentine
>>>>>>>>>>>>>>      
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Kind regards,
>>>>>>>>>>>>>>> Adam Przybylski
>>>>>>>>>>>>>>>     
>>>>>>>>>>>>>>      
>>>>>>>>>>>>>   
>>>>>>>>>>>
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> I looked up the function which gets executed in the Kernel. It's
>>>>>>>>>>> "acpi_idle_do_entry".
>>>>>>>>>>
>>>>>>>>>> Well now you are back to what Valentine said. Open up those ports one
>>>>>>>>>> by one, until the problem goes away. The alternative is to disable the
>>>>>>>>>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
>>>>>>>>>> parameter, but you probably do not want that.
>>>>>>>>>>
>>>>>>>>>> Note that whatever you allow might cause weaker isolation, in this case
>>>>>>>>>> maybe real-time related.
>>>>>>>>>>
>>>>>>>>>> Henning
>>>>>>>>>>
>>>>>>>>>>> Adam
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
>>>>>>>>>
>>>>>>>>> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.
>>>>>>>>
>>>>>>>> You can again look at the system.map to find the code behind the MSR access.
>>>>>>>>
>>>>>>>> The rest can probably solved by consolidating some non-page aligned
>>>>>>>> spreaded memory regions in your config -- could you please attach the
>>>>>>>> output of jailhouse config collect? It should contain all data that is
>>>>>>>> relevant for debugging.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>    Ralf
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Any idea how to debug this?
>>>>>>>>>
>>>>>>>>> Adam
>>>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> attached the jailhouse config collect output.
>>>>>>
>>>>>> Please try the attached config on next.
>>>>>>
>>>>>> You can use diff to see what I changed: I consolidated some memory
>>>>>> regions to one large, contiguous region. Should at least solve the MMIO
>>>>>> traps and the unknown instruction error.
>>>>>>
>>>>>> Remains the MSR access. What code is behind the instruction pointer?
>>>>>>
>>>>>> Thanks
>>>>>>    Ralf
>>>>>>
>>>>>>>
>>>>>>> Adam
>>>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> the attached config works fine regarding the IOMMU/RAM accesses. Thank you!
>>>>
>>>> Great, good to hear.
>>>>
>>>>>
>>>>> The function behind the RIP is native_read_msr_safe.
>>>>
>>>> Well... That doesn't help. :-)
>>>>
>>>> could you please
>>>> $ echo #define CRASH_CELL_ON_PANIC 1 >> include/jailhouse/config.h
>>>>
>>>> and then recompile and reinstall jailhouse. This should give you a
>>>> stacktrace of the kernel when the crash happens. Then we can go on
>>>> debugging.
>>>>
>>>>    Ralf
>>>>
>>>>>
>>>>> Adam
>>>>>
>>>
>>> Attached the dmesg with the kernel crash.
>>
>> Perfect. Try to add mce=off to your kernel command line.
>>
>>    Ralf
>>
>>>
>>> Adam
>>>
> 
> Hi,
> 
> thank you for the hint. It solved the issue with MSR read.
> 
> After that there was some RAM/MMIO assignment and PIO access tuning required. I am not sure about the PIO permission. Is it right to allow pic2 and APEI ERST?
> +		[  0xa0/8 ...   0xa7/8] =   0, /* pic2 */
> +		[  0xb0/8 ...   0xb7/8] =   0, /* APEI ERST */
> 

APEI is needed if the related kernel feature is on. For the PIC, I don't know a 
reason. Maybe worth to extract the kernel backtrace (CONFIG_CRASH_CELL_ON_PANIC).

Jan

> There is still some issue with EFI access but it's not so critical.
> 
> Kind regards,
> Adam
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/511ad017-350d-6cae-b1ae-bce3fc0052c3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
