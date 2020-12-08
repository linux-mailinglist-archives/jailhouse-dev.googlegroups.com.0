Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK4GXX7AKGQEN7UTOLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC52D2730
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 10:11:07 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id o197sf3297897lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 01:11:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607418667; cv=pass;
        d=google.com; s=arc-20160816;
        b=b2LexoD+u4oEla3wU1EZJ1W7Py3NC1TOWV3/vQRGccmZ3+h4xk/X64hd+keoYKfe4q
         O3cuPjWsbgic4Orb04do+EhEwuGa16x8jstabCxDSpCSqn7KsjfnJDi//CUdd4fFHMhn
         ZXUwHgm+qhnOLDKCNdTGBRFGX/bZigV70gX5rDQ0tR0dstTgZ7cIXMZ0LK6UlYBdhy/7
         ylONgCkglUo4XrGTt7+GD9rEbV8PWeLn2M8UGrSyWjMOTLVQT2kzATCtyKkBXStI5+hg
         JD1ytSTYqUNSiJ46v1nnmP5aTcd9rfdWoQnjKjRsuP7A78a53WfzHK8p8WoOey1DkE1/
         zLjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+i0aY3EyOnLf0oupGCAkSfso5zO0WyacBe9MAavf/ow=;
        b=rjn70GpxmQelLRrvJw10979kRaWnZbjWH2otO3M7OwAaytxne3XBx+qXb8OS0KhD6S
         Lmr9rX3egafWSAdztgDys8kHWyQXTjC3QXBdTV7BgZtaX+vtydlaIeNctBUuONxjRLsb
         S5T1OULiRi3VfNagrkYdiwthFyU4P1I8wd+tTGGDY8oFPb0PdJAmXyCKqVuyONJEG7t0
         SophOfordLwUt0nq926IgcRgGPaAzs72mqJvfbt7F5RVy0dhOMZB97IwVH52mdNAIutM
         NvQNM0A+Pfi5Jgp11LzoIQIo2VIn6LmE5DX6grmGG8uiR3YBsxUyRBiMwoGxoWvGHcxA
         SViQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+i0aY3EyOnLf0oupGCAkSfso5zO0WyacBe9MAavf/ow=;
        b=QYogYptD9FizK2aeijWpTN9TCycxbEifzHyNftmND506orU4sM7nmO7XDkmlqBPrnf
         6wul3RFlNW3YAHAXoKnA+qP5MD9+NsZs+gW3cehRrmfWTyQaawo9CRSBaXd8Y3mxz5bU
         o4awv2CWman+lhaLkJkp1i8EA5j0JartgpobPxiIDBtD1nNj4dYqMpAoTRmxBAjhLyBt
         3lVZM2QwWuBn1vQMi1iNnIT2VHHJXlfRPIPGlcgmcOYFMEIx3w2d0sZiHCkW6FmjfGom
         ckKsO/jdgWDbUaBEAF8JBDQ2u5fbiUuzj7weuMxWoB+EHSLOimPNpLPP4+mn3XCHYPY/
         35vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+i0aY3EyOnLf0oupGCAkSfso5zO0WyacBe9MAavf/ow=;
        b=da6LIN2TiN85R7nZuRzKdyMKrBQLEMVuq0YI9CAE5kQzYcLIiF2/ND/dP6nTvmDuhU
         jzKxjoxcjFz4Ah6TEyPsAGQ4EwazDnuLJAWy7LKlve1K4zevoMAAyRUqhNHCWAtgHNCx
         6EZz2Bq4jmOlD4DJvz3Scmx0JDFtM2wVPBQqyzyyzKFn7WTRp7AhZWR6lOzvbM15rtWt
         LeYh+usHhsNxRcAMUhyODxm5PtdVG3Ws20ZVrQC5+7yYDS+FlM+mv4FrnmPQ4RjUGq9y
         FJWPjbVQ8RXMNbxsOcP/F/Ub6g0H0mPtzbQRAsSt0cpqTl8V+DkMw5zQNG+Mi75JK5VP
         bj2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QONJd27mY2cp+y0u9yezl/luXacU9oIA7SXNPfmbQB8QMoJXL
	2YQPxI/VuxpMxVHbApjiSCg=
X-Google-Smtp-Source: ABdhPJwfEmG1SfLn/P0ppXYj8KbOYh+DjiuO3Bv0xVTLU6/ehGZdYO4QUTYsJ2GcXhPq4L7ktCeghg==
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr4731488ljj.326.1607418667534;
        Tue, 08 Dec 2020 01:11:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls861263lff.0.gmail; Tue, 08 Dec
 2020 01:11:06 -0800 (PST)
X-Received: by 2002:a05:6512:10d3:: with SMTP id k19mr4906957lfg.362.1607418666290;
        Tue, 08 Dec 2020 01:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607418666; cv=none;
        d=google.com; s=arc-20160816;
        b=zODF5my5wMb9vZSdArFFlciUxe4HXmGfAzbmRWr4mWFOlvVsw3XEQT56CNYCZjopp/
         eKhikC6hCSPOgUlyhSopbSv2vhVk3mWn5wKtMR3VXfN+co0qX4zcIlryuxXBCGJgQQww
         +nY/glP7WUrzJUt2hj+Nu5d5uj5o9uHZpCG/XsNWCng9o+KWN/Zgeyl38TquFFqZlaQo
         MK8upBj8P1jxhut0VE52HKRVj0jfZNqbWbSsfZDLc/coyiVl/+OoKgI/Y8HSDSeG8+ri
         UReTLyOL+B0xyCp5YAb7kZ8qDHhIiqCi3gqCyfuISBXGe31pIoTLj+1BTJZqxzPA1CR8
         TxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=wPA52Nqae0n5HjXYDmPh4rqGrzl82/6krwvQtZsMipQ=;
        b=VUvfOSza2ZK68K/v08h2Qv5/PnCt9jCmeIX7S4KmAl8IWcymWfDkNUSe9USAXXnuhe
         q2iHFw2JHV/R5rnCeYUNUmgSbeEqMbyyZW0nXedzh4YRnyKfoXAHLI4RNFy9CT3N1D0I
         nx8qW3R7MWFxik4Dtvm312xfQ1KTuA4j+pFMKaw/aAZTJ6XULwjngfEDga+Efga3KOpF
         hVp3vmAMvHIjY423ytIH+OrbVyNR5ogQVBTWr+oNU/1GJ3gx3rEOJSnbRve5T+7f/1FZ
         Mioxhzw3wAg4r5iqnR2hi4tCqLqVKlLFGngZTa3TF63yRAjfKWeh7u+MEkIGqoo8Kjzy
         eJ8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r26si139289lfe.8.2020.12.08.01.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 01:11:06 -0800 (PST)
Received-SPF: neutral (google.com: 192.35.17.14 is neither permitted nor denied by best guess record for domain of jan.kiszka@siemens.com) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B89B5a1001043
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Dec 2020 10:11:05 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B89B4C1023238;
	Tue, 8 Dec 2020 10:11:05 +0100
Subject: Re: ARM64 MSIX enabling error
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
 <DB6PR0402MB2760AF37C2A42481C80249E788CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760C14BDE7BECED2A60906488CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <543a61e2-e521-5c89-0d96-9f06946f0aae@siemens.com>
 <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <35de9824-dc88-dd3a-175f-6db6c086d2a6@siemens.com>
Date: Tue, 8 Dec 2020 10:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27605393AB95974CE4D8944E88CD0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 192.35.17.14 is neither permitted nor denied by best guess
 record for domain of jan.kiszka@siemens.com) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 08.12.20 09:01, Peng Fan wrote:
> 
>> Subject: Re: ARM64 MSIX enabling error
>>
>> On 08.12.20 06:28, Peng Fan wrote:
>>>> Subject: RE: ARM64 MSIX enabling error
>>>>
>>>>> Subject: Re: ARM64 MSIX enabling error
>>>>>
>>>>> On 07.12.20 08:46, Peng Fan wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I use MSIX, not INTX in root cell file, but always met the following error.
>>>>>> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
>>>>>>
>>>>>>
>>>>>> I am trying virtio ivshmem on my board, but seems virtio ivshmem
>>>>>> vi_find_vqs not work with INTX, so I change to MSIX to see how.
>>>>>> But met upper error, any suggestions?
>>>>>
>>>>> MSI-X for virtual devices only works when injecting them into a
>>>>> physical PCI bus which is using MSI-X already. Is that the case here?
>>>>> If not, you need to debug the INTx case.
>>>>
>>>> ok. Thanks.
>>>>
>>>> I could see virtio-ivshmem-console /dev/uio1 shows a few lines log,
>>>>
>>>> But it responds to input very slow, when I press enter key, it takes
>>>> long time to respond.
>>>
>>> After correct the interrupt number, it responds to enter key fast.
>>> But if I not press enter key, the virtio-ivshmem-console /dev/uio1
>>> will show nothing. If I press enter key, it will show one line boot log.
>>> Press one more time, it will show the other boot log.
>>> I need press enter always, then could see the boot log printed out.
>>>
>>
>> Still interrupts issues, I would say. The GIC MMIO resources are not
>> accidentally passed through? Does /proc/interrupts report events for the
>> virtual device?
> 
> ivshm_irq_handler is triggered in the beginning, for several times, but after
> that, there is no interrupt triggered from inmate Linux to root Linux.
> 
> The inmate Linux is dead loop in 
> __send_to_port
>       -> 
> 644         while (!virtqueue_get_buf(out_vq, &len)
> 645                 && !virtqueue_is_broken(out_vq))
> 646                 cpu_relax();
> 
> If I press enter key in virtio-ivshmem-console /dev/uio1, it could pass the loop.
> But it will run into it again later and not break out.
> 

I bet the "virtqueue_kick" that comes before this loop does not trigger
an interrupt on the backend side - or we have race that this is consumed
without delivering the expected answer to the frontend. Didn't recall to
see this, so I'm afraid you need to debug deeper.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/35de9824-dc88-dd3a-175f-6db6c086d2a6%40siemens.com.
