Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBAG42CFAMGQENKQM3OI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D341C15E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 11:12:33 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id f21-20020ac25095000000b003fd0f3d19f4sf631755lfm.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 02:12:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632906752; cv=pass;
        d=google.com; s=arc-20160816;
        b=xssSQf59+8NgvRHQ7kXYHgsPXiUtCJqYwqpV8wVutlgCgWbGu3mNJMYd43WQnVz2Gv
         ZKxn6FoJq/DIBiog7yGxCJN1R1TyL27O47IjQDjWOskFoksfIUiGevaS/za7DcT45DGy
         hwOPCj/LaPJZfEWNizOUuSC9Y8FiQGQarPJIwFmQJgZ6ubKbVtvTuQe1M3DDaA68yBKr
         W8djcdgMrtfFrhlkTjiTf16KrhYTUt9sicglSMEEIVBSxpNNhArGexTs2+64dIq+3fn/
         IJxNtwMVWI/kAffPXR4Q2LMwQ0K3x7JHZhn7xH6zqLfPCzw4D/H1TC0+1o+fSN6dHGMM
         HupQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/3Y+p89KVbpnPYCizrSTtJ9t2/BRHdklRtHLgV45bic=;
        b=Ras3+3TMVPor/C/NXSqg95N8hX/0KQsdfQwmwHt8aLYSfUQDCcGDV26C0Vzt2ZUNsJ
         eWDd7Bw4/v8UXeBTj0lVuLJg/UAvW1Cu9Zz5S+Dxo/d2Hyo72OeHjxh/4Qq+wjKmIud2
         xpfCDuOzXUvML5KY4jzFTtOpIggJ+zE8/cig+hBKQUhZ/cFxHwNVLt9KI3E1YWU68Uis
         ngJiPSBbIIqJwVCgMwgjLuNTghjKA32oQkzr507klLxNg3gibREd2nfLKD5DJ3yuMcvi
         Gyh9OvUUwQY9II4AeOkMxT3negF6v7CWyXtb8GWguFJP32LXznrfImHi2oC+lupUlQ+V
         ggXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Vhqa20av;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/3Y+p89KVbpnPYCizrSTtJ9t2/BRHdklRtHLgV45bic=;
        b=PKaUNvi8BSAowlozpxSCOCI5dIpMlMwrxKKdiyP2vQPdup3qZN7Et2z+/JJstJVXbb
         NM8po1caVf87c4Ik6CiIBnQL6wpEXFYXIK2Hu1ys/VSxZMJ64geBdvSdwkRc99WwkwkT
         J4YCUZmittvn9M1ao+tlcX27Wd6kjUnG2xT0jhx6bPvy0T0+3aZPKh8+caCU5ShaaOmV
         nHZiytO/f37gfxIGX9tZ5ooSXpkP6qlY4YCno9Y3HsEXU/2H0E3F/4HEkB2PtaxtD9MV
         O72tN6YAGSBSuz/Tg7Oail10PY4Uk7WuFJI8x3m7YT9Y6SPbdA2xXXgXbAUh4NDuHkq6
         NTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/3Y+p89KVbpnPYCizrSTtJ9t2/BRHdklRtHLgV45bic=;
        b=N0u1+L0Kn+5J3Ff6+cSrmsV1eHG0LoN/mipqDbYCUI8TpOfM4vpMXkKNxqe8f0RqnS
         np/ryKhcyW5Se2P63nZK33uIGXmJTlIgzuh8Dc/Ko1sI5RgwYyzK8cx9gStHkzKJ8P20
         6tTaB5a5NUVli1c+Q0BJdaD6O+G13blY6SLFRLbzuhwfKFTDtqQoNQhhp3+z6BNddnJC
         Cd78ly23IYResq5yy4ZOYuuS+CNNswZpP8HhyyaiYf+oBFur27om2qLgB1bMl7BmY1Zo
         uhtQmtr8qZN0ZS8BCEOBp7dapMtAoufwmTDwPjxWaNjeVj/uSeiqwYwwTFbP5E1WSqJq
         SG1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Rgc39oMuXhzzaQYcYI1b+YgSR4Jr2RtbAHmw4rJ7uVuVtIY4M
	j8IWTzTRGxFbu/o5OE0gDhk=
X-Google-Smtp-Source: ABdhPJyS1nDQyjVbSzMmq45yXhNg5hNMnsIhnbwJfLLVs5YQw7zrd1cO9efGSxoB/aJnJ/bnjRnZ9A==
X-Received: by 2002:a05:6512:2e8:: with SMTP id m8mr10489635lfq.22.1632906752844;
        Wed, 29 Sep 2021 02:12:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:4a12:: with SMTP id x18ls446610lja.9.gmail; Wed, 29 Sep
 2021 02:12:31 -0700 (PDT)
X-Received: by 2002:a2e:1404:: with SMTP id u4mr4932432ljd.269.1632906751834;
        Wed, 29 Sep 2021 02:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632906751; cv=none;
        d=google.com; s=arc-20160816;
        b=VsMJVBEf8GPmLW8lKFtRvFsyiuo1nNtk2iWneDwM1H2p1i90Cw4d8GCToeAwCi/rD3
         r6uw45LdqFlp3W+FwbR3CJQ37D4XynSbt9UuyOfkT2+BvPoO9aKZbvT+a0swmzaOYFIb
         raB5uroMBe4HFPVgiRLmUV42W89vy7zpKc/SE5+8eIoczKZJaNszTAt60corC54/HSC6
         aIc27AIbOFb/zg9CBw2IYJwIzpjcGUyAz6IjDAWZWWXTLBFWIC0vuPJ2TFoD1OqcpIIM
         Ep4nZ0p/ApiGryWVWWAy7EFmVkMt/nFzKtFSpkg+1mq84BBgYoBNA7DSonFF7CPnbfA4
         5EJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=/Xhomhkkl1he/klWvGMMbkmot+SUMmOJouJzwIY6UJM=;
        b=IZeTzsk0zvdBOwDaD+gSy34dqXbaXDDLpIQ7K+8p0S/xE3C1opfm6ZDBoUWTtblf24
         gnRU/kma8/el5rhzNPfQ3P5sc+nd0AA/Upaxnn5Af2Jg11+KL+AWMa/keBsL3OlfKVLR
         ZEnTkvjFOtecQ+rpSOPy4JFIApeidifIzDtvmNWjci6tzMwoV8AfwCa7qar9JjeKTcfk
         vsZrDJYzDWQLmpFS9QxPIhb//tjfeIEti24UOvvcD5qpYoBgfNX+k0NzqCEwt9t4I7og
         nZXsULnRM/jKgIoHEO2tOfPJ7kF5WyTp5Y7OALlSAFCnJ6w2FsIqfgyVvxse3ZG2EEfO
         jeKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Vhqa20av;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id y20si86138lfb.10.2021.09.29.02.12.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 02:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LzbAA-1msFRN04Bu-014oot; Wed, 29
 Sep 2021 11:12:31 +0200
Subject: Re: cell create gets stuck on zynqmp
To: Martin Kaistra <martin.kaistra@linutronix.de>,
 jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
 <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
 <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <167c22e4-d59e-1560-c9d5-58dd3d3c1433@web.de>
Date: Wed, 29 Sep 2021 11:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:vQqepXxZyS7pJ+Y25ya83E/+fABIcJ+GuDK6KRIT9Yn9EMzn5Ve
 YzpJt5t/RhhqeCj03QJMFdDcycVxZyA98LRgp8BcWL3I1ouKjsKsD29HrGly83lpvzf1TMz
 xEHCsKGyMn5Eehy7RAI6ydMNh1krvsHKfkYj7nc/8x2xnwNoXxehB+v/8D184i4rgWNuecB
 8gSsP3f618RKo8d0K6meQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IFka+iI6zSs=:Bbo8nB9ilwxADSqfHKBzWk
 dosaTRmhUpONLaSUkuo/iEvJQe0T36Fl81iwGqrSW2hm3zimGug5DKTpvhM45nZo559pJD/va
 7eY8TEpOpTn9F6ZXQ0Z4FyW+vdO85jS9bStmQrItKlH2ew9xr2vzHiC8XOr3SS5W19ZPQJ+Em
 pQarznoF6NPQne/QIraACR62w4+tUpH1z5EsTKoH7EKFSvfi+p3SOoORNlwaxJNdCJZ6zhmEJ
 iKX/yaJ9Wg3wIyW4PfYMkGsn6qf5Ovdp5kjwvoctnKkKwlO9f31CaTOn1Gkd3JXqUSMWkUU3x
 Y+HB1bPurbUQYJZRvMPO5w5UCW4ScmZT/iHxGFbSs3iByeSznvzi91TfS7Radi8ah8pW5GnAV
 pDI2OAxeNgE+VP70EfoFZO9PfOYOHdlK+i+2htk6FRvhr03WUQJDkM/IsSt+qsPz/jZKGBOgv
 pueG++K57ajdXpioU/uxB3HqWeztsZ5LQ378f6Al7rTs2xORI0eC/flZ6TEnei9fxa4QVO6xp
 qzxjtetb/zh5b7gUdu//ZNsGVNw3MCWRG08O3wNNnJJyLLb8a2f+7NMKSlTdOwzebwukB8Cpe
 h1Gr/NUkOrRq/LwWIUBQ1ohChBNgamNED/htcYaNYD0Dbf4JSiOfa3vZ3M7Ciwgfgw9Y/M1bz
 JSpvEEec9fNLYEbBruOgZ3gNUYP0DsgMWrUBQHOxyztybXNQ/Yh3kAjZAileJVXxnHpat/vF1
 g1OER9dWs5KB7O8MxrJyS6VvBk29DhXSx6iYbQ11Pj0MFgUDcuyq3PeGxof/pR0UoNAOWGKdj
 xkMQaqznEEcX257vTsJArQ1HldY8GucSpoJjTcYVSgirsQaFsU/XR5u/9OvEHymm/V2RZMrWk
 mV4PlAOU8rliaAZc1jELxz3XzPtDxowQn9kilttT5hTLeQhb/+ZC+eRgmupZEogIWZVa9hGAJ
 G/MuUHGsfHQIb9xueWQQQKEdstpJ9llrV3TTN6ogiVCwnElDjHxEI06LdgiEnxlv33vPMAKwq
 rz9uz02ISPAl8SAfhbgqO4eJQnOzZv9YsSR8pd6wCT3z7ykV9uB337xKnwaQ5YRnK2a9MnQ+a
 jYwix4LMTaDTtI=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Vhqa20av;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 29.09.21 09:50, Martin Kaistra wrote:
> Am 28.09.21 um 11:28 schrieb Jan Kiszka:
>> On 27.09.21 10:30, Martin Kaistra wrote:
>>> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>>>
>>>> If suspend_cpu() does not progress, the target CPU is not reacting
>>>> properly on the request to leave the guest and service the Jailhouse
>>>> commands. Could be that you interrupts are not handles properly. Run
>>>> "jailhouse config check" on your setup, maybe you are passing the
>>>> interrupt controller through.
>>>>
>>>> Or are you using SDEI-based management interrupts? Would require a
>>>> special TF-A version, so likely does not happen "by chance".
>>>>
>>>> Jan
>>>>
>>>
>>> Hi Jan,
>>>
>>> "jailhouse config check" finds no problems with the root cell and inmate
>>> configs.
>>> Also, SDEI is not active. gicv2_send_sgi() is being used.
>>>
>>
>> Then it would be good to continue debugging, now trying to understand
>> what the target CPU is doing.
>>
>> The CPU that requests the suspend sets suspend_cpu in the target data
>> structure, then sends an IPI to that CPU and wait for the other side to
>> confirm this via setting cpu_suspended. Check if the target CPU received
>> the IPI, left the guest mode or what else it does by instrumenting the
>> related code paths (check_events on arm64).
>>
>> Jan
>>
>
> The times, when there is no freeze, I can see after cpu0 calls
> arch_send_event() -> gicv2_send_sgi() from suspend_cpu(), on cpu1 there
> is irqchip_handle_irq() -> arch_handle_sgi() -> check_events().
>
> However in the not working case, after going into suspend_cpu() on cpu0,
> there seem to be no interrupts landing on cpu1, I get no debug prints
> from irqchip_handle_irq or check_events.

But there also arch_send_event() called in the broken case?

And in both cases cpu1 is inside the guest when the suspension request
is started?

>
> Maybe there is a HW problem? But why does it seem to work sometimes..
>

I would call for a HW problem only after truly excluding all software
issues.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/167c22e4-d59e-1560-c9d5-58dd3d3c1433%40web.de.
