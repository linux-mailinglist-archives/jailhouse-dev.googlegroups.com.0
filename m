Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZUA576AKGQETWKAJPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A8F29FE6C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 08:27:36 +0100 (CET)
Received: by mail-pf1-x43c.google.com with SMTP id u24sf4216613pfh.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 00:27:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604042855; cv=pass;
        d=google.com; s=arc-20160816;
        b=RzXC4h18HQ472YH8tRuUuxxI16YBeiv9JIlMzncwA5wqxYzkyyQEaElUG8IyswIXRA
         27gfKRlVOZR22Kb49Xx9/w56EL1QKaq0E8N3N5r9ms5QLVm8gv8vbzBHwSkho5vcQvef
         K48if3oorBB+LJh54FElWCqmCij186xjM+p70oY7axMaxQyBm+yJ1In62x/TqXljqXs1
         dJmm+KLuVIUVlWObqJVQG13+Dn41+TWfBmmz0CTDSA04pHlqEpuD5Nrvp2vTpBwj+8BI
         pD3lM1Ja/rYXIf1Aw2hbkNneunab0ATuIpsOVmIuOZORgvQKvna08LR9iBowf4hOXE7k
         1mzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=woanby5yuusbhk07mOYdNj2XJ9lyCVIXT78gGdontAE=;
        b=ugvaE89BcFZ6+wz6l0hdV82Z4Hs6uynKPpYd/i9PqVJZkO1+9Mo7Wv3rvJKKJswuLz
         B1Nj5y8yFWJo3Do+2O4HpTZQsP3tkaaJ7dIW6TEw7vqCO3XsA7nWm9oypkCcV+KagnST
         RkPiuq5eoOVFzaCab0zxwzQTqSbg11etUl2S4b1fRVRjCHYdijux0XMWOHvV8n/0i3Eq
         DjRba38dvHUP8Ie7WXOq5bFa6njZ7OFFiZ58fjTsNuBFLxSWAuLmMWMZi5x/BlXIkliJ
         /t08a4g4ALEVGzRRmDfexEY3p3/MUP/1GXgraqwd7TNLZ7ke3wPIq0sTzpkldOqbZoGe
         umRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=oNHTgf5g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=woanby5yuusbhk07mOYdNj2XJ9lyCVIXT78gGdontAE=;
        b=ETb8G3KOXhHvcM190Qockt9saul0iTRLrZQJuw0wj9bqPss+TxB4svazHD3QXi/S4P
         FU/GZ8NgTQx10YMmJzt+3fROOhRpi43JxhpM+zsY1REMCd98lzhpb9uvz8DoKRa893pv
         7Ea4H7Or6H+f4InYyMUAzZZSdZ5/LF3tSCampzatFPH5LwPgtbsRefI4ET9tj/nscLpk
         OGsOIA9BXB3qvJgb9n89j5100s5aG50Rxta5j/ThYcq5MTxOjXtRusnJMqlTLDly4vEi
         AAjUT6qyxhO6bqFGaD7XmqRnV6A4v5pt0UqlUj7mvEGwDVVAmlrc0cgA3ArEGpSB0FpC
         169w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=woanby5yuusbhk07mOYdNj2XJ9lyCVIXT78gGdontAE=;
        b=kYYfkhd0Vuy85NSiInAlbkQm73vZbskxH/0TTjla5H0gsuWETUTsQf90CgconpLARe
         J00+gAOCkDKKCaEmsFHRTkS8kT4BmGSyj5m37LdzRP4pE5pSi4FVZjngmObkp72wz+AB
         22v7hogThIV0EjBGeSpAkyIDKapDPGY00Iggv5To4nZ0QqUF2jdr9+d7Ji+s/BCMZgp3
         h/kjANet+1qPWIcLtsyvXq4bLsmR7ZUrtQ4ddrZgSDFg/2s3oFRHkd2dgN0UfSn76XFN
         nz1WVjioo5zX71GEpqnlhFpBW3ChhpNQOj55Z4GL2ApJZjXHOUaMZwCwfmwm8Vf0zwPR
         kJpQ==
X-Gm-Message-State: AOAM533HVh63fRi53oQZ7tI+MmZdI9Ea3k3DB0u3ZdDc2PQEDUE/4Khs
	xWJCKZqqeTgtOvEG/gmmWPU=
X-Google-Smtp-Source: ABdhPJyriLNLk8WN06x9w9AQobGfXNwfRWvWIYaVLJ5usy6/Z72t1oifMOAnefizRrhNumxg0cTCTw==
X-Received: by 2002:a17:90a:f683:: with SMTP id cl3mr1301787pjb.84.1604042854919;
        Fri, 30 Oct 2020 00:27:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:515f:: with SMTP id r31ls2015991pgl.7.gmail; Fri, 30 Oct
 2020 00:27:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:88d:b029:164:5a00:29b8 with SMTP id q13-20020a056a00088db02901645a0029b8mr8327921pfj.10.1604042854130;
        Fri, 30 Oct 2020 00:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604042854; cv=none;
        d=google.com; s=arc-20160816;
        b=ovMAdvVRA94P4tuhbGiZwAZLl9ENG3N8by6YRvVmFtZhxPnvXaegzOfIqG1CXDk0Oi
         85Zl8ySUYYyuMVBDDvGrWwymPXD+4m7XgNzuOoI8TsHGz5Yweth66fYtEoVC6dFERhuT
         TVy4NDn3RjeyyZUgobl+JIEVrTj2+UbjFIqqDLFuVu26woxH1ATJaN6B6nVIjxcYz1Fj
         d5QcXZ9ExD2/zm+ANEl7Y0oqvDtjVe5cR71uiSY0C7+A15UAKfY+0oZVznIKlS1sNnev
         25a5W4TJIemc4G+oFGfYb0y7XjqFldxQ9ncVLH32tUOSgI+dTX9fHa4ErvY0sp6F8eJ/
         MTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=0lJhgm9wm9YfSkg/Zf2Bonv0nQTp/uezt19i7UYqY9Y=;
        b=MV2T099aK5TsvjIvBMgjlx1bLEo3q1jakADawdxbWuDg7lERJ8dcg31caGuKq2nIhp
         bHdq9JPgpH3MS7/Gub95XyPKFX/fZR+O+8t8GiDwzoyIz1i2uMs0rW5YyD8L7BHCkXVf
         tTVbiaVyZPba549bXkeXnbXIbc8fSTjT9RiGw6iR178BGDYIVn71vCygyGCLrAohIZHj
         RLYwdUEkRpkkNS/uNdSysVh5Z5sXs0d2GctdfY1nV1v5ExIzBCqKoFwi6sEBOCdkBoex
         t8HL7I73K8Isi1UQRaKuBTP5DbqmLDOHiAAbiOfA3nTt+/IR0+lZkIWi6e+xpDdKS5yM
         PPuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=oNHTgf5g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id j63si328763pfd.1.2020.10.30.00.27.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 00:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github.com (hubbernetes-node-8b72bdc.ac4-iad.github.net [10.52.18.71])
	by smtp.github.com (Postfix) with ESMTPA id 5332D560CC1
	for <jailhouse-dev@googlegroups.com>; Fri, 30 Oct 2020 00:27:33 -0700 (PDT)
Date: Fri, 30 Oct 2020 00:27:33 -0700
From: "'Ralf Ramsauer' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/c90737-d845c8@github.com>
Subject: [siemens/jailhouse] 12a42e: tools: introduce tools/demos subdirectory
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=oNHTgf5g;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Ralf Ramsauer <noreply@github.com>
Reply-To: Ralf Ramsauer <noreply@github.com>
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
  Commit: 12a42e44e26a79a36125f2c9349bc3885ceff7cb
      https://github.com/siemens/jailhouse/commit/12a42e44e26a79a36125f2c9349bc3885ceff7cb
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M .gitignore
    M tools/Makefile
    A tools/demos/ivshmem-demo.c
    R tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: introduce tools/demos subdirectory

And give ivshmem-demo.c a new home.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d845c83d937335e39105e08b5c164adab825dc16
      https://github.com/siemens/jailhouse/commit/d845c83d937335e39105e08b5c164adab825dc16
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-30 (Fri, 30 Oct 2020)

  Changed paths:
    M .gitignore
    M inmates/demos/x86/Makefile
    A inmates/demos/x86/cache-timings-common.c
    A inmates/demos/x86/cache-timings.c
    M tools/Makefile
    A tools/demos/cache-timings.c

  Log Message:
  -----------
  inmates: x86: add cache access time test

On x86_64 systems, this test inmate measures the time that is required to read
a value from main memory. Via rdtsc, it measures the CPU cycles that are
required for the access. Access can either happen cached, or uncached. In case
of uncached access, the cache line will be flushed before access.

This tool repeats the measurement for 10e6 times, and outputs the
average cycles that were required for the access. Before accessing the
actual measurement, a dummy test is used to determine the average
overhead of one single measurement.

And that's pretty useful, because this tool gives a lot of insights of
differences between the root and the non-root cell: With tiny effort, we
can also run it on Linux.

If the 'overhead' time differs between root and non-root cell, this can
be an indicator that there might be some timing or speed differences
between the root and non-root cell.

If the 'uncached' or 'cached' average time differs between the non-root
and root cell, it's an indicator that both might have different hardware
configurations / setups.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/c90737c12d16...d845c83d9373

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/c90737-d845c8%40github.com.
