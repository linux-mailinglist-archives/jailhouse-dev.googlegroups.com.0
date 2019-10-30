Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV4547WQKGQE622ZIJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 54540EA2D8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 18:56:40 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id a15sf1772776wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 10:56:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572458200; cv=pass;
        d=google.com; s=arc-20160816;
        b=zpJ4DHz3IWpEJ1bFtTXWA5yH3qTgrsD3HPv81s+NW22qk7evvUAELlDsB4cCJWRXZZ
         bQ0fVRP8PCdd6XGReC8ml7lJfF92hUf0/x4Ru7IhhZCOdSXXt+/xqgEu+Qqr02KIeN3K
         kZJRZ9GOfgMiF8natWGA8N5kTyv8jlxwdmep0GsgUpMXnCg2tmw2hgvCNvS2WC0+ZVVh
         hMe/d/qBLtpeqkVu9RC03cGoXe9i4YB/11S2mPZVdwfJn2pqh4w/uKDPWjLcn9eUfIhe
         w7NPel0e6gUJPLo9zmWQKP6d2x8kPpd6cYgNux085naBHzAwL1wcgMrEfZYlkZzeAAhU
         lCVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=AWonH0jwtixcE4BFx3AvUWhBtMx+uUK06IBqRp0VjCk=;
        b=W24Ce8vKJ9liMMBec6llM3QgjkquU4szXk2knUOadll4cXPNHSlQNMA9f2DGL+kPCH
         8FArFDDK45KutPTFvs38mtOefEBkWIzYTJ8efjwp5jYqXAFXR3AH1xE/ZtKZ7AuyH/8o
         etXwo6k5Fwd5dUQuq6ldy1C9Yrbs20NpP1cLe2SeOEAxPNajOdLdo9eFJ0LT2O0WCz4N
         tGJEnWFzFnhqFbupoxL8xMkdUkCS7SiV5MMs994QH9qHQEtsO5WMLA+caf+eOYgUSeWJ
         I/cH8LVdYcI+d5AM7ICn0JfvHzxfj34S31cfQdAO6zy6xya18/e6J6NnOgvtbzCYTxuE
         JLxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AWonH0jwtixcE4BFx3AvUWhBtMx+uUK06IBqRp0VjCk=;
        b=SbSs1pAwiLM/u8MIDiEEKZRsCJGIFnAAaENvRuxxUqbW/2kFcqfZQuttWq4ZTS5H/6
         pvrMAlMDaSCUnBswElfgln1ndfDS9KnCPBRiElU3mUpdHMje8gYXTp3l5zPtLCqfCxSM
         QOXQMZ1vGjX5eCbcW4OSOjqqtIFZX/5LQs4x415QNOTDnzX9pzeFE2hSqyhl5PxGhnmh
         di4gW93fZCbAhSooLd2GPIJrMjNLHHx5SK1cLF06upp0FLx4X3bxO1aeqCr97Lq1/SFD
         unswE1vL95oCNP0N9b/7O/TgPN98XkGFAImc370YWWvkQjZqn732TCsJivt7Dqxmc7G5
         n1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AWonH0jwtixcE4BFx3AvUWhBtMx+uUK06IBqRp0VjCk=;
        b=Islfaqgdilxcp3syzuMB6HHKtJQnEgbvzV/Mv7cTky1sI/Gie8N2k4VYuYsnCmqoA0
         /b015GDBcpKU3tJGOxC2dHwUrG0z7afjMcCGNmLwTFR5LbmVJdFo7+AnpdBVSeRgVo9n
         Ag0GXueFCaDSgqrtICAaimG7pOCCkBQqHSyzeJU39c+SYGbdmqO9QyF8dE1G9Ylck5Nr
         3mfyB4dGLrkyzoP3QYV8BNF9yHO/6orNWc54DEv7+4Z72sxk+Jk8lrxDkEOtFo/8siBG
         ISjwaG0dN/hfPEGnOKBJc81kwy/22+WGx8SU6BaNAcq93iIQWEBTsVS1KwXdHN4XOSej
         HQjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUg8fcr05WfrAMEWWH8PICxSzzAp/l9sFAo5uyoBVSFYto1W48c
	9IbPaJqNtQAgy/OOa2QFedM=
X-Google-Smtp-Source: APXvYqzcYH1cJD7AgT5swzIbWjJi3ny4/wX/ntdMW0IbHCenevt/YrMp4hiBgznD4XpQZTfBT/JSmA==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr670512wmi.65.1572458200055;
        Wed, 30 Oct 2019 10:56:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f707:: with SMTP id v7ls247430wmh.4.gmail; Wed, 30 Oct
 2019 10:56:39 -0700 (PDT)
X-Received: by 2002:a05:600c:2247:: with SMTP id a7mr680397wmm.19.1572458199027;
        Wed, 30 Oct 2019 10:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572458199; cv=none;
        d=google.com; s=arc-20160816;
        b=KhuZ7gzGkMyAiwUcWFbG4O1cvlp2MJS+BBS9lskLIws5FuAojao50/Iruw5pioHqEb
         xUojUGOshN5UMqyIWUPYoY42rpf1HvmXN7GdpUZpmbTv/KeZUoZYpptVsiYLb5wmYjOh
         adZKjnx9aenCbh6RVLe6+8kOrPk0UlIGR8ofj+OrHBPjnkcLISjfexRIiaUqbePfr5tJ
         1saoOK+lrY4fe9DakqVoY6QcCHCJKtCylBLMrZYXstC28KGWCCI+9mr+nWQndlX4vn17
         iVSCnYa888b6IxoO1hrj1bA4PnLsctTyVmAtONMCooGsXMLvZImHCQZvXa9kPlOELJet
         fMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=90z4MmYZQd73lBNUMYypewx1zkh+PMgZdvtnSQI1Glg=;
        b=yOhWCTYU05tVgwROSTGLCLIrEs249dpvIDWfAFL9hZKyZnL2Vyh3RhjaJWvOmxKB7L
         /qdDQMxsnAVQ+qUcp5Y3X143KkCcgROI0kkGH2C+5teFYxkmjEo8sJeMQ3SbfFeuqNLx
         tZZR2owPndL3PZ5lDywsXemn9p0qsA2hWM9cecBODHBap84giwak3fRQ+poMBgoGSlwc
         oaMfBpeCizj+GPGhJeUIvYLNHb0I7VsdYlYGnLzjFKzlexkQQbP7roRbEnfTeMtlIa7s
         Y0UTev1rMlLqP5uAqIJPMqPH19sbUNz2xmIvCLkaj9xjDe71qXm6DWKqbT4EyIXG9P45
         KrnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w2si140036wrn.4.2019.10.30.10.56.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 10:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9UHucdJ020818
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2019 18:56:38 +0100
Received: from [167.87.33.44] ([167.87.33.44])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9UHubWp009938;
	Wed, 30 Oct 2019 18:56:38 +0100
Subject: Re: Backport of patches to jailhouse-enabling
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <343b0acd-45a4-0ca6-f6dd-84bee630169b@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e01e63da-43ac-b915-c8af-828491621c88@siemens.com>
Date: Wed, 30 Oct 2019 18:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <343b0acd-45a4-0ca6-f6dd-84bee630169b@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 30.10.19 14:30, Ralf Ramsauer wrote:
> Hi Jan,
> 
> could you consider to backport the following Linux patches to the
> jailhouse-enabling trees?
> 
> 8428413b1d14f ("serial: 8250_pci: Implement MSI(-X) support")
> on linus/master, and
> 
> 0935e5f7527cc ("x86/jailhouse: Improve setup data version comparison")
> 7a56b81c47461 ("x86/jailhouse: Only enable platform UARTs if available")
> queued in tip/x86/platform.
> 
> Those patches have been accepted upstream, and it would be helpful to
> find them in the jailhouse-enabling tree.
> 

Yep, will have a look soon, along with a stable update.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e01e63da-43ac-b915-c8af-828491621c88%40siemens.com.
