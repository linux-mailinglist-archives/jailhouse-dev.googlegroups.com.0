Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTOZ2X2QKGQEMAYBFFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F21CB1D1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 16:29:33 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id 21sf311694ljr.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 07:29:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588948173; cv=pass;
        d=google.com; s=arc-20160816;
        b=iP9r+BexXQAC4Pz4mBS1KzCaELW1h/IYC0fyrdLX5wf5l1yZQ+rcWuel3kgq4JhU/w
         rUP+ekiUJEseW81D8fO6UIZRkF6pc41xI15Dqev4QVZTcLOf/UP8ubC9y264a/7jN2G7
         QEPtRKdDAx/t0rVaI8VjAOPPku65jAWZBWhI7HjamuuZyZDm95A2bn7GZIJom1vmBR5y
         hOJ3v6KoGg7eTJluhUrCh2CKsH1DjKhStkrn7k/9HyMVsLZkEyoR4S1Zv5TfA32ABx2q
         hSyzWLDDR5Z6O9WyPmDADMX0U45rUYjcvELby25Kf+VAemYGuSU5H3eaj9rjEJFlNPTI
         SgWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pHSXgLSgLFuUkWQ1CJr8g3zU7AL0QJJYt6hDQrYxa0E=;
        b=D/47msXg937ES0RGWOtSeHJTGCmUzkRp3Wj8Rg1sjinxdEiFOmaDy6dZ0gE9knZC/q
         Bd9T/nGSeVTPDutYdLCsvCeVu9M0h2aJHV2lGdwg28zsOvKb467R9RPxtreVRZhfSD7a
         RIzGCrc4iuJBR5ohAwH6mp/sbGG8eBk77sZ5JeWQ0oVX4Ja8fSxJaBtY3ijrX3I70JFc
         0tmGX91pU6ML+nGT5VGn1j8Emuu+ZO6ZL1Am+cj7HnVV/AVU7vN4nhNKUn2qsQMDD6T9
         h2rGhrpUUw94lWGEzjtMrzUEfeqXDprgK7iAUxTTC3z9NGvh427d3+x2ukczf5uR1JOf
         EBFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pHSXgLSgLFuUkWQ1CJr8g3zU7AL0QJJYt6hDQrYxa0E=;
        b=FK674xMsIGLPk863pW2+sMb1GOLnb5WzT7L2+gYZwhgMTTaPPAemRb01BPvIUMPTL4
         +cQTCO93zt2qzMkd33UCGXi8sPQmrVupe281dWEecq5LB7p/hbKofOTtIaTmJtN+sbjg
         QO4eRaX3gW3EZBtQL+TUvCeP6LNoA/SEJGjm40rxm5WbF9I5MJ+0KmGdT6q7aNOHUwWl
         68yMbZGqKLBR5MxNaXtTnJphxla9M3pa4QvvvpRZmgihyywLJRbEslapd4/Cj3WR1Jul
         61PmwnS5JeESnvB6pBGTsoGkNtH8P9zE0b2qRVvUTMK9JnqjYipf5560TSjAaEzAtndR
         j1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pHSXgLSgLFuUkWQ1CJr8g3zU7AL0QJJYt6hDQrYxa0E=;
        b=hS4xBAKcPjaFiXZUokqti9p5u/bV/QA4zLcHPBN0JcLjznHbSVZwMm8arMwVOzYca0
         XT/bY4m7rtktFoj8XbGEfD8qCucpJ7GpPixTVZsKlbIOdU/wLXAyIL+hr/GZ5JxusO0f
         WZ7s0GMM4qbrsQvhRJZTzblvw95eez/z6DyDqCcNL7L9th9YaSNTTMi4zZqKbxloQXNU
         yx9wW/bUSKx9/SWFsKktM0KRzTzCGV5z14dES7LFNWEdopLlqw3cQidkBtDKyaZQtvaP
         LWW+/1cg7wpFDKQASt1PvuOO60uS/BVzxo5q8hPW2DwwaCjLKszkxmLfjxtwTC81DN3d
         stlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ik3qaT7Mhg3oxohG4K5HmmSCKBQXFT2mU3F28wV4aR8vzkYvy
	PHIL35i8rYMs3ER51QJvGmE=
X-Google-Smtp-Source: ABdhPJzgvlbiLkUINnkEcy2KiKdlCGhWNh4zxaLSQ57LkLmFGyZmIhY4Cl/0WWaB3E23TWJshSmkig==
X-Received: by 2002:a19:5518:: with SMTP id n24mr2139787lfe.61.1588948173453;
        Fri, 08 May 2020 07:29:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ae17:: with SMTP id f23ls311827lfc.9.gmail; Fri, 08 May
 2020 07:29:32 -0700 (PDT)
X-Received: by 2002:ac2:5de6:: with SMTP id z6mr2099136lfq.18.1588948172462;
        Fri, 08 May 2020 07:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588948172; cv=none;
        d=google.com; s=arc-20160816;
        b=qYn483Twf0RLWk2tBd7+28VUGRr47S1D7PdN9hv/kPV203gorTOnBkchZU1KWY4gtz
         EGRzVT08nOqUg+MGUvmHl/9l4cePkzs51OZRJBkAEsSKrqMQtWjzTAPY/VLsj7zfK4w4
         YmP0eMX05VY1Aj4PE5DgK2q0hjjiO5Sc0VuxorOTWW/tcVpv4hT8PgaWLznl2LDvIBR/
         oRsTAQmAOo7kBqrFUeEhkCk/5WbhoMEyRuSJ8YD4afXl0OIv95u7pEea3pftvh/TXU41
         JhQdtUM9Kr21Mo2T185CwSSgx38r6yQktMpRC76bYztA3tmVWTu8VDdB6jjhMm2QVjV+
         ZFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6dtYGr9oxCnqa/TZSHqASKtqxbhtxB0haAruoy6b1fQ=;
        b=KfkRzxMt40sIDxa2w1QR27ufdZgFY4eq+Qfx7faG2591Q0mLqmwgvmoTU5kTDl824z
         Uj8/iAkQjXWiLWuW+Wjjo4gzXVMd48z0ypYdgdbsPsUuZIvBM2XyKektwoqIUT7W1sop
         A3Ge0rAHClBz+x2CnHdzsKRUSTOKy49F9OWYVCGezpYLW2qCM9tt4w2zV0alv420gAlP
         vhrZCoy+C5s9T/vJjgl585K9G3w4ZLY6xoEeisIP3lu11R1hpoRSiECC9yXLaHemDVOc
         umFEEiH7uW96HXhIaxBKzAJqa3sg9fRdbZ/pYLZD7NVr7aC3EIJr1oSgaZtRNliFNxYY
         Jtuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 184si102161lfi.1.2020.05.08.07.29.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 07:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 048ETSfp022480
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2020 16:29:28 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 048ETSHU010319;
	Fri, 8 May 2020 16:29:28 +0200
Subject: Re: Ivshmem-2 driver for x86_64 root Linux
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <0fabe986-8e7d-4905-89af-75ec7e4d20ff@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <39160e6e-2bba-a46a-5bc3-18595ec872a7@siemens.com>
Date: Fri, 8 May 2020 16:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0fabe986-8e7d-4905-89af-75ec7e4d20ff@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 08.05.20 15:48, Chung-Fan Yang wrote:
> Hi,
> 
> I am upgrading from v9.1 to most recent version of Jailhouse recently.
> 
> As the ivshmem version has changed, the old drivers and way of doing no 
> longer works.
> 
> I am curious should I cherry-pick the commits on the jailhouse-linux git 
> to my kernel source?
> 
> http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse
> 

This is a queue tracking (via rebasing) mainline, more or less frequently.

> Or I can just use the Jailhouse enabled branches in
> 
> https://github.com/siemens/linux
> 

This is a stable queue, merging latest LTS (5.4 ATM) with the Jailhouse 
patches.

> Or both way it will work?

Both will work. We use the second option for jailhouse-images, and the 
first one for ongoing development.

> 
> I am curious that besides of the special ivshmem2 driver and patches to 
> uio, are there any other significant changes to the kernel source?
> 

You can check the commits:
  - uio ivshmem driver
  - ivshmem-net driver (lots of commits in queues/jailhouse, folded in
    stable)
  - virtio-over-ivshmem (experimental, only in queues/jailhouse so far)
  - driver for debug console (only relevant for bring-ups)
  - some export-symbols, not needed with kallsyms workaround (as long as
    that works)
  - some dts changes for marvell arm64 boards

> Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx and it 
> works like a charm without any noticeable bugs.
> 

It depends on the use case what would be missing, but things generally 
work. At least booting.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/39160e6e-2bba-a46a-5bc3-18595ec872a7%40siemens.com.
