Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBBTFV2CFAMGQE4ABDB3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FAA41C021
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 09:50:37 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id m2-20020a05600c3b0200b0030cd1310631sf539290wms.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Sep 2021 00:50:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632901837; cv=pass;
        d=google.com; s=arc-20160816;
        b=DUD0f38rIfZ3uuJw0JSmenZog7J98gqF3ZwkzxDt0Jw0l6oyR6QwfN0Dl2Oxy+xiz4
         Ws1QpkCRP9EKuizXVAyjwh3+eOrCvJQZzNBSztR7yHb+v8qn/4ZXiKJHkdwBU4Bh+EvI
         eJq1xoyyFfTfhvPiEqCGxYQ01PhImHVToJARBE8CKerJIkmpbDc8Q4ucGUeMwh62j0C2
         ZOryAPXuNfdQl5MHHkFiXYw8zBJPu8LvGvx1sEV4yo0eeDiACsuqPE/Cwr8RLFCE8mT0
         yzA9Jd8gL4GX3YTBuXrs1Z+akkBS8c3tGTiVSwCz1IVfR5gXDOtNM7UJh6XFuSqfmj3p
         G9Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:date:message-id:from:references:to:subject:sender
         :dkim-signature;
        bh=alnGU6GdG/dVsRNvsTN/BIjv3ntIHICyZwdSIOb8PDQ=;
        b=M0sgB2gmYyg6gOp+yS6EEDGWSIAXrjTUyxRgtEstnmQukrgZ/Bo+C1cXYPcMm+mGtH
         4yGymrFeMMG1YETcoDNKmYWOEZj/diFoZgAJSURnG7+r6R48ahqIhLbSmTkbtY5sr/kp
         1Sx1Nr8AVhtVmQ77QcYcRDUkGNWe2844ax3MEcWBB9LRugSELaoeTxprA+mJLupPUz6T
         BLM3CeyoHAnq3PRX4FVLNI3nO4jfXmDA3hKmFBf13071XXI3ZukFWeLh9GOny308vIUY
         Tyzsm+VO+vcJpxjeQtcxUTY8Qrcx80fxM2kzUVgbKKcUBGj0aaSJFkvdkkM7+10hkk/P
         Hh0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=iasv2xUw;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=alnGU6GdG/dVsRNvsTN/BIjv3ntIHICyZwdSIOb8PDQ=;
        b=ELqO80AqG5fknh51KILKUD2mVnGMhQB57PohAkAr3dByOWJNEbyeES335zCbFCCj0r
         7ATLZr3FDUhY4S8FwvKXXceQxLmIUIPbhxy6ogb03FOxS/ZevNVU6qANaBSxsKrS+cYl
         CmsUfZXEb3/ygTznWHVztN8saTFgWjK+iGHUMlH8BgXTtzyB4hLYEaf7yYQbsScrXLKy
         WPg3i12THWcxciy8eBOszZ0AiJ9SOj1AmzbfLZC0nwCMaWqazDRFJXc5cugSsKng8aS4
         +MGMXw2pOmGNamxaVb46FvW/EpfDDLwWYlG/yZB6V5pUh6hz1uPMNo7b+dCMCfzEgOgp
         1aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=alnGU6GdG/dVsRNvsTN/BIjv3ntIHICyZwdSIOb8PDQ=;
        b=bTF1Oe698NGVqiltVqfR38muZY/5RchU1MMVP3m92f+UcbDX4qShDfGVYatA6wp5WF
         dUiMhfpTSvX9N/9AZZT8umGooPrK7xqRTtP76cYx0IEiKP9PoOOH+DFii35M8mJoFb6u
         ecpbn+dS74WLgABcWeuTOdlEJKmNZJun/BD9K6cChGIUmC/Nk5UpAu4rQjuK4K9jOctG
         JmaY2+J8IFKO6wFyWwL9SbME7F6QyT0KBQBYkx2kWn/zyov86PwTrpjgzpDj6Llprh4H
         shvgBMTERt1xuKmYIRj9bofXGiBUoemU7uyKk/7a2eIl4gQp+5jptyj9LHzP6tHg8JjM
         2zRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533a/lFegG3LPuhU8Usvr+HhqJqR6BuMhT1LN3WmKZUf/bTQjxHt
	KXcEQzR5SweFD6o7xl7tGps=
X-Google-Smtp-Source: ABdhPJxVDYmF5ttkqX0WAPgVbtHUmyfIIAwg17of+tfRO4anTrlVKwF3ySiH6U3uqv9uDqsBBnDXDw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr9049996wmc.24.1632901837385;
        Wed, 29 Sep 2021 00:50:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a285:: with SMTP id s5ls1767431wra.1.gmail; Wed, 29 Sep
 2021 00:50:36 -0700 (PDT)
X-Received: by 2002:a5d:598f:: with SMTP id n15mr4989380wri.74.1632901836233;
        Wed, 29 Sep 2021 00:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632901836; cv=none;
        d=google.com; s=arc-20160816;
        b=hk+KpViT+Vddf+LFzMKSRU4Qp/I2xFifm8b9PS+Ew2uglnxU+YdPntxsNIRHZT7JZi
         +5AbdaNFmKsqgBmixjKFpSx7ysO+yebobrFZyQaqEYnS3HUHrAHyhqDowvqkghKLm4Dc
         n3JLOiI40wGMh8gLvtv0KWNxpZFcjIniNB7/+3zjuxTOHe4ccOCzeDirCd3qBYcNutCC
         H6jwDS4wj8BT0IrzJmPnCsitpbNQ857Q7I3MTA/iAX69LLlHhP2V4waRJnmMPYuzLHzX
         /wLN30nXvoIpP4EDjT4Pu7QB+zXPQfQsYoP40L3G9LMcPkfOzrer7CE09tKwepbdjxuW
         L8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:to:dkim-signature:dkim-signature
         :subject;
        bh=5ugf3k+9Wg2IHtmwQ4w2LvJoveczq+lo/7pRYq/wN1U=;
        b=vG8Kdmi/EO2Crk2FG50q6id7m4PDeojogFHIN8PiQYYqOyVkv7YMI6vM0D5O+JrnkV
         rc+aQ6pGkkyCDv8CSDe9ac6N35cVB2KTZ4s4m4YT4ZFxqytHO6bYFGIK/5PKD+o/YEMc
         dOSGevCLX3fiq9R+BbGWpdBsslmlpegxvzw6GrTao00J0/cWtj+ItYMlfE7GHHRtftGh
         1cNBkI6r2hVyOO7ioDOMWOE676arpwjiLhldS/Jv/NEKTusPKTUMKNoos4HeHLQnaxQd
         iaajL8GNJ+gQyRbyEnTygsPifl14cBi0fY5676+RVD8E0OO1OHXcHIK/mbh5Pv0fpFVi
         RiZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=iasv2xUw;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [193.142.43.55])
        by gmr-mx.google.com with ESMTPS id e2si118019wrj.4.2021.09.29.00.50.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 00:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) client-ip=193.142.43.55;
Subject: Re: cell create gets stuck on zynqmp
To: Jan Kiszka <jan.kiszka@web.de>, jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
 <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
 <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
From: Martin Kaistra <martin.kaistra@linutronix.de>
Message-ID: <b5c06e03-9bb3-6703-aa3a-91479cb123ae@linutronix.de>
Date: Wed, 29 Sep 2021 09:50:35 +0200
MIME-Version: 1.0
In-Reply-To: <8ae7d02a-325c-1be6-fc2c-8654b5e8bd4b@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=iasv2xUw;       dkim=neutral
 (no key) header.i=@linutronix.de;       spf=pass (google.com: domain of
 martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender)
 smtp.mailfrom=martin.kaistra@linutronix.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Am 28.09.21 um 11:28 schrieb Jan Kiszka:
> On 27.09.21 10:30, Martin Kaistra wrote:
>> Am 24.09.21 um 17:46 schrieb Jan Kiszka:
>>>
>>> If suspend_cpu() does not progress, the target CPU is not reacting
>>> properly on the request to leave the guest and service the Jailhouse
>>> commands. Could be that you interrupts are not handles properly. Run
>>> "jailhouse config check" on your setup, maybe you are passing the
>>> interrupt controller through.
>>>
>>> Or are you using SDEI-based management interrupts? Would require a
>>> special TF-A version, so likely does not happen "by chance".
>>>
>>> Jan
>>>
>>
>> Hi Jan,
>>
>> "jailhouse config check" finds no problems with the root cell and inmate
>> configs.
>> Also, SDEI is not active. gicv2_send_sgi() is being used.
>>
> 
> Then it would be good to continue debugging, now trying to understand
> what the target CPU is doing.
> 
> The CPU that requests the suspend sets suspend_cpu in the target data
> structure, then sends an IPI to that CPU and wait for the other side to
> confirm this via setting cpu_suspended. Check if the target CPU received
> the IPI, left the guest mode or what else it does by instrumenting the
> related code paths (check_events on arm64).
> 
> Jan
> 

The times, when there is no freeze, I can see after cpu0 calls 
arch_send_event() -> gicv2_send_sgi() from suspend_cpu(), on cpu1 there 
is irqchip_handle_irq() -> arch_handle_sgi() -> check_events().

However in the not working case, after going into suspend_cpu() on cpu0, 
there seem to be no interrupts landing on cpu1, I get no debug prints 
from irqchip_handle_irq or check_events.

Maybe there is a HW problem? But why does it seem to work sometimes..

Martin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b5c06e03-9bb3-6703-aa3a-91479cb123ae%40linutronix.de.
