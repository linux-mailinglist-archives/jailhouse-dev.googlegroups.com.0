Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBIELW3TQKGQEL3U776Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFF2CF15
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 May 2019 21:01:52 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id d18sf1544001lfn.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 May 2019 12:01:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559070112; cv=pass;
        d=google.com; s=arc-20160816;
        b=skPkuCSlf2N587sHj0UTiQ4OCizxLYv3RZdR6+IHB0Rr753k6yrLzdldJUyDQqdaU/
         rdhmfxVpLz+tO0jW0PXJtN85uzPmsy1vN5NARhB0rEkoGDoF6uWWUzOoFLIQzucEmFC/
         q4ODUtA0Yq+vf8rOKN4urMU1szG9KiuOzzhaN9CH2iAa47BzFo15ABmnsfW7x2FLc8Tb
         sxKHFafmNRrpBgttKyc8UeQFWkJ/yZNxv+B8u55fPgfo6IBmS2dAAKpNW4jxr92Oo9vb
         1RsuaKvAVsYFASr4f1i2huvL6joroCxivZS/1c163kCqlxb2i41nkF5qCfE4gaW4BwnK
         GOag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=XUNEiXvgu1mRFZEVvPPK/RFXZvNHOG3RY9/3/tjMm+U=;
        b=NYY9Vnvs8Nor+9vTI3awbb22jOv6YNIUbqpH7Zkl85FWRNUf+GDRYIsOKAs+uN0+bq
         0WYMmLObI8Nbzhx2D22plbU4qrzJ1bf4aYlOj8nBFQJBZqNsoAGyrX3bXXnjYaCwakCJ
         6uktC9r+xefkYvcl+JvebpR9kWMFz72mJ+UIkbcRYq845fPcW6u6srCVe2fq39iMDZ4g
         QJPMAlM5tNYbXyBKMnMpMelf88GDNIto9vgoaXUABfJ2z/4+gZPxsiHFgrtWXNl5Hb3G
         51vC2gsBoMBLCNLnIdypQ5M6IFZf0+Mpp5wHmLm5ID7ivRi+iIZZLEoAZdswyn3a9rbo
         Ly0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XUNEiXvgu1mRFZEVvPPK/RFXZvNHOG3RY9/3/tjMm+U=;
        b=EVPQUb3RTQ8bt1vI6mdf9oJBrX4LnOBpszcYV42V1SRSR9ztCsCuwIsRh2DOs3HROm
         hOQxnHqd/0p0PvTdYoaiiORdP3euuMdvG9GaZsewswDbJe1atrkOkqX9ZVOuEb4dTWZ8
         csp9GLRUaG+9GLm2/8TJNGhx2Nxr/Vvl3tFRsPrEnIU2qMrHuRvcUJnYtGS586VonThs
         x8QxTGPXXfONvlBbqEUwfQ+IFg3zGOXNWsgj/Xx3VcdbxLp8N5/xYb2jU57pEFzL1mpo
         rq7sQuHC2Jyp7P54nR7EivJjP8fJcjp8ybv6VzCnTlK+8dnoUAHu0Bc3RijUSpdkotj7
         SFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XUNEiXvgu1mRFZEVvPPK/RFXZvNHOG3RY9/3/tjMm+U=;
        b=SnOeN0PPDGQV9kTkf+O3e8S0ij+Q/27hZB+qldX+pqTeZBWWhJ8OjwaSR/jDlahyIo
         QFuvV+pWRCQShhETbQI90bgVGX25hEFgCt1UoEU/AqjBVdpR2YPlkRZIHxl6Nc3LjU7M
         qa0qu+Zx7loa9bXS0Z75DdzAVsJ4Sy8Qx2yjuiK+OluPN2regoSS6bfeLd8h21qO4iMi
         Vgf+v7V8vDIu4+AxN4Q62k5xpv7WZf2Bo4hkPtJh23Rosl6Hqf/9KilvPbdXg8Vcs/dM
         UOxdT+2KL2qCYfJ6LV4w24opD3Yyfk9xZMxd0bzdWEhXx1YGWZbMu3DGBZMz5WxO4Gne
         MV3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8xdo5HiYMC4cI8B1oBDrghzkGmkUfXZC6CmXnQRhMc8K+Z2uR
	rh/gfZYZxytlcNcUV03GMBU=
X-Google-Smtp-Source: APXvYqw8Ae8UsUHqTg2s5CMedJf6kmvbD0U7qHkCbHyG3O+Si+TFsAPRs3ZcxiYbVC7qp15DjfJ4gw==
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr43277017ljh.167.1559070112247;
        Tue, 28 May 2019 12:01:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:651a:: with SMTP id z26ls2262040ljb.1.gmail; Tue, 28 May
 2019 12:01:51 -0700 (PDT)
X-Received: by 2002:a2e:7d02:: with SMTP id y2mr39341498ljc.62.1559070111704;
        Tue, 28 May 2019 12:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559070111; cv=none;
        d=google.com; s=arc-20160816;
        b=MXkDaBg5s2qoFa9Sak3qH/AaSPav1lgJKXyFkMyoirCZYyVt6BdIRGIKZ7mcLXeiI8
         lA1gMr7Cgkx/GxUjMETmz0+e7XLbodb0uYIwoEA9HyVhABAHnSjHbX513gE9kqhjv0U0
         m/4Bb5x6ybVF30Jr0frJvTKuyB2KGHirZb6BtNcgHRjxbhI5dQW1RS77aa6hhTR7QeMV
         qGPbpkDZRKr/BQ4M6o6/3q4orQwtzjb9zdNdUbTnuaaZ33b55rc3SBiW88Bl9ncM+mn5
         aXgTDxmA3b6tIyiNsCYOjjddv1BnjP7eNU69Q7y4xmwzJkRAvfQRHJfYX7N98aM9Csbp
         IEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=KiqNtyhHKX9OF9eeR3mHjIWzw7DGd/2XtA9edfooAHU=;
        b=sZSMF5olYDNX88oeEsp/4QOgljwsCo697BqWPStGUV44zO3Sql0Yy4WQW3ra7PbKiz
         rRVoOmcrefADqtFZ7iPrhby9b3y0Sgk0R6R5UD9Y105KSGcBjB2EwTy72M+Su6jvClmX
         v0ZvNAOpCt2SiCaLJr3L5cKT8rVQ6yfuYA05yWU9YbcbC9E1cQOrrEocek4laPLcxIC6
         eFR9hXH6XTHYj3vB6MI+I8KZ+TKpiPZrGZV//Fi67+G1wCpDJ0o9epGT9qwTUQNO6PTl
         5TZM3jGbH2EbGc/yGJ3HdZtIyix5T9YJr/iRNkUD6JP8c+CfaiypzTr3F5VanSUqNrEG
         bb5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o20si777840lji.2.2019.05.28.12.01.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 12:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x4SJ1oIB022137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2019 21:01:50 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.101])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4SJ1nEa018048;
	Tue, 28 May 2019 21:01:49 +0200
Date: Tue, 28 May 2019 21:01:47 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <jeanne.romefort@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Ivshmem-demo interrupt
Message-ID: <20190528210147.6dd80c1d@md1za8fc.ad001.siemens.net>
In-Reply-To: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
References: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
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

Am Tue, 28 May 2019 06:22:05 -0700
schrieb <jeanne.romefort@gmail.com>:

> Hello everyone, 
> 
> I'm trying to run the ivshmem-demo on a lanner NCA-510A. The inmate
> cell seems to be working well. However, I can't get the interruptions
> between the cells to work. Is this due to a configuration problem?
> (You will find attached my configuration files) I explain : when I
> launch the inmate the shared memory is written but the inmate doesn't
> react to the uio_send and there is nothing to read in the uio_read...

The ivshmem guestcode repo is not tested as well as jailhouse. And
together with kernels there are now 3 components to combine. So i would
not be surprised if your problem has to do with that uio linux example.
But it is not horribly broken and should work! The main issue with it
is that people do not read the docs and check out the wrong branch,
later use the python code ... which is not tested on jailhouse ...

I would suggest two ivshmem-demo cells before you
even look at linux+uio. That way you get isvhmem-guestcode out of the
picture and will start with just jailhouse.
Especially since you later want to run linux in another cell anyways.

> here is my :
> grep ivshmem /proc/interrupts
>  202:          0          0          0          0          0
> 0          0          0          0          0          0
> 0          0          0          0          0          0
> 0          0          0          0          0          0  IR-PCI-MSI
> 229376-edge      uio_ivshmem
> 

> Second question: the next step of my project will be to run the
> uio_ivshmem driver between two linux cells. Is it possible or is the
> driver only for the rootCell? 

The uio stuff will work in either root or non-root, no problem. That
is, if it works.

Henning

> best regards, 
> 
> Jeanne 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190528210147.6dd80c1d%40md1za8fc.ad001.siemens.net.
For more options, visit https://groups.google.com/d/optout.
