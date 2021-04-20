Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMGS7KBQMGQEFOHVWCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53f.google.com (mail-pg1-x53f.google.com [IPv6:2607:f8b0:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0573655F0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 12:13:05 +0200 (CEST)
Received: by mail-pg1-x53f.google.com with SMTP id r71-20020a632b4a0000b02901fc8e59f9a4sf7607751pgr.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 03:13:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618913584; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ft37Molaq4wgc62qber1nybO/EtaPjhrlqV+/nvgywc5h/enxLRfDcRpJnicCNNN4Z
         nNFGzkGQ/Y1dXiUlOebkDDfe5pFDwVP7vv+7D1IppVz6KPCjLW1RxRara2+2/TJ1YbJN
         FyQReUK4KYx5uvX/oAJK21NOboarKyPQvF5O1jJxoNEuLdaOoCeqKLu74xcbNEz5dBJL
         gr8fxA2jDb+NHtBC6eemMW7yrAFEUUpVgyIx489exKl5AN9w57Du61tmzdMWM8/1UtUv
         AttvtrXHXGjcHoIaFd92o4Ig61WPbIV4D15EN8Vo5Zj7cl3iBUCR/qnGWZ6F3hV1zSDq
         26Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=G7VkUokUN132J/8s5OvfDHiXNxVEfABovbrrBXEme8I=;
        b=SwLdCUTm91+yduOgaMvEB5bgzegiDVJXA7zeyuK8CpeXPlJuuFd2ua8EiMgRjqjVXJ
         aoMmNfxif5Ug2VSBjVtjNZQ0/61bNDRV3OWmurh5ZD7fq5HQy15vDfYNKJbEZxk5CUFY
         WO0UCPulX68mAnXmp81qekc7rTsVp0WKjL7CirdOR2OeSGikI6Q5eWmuVbi0VF766r8g
         jcukZnsNpA/8AsspiqGWyfjKTZfb4F9SC1bp96c5s7RhynhuGHIjYs8j0jc43m6w36CN
         UyT+hfNt43QNfRUGLXWNMExKtg4/FLH2Zfz/5jwBbq8rxkG/5EyZh/ivQcoFOMleH8p3
         ++1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=XfWk8EaT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=G7VkUokUN132J/8s5OvfDHiXNxVEfABovbrrBXEme8I=;
        b=Soj2d/2XnuSBmFc3mlV3rUCD640CJzfowKloxeSD6uIahENGiU+dtaGSJzoq2mkv0e
         eKLuE1SA6W29NHzNpAikrFA4tX/eFUj6hErack2Biucrwp/VMLm2mDRaVYe4pV3C4hDV
         a8F54vzEsm1Lh1Y8OZA3SiwCb/kqScUP2w0UMiWOYkoeoRo3uby4qXNCZKZCQk5NU53V
         EhYFDSy4xQS6FPur4TGvFksEup+dlY9xq177PIeajm6kEyaPDOqceuKicijgGRQ7iK41
         QHk7pjq02Pzr7KxojtTFG0iWSvWZcTIjWM3ON2W/3KIk4PqkW0+g1JRAVg3dWkmVIcgd
         I++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G7VkUokUN132J/8s5OvfDHiXNxVEfABovbrrBXEme8I=;
        b=AhrqIvZNdLGhVCLWda/o7EIo6Oy3GGaCqLSeYvz21G25Ny+wSfT0MXcTF5qIMdVzNb
         K4ucFoWAfinb+XeYQE91oxUQkT1eyBv6Yb9UnujOXESy2z17Yiz4CfU9HfPgVV1fOq0H
         WxLUtCmziFloyuWI5/mOqqYRxk02nUUojSQ6J8ffXuRchhHTY4bzaNYQdYP94qlXvP8B
         uCs0lUpIyAvOyUxcTX6jo5VuQv4sRyQ0NWNwPWxWtb1HpsykHYwRi9TpR4HEfdiIhaS6
         qy3Ssjufam7ydxypYV9c9WSeNTACSVnd9FWLwrqxjb7GzvDJVWT16f9e81fn6imwFyy3
         E3ig==
X-Gm-Message-State: AOAM533Ouleuf+bcOtBKD6wtRloAwc6MERn5yGFU5o++fgvrwX32Z2fD
	YVhK91QPcKGYO3UB9ER98Ps=
X-Google-Smtp-Source: ABdhPJwjjvYFmnM2WjKIjrnSTICMUnFP9FxK6WbcMNRh4v9tElzOxruv/witJsiqlu6tkj/NqZN9CA==
X-Received: by 2002:a17:902:ee05:b029:eb:87b9:ddc8 with SMTP id z5-20020a170902ee05b02900eb87b9ddc8mr25932322plb.61.1618913584360;
        Tue, 20 Apr 2021 03:13:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:b48:: with SMTP id a8ls7662760pgl.10.gmail; Tue, 20 Apr
 2021 03:13:03 -0700 (PDT)
X-Received: by 2002:a63:483:: with SMTP id 125mr16271217pge.406.1618913583738;
        Tue, 20 Apr 2021 03:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618913583; cv=none;
        d=google.com; s=arc-20160816;
        b=qutxxIKACLGUsELeVLMJKZ2Y0AyExCP/IitSmXZ3Rg1R4buhKyQeLelHSTxKmBWtQq
         zCF+wuu9qzhVaTkZf0KEaGFlypuKk8+LetOtRLQBoJiWXKtwAnL0Y44bs1FfsC6U3Jwq
         6jN1/u7cmcWjj2f8xDIO2JwBYcd+VrOE31o54Hjk73dn/Dr9yY7z8Y80k+iXJ2dbB1Ho
         gbW8rrp8x33ZA7M+bxwX3JlyoS7WOIwEhyCzDklpEQuZPC3NJD7PTJ1gsY6bH/V3ZBYl
         DY62mf/6IFx0O/2JYl9mzHiAZRg7jz81DAjFWvmbuuKR48RRBN2gMDUgwVz8bRxCroLY
         x6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=rJUKrvDgxdPnwbDvwiS7LP6iCPT4tn5R5LLrWEZ98Q8=;
        b=pTFnSzalCOJ6+PjeD6n80dxkq0AFmGu7bxxpubxiOcjWO6d/14hZAMmElZzbFi/ZhS
         GWquRl7Z1w+erKF6fTVtLqPfC7uhwGgas63yds1YnKiohFv+MwBARcadf9LMiZ9Qpjp/
         SMkvha9QsXtipdCl/cj10roscHwZhAtJ+49Sz8GZ2mMTDJYo4eYFISvWCMKWtkwaoaQp
         IHKojTumIIj+UoFsgzZcEYPJV17qVF/cNNep8X7jFZSj6unhWMbtdonWW743IWpHcloR
         r1IB023uIu9up8yfeUIc9gWJkPv3nE/iexP67/gPLhUdfgElJAI6vXhsqJrBOLzTO3nf
         Swcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=XfWk8EaT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id x3si381081pjo.3.2021.04.20.03.13.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 03:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github.com (hubbernetes-node-075089d.ac4-iad.github.net [10.52.200.97])
	by smtp.github.com (Postfix) with ESMTPA id 024D25208C1
	for <jailhouse-dev@googlegroups.com>; Tue, 20 Apr 2021 03:13:03 -0700 (PDT)
Date: Tue, 20 Apr 2021 03:13:03 -0700
From: "'Bram Hooimeijer' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/87aa37-95cb81@github.com>
Subject: [siemens/jailhouse] 95cb81: inmates/lib: Add zeroed alloc, and update
 usage
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=XfWk8EaT;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Bram Hooimeijer <noreply@github.com>
Reply-To: Bram Hooimeijer <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 95cb81c355584e2a6a81b5d42154f4c7555d7644
      https://github.com/siemens/jailhouse/commit/95cb81c355584e2a6a81b5d42154f4c7555d7644
  Author: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
  Date:   2021-04-20 (Tue, 20 Apr 2021)

  Changed paths:
    M inmates/lib/alloc.c
    M inmates/lib/arm-common/mem.c
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/mem.c
    M inmates/lib/x86/smp.c

  Log Message:
  -----------
  inmates/lib: Add zeroed alloc, and update usage

Adds zalloc(size, align) which allocates memory and fills it with zeros.
Replaces usage of alloc() in inmates/lib with zalloc().

Motivation is that use of alloc without zeroing mem.c:map_range()
results in illegal page tables if memory contains artefacts.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/87aa37-95cb81%40github.com.
