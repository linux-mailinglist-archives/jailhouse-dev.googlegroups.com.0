Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7HUT3ZQKGQEUTJFBKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc39.google.com (mail-yw1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id E511C1802BB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 17:04:14 +0100 (CET)
Received: by mail-yw1-xc39.google.com with SMTP id w72sf21631372yww.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 09:04:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583856254; cv=pass;
        d=google.com; s=arc-20160816;
        b=h2IzToa2AOCuNHJ68AaipJFECqCO4hMv9KY1QaKLfJZGRhmPsDZbPGxLxzWxDufM9i
         h06EHLeNtp3F3MVzinEDBusK5rjIJib5hwq8C6c892itO+1TRjOtoyFygG4lx2ZB1Hlv
         xTGAz9AI0AeIEFND+vQA/EkLEcRNACX8XWYjpYjeeYzrFA0QOG2niLrKadmj/ANpfv4y
         JV0VuJuCabu0pPgRzLARWG4OnIeE8qhbQI5+DnoBlhmN3HgzMcwv/4BQQsZcM9ZNBmDu
         XW7WJIGcKJwvW8PH76lym6RPvyO7JSbKF2+7vjE9uXEqFfjxYzdjYnPsR6pVwNxrC5YJ
         MivQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=lt+ujJE+AREuHXrJbQxuUwAN0+5rTA4U+aBv8fFIkUM=;
        b=QfvjCShrjYSnkmp+Fi0dmmg3fXDsUmNaLmGjMa+R43vcWojaEJJHuo0wnTrqoCV8dw
         997XWWkUjl/BRBRNyKncffGmnWTg1C3POdU5dUEkRaG0x4y6zYknoVrUXw48+BDkoSqd
         25FWnznPRD1T3iPt0cotbQCAVtgZ+vSs283M7XIuXOre76OoanmF6fzJKMKQHPbJupcv
         J+RtxLOOiTcui0afKwCRUlBJcToo1HpC+I2aCTovHKM84lSCVr5GfS7PTBV5cS5tRDst
         1NXvSssRfCs3lZD5ca/ocWclfBkMHutV1c4R7weaIChsFucYoAid9Kl91RSeRi2CbAEl
         /mMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nx7Q1Knw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lt+ujJE+AREuHXrJbQxuUwAN0+5rTA4U+aBv8fFIkUM=;
        b=R/Gb35oquqwOUGnso3fTupqjrHhLRLMv4hqH6iiz747E1Egw/H9kUK4NenJLkNULSQ
         6CkpTQT4oRw2nMwotC9kLoV31wyqFfpj3y5k8l1z+9p8LMGciVuinTgi9eVYKmKotikN
         thmR5O9fKTKO2QHY06lTYDm853IWdRZcuD71eRRutbBsYtQW99FDYiRNBmpo26cnWP9R
         ib6SJ/wpupIunP5FwlzzVZ+E+sjs1tUraGHIeamw//yzGCOaLCsZRjKJd0EUZdzkyFDA
         SrqYVFoypxaU9gRxr7G3ks9ZXusVTXjxhBlT9/lgVmifhSWqJbRFZObbK5x2VQfGHjQx
         Wp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lt+ujJE+AREuHXrJbQxuUwAN0+5rTA4U+aBv8fFIkUM=;
        b=XxuHZDUe7FODYKAw25pjnftFspnX5Ry8GVmyqiGD83yjvZ72L9HH/GM1E4PcPa/3wm
         OJLooSvOf9MxZGf+ITwxsdJfC4IRBD1aUYnjzpfYZcjXKpHCEkGbthVYuhxZQ1yrS7pM
         4WsvJhkhbPNP7IImB7PqZuqucoAfke9JeMRUkHdj75fY7WStbfBQEnhevoMFEgzLV0pA
         l3fatFH2jmhGigzpgT5YgdftF7FGCzTyL+BJnYekYVR3wQOTbR0dHJHkexJ5ORi/s+jD
         XdoLzGmtGBDMnXyIK2z09eaThf82RtezNuLTOaTgmAnvE3yLM4e+qBVVsM/KiSboCT+x
         9RMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3e3sCUezZgPeZ8CvkyeAN212boeychxnfTGVrQqIqgL1gDI54w
	gsNhaI4B0kJdvgWgdAAzDNY=
X-Google-Smtp-Source: ADFU+vvtxnPNovqUsFHCg3RCrbInUw2NDjaFT9PwuhbDLSP0C/EMxozjJpKWtD9fkIXzLwoG5C9zqQ==
X-Received: by 2002:a0d:d5d3:: with SMTP id x202mr22638288ywd.120.1583856252730;
        Tue, 10 Mar 2020 09:04:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74cd:: with SMTP id p196ls3246091ybc.7.gmail; Tue, 10
 Mar 2020 09:04:11 -0700 (PDT)
X-Received: by 2002:a5b:34b:: with SMTP id q11mr24180241ybp.243.1583856251914;
        Tue, 10 Mar 2020 09:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583856251; cv=none;
        d=google.com; s=arc-20160816;
        b=Dn6T4q5oIGME7rONwb1URvhL8pe52gnVt3E1ghyDGyaNWljsVQQ1ltseF58tJ2Q0C4
         ysC6/P7yz1nkFkBuInWlMKNz9DXvp+1u4DhPsWLhihRLiK3w9VCaMaPw1fI8SHUwmypN
         cY99d/22XsbvMAvBdpmmoaJTNVo3M7MUnlwu+1v0mW5jqf5HkLkR3WRC5Um+KLzRSXgL
         6cYZHZ8XGv6jSwkkuIq5CDRiYrc/ZINEgJpSZragPYEyoyblSn3oO2VFqv5/ARIaBTHq
         vNQZccWAr1XUm09vLIGb+Gm4Ff9O/kFZVZqsvgMJkBTuudG7p0VJ0CgWrs2Z9gsl+aoF
         vmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=5aRJRPY23eoMq07+c1pc5avfkexN+L9oFQhBoN3fwS8=;
        b=vOM+Upp3LbhRsIrJFGlCCnN7Qv+kFc206P0UPTQQNo+/ZLbbas1raxUEqpwHeoXf29
         nvCPMMhuZkPlBKvab0wikP2p7zQ4jcBng+3S6mDndH5OY0BIxuumLd3ZhsAVEVpblIrp
         KkhoKWckZTJwtDfBfUqRKCPOxJdXWKQfLZ/1tyryac1BsTJqmfJEQnbxQIJiqstKGfpr
         wRVfAjy3xnDqCgDqwj4LJPYv3Z3e+xmfJ6QpoJ8QpwTy1g3lYlYdHkNGba2E5e9lWITM
         GN3ld0q7SJi41hpB8ThtCRJS+WGsMduFNGf1VXR4xGmyOLQWEnSs1vDKt8PCHmIK1b0h
         l4Qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nx7Q1Knw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-11.smtp.github.com (out-11.smtp.github.com. [192.30.254.194])
        by gmr-mx.google.com with ESMTPS id u202si102453ywe.5.2020.03.10.09.04.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) client-ip=192.30.254.194;
Received: from github-lowworker-292e294.va3-iad.github.net (github-lowworker-292e294.va3-iad.github.net [10.48.102.70])
	by smtp.github.com (Postfix) with ESMTP id 0524A2615B0
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 09:04:11 -0700 (PDT)
Date: Tue, 10 Mar 2020 09:04:10 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/421fcb-f76b0e@github.com>
Subject: [siemens/jailhouse] 37101f: core: ivshmem: Clear state table on first
 peer setup
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=nx7Q1Knw;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.194 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: 37101f166e71d712644b107c77a0a694f0959f96
      https://github.com/siemens/jailhouse/commit/37101f166e71d712644b107c77a0a694f0959f96
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Clear state table on first peer setup

So far we only reset the state of the added device of a link, not that
of to-be added ones. This could expose random state value of upcoming
peers until their cells were actually created.

Fix this by clearing the complete state table when the first peer is
initialized.

Reported-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f76b0e89ed89a64c2d22bde114e20abd0e18ce38
      https://github.com/siemens/jailhouse/commit/f76b0e89ed89a64c2d22bde114e20abd0e18ce38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Clean up variable initialization

We can use the local id variable also here.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/421fcb1f99cd...f76b0e89ed89

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/421fcb-f76b0e%40github.com.
