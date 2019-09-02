Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB3ETWXVQKGQEVVIYMLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CDA5B96
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 18:57:16 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id m6sf1991189wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 09:57:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567443436; cv=pass;
        d=google.com; s=arc-20160816;
        b=f9g/jYQNojmCxz6KkrE+Dz5W92CYDVY7p7/Q9ap5ZpIaKfNjTE6sQoEN8MxV2ysfNm
         UGySzPE4uSmh4BCpewTE8hvN/ooKNj4ausvZQ5VWxkVXhNXhXefJvSp4tfh3agprwnM/
         Yw2nhviMD0XQeH/P+B2Km2nT5JdxvANC83XcluQJikHMvmv0UtylWZcLrZLaW/7VmdnR
         TyeOh/cuACE1C35tY8QLD0AIFLp6UJu1EejMr/IMQQDMuj/legywIIYLY58RZyvOyqGB
         MPHLiPz3UxXJ/AQR11OVjeToOaAxVzU4mLwCybcluttqahAaPetPdxK4uEYB3GfUVS6Y
         kj9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=8wT/kcnWq0WPaoYgiN1A3+z3SbLCxsQqyiMDF5wiLBI=;
        b=KgKXrQ18fRNEDQaD81HTlmak179btBAmB3a0KWMGenL4tM4qOCfNYUwhJ9q4NZcrrC
         B1Grmtbp2TWVwFxnGNCz/xRKownGOZM72Ngy363Wfvnmfphv1QNGJa4YaBHlG2pW1h9r
         rFfMnqE/4DS/VO3dJbOV7s0+LyKF5AfH0hDKApIqtgrBOsMMkjYGtBNPg5CoIlAoJCVO
         3VjpKPY/MxOuysUA05wEgu6GNIsEJje83PMp1idEnKtRunU7c+fzpQQvvhmdMqdwkpq8
         Uky0Vp4G/D2viAVMHNrb+3uex5mXWlc9hkf47eYFp+NxXHaZ0YUedPCUbrwAA4tqg92t
         e1LA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8wT/kcnWq0WPaoYgiN1A3+z3SbLCxsQqyiMDF5wiLBI=;
        b=DGie1g8Btw+amYbbnYGHgbvmFmKgazxEzt6Zh6t8RunG/L6EpmEDhlhYpZ7+gjccFF
         DFmYH4l1M209uBO9SZn4trafu9NSYwVSH8a+qe1aRen4hJCav/1DA7uYMTECJkLWBA3x
         DnnXFjaqtF+9V0+P1Xk0d6jjU+dT866c/CWLCsQXAZS/AY9+deezVbx5yYaOpQWgmkGR
         gPVFx7RltlRhEsapqfsui6AWy5DXhnRFpE9UFiqnJztNJbhEIOZLFK3rVJefxZ5YR5Dc
         WGaLMoCklkD71zqsOXzZ6Ad68221ltNvfZZ1JpVpu8X6/mca1jM9rDLV/43a2grJ2qL+
         YoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8wT/kcnWq0WPaoYgiN1A3+z3SbLCxsQqyiMDF5wiLBI=;
        b=XtPHMjowv2zSsY1Pt/2/QkMrhifehk6niiqcWSkTvlYN4wM0JIjre3OfFyArVjgMJP
         30Tc6ow9QM5ZgDj2bYRJfRcR1P76onNvl/95P9R+yyO23Q+/kbz+dxX4B3SmkoHuj2pk
         tvr8SNcxGymuB5icpBZQPcBbwkwW9SwV3Cus9i6BmWcShKE9PvfhUvq7thpSP5Q6CZSU
         KhIhK/TRjCrv1zzDXTePpPNLMLN0BkASUckQkrUn4NVBZyrdH2TfSONJizRCcp6O2Fpc
         lkj2BAF1bm7gv3oIt5ILkRjI7wfZiiOLY4Xu9and9Rav1udcyIGWPFhNWcW/ZcANpfp0
         4nsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXOrbyTF/NsmroGy/B+x+y4uh9owwzHPPZPpT3Qt5fYaXmFYeJz
	5wYWxt7k0zDRJngxIE9AAnA=
X-Google-Smtp-Source: APXvYqyO5W5AoLO0KnqkuUUd1FsCedEP322CXqFUQ5FJL4Z9tpO29w8PEOdAKjbSwAmxHJriudr8OQ==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr37027938wmg.120.1567443436496;
        Mon, 02 Sep 2019 09:57:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c141:: with SMTP id z1ls5731964wmi.5.gmail; Mon, 02 Sep
 2019 09:57:15 -0700 (PDT)
X-Received: by 2002:a1c:c00e:: with SMTP id q14mr37566885wmf.142.1567443435786;
        Mon, 02 Sep 2019 09:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567443435; cv=none;
        d=google.com; s=arc-20160816;
        b=xQw09AL8twimKMTM2Rd/qL0+B5MqSEph2WkZjXpmlgpLQrmAhsuKfB+Nto9yQSWo3T
         kbJMOroRNxbIE5y96yuUNIwD5C5+DWrflm1FeT9a+vYZqFZnMSCph9PzVuP0Dnr+EcIn
         Wsjytx01doAUZpM55toZ4x87fBFOiFWag3by8J7GljiheQt7C78V0fXRZGScv/KIgdv0
         WKt9Y92aH/4M/XK9MxS3aXrR48zTRdF+/Qcmh6TuIi4jWgwKqbVvqXqbH96OKeLbu0e1
         Yv7/Iyutxufv4OK3IAAZ/LFZfQfI1+7YsLygscODE7QRHOvt7uWBTbmGYXcbtFPjo45p
         YP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=edRLlFhNBT9UU1fqQV2BnXXI1HQ6vPNLxojp3LlY+PA=;
        b=Tavz4OgsNMIMFCLuCCAMneq3IRR4uDkdVXc7xd3/tfQE0YyzuefWiNGTmRx7pxIlhb
         +um/1Xz+RLUxyis13KBkuKpGRydge/BBbmdENv00HRN9shweq/ZCmhY51TNm+etaBtkq
         t08jwa+EUODh3qTfiRYuMkjKhlFbnRXcLlJVKEmonvTfoKSnxQYN5Tu1SFlB7BE6W7O+
         8ZQ1mOlAMUWRU7tQ/fuhSNKdfOl3wizcWL6W2zPoT96GuYUvabZFR9nYm5eglCqytHMr
         H6JUY2MqrH0KU5wLkQy9LVFHs94hPZFwvcqVbrfRUCm2u3gKrjkkkkcBvA1AFWIGoZ87
         c3Bw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s194si895132wme.2.2019.09.02.09.57.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 09:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x82GvEJB012120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Sep 2019 18:57:14 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x82GvEIJ032398;
	Mon, 2 Sep 2019 18:57:14 +0200
Date: Mon, 2 Sep 2019 18:57:13 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nir Geller
 <nirgeller18@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Interrupt Latency in RTOS inmate cell
Message-ID: <20190902185713.0c54ed6b@md1za8fc.ad001.siemens.net>
In-Reply-To: <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
	<bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
	<20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
	<a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
	<53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

A good way of estimating the cost of someone messing with ones caches
is to flush them yourself in your test and see how much that costs you.

I am not sure how complicated it is to read performance counters on
ARM, but those might give a clue.

AMBA QoS can maybe help raise the IO prio of your RT-cell. If a DMA
request is what is slowing down your GPIO.
I have never used that but maybe you can configure it from Linux before
you enable Jailhouse, and make sure that your root cell config blocks
future access to the configuration mechanism.

Henning



Am Mon, 2 Sep 2019 17:27:47 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Hi,
> 
> On 9/2/19 5:11 PM, Nir Geller wrote:
> > CPUFREQ is set to performance, and I'm setting scaling_min_freq to
> > the highest available frequency (1500000)
> > CPU idling is disabled
> > 
> > Now I see that executing a simple "cat somefile" on the command line
> > causes a spike in jitter  
> 
> only for the first time or also for consecutive calls on the same
> file? IOW, can you observe/trigger the spike when somefile is in your
> page cache?
> 
> Does the non-root cell share any devices with the root cell? (e.g.
> debug UART)
> 
>   Ralf
> 
> > 
> > On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning Schild
> > wrote:
> > 
> >     Am Mon, 2 Sep 2019 06:12:00 -0700
> >     schrieb Nir Geller <nirge...@gmail.com <javascript:>>:
> >   
> >     > I created a kernel module that catches/releases a spinlock and
> >     > disables/enables preemption, and it had no observable effect
> >     > on the jitter, however,
> >     > the operations insmod and rmmod definitely cause spikes in
> >     > jitter.
> >     >
> >     > Any pointers?  
> > 
> >     Do you have any power management features enabled in that Linux?
> > 
> >     Henning
> >   
> >     > Thanks.
> >     >  
> > 
> > -- 
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> > https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com
> > <https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>.  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190902185713.0c54ed6b%40md1za8fc.ad001.siemens.net.
