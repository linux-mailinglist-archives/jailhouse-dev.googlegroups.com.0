Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM5LSOEQMGQELWWTTUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5493F5D03
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 13:19:17 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id v17-20020a2e48110000b02901b787efe665sf7402625lja.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 04:19:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629803957; cv=pass;
        d=google.com; s=arc-20160816;
        b=gElO3o20PAtI04sH6tuxwb+z4DjbRTV+e/ajvnE/TxNR/9+pXW+a66FnCI+IW9IigP
         FQl8LjuL04FN9CMBXtDiPzJPr7pGniVMVmMKkw6XerTJrVU19dxJRP616RVsus7Y2tBx
         iiucgbs7YiIPZCjEAZJniBhtyq8SHVi2ZsFABrew7KXB3x7KRt9KnL7zMiHSRdPx5CwL
         55uWOd6/+7O9hljBmNsawig9+tvQ6rsZf5FCYVTozvulUGj20yv0Nq70xpvO8XzzF3+H
         3hlVUyNlO3F3L1mRbzDbhccqaoMHIEZleSO9ghwMznej4sX6A/IHTHgJIulqIJq7UXkD
         8k9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=BQ5vS9nysggytpKrAY7Z9d/yeRZv9pp0/JlVq7F7lNU=;
        b=CXpaKhWG/faInJsAkJcNb4+K6dtWL+UcAtQQb4u80Z2B97MDmH4LCPk+xVtV8HZ8QP
         yuW4YpjeukBjzQIUCCAh9p1BKPVOfOM1nFU449Yq+b/SRaGLr2bplq2t8CgsDUUof3w0
         8TzVFm9ZYThqVpxgReSavpILRQEIidJDR42pC1PnHxAeDOoE8HQyQTyc6Yk/EEJ3a6jM
         eHsrXmfWwA/zwWXt7W2xJ7IkErN9mjIbrfSZy2CsWu0kzW9miv5Lg4jx0coVBcrRk227
         XmO7mZhBX2E67stJBw1LJ4haYEtRh/N4YcIe13vkLXNMe8oNSkRieuKa0zah3yk7sHrM
         lllg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Yn9lBEVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BQ5vS9nysggytpKrAY7Z9d/yeRZv9pp0/JlVq7F7lNU=;
        b=hPqPkAUABl1Ec24IixRFTwWF3K5H2DVPjMP7uYmC4hAwKFD4mdTP6A3WvHSwK7H8DI
         OTNYb4Ao8jRFMnnSVQYTKOjHZ+fhXOKqOkRrvLTEc9ro3fvhLKTLG6o/TQqBc/oE2ze+
         TSOSMhnRoSg5Zzzd0Xpo+cTk4Mu6KP5oEptZCjQYGEJtYdRMlaWWk/C2qgxBakzuQ5xU
         NLy2dXo+fEyQr58j6AHYxaG5rXwnBohb6B1u5+yJnAmJPk6KpVXcoXmyNdVDf8UJugOp
         wE1y+qwtCVoS7J+wPJUjmzMI2dM13Beqcqi755TreRyfj6pl5JGCgJy0K0J6eNtxk3j9
         npXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BQ5vS9nysggytpKrAY7Z9d/yeRZv9pp0/JlVq7F7lNU=;
        b=jTic7Q/erIDdwenqoLYRG8Ho19EAnTM8Sm2TNycBSpxwp6JF4In/UgVf8qLdMzWM4c
         xnRTt/Hday97m2bwsEOY+4cgk9RVcGLVlwYs4T8wSl0nbjuG0MpPqa5/azODR5EZDEtG
         +rcXwDkMd1F5K+LdcxguXgLt1lnomFYjIEfTwARcxZRXYbf8xwGcLvo7y44w6fapW0wa
         Ng9MvATzaXZI56eJTqTRt96EgPfg0gJUrG2rmFcfJuOVzTN9TV8/Ac7U3WcZnj7+/ib0
         VUgW53MLSq5/Lr6rbdWVr8aM8VMsxBlyV1e5vdfDo5yY+oXvyYv+WheeXVSx5W7kMjUM
         ZGWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QMtuzMwvPqawIlWAULZ+N2KiKeEX4o2xBjuP/RNbtXyyCcb/x
	wrgOrJXsiVTlx4uuqriWGF8=
X-Google-Smtp-Source: ABdhPJyALB/JwWdp7PY7Vpz572GNnge+0u5B2jBps5KUIfchUywcyer/PVkJCAj7wkGHmRpkh2YF7A==
X-Received: by 2002:a05:6512:964:: with SMTP id v4mr27631612lft.91.1629803955494;
        Tue, 24 Aug 2021 04:19:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d43:: with SMTP id y3ls3333420ljj.4.gmail; Tue, 24 Aug
 2021 04:19:14 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr8207638ljp.494.1629803953963;
        Tue, 24 Aug 2021 04:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629803953; cv=none;
        d=google.com; s=arc-20160816;
        b=G/DSnRcpT+o0rkBT6+SLQP9Qv9jejjuFn4N8IE/XuJaGuWmOk/pz9uaVG4cyC8c0pV
         8aoEP/PyFQmjdI38PpYd66LgFOR9GyzdqtRB3Sf6nHp4BttvSwb9rxnKKBZFsB82ZHQN
         bifGfAU9lUmExZBt5dcBGU3NZZzUzKXdA7yxoSLSx++tsDXuRX8Of21n+witSqIOa8d7
         Hv8WvNE1axRVogtF/SLQ05hMbNWXKJv27U9BzcD9hOUtv6wnuuRHkXGRJD0KhMRgm9wx
         iNRQx8wvOrQQ0pPtNSbjVsKrHSsCVeIbrwF7179XXL3pTX25cxy0M2Lt4Yi6/6JtFSMj
         PBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=hMprna5jgNorlUr5y+wqFoPMIxHWIXVbNMLMrsMbZNQ=;
        b=RbBcoRoeTWcyNXmZHgeVqJEBk63zm32r54c1LBe9CBAC4wcpuloWzgwky8qRHzjkuu
         46d4S4eKDUY4JJsVNMuCGZ+TKYExjYfwbVvQp32RR6Ka7xZQQJhpIR2bZwDbWcFPvmtp
         YTeogDZI89F+9T10A2G+VuFRvluRdZ4K/XIRybl5nPgTzjVhi2LOzP0v8q1r8tT8Tpgo
         WE3oEpIVEEb0062z2R7Enl8k8HxRmUIm2lMPD05jimNGVYg9e8vTvzoUf1IKQ0c7j2fh
         fgLphqmxwH8iRuVOIm40dFBwDiYTcrmlXjXRiCY2uhYo61Hgv4XwKpGx/mTNKd/+OPrZ
         K4ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Yn9lBEVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id h8si837084lfu.0.2021.08.24.04.19.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 04:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Gv67g73L1zyh8;
	Tue, 24 Aug 2021 13:19:11 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 24 Aug
 2021 13:19:11 +0200
Subject: Re: Building a Baremetal OS for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
Date: Tue, 24 Aug 2021 13:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Yn9lBEVL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 24/08/2021 13:12, Moustafa Nofal wrote:
> Hi, thanks for your support for the last three months.
> 
> I am trying to make a simple scheduler and include it in the inmate
> file, in order to implement a rate monotonic scheduler and analyze the
> results.
> 
> So, basically the most difficult part, is the context switching. I used
> to combine assembly and C using __asm, but I do not think it is
> supported in Jailhouse. I found some files in hypervisor/arch and
> inmates/lib/arm64 that are in assembly. I wrote a simple file in
> assembly and added it to the directory inmates/lib/arm64 and I got this
> error:
> error: stray '#' in program ldp x25, x26, [x8], #16
> I tried also adding some assembly code to a header file in
> inmates/lib/include with different tags for beginning assembly: _asm,
> __asm , asm and .asm, but I have the same error. I checked also the
> makefile and I think the file should be built without a problem.
> 
> My question is, whether there is some constraints that I am missing?

Please attach a patch. Otherwise it's impossible to know what you
exactly did

  Ralf

> 
> Thanks in advance
> Moustafa Noufale
> 
> -- 
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/e76f8186-671f-45c8-afc8-8c85b3988c43n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/e76f8186-671f-45c8-afc8-8c85b3988c43n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd34eca0-5093-ef58-2084-0bec72ac1b82%40oth-regensburg.de.
