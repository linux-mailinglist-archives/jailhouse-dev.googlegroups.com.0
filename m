Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCGWYHYAKGQEAUGNPSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3F1301C7
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 11:38:02 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id e22sf15607218oig.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 02:38:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578134281; cv=pass;
        d=google.com; s=arc-20160816;
        b=IKYxnkAydCRzqdZ4CclIOTbWPaFsg8ki1beE2Q8gHOULfIzqhO4koltYITmUwW7l9I
         9qqP8K4ZkJWx3GVlOWCH8eOJq2ZOPuDqorh/fZvA4vyJCafyYwHRwB2Aat/ze/YXSZTk
         FwElWxQUMmGymn3wlXC+FCBNj3Jb79/9deI0lazIIDGn+Oy5Q+c/hqeUttfwKB7jsKY4
         I5/sVmjr/SFC0yG0G55fViNQ9Q3uhSDOdWL38OJvC5rx2p0rMFPXAhvNoSStmRSqIT8o
         z9YHt4oP3be7G/RgwNF/53G5S+8s7669Lnsz1xmfiAg85tihYIqTBQu5XSuPNpioIUMc
         X6aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=v9g7WcfIx2T32xLSLbQ1FDBhDgzjWcJ17hPDkhfvPQA=;
        b=pT2MGJrq8mebpx54TQOpfy5xWybK+l0u44TScz8OYdRCASB+fKH2s8Yzjl4wuaD6nx
         fcKU8OfdyNOlNZkVfSffBt2QPoiWpwFLexIvT11iRl43FPdHYRo9SmpcyZnbYVcnqNxe
         EASIsLN4AsaCG0uZmz/OpVsIovpeOQVuBhWzFNPkssMq1fezU27La884BYyD5AMp1T8z
         N5rwBPuN0zq3feBklO5/cCrZKRvVx3H/v1DmeqHIR5tmgg7Hhu5Bn6+vxldu/zkgBn5C
         Qo4GY18w7ucgbJCQMPo94r9CN50SfKe66Hf/UQkw4ROBFMlGlzZExUBJBNyV6HzkEe9E
         1IMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=18Vz40ZL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v9g7WcfIx2T32xLSLbQ1FDBhDgzjWcJ17hPDkhfvPQA=;
        b=TISTqi5jJ+oIByCWG9V++A0oqgvD9oEWaepISllpGCAxUizmiGW9n8J3mkGSJNKt13
         2FdThx+mexsOMgNYYh2wLiWwATKu9BADnHZ14hToLLdXNRexoU08tRoULNmhTSqQRmin
         VaSIRsQMp/Xw3FpVsUy0tXFXub5Qv7FvR83VFQhqyk0nbVaqPH5B42EUyaEpVVpE2co2
         wOH3QmY91wQXnyvx1oOX8XAsp7G9BrytPhrl6VirlEsiXLwVi5stD/B+Xiy8wR+BKADs
         LTA1DF3EE6+zpEFKtefjbEeBqjp2wfNcDRq/Xb4b7nqostFmreQOK/HnGYsSDKqLuzRI
         0BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v9g7WcfIx2T32xLSLbQ1FDBhDgzjWcJ17hPDkhfvPQA=;
        b=GSlP+zcY2f7BeT1uKiOVLR3dzdx6HJEbPIdLMOrfqENlN+BnyYNTO7R9lN2oR7FtmB
         wodoTOdeKn7AyRvP0j7qXPR0Hha5gIWLBAWCTNxjFxHiCfv+6tlhb7KXxxUvO5dD3oEK
         jQVxmjAC25Az4eOL3LTw1P85rMBU7Dsp4aITvecg39uQl8FjKF6nSdu8lm5Ynny7nUXH
         w2ZSEDW3HviaK/f9KPNZ6o9dMO4heETKbSCUOg7qzdKSBCjEkc++jniwuiUXVFIiPTZt
         66nM8eoMzF8gfIJi7s5g9lgHad9XBk5vYLgDniVzME7ozIHbKY0+c11RMXC0C37cH4H/
         0kaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVS1ZvAI6JeOVqR4XOD1I8snEHCANDFnBhxLGMnV8pnV3NQuuZq
	dCm2X3uoiDO2xA/hSh87q94=
X-Google-Smtp-Source: APXvYqyGjvEgJrBs40Cq2+6agTqMjOndfMZB0x/ua5217aymxUfPlYYMJYx0CdqZoIfFWNEbgyccNg==
X-Received: by 2002:a9d:480b:: with SMTP id c11mr93577542otf.283.1578134280884;
        Sat, 04 Jan 2020 02:38:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a01:: with SMTP id g1ls14309515otn.6.gmail; Sat, 04 Jan
 2020 02:38:00 -0800 (PST)
X-Received: by 2002:a05:6830:151a:: with SMTP id k26mr87682753otp.74.1578134280406;
        Sat, 04 Jan 2020 02:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578134280; cv=none;
        d=google.com; s=arc-20160816;
        b=m3oGnVz4MwKowGpk9pez4TTg41c5wDUqcwU5PisrvgtD2ZT/X6hQoHAo7/gYQWUwcb
         eXpyvbQOqrLn7umN7cqNniKun7KLT0SDVDPakgYVyO/mWQi9lrguLEZlZQP/XTE036te
         OLiKaqoBMtFHsG1QcJPH2R/5XOYAGOwjiKI/wayxA1YdtKto727cvpIZgxNI/AD1a2yp
         X1Y9fgk5Qmb4JB0Uk0N21GOznElwoFS4NConLWzH/gg0i4guUwQVizqQtg9o4Q8NtK8Z
         lmoAZEvFWv5T79nskKdUpurihvHXDR31nOKqkD+JCwjMB9F3GAwpr3GsT+Tw1DLnWrjL
         +ZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=5tFLkHJi8qNSVQmgN7hfzwJS8vFgA0ouB9056+NLVVU=;
        b=sWpgo3HYx9qjmhyo2UeyffY392f87k8kxQJawZMr5gf+C/7g719TU88DArOJcTjLfQ
         +7mBliZP7hmk98m8rGWIfepW1lQpZqA3WxK3nynmdOTiM0ZqA/r60PaZLpPJFYTYsZ4O
         cJ3UAOZKMYskIzowlBQjOpdkCG0J/f5hjvN5vfPwDRh9TvvbOdenxT/S3tjwAEQNqmx7
         A/3jUy31rLe9qgVjQX6n5mNzuD9LZp/H0V1gNiuYMVfS1hdJfDdyoJQKtAxjGUXhZOdk
         6tdIvycxrZFZJJ/TTsffeT0fMF+zrOJxXamir9R4ekBIVZPayYOy4nb70DTioil3dwzJ
         1WFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=18Vz40ZL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id c23si1078262oto.4.2020.01.04.02.38.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 02:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-edec459.ac4-iad.github.net (github-lowworker-edec459.ac4-iad.github.net [10.52.18.32])
	by smtp.github.com (Postfix) with ESMTP id F0624A0441
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jan 2020 02:37:59 -0800 (PST)
Date: Sat, 04 Jan 2020 02:37:59 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/4b795c-0c902c@github.com>
Subject: [siemens/jailhouse] ff5481: inmates: Rewrite ivshmem-demo
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=18Vz40ZL;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: ff54819fe4fef8e759983496b3b8afd1f8bfb82f
      https://github.com/siemens/jailhouse/commit/ff54819fe4fef8e759983496b3b8afd1f8bfb82f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M inmates/demos/arm/Makefile
    M inmates/demos/arm64/Makefile
    A inmates/demos/ivshmem-demo.c
    M inmates/demos/x86/Makefile
    R inmates/demos/x86/ivshmem-demo.c

  Log Message:
  -----------
  inmates: Rewrite ivshmem-demo

Provide a bare-metal demo inmate for the new ivshmem device, exploiting
almost all its features: state table, unidirectional shared memory,
multi-peer support, multiple interrupt vectors. This demo will be
accompanied by a Linux tool in order to span 3-peer demo between root,
bare-metal and a secondary Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2ae44202d1eabcc35a9e6431f905e4754fa28963
      https://github.com/siemens/jailhouse/commit/2ae44202d1eabcc35a9e6431f905e4754fa28963
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M .gitignore
    M tools/Makefile
    A tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: Add ivshmem-demo for Linux/UIO

This does almost the same as inmates/demos/ivshmem-demo.c, just using
the UIO driver for ivshmem under Linux.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0c902cc00c17e8f812f090ef6a5fa3d00ebbac3b
      https://github.com/siemens/jailhouse/commit/0c902cc00c17e8f812f090ef6a5fa3d00ebbac3b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-gic-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/4b795c3f7e50...0c902cc00c17

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/4b795c-0c902c%40github.com.
