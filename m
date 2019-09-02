Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB26YWTVQKGQEQBV4ESA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B6A59C1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 16:51:24 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id s17sf2038376ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 07:51:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567435884; cv=pass;
        d=google.com; s=arc-20160816;
        b=uW8X+5A1eCVjeK3nUU+E9cQwJtHg+EV0v0bS3+j/MSo4q3fu84bLSSDtpERrJ/l4sC
         Ag3FI/7GPfJfF2R1mNfVcfPsfj7CadFTx580k+qvBK23kGsRoXRlSRbzNIr+Uloca6Mw
         mfEnUc/CrfRV8hFrbAq+Vejc3BaLJPRNPvqVcRMUNHfl1pG9wikVVOqxRPnwZhzuZlk8
         y0tjKd7/I+zWQkwlu56ghqLlTcEKmrhxLQLSWJ431TrCUqLZsx6SlsV0W9LReLxoPWe/
         94cvQleU37DOPUXrM5qwKysneUYk+xEt7ilzfZzWE9Muf/APcbz52FkBVVOFr3efyMIB
         IzHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=cYcGkwzb8/oD5glkpTwWuCF5s64yf5OZoZIiqnC2vuc=;
        b=SHfLXNXNeS575PDrxHnwCTiCI9i58QSeaGHQ8b5SKrF5kbUQWq/dzcRYPxUHeq5V7y
         n/hv8IHZ+oZCZd/ZmyybWroHE7vpJoL14fNKX9zFvTFuLeKWs9Axpn/UCdhLpJYrdspl
         6kiPcVTaCfaiDeTBXodP0z285J/P1ToXcNumR2JBRnzYfMPLn6yDJ1SO+xDiXBPsFIst
         8s4zZXQ+iZ8226aSsM9zmJlhp20wTAIWyXZE8mwatXfKsL4pKqJ2/2p6G67wZbY2B289
         V2PQvwwzfELV4Dw1mJvp+Uvlnf2+Qigk42nw1ifrTfNMzsOKX4y0Jt2whGXdhv98PKew
         /aWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cYcGkwzb8/oD5glkpTwWuCF5s64yf5OZoZIiqnC2vuc=;
        b=BZK4BcacG3FD+12saMX9W1XptZiDxdXMLYOxwSsWBpy6phLExvVyx/pWVRyUA6BGfv
         KNzUPLKOnnUZd9KCwNC++4CvKuxbM5U3bbeMr++SyKg2kNf04nL6+04CdOOWvEfCKBvY
         4IhAQ30hRvBYCL4hcnXPZrxCW1RZ39sC41WusD4luRytGA04q4ZvGviFM8RzchVmzjUo
         ukkFi+X5q72QbmHVs3CG+T2sNx02c9zdF/LFdWwXAeAZI4Pp5jS/LYLwCs4aHcEO12hH
         ++aQfKBSivOtbpVLPf/UXdjqtHmD6V52FAo6BD8XuN8jMEUd46T+nuY41Z9SvMuXutIA
         EEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cYcGkwzb8/oD5glkpTwWuCF5s64yf5OZoZIiqnC2vuc=;
        b=ATTtnAFiuCmErLq0ft4R+L8htrIHKPaYKehLbFlflIjWR5mBYLVF3YLcqU3s+b2GW6
         TU2dHblmKTaZ/6VC2dg1Dsjsr4GUhj6DI66Ui5LTEkMg56bgqinq2QXtTEriYPwTj8n8
         1oYmq6+PZHkehC4rRc2B5kJnjQfz8GamoChVTnX63AQPhhQS+Q5qWLKk18Rdl8IDaXBR
         7+pXSu+HCw5HJW0865SC3BLFzUzjlIc/QKr8tUTdlsSe/3ODLIl1U1+ZX/E63L3JA8vf
         2axTItPXxfdzo/Jw5Ua1otS//PWPOlRjw3Ld12wplD0tMS6tGofJoPmFdMobzVWLEb8j
         7KJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUf1S7DfXK/CRUGbbbRCFHQosLUZO3YfGMQ4v2fLw8R+lRDTTCq
	Nav2k+tNlylN413pG9YabKI=
X-Google-Smtp-Source: APXvYqyrbwu3JuTFok621croKqb6tc71IvXi6M/mrGK0VAZ85zuIxrm2dDyY2CIUiLyht51B2f4/mg==
X-Received: by 2002:ac2:5297:: with SMTP id q23mr10563948lfm.78.1567435884149;
        Mon, 02 Sep 2019 07:51:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1122:: with SMTP id e2ls715397ljo.6.gmail; Mon, 02
 Sep 2019 07:51:23 -0700 (PDT)
X-Received: by 2002:a2e:4216:: with SMTP id p22mr16395629lja.25.1567435883197;
        Mon, 02 Sep 2019 07:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567435883; cv=none;
        d=google.com; s=arc-20160816;
        b=OTIfyalDpIY835iNjTZRy1QKzA4VNZl3UoYKhbrvmmPAbFtMZWYMCqwRJWYRjB6msn
         gldSiWHBxV1+G5L23ni2OTP7Hu1+uLnzfixjhLgZ9yY+ESndQ/Fys50fyGH7hixs0Jkp
         Cit19A0TGbm4IAlQDCRZJHdQ4+O8VWs350/hbTmULx1MLXmauRZar3G25n/eeONYO1Md
         2N0yIHTdPlmO1YCrN565a2aBSuQb5XjvUIrzy1x35Uo1Ng1ItzkxJ6BibwEJCpeyojUo
         N3vvT63WKTLROp1EgszRc1LjgIALXemcKEir2OEAMrNa2C1kVQfmsLxPoul6O23tIBDc
         /AWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Mzp0RoUBDcFOA6chbDtSnUNoDGKJAK5OHkkuJva7M08=;
        b=Gk5J/3PUm3ziPP/8O9h4SpkO9ojgoJUjV407VgCbjWJmC6Hov+8sYFJueM4XmtH5wZ
         hT3APTa3/DL2lORddTDKMBDRCZ7w0xnSJHJDaTnwf+wuEvebgkcbqcKDfeNDSYfvsejq
         Nn2PpJ8TjSg/1uVbnSr2tmtJGP+BrFVCN9TlfPkPhx6ryKyoaR5yJtV+n1Mx+hHreuzS
         LxvbskijUQm8qvu9muzE2b63TKW/bssEGcsyTv16F8U+oWH2sH0TP68sgCK/u0Zco8y4
         RHhrwPvlCj48qKIjfqfbSIe/TChSvVhygBE/mw7dsIjlWOknmDs1d7YygmUQ6aPOFWBy
         zfmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q7si132219lji.5.2019.09.02.07.51.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 07:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x82EpLin025060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Sep 2019 16:51:21 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x82EpLI0006268;
	Mon, 2 Sep 2019 16:51:21 +0200
Date: Mon, 2 Sep 2019 16:51:20 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Nir Geller <nirgeller18@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Interrupt Latency in RTOS inmate cell
Message-ID: <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
In-Reply-To: <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
	<bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
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

Am Mon, 2 Sep 2019 06:12:00 -0700
schrieb Nir Geller <nirgeller18@gmail.com>:

> I created a kernel module that catches/releases a spinlock and 
> disables/enables preemption, and it had no observable effect on the
> jitter, however,
> the operations insmod and rmmod definitely cause spikes in jitter.
> 
> Any pointers?

Do you have any power management features enabled in that Linux?

Henning

> Thanks.
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190902165120.7cc1048b%40md1za8fc.ad001.siemens.net.
