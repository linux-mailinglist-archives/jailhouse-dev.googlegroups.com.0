Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBO74ZPWQKGQEL5I6OCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0FE4CAF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 15:53:00 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e14sf1167829wrm.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 06:53:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572011580; cv=pass;
        d=google.com; s=arc-20160816;
        b=MagLT2QLuPhDnLV8qSPw2YxE1sxYR7rwUUjcI7P7mjZtuTB+GTt3DGbdqp1E0cZeLC
         H7M627PhGfd0gGwHHD6jmjCXyL5FswA/1brogSsA2+5UwF3x+5jTDJ+Q5f2mwjEtTByL
         wUgNXeNP87xFG/Y2D72xKIeDzTwB8ntCjapE3U6e/v+q0jWZaXpUAHI2YIQm3Vlr82EE
         nZZwBrT/9v/Mj59GRwcOWtQvxlohCOdbsqD/QPF4bsIa40VawGdcgqL5UgazqErbplX2
         RaYUVkv634ALC71BQkOk8x+GMZKvSlFyEldGIIZ2OxtCjMoG5WlIe+k4W0GHVbC8L4bc
         7Jkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=XbsUdPkk51DyQNE+jp2dOiUaXhEY5DXyMtccQC3LtwM=;
        b=uM/wjINX0obHzntfExZTik+IyzS9wpsAG2MWj4mrhkgaEtxdj3pcsxEkaM1yzhChRb
         7SyhQ8yeNi7JCIrZYKQlby5WoZcjBQNDd6w0Ej+YchlP7IaksLLH5Q4aJksl6O2XdpfV
         Kqb9ZmcaySDZkFt+bCqoA4rwtIcTWxvKWVwcZuOTa3Zqi9zD4sWah3Y0oKTlhi6fsDO0
         BcYPk3+xQusOkublinR47dRrd+PYksR6qBwStQgpvqfmwcwwqzxcqzF7Mgwnb/oi/ZEu
         ScwcY58iH8m38dzfzM6n58awW4iU7/exLyCcRf9FsiUoqJsk1giF67lVZs5aOBUJO5TX
         pq3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XbsUdPkk51DyQNE+jp2dOiUaXhEY5DXyMtccQC3LtwM=;
        b=Ib5Y7jFOqVnihCIbc4VWA3nwrXjVlHhCNrzDZ7K92S1ndUap8nzJqt5ckan/B6geP3
         Fg0QL9XwP5Pnv3VaOUXuUHMmj9xJHuYrBMwBfXJhbfVlfSgW5479EyKGFe6aommtBHft
         pyyhrMW/6jGxITveKsGquql3fhOeU89DXlNpDB3BjZPdDG7scXYsO65UOWP0M4lPhaAq
         dfy4nzRZdbuZy8uyCslEfML3w70tWwmpvWsJIQ3Ilccl61kZxcyk1/orgCjfXUF+m/21
         eeFidw7guOTjANgEZ9aZd74xF3bwZP5BsVlqYpNQH00xClXpXgTeJ8gVXCx0Mz2ve4ve
         mzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XbsUdPkk51DyQNE+jp2dOiUaXhEY5DXyMtccQC3LtwM=;
        b=CrXU4A6DlaveAerTmie6HGQRq+cg7/iyXGil2KEevdJ+D+avH+0dCbdnvP53yAqYp+
         LmQ/diZ7jL1uozmEc3G/QnCTAhvxnlnWk6/kqMpGEcqlarW7l/502nvlhehpiV1mJa3C
         +85NzFso66Y9vlKRL2dwr0Ss30P2H5h3VQ93UQVF6Wm3KhQc4hJlqgHDAFsudM1Jl6b3
         BDRNt5xKG6Zo0nOVhearDB24CC8dzmZoJ/lI1dTcKwLgld7hCVYe3W5ZeLlKeZds9VbA
         4pXQCiAxWIW+yNxJdni09nUKFE21L+p0cipxciV9tzO4rIaRg2+FqGDPfb46LgCGiBnW
         Uvug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6NO5lUfNYK89ie99qTDyN+Pi+v1uDzfXR+yvrC6I5FErGhoXI
	GR8RRIl+hJeTGPN6O3YS4Lk=
X-Google-Smtp-Source: APXvYqzoa60nqjc5h7KVgXml5OeZkXP8tgs6YzzZQ9hXpkFLvlT01ohMvF3sEKJTM+tTk2C3XSgnNw==
X-Received: by 2002:adf:e747:: with SMTP id c7mr3175759wrn.384.1572011580143;
        Fri, 25 Oct 2019 06:53:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9e01:: with SMTP id u1ls5739913wre.15.gmail; Fri, 25 Oct
 2019 06:52:59 -0700 (PDT)
X-Received: by 2002:a5d:6651:: with SMTP id f17mr3290149wrw.175.1572011579239;
        Fri, 25 Oct 2019 06:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572011579; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/a42qIND9eP0hgfzrwHqFTJl7YCDKox/5uJAuZir4WZZNyzN/g+R2iSydjjhn1lkm
         R/iPrtyTNEutQC97j1vMTByNJAafpHaCCL6ncFPxW3rSKL9Mmh5Y6s5rY9y+abdouy0n
         K9D2TybEFJCt2PoFeeNrnFg8/wdx92rLZK/vNWEWtZTJnkHw4PE4YWkSbgb23VO6sm+O
         gkIUtPQpW6Pb+O4ji/cg6wMv8WF4DhjqRTfvGO69Wehtd+lCASyc7oy5el0JfUCdn20a
         lJ1otKklSfE96XR6CGGWVHvitQMAhMBS5DPfXMGQC/c7dV9uGukgCVU5nfca6uy0cHlS
         h03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=HXVw5pXOTK337buakG1KdjG2q2ffBzGZl50KG+D03Zg=;
        b=vs1mv1H89YyTRfg4GRwGSc3y4ZeFMVV6yZA2cQsh1tjoOiOaHnlBtq0v+Z9+gOKyHD
         pA/LpYFgdFsgWaEu72ACj4xogMncLen4NchETFutxT6Pw7dQmvQUMZGQsCLXpLM5I9M2
         3rsaxtzBAqbS9ntNaJ4LarqaQhYf7uDKr0sJDWiq7Z+s4kRHVLit1oQr/9cDc2mHzyJw
         ahnU+EXxYimOiGLUQ2Zcxm5e2uLEElrKzNpDwq2oxgttLcpDMmrbOetBj12v7pOuhRA5
         fKXxR+/GLbJo2cQY0VFukX4PB8vE+eEPkRiQXyjU1Km+24037UQptLsYzyGkCSj+jOLO
         oyqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y188si130172wmc.0.2019.10.25.06.52.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9PDqw47008755
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2019 15:52:58 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.244])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9PDqwE0022288;
	Fri, 25 Oct 2019 15:52:58 +0200
Date: Fri, 25 Oct 2019 15:52:57 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
Message-ID: <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
In-Reply-To: <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
	<6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
	<eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
	<48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
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

Well you only have soo many shared ressources and if it is not
additional exits/interrupts then it is contention on shared ressources.

We are probably talking about caches, TLBs and buses.

You should be able to use i.e. "perf" on Linux to read out hardware
performance counters. And there you might want to look for TLB and
cache misses.

But the bisecting might be the better idea. Jan already mentioned the
"features" that could be responsible. With a bit of educated guessing
you will get away with just a few tries.

Henning

Am Fri, 25 Oct 2019 00:04:36 -0700
schrieb Chung-Fan Yang <sonic.tw.tp@gmail.com>:

> Alright, I have test the latency from HW IRQ to application response.
> 
> I found out that there aren't any additional VM-Exit or IRQ, nor RTOS 
> scheduling and house-keeping.
> 
> It feels like the processor is generally slower as everything takes
> longer to run.
> 
> The IRQ epilogue takes ~7.8us and iretq ~2.x us. In addition, the
> libc and syscall interface also have slow downed a bit.
> 
> I do notice after upgrading, even with CAT, my RTOS latency are prone
> to be influenced by the Linux side applications.
> This was not observed during v0.9.1.
> 
> It's strange.
> 
> 
> Yang.
> 



-- 
Siemens AG
Corporate Technology
CT RDA IOT SES-DE
Otto-Hahn-Ring 6
81739 Muenchen, Germany
Mobile: +49 172 8378927
mailto: henning.schild@siemens.com

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191025155257.6af12e29%40md1za8fc.ad001.siemens.net.
