Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB2HZQOGAMGQEDDVTRRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E24429EC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Nov 2021 09:55:04 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id r15-20020a19c10f000000b004000b509a53sf2219687lff.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Nov 2021 01:55:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1635843304; cv=pass;
        d=google.com; s=arc-20160816;
        b=VdCTOzASMJsiks3n05ibloY363lGDSnF4l1oluK3u2xmdpoeHD9u0J9zzOPAj8fDSx
         ApANUUKAb9kMjGJfeN76bbeaxxQP9XXsr4yVjodN7J7Rk6GIs/Xx4HXqAOjTLpQVtSU6
         blJvoAe6XxuX/fgBom94CyjJDrI6xLTMSbsOIxLZ9alzDy85Z6Fc2dH8ZtcSftZ9waFZ
         XEOQkyy4q5o3shxu1b7bMpoE+tJRc+78EuygLseIti71yFqo2fC3KY178yDRnerWVILD
         Kqr1IiAK1oycMFZ3ck1PiTG/yL5ZOvTby2dBYvgcro1WhTVrwnKevGC8mYk5bu3M0AvU
         OMag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=uJuJ5FxX1WxoHgLsPNHFhF4BW0BxomDeFw6b2AevK04=;
        b=NyZV8kn5UXzpOc6+ZPICryQEPv7Ly/S6GKyFg20YS7jpWUS/+MGE6CQ/g1p4wqxm4H
         3Q6dykgeb2QAWWgtJjuXwoxS4zGGPcOm3Xp4ZElMqkufQ1naNG7yUQOVsyo+48wdZ31k
         NDe6dkFP4q2Ny/nKBdURFobOfLbkAiq6CfWd9rOfQ3+y7VbaWE2oOiNGrOsIpOqCIj5t
         8vS29itBc9/tMJDKZHCwmS0jf5IWcJcn2FHw9y1DmxGYCMsNrY7zNYKDRh6FLx2fdiVT
         TI9VRJWwJCMSHSgRoQ4GUa4VpPooY0vO9VwUXr9CmyYuiu9bcSWvkJ4I8/53Odv/HeDK
         n7Qw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uJuJ5FxX1WxoHgLsPNHFhF4BW0BxomDeFw6b2AevK04=;
        b=ijASwSwm95zuPpgfrMUqBW1puL/vpAqIuFOVULfl4MCmZL6NysdhS/ybpluGhPlEg6
         OYDUW/lPkejWbdJONtlFQHXchzbG4gmi9f7gkV5T+fvAfM7n9rCm/04LkYwmnyyCT+bR
         EMYn5gw15liYXcnJZ81PouOOvwBHMDYC7pgsozYgbX/8ffLDx//okUTDgSVBUymPC1bB
         0gbIWu6tDnHK14P2iMPyEmnW9RNGa1KeQHjeVvjViITXoBGljadfbVwfWG/kWCzuWGtS
         2Ag/DqQuDiWn6PMAZ4RQVZyUoB9k883Jocy6GR15JlDEMYjGO9fa6EVJhBLbYzZ45uuo
         T1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uJuJ5FxX1WxoHgLsPNHFhF4BW0BxomDeFw6b2AevK04=;
        b=KwkwHcPb18bg0WhrvAt2ICO0fzHnIgJzEX89EBFlPFcx9vg5Pz0YItsX8zHWfxH1s7
         iNlHsMrkIHZT6W+qrvKgKvCjiuQK+R/1eKOHEigONKEyyuZ4ZZApWYRpCCqSF6PQ3BsX
         YY87vqse9nUrFDpABwh6ZkUcSodMkJr0h07hjEjUK58S3244iJlOa/TTn5Y48lGRkBcf
         nEAhUcyikUlcaCb2ZLiQkxMMHVUUgSZ7g3c9PXImY/LqtcZ6Jt702Vu74kApxMukI0wF
         FLcW1OvEFeUtpx6sgQ7HnJpDSCdEquhqlykVIj7YuqsbrwZpoyeOIpIcCRCDl+Hxa2rz
         jPiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Ou74w05GB3LYvWIIYestlG50bcgdfZbEukQpurOQ2fMPkdOR4
	RY3J1KReltNTTGLcKOLHUyY=
X-Google-Smtp-Source: ABdhPJxLWEeaigrffnNfJzB0QQghJS4gCHDHbc5Fa+t/leu54Q6Y8dTvlMwMcznsCWsQMThr2llTAA==
X-Received: by 2002:a05:6512:b01:: with SMTP id w1mr33118622lfu.508.1635843304430;
        Tue, 02 Nov 2021 01:55:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c74d:: with SMTP id x74ls2665766lff.3.gmail; Tue, 02 Nov
 2021 01:55:03 -0700 (PDT)
X-Received: by 2002:a05:6512:31d1:: with SMTP id j17mr33377176lfe.11.1635843303311;
        Tue, 02 Nov 2021 01:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635843303; cv=none;
        d=google.com; s=arc-20160816;
        b=sq8UPmUgtYdYA/3iZoDBPw0eZb+pANMAAuBXLM+a/jipgCKdiqcxoCIUEWNVADjKAj
         6sjqlOtGUQBkW+L98G/LHuiK5LmIafEpEdnYhSWRVoMcbN2PU5jn8L7DziE10BZ6u6d2
         sdm4lIOGIEDRFdW2iOjrbvzPoFLXeBJ/S9tSWGEZqEK9s+OnfLErlLSoYHl4zeL/mAXx
         0RZPQsPv6na20aY/tlftkd85UpvN8mDn8+IJvcN9Tr/BK9QJhKlfzKEsA+c/N+gokx5m
         rEJWsVTbfHA9jj7eeGFcIgcqmGakkmkjkynF8JeXQiTHCC3G7DyhrC0tpo/xW1x+yOOC
         urOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=bwIIKJGwxkJjwmVoP94k2GSo8GNYR6v+vvekoTyQ9Ds=;
        b=lacN/5Z4D7mSeILp63N45rWpRJMwW7Ev1dxLiR79xBty8RCtQyxFK5S3Inr9zl2XqL
         38d8H3+iTMLjyPjaeK/8xovGd/+zcZXVhfT4OTZoihjsuZv1lLFrdzMiVV7KRdHnOLNn
         a+XrlMgDk8Axdwe69izn2BVKcYAi9kEEOY/kVcmZ87spHNJ/t2itovjd9sSLHGwtNbfu
         qn32lv2/jl1djnqMY8oh3le7XzqEQdKWz4/tZMijoFxjrodKYUG6tqokwSiovRxBa0Zq
         jyzdtkR9eRhcBSyQyCDrcPzGLFfJi9qERBjZbGY0HT4MkROYei8iIgXJw74TAOYHFKVd
         NdRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n22si595716lfq.0.2021.11.02.01.55.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Nov 2021 01:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1A28t16Q027888
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Nov 2021 09:55:02 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.0.59])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1A28t1F0028519;
	Tue, 2 Nov 2021 09:55:01 +0100
Date: Tue, 2 Nov 2021 09:54:59 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Moustafa Nofal <mustafa13e09940@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse cell linux
Message-ID: <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
In-Reply-To: <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
	<20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
	<251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
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

Am Mon, 1 Nov 2021 00:55:07 -0700 (PDT)
schrieb Moustafa Nofal <mustafa13e09940@gmail.com>:

> >  
> > >Might well be very little documentation on that. The code would be
> > >under tools/jailhouse-cell-linux which might give a little more
> > >insight on what it does and how.  
> >  
> > >And "./jailhouse-cell-linux --help" might help  
> >  
> Yes, it was necessary and very helpful. 
> 
>  >Maybe start with the virtual qemu target, in which things should
>  >work.
> >Not sure if that second linux will have its own uart there, but it
> >should come up and be reachable via network a few secs after start.  
> I used vmlinux and rootfs.cpio from jailhouse-image to run a non-root
> linux cell on RPi4(5.3 with compiled Jailhouse). 

Good to hear you made progress.

> So the current
> situation is: 1 CPU @ RootCell, 2 CPUs @non-root LinuxCell, and 1 CPU
> @BareMetalCell. I have another problem regarding the network. the IP
> was assigned, but the cell is accessible only with UART1, the cell
> has an IP, but it cannot be reached.( Destination unreachable) when
> pinged or ssh'ed. I attached 2 screenshots, just for the information.

Not sure how you ended up assigning that IP (i do not look at
screenshots). But i guess your network setup is that you have one
physical NIC which still belongs to the root cell. And you have a
virtual network with two jailhouse shmem network adapters going between
your non-root and root-cell.

An i further guess that the non-root cell got its IP via its kernel
cmdline. To hook that up to the root-cell, the root-cell will need an
IP from the same subnet. And that additional subnet should not overlap
with the subnet your root-cell is already using on the physical NIC.

That way you should eventually be able to "ping" and "ssh" between root
and non-root. What you might want to do later would be to create a
bridge on the root-cell, where you would attach the physical NIC and
the jailhouse-NIC ... that would connect you non-root cell to your LAN
and allow for DHCP and external communication. 

Nothing jailhouse specific really, simple Linux networking stuff. The
only thing really needed is the jailhouse NIC driver on the root cell,
i assume a new NIC appeared after your "jailhouse enable" ...

Henning

> Thanks for your support. 
> Regards,
> Moustafa Noufale
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211102095459.3a17440d%40md1za8fc.ad001.siemens.net.
