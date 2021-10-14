Return-Path: <jailhouse-dev+bncBDWPRN7PXQLBBREYUCFQMGQE5DIW5VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AA042D785
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 12:53:58 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id d187-20020a6236c4000000b0044cf291bfebsf3327306pfa.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 03:53:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634208837; cv=pass;
        d=google.com; s=arc-20160816;
        b=u6MoSJY+ZeW4nDYdKHPkxoTVqOROjx4iaRof6LpWTzqyVtn9JyHL0L9iYVS4vldYhl
         vMKe7OwKRoGY30zrdpsMyIux9+8tf8dxMVrjT7Mq4H7pBTaMaMy8Lj+9ZA31ZWRwwyK7
         v+wk7b2qE1n/aFVcA7kUq4drYRyrV5NHVIPrdCu76kvXx1mgZoUUNDgoTC7jfQeuhtAV
         uiYDFJpXUpxbAl4Nm78UEwt16x6EmtTLazsSlXT5mWsuTvSWcxrs1l6b1wfuAvcK4eZS
         Po6jEbAYF+MOMFjn64N0CEexQ90WzJZbWVfJ85bWUn45WDeUXx7HX+cL5+8bU0aTvylC
         grdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:date:message-id:from:references:to:subject:sender
         :dkim-signature;
        bh=zYc2jS8NJXE/ms+3vyneNf1CLOJDL4T2O3RM8QQvlF4=;
        b=Bh09eiic1D/xfC5GT1SCkwrwbDOkZxGjLOlDbfbaqzXb6IcPFQFPMmPdwhD1oiGSmz
         SEprKQrUMjRHoXM6Pv4LosBE73ACHB0ACKsGi3J/NjEgbLYsQDflKIIfBP/ffP5GKlwn
         YqfjhnlhzYAjkGHI+xpucdTClGUigsyMDCtc/fPvXoTlG5KTDIp2+vm9oiq0Y/jtIu3Y
         qbWqH8jNgMltANBF8tr2acqSzZZsQPeiRj7Msk4QJj7oSPbB23wctlCIUzdBq1X3MTSE
         2HrTYDI8wlkH9Xw1ovTfDDboKR5noq5t/YshnakeDE/W/ZW/25VDrI5gNnHAaRQqZaJo
         GYzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=3DLl1dcR;
       dkim=neutral (no key) header.i=@linutronix.de header.b=gfxDCC5g;
       spf=pass (google.com: domain of andreas.messerschmid@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zYc2jS8NJXE/ms+3vyneNf1CLOJDL4T2O3RM8QQvlF4=;
        b=HH+jQicBh7xnp9ZPMgavnB2SkCjsxFQIlQirqF6w2kQZgkZUs6ZkJ9XHxWCRAyNpym
         +URrXgpw3kF5dr1Wmd/3PhAoYrPeRSrtRaZHPSmi+7U1ycCP81KvFnki03PW6Un6FLx5
         gCxp8O16ab/UFlh1DS8DzcoVFvy2oxQOnkYc6G6uKCg2g7i92T2H1Dpve7BsnEVhYE2d
         U8MII39TU/IhcJ2Sngm6F0hede9lIG4nl1BpaP9r+Rspb4/OpTWRMhIFkAqetKYFwr/t
         Y788iT4GefNFN7VB5BqaKHWFCN1hhKQpYy/Jdhz/0C3NvfYogZPzblV6+zzp7V0Qnago
         GkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zYc2jS8NJXE/ms+3vyneNf1CLOJDL4T2O3RM8QQvlF4=;
        b=vuUslGs+2AeDPkxPRgkv4YZSwiMLev4tNszBj9dn9YJN8ZZHpXGUGNGuKpIi96GsC2
         3qbhV3YYe7z1026xtU0AZa5GNiYwXXKn8Y7iAAe0FEi/5K0dzBX7IMta573BbGNYaDI/
         bdRG0asTwOMu3bd/UNqYhUKX8SMltkjoulQEtpEZgpuJBZIROeCJUGM2XuR24wDldEPt
         N2WGq4f9C6I2F4TZufkRit+lvpcgmbRy+it/rBKIxi0bY9e6mIZNuBRkOg/ErDl3i0lY
         QY8AsT6FHuMuHy4NbWDyZaU9Z9BWV1gvC2a6PzSSlfEYC2X3JP0MJTz2RBQpCVF8E9kj
         4rsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533exSNjvpeFUcPUxzDAfFL8oJDZa6TK3cBtJnKtULPmls0hvTaD
	6tajF9GbkNzk8uHQXlVgSA4=
X-Google-Smtp-Source: ABdhPJwyd+aDr4auQBTQVRD93pDLp3//P74XR71snsCnLhR22C/jn8SGuZ1HzhlQoA8bQQZBZTgVpA==
X-Received: by 2002:a17:90a:e38f:: with SMTP id b15mr19577953pjz.76.1634208836784;
        Thu, 14 Oct 2021 03:53:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:390b:: with SMTP id ob11ls4971425pjb.2.canary-gmail;
 Thu, 14 Oct 2021 03:53:56 -0700 (PDT)
X-Received: by 2002:a17:90a:8404:: with SMTP id j4mr19565068pjn.204.1634208836109;
        Thu, 14 Oct 2021 03:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634208836; cv=none;
        d=google.com; s=arc-20160816;
        b=EzeVBPzip+NxaPa71xyAGCDqsWLVar5hG5N38NlprzkBMv3+rTakCHVNcK3LuTvwfj
         xgKNERds+s8AsrzZuZ7pFWNtEuKFJ1MqcUHBO7MrMMDG0Fvvti73NXdsqIfFdMpFBgN5
         p61OgaQPzDrDsnI7W/IbYejMrnPV7RZGaljrEn6X64nzk+onvIx5xDOk04UlassilIii
         7PKjuiQbNbBK7V5j+1r42kEtBw29TuUSRuX0x5b1eTHDDP/nmwQGFo31VU6aaskTEsy1
         rleok2OSpUfvXsvM7QAa6P+w66Foq6FYdIBCTTjTcYlztYy0Y3ZfpX4/T3e4QL0NQHC/
         l9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:to:dkim-signature:dkim-signature
         :subject;
        bh=3LG+Rm1IUU1DtppUYj91KE9iuxSSdIQ/Ztlpl8ByJiM=;
        b=0iYOHkfyPKzAfRfX2SXUtrsjIOsOqrqIyT9UL/mDktyCH2k0rYmt9xS1jT3+T+ahMa
         ffWrFuy8WOHKxyfEc5cfB95xMbyVW+oV9/vFjFtZZi781QMyIG51y03WMMgVUONTkQ2q
         9BRJi628cDBwyYuk/cF+Q32ICgH1AKpA5eWkts8vIFiv8oNm31uE6k7qoneqpOxYU/gu
         kEOOFx+xISGHGfuzRrX8o9rpBsPczSLsMDDGo8BgafOnO8RsP3ET48eWF142HY+SOIqU
         ZcThnsWRsOWQYtXSpwWfVpiUde/i3aZamqGjOPqa+1EdHg5UweTk99pEE42aA4ARvlUv
         cLpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=3DLl1dcR;
       dkim=neutral (no key) header.i=@linutronix.de header.b=gfxDCC5g;
       spf=pass (google.com: domain of andreas.messerschmid@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [193.142.43.55])
        by gmr-mx.google.com with ESMTPS id r7si1804210pjp.0.2021.10.14.03.53.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of andreas.messerschmid@linutronix.de designates 193.142.43.55 as permitted sender) client-ip=193.142.43.55;
Subject: Re: ivshmem-net on zynqmp with hardware based PCIe controller
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <001fe6b2-286e-26b3-c820-6b184cc5c76c@linutronix.de>
 <45a5e58c-83d9-9461-3b2d-08eda7eefa24@siemens.com>
From: Andreas Messerschmid <andreas.messerschmid@linutronix.de>
Message-ID: <41502048-c005-69b2-c73e-53e8824a6af2@linutronix.de>
Date: Thu, 14 Oct 2021 12:53:53 +0200
MIME-Version: 1.0
In-Reply-To: <45a5e58c-83d9-9461-3b2d-08eda7eefa24@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andreas.messerschmid@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=3DLl1dcR;       dkim=neutral
 (no key) header.i=@linutronix.de header.b=gfxDCC5g;       spf=pass
 (google.com: domain of andreas.messerschmid@linutronix.de designates
 193.142.43.55 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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



On 14.10.21 11:43, Jan Kiszka wrote:
> On 06.10.21 11:32, Andreas Messerschmid wrote:
>> Hi all,
>>
>> did anyone already implement an ivshmem-net link between two Linux cells
>> using the ZynqMP PCIe hardware instead of a virtual PCI interface? What
>> about MSI/MSI-X in this case?
>>
>> Any hints/success stories on this?
>>
> 
> I've looked into that topics for a couple of ARM boards, again and
> again, but so far only the (historic) AMD Seattle was fulfilling all
> conditions to allow PCI device partitioning more or less easily (but
> that thing had no IOMMU IIRC, this this was incomplete). On other HW,
> you have a combination of these issues (or even the full list):
> 
>  - missing differentiation of PCI devices on the SMMU in front of the
>    host controller
>  - missing way to inject ivshmem interrupts at the point where the OS
>    would expect them from a real device
>  - complex PCI host controller, deviating from the generic one,
>    requiring extra logic to intercept config space accesses or even more
>  - things I forgot
> 
> Therefore, it is generally easier to add a virtual PCI host controller,
> even if the SOC already has a real one.

Thanks, Jan.

So maybe the easiest way to go is possibly to keep the virtual PCI host
for ivshmem and move the entire hardware PCIe controller to a non-root
cell if PCIe devices need to be served there.

Andreas

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/41502048-c005-69b2-c73e-53e8824a6af2%40linutronix.de.
