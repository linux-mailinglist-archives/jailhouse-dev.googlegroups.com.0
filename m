Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKV33D5QKGQEHX25HTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF8280667
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Oct 2020 20:19:24 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id k3sf6133015ybp.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Oct 2020 11:19:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601576363; cv=pass;
        d=google.com; s=arc-20160816;
        b=0PNBUWIPFL78+pMHmZInlgKLd5sXpPq4Ce4MWSxLcfefprJHLx2JCbYvSRpR/8Zx+l
         Iv7dLSWdureRo2QueWNdu4J7XomZJe/a6N/PnLxsoX950AdKHlzFJJCZ38dBa5EUS7oN
         x6DXHNzerDBm6btnPPRETArNhAQF91l6n7QtTFoLzUPviVDyz9azFqTqvzqvSfWdvckw
         5RCylwzTBnB6SiKLSU079DlKLCtE5n7fMH5KqzRSEwP0wktk9dqkxxTC/Q9bOjlgBWaP
         sQJTJ29N2KZAios6tl3yknoInFE70DyGT4BIbgqBpbHlQ/3htjSgbsQ0FgVW+GpjjihZ
         nQJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=uM8m/wgdb6fwLSOcHgRRZyZ1mEIEk0KmvekIovoE6sY=;
        b=gIxdbMERxreg6+r5hJDgXFSmW35Dg2fbRR+nEz5oRTcMqKYHfzdHqmcycDj7wDIwCm
         xPwQRzjF4OBTWW9oa3ol+vU0LUAleRUGliyxE1VL8nWaqN2ijFUrzrfLRN1tp6Xdweu1
         DUAWRlJY6mjakZ5jz8CtVGb5t+c32ZS7SX/Yb+h6H66lqrv87qflYh0UvfIWlakrnNNe
         TzLGN55ojPFcwe2Bg2BJCUYMI7bRiD7DqjO86Wqh2/IcfloPRyYEzHzsu3K7h3BTXoOF
         qoeDl3jyBPP4Mf1G+BCWADF/L8pRDo93+3RIlTKdcPgFLyeUPwyAbWVVrEGd+6B+s76t
         4/6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aiWsWLee;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=uM8m/wgdb6fwLSOcHgRRZyZ1mEIEk0KmvekIovoE6sY=;
        b=n4C1OZ8kUbpbhf1E63aDuBotxMp2J/jVcgwYY8DiUdjFvzukC35E/d7VTJYcxT+gdF
         rRH77vTiNIVNBLDjnpCoi2zyOxa1FcWfUasH3nEFH0FXWeg6ghahjgc2QDvJgPan7Bk4
         5yadRfua9QKC7fFBmHRybdcaC0px7UMvfQGSv20l+9Phhoim40HTfYLmaaFg+CaCOfgr
         Zw5mAXbjPH0QXIEZdxnuc2LhxTwZAOuPufETFvK3Yb2cJkbYgiFDQktfQ0qM8ULK83OW
         9IJ7yWkLTx5bR7EDaKHZkxPfaFYJDiWtK7rsgibvM4773KJps/6tZxvWDVHx97U5eDNz
         5O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uM8m/wgdb6fwLSOcHgRRZyZ1mEIEk0KmvekIovoE6sY=;
        b=KwZVLal/UhBgcgQlSCY/gIb2YLYP7Tj/61D5/MwfDnR+LPvPqa/hZFLVj6Cegcuose
         Dm5auP+P1aEqpBkzrAV6TiY5qEcaJlxXwWlfB5qEXmp+gUpnRbGKglVAwrSR70dHTIiA
         B/AVsx3XwRg/faqyvpYEND8Tz+zFJRHUECnz9poFOBOMgwpSqQ5Fi8S9PGlGrf7zWpOA
         UaVa+NhyZbBgCB7kKOVwTIB0Qp9TPBIS2l08TjwKYrkLqBixmeHkbE/6FyJDL0P0NU5Y
         idv+QvBVqOzA0BJKR+RZQuIfar/yZkDH0NNXFdCmne0lLHOfui405jAAdfo24xoY1w31
         +H/g==
X-Gm-Message-State: AOAM533yu1oB05/ZTJcFseWbrRNlBsAqMgzPAWr+1yGDdjZTa5GkLe08
	V6HVVqE5FT5xkFyCDKH0RvY=
X-Google-Smtp-Source: ABdhPJyu5Fyby9t5mh59I1Ih8tCyNjOV20UCBPSFuHAIaFNvZcWCLLnfWS8KehsltnP1uoquSiJjAA==
X-Received: by 2002:a25:b78d:: with SMTP id n13mr12059849ybh.152.1601576362887;
        Thu, 01 Oct 2020 11:19:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8285:: with SMTP id r5ls2933682ybk.7.gmail; Thu, 01 Oct
 2020 11:19:22 -0700 (PDT)
X-Received: by 2002:a25:4cca:: with SMTP id z193mr10754898yba.274.1601576362214;
        Thu, 01 Oct 2020 11:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601576362; cv=none;
        d=google.com; s=arc-20160816;
        b=QUP2sh2bpwfEA+i5A/N5RkNduoC5ynU1jjcVZu4N7/6tJYP4V6L8GaFHBHCV52GHPP
         hdUf26S/lhzNQc47ryhiZ6RLAL8knGpA2tMxZVH6BwjvGsyE5jdUfEyWSrcIDA8Piqc0
         M2aEv+oFnPtxbu6s6molcj5DroTZfsCXoRZXBX7o70IXRZYI1orPiUknw3vQE2B3py4z
         IWi1SK/7ZpcJpBKRuN+6/4qZZl6Jx4Qx9s/IWtWzVNjgajQnBUY4hCvYfPaKAVfgm3JI
         Sugv6XuhZ4PsM0poZlYvgVH9u1jWU+5LvScXMGAUrJNveW9d1D/AOjqBDpBEnw1sjOGb
         Pm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=TY4sib40favnpYdvMi0ASnMdAOhCrWeQpr0kkqi1N7c=;
        b=a+0CrtUT3IbJ2KtaHPoIWjUsveBa1jXE0/HBJ18QfeMvmbL0Lt/6PV8hJ0HK/wdexp
         CDDGZ5ETDbnZR1KzNS3s+/aemMUKLAC1OchSULytTaLjWyJ5V5cyFL989bNPKwI9obLf
         31IUxNBANRFTfiR/Osg38mqxBlC4qYGzW0cvW8jSdq1vf5l7QAdJhvAypwt88iGMnIrH
         +zMVcDNSjO4yIKmdnnRgJWIj5q47fU0x2WxHWZAQseOmGsgwDjJK057AoYTh0G2VsvOw
         hjyzzdDb9Hiqpf00ZZTZYeo65INiEcjZy4RNSixsuYVNhh50NE+EsiOzlwowWhjiNTcO
         MWWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aiWsWLee;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id e17si455011ybp.1.2020.10.01.11.19.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 11:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Received: from github.com (hubbernetes-node-4b19f02.ash1-iad.github.net [10.56.25.15])
	by smtp.github.com (Postfix) with ESMTPA id F1CD09025E4
	for <jailhouse-dev@googlegroups.com>; Thu,  1 Oct 2020 11:19:21 -0700 (PDT)
Date: Thu, 01 Oct 2020 11:19:21 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/42f0f9-522ab6@github.com>
Subject: [siemens/jailhouse] 1aa592: pyjailhouse: Do not fail on missing date
 for Debug...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=aiWsWLee;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: 1aa592b331f20e7ab4e2738b7893cea4aa8beed5
      https://github.com/siemens/jailhouse/commit/1aa592b331f20e7ab4e2738b7893cea4aa8beed5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-01 (Thu, 01 Oct 2020)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  pyjailhouse: Do not fail on missing date for DebugConsole

All readouts are optional, but then they will return empty strings.
Converting them to integer will raise ValueError. Catch that and ignore
it - we won't have DebugConsole information then, as desired.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5d07cefe6dd8c8532ad2317b5e87d5133b7c9559
      https://github.com/siemens/jailhouse/commit/5d07cefe6dd8c8532ad2317b5e87d5133b7c9559
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-01 (Thu, 01 Oct 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix regions_split_by_kernel corner cases

If the kernel is at the beginning or at the end of a region,
before_kernel or after_kernel could stay None, and adding a NoneType
object to the regions will make other parts unhappy. Better construct a
list without any None elements.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: edf77fd38dab4c09ed982d232d2b7feb8db15cf1
      https://github.com/siemens/jailhouse/commit/edf77fd38dab4c09ed982d232d2b7feb8db15cf1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-01 (Thu, 01 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Fix interpretation of redirection hint

Reading the KVM code of Linux and re-reading the spec, multiple times,
it became clear the RH only controls whether one or all CPUs of a
potential target group should be addressed. If it's set only one is
chosen, via lowest-prio, but that is done by the hardware. For us, its
state does not matter. We always consider a multicast scenario, thus
simply ignore the state of this bit.

This fixes startup errors when DH=1 and RH=0 of the kind

FATAL: Unsupported MSI/MSI-X state, device ...

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 522ab60f408c7a61daa93f0ce25ae9da32ae5f10
      https://github.com/siemens/jailhouse/commit/522ab60f408c7a61daa93f0ce25ae9da32ae5f10
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-01 (Thu, 01 Oct 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  ivshmem: Expand MSI-X region to full page

It's a bit wasteful, but the alternative can be that the guest moves the
region close to a physical one, and then we need to start configuring
sub-page dispatching. That is first of all a source for mistakes
(specifically in combination with generated configs), and it may even be
suboptimal in case exceeding, full-page access on that physical region
would have been safe.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/42f0f9dfff8d...522ab60f408c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/42f0f9-522ab6%40github.com.
