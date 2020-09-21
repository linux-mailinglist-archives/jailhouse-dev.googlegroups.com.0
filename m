Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBDOEUH5QKGQEBYYUWHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE3271DBF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 10:19:27 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id j5sf10396993qka.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 01:19:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600676366; cv=pass;
        d=google.com; s=arc-20160816;
        b=EjLXy7reP3OP+CVAOqBcbTqVCvZKr1EVwdUAKLrt11pz+GLFHiOcAM1beU20Noh7/o
         BItvv8uKD826REBsf6FaGpZAioH/Ds3YfBw0vAcDCoriEv2v1OqqAJfhVONSejaUu5rM
         BpansLLxFuSfwKr0cD/8x6M23s5Na5WiS8ovqx8X6sCoZUEv7nVAgQBNQiy1d1cCqKSP
         PBUjku8V0dQzo5IFjWCaJH1EwNBj2b0icjpSWUCZritAGkqryB32qUKkIlDP+z0lt5Ws
         W94l5K+QW+LH7CZ/ClxJyMOT48HVWlTksHAHa49PjiHzEbkZfXrYridfgI1zOaARHBv3
         HcIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=HHuhxzSBjIHwyHQ6BozEiSkV598dIwHREOMK5w3kCxY=;
        b=ZFc5DNCqtKpO5FeQmoKj/vM2P1s+JoKzHA9anvTgZ5bYxhNgYWzJPcgsxQxH5axfmq
         BL23A6VeSg7YHsNZ6C3OSTr2UwlmNgoXMIusRDImpm4rEBXu2Bg/8q9wT6AX2r1+0pGv
         /GFqUNmkILlqw7tRWYF9zGxutWw01bgc/nZ1i0/vm+1l4DAGROcwDsC01S9s/sL1TBIV
         EqlNycQU529Z6+LEgX8vYQXWElRPcPQk1DMcCamunrkYdWC5qsdtd1HcY2Qw8OMCvatr
         fDUcK9Xr4+vN31yOF6RLLUXbXvpIxBqJbn63T4RQumUkhzb5Ev1LaBy9TCLperIYpbmj
         ozYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kJIX2uGO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=HHuhxzSBjIHwyHQ6BozEiSkV598dIwHREOMK5w3kCxY=;
        b=DUVQTKpz1U6Z0EYQUN2Bz/+nsOja0E9l5ZIu1tDwsTDf2HbnCLDH5NHSBP0tFst7Pz
         uWKWkLIKuIoagSEgx0mTkDyA/wjbsPwWxA6CBHN/LtHk2F49oRBsjAfGoaGS8V4wbGZI
         bHeS0eL7ah6VJejuFvC5dZy0h1dRsJgzXtjsyrUfQnx+IqkXrl5t1Qyit5l5wsssP5Ad
         al6STHit6josFqo9r9VzWFzJCxTvN7zGyJEVcE3lDOJThVNnjJpvmHzD5jK4eLzi3fYj
         WFLc5n+CCzOdPhfihk2Xz5R4NmjLwYnLRG562RqgKAnwZXw5WFYB117EihtchqVBqR7Y
         O/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HHuhxzSBjIHwyHQ6BozEiSkV598dIwHREOMK5w3kCxY=;
        b=m8CxLhBJZly3hpDHhMVbuLRvKUX5ngiZyDR3R+YgkZEUDCMt1CYULNAGwpVw7nYlGY
         3IIFS2OS3zC4KJbZu6aZLlAQPJIcdzxaVkWPSTTsUSZptI+SNzXo/7oISUaB4sOF9rSK
         Wr6EYnV4594vYG4AkCpC6ciLvCtu5B0ThNAnPP8/f+5/VQj7qhILu3w9EM/im1MqWP2O
         zIQLlt57EsHZ9ZUCQL6Q8Gm7PeMK8vxBjYGPQD9FVb38N5tGRoPrh6I84k7dLfR1O2lA
         9AugUN7pClSAblq+kWbsMc4Y7G41AmS1Lu6pGFfi4/qukZfHaDbf3ENe33gNxQeJOrY3
         6zTw==
X-Gm-Message-State: AOAM5305zetkYusiLSyzQypGBKeOtSn3s7uKepHSisOEgKPsOfAGjeSB
	bH8vQmhJjruqPDQoJ+D/JOs=
X-Google-Smtp-Source: ABdhPJy05ytgWKv/COiAOGQqAbHkOYX7KtN6HAYWHPV6tDTceV884ggf6Twjv3nX80uFcZSZN64Nsw==
X-Received: by 2002:ac8:4d05:: with SMTP id w5mr44522468qtv.339.1600676365732;
        Mon, 21 Sep 2020 01:19:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:42b3:: with SMTP id e19ls3073292qvr.11.gmail; Mon, 21
 Sep 2020 01:19:25 -0700 (PDT)
X-Received: by 2002:a0c:aa5c:: with SMTP id e28mr29178379qvb.34.1600676365211;
        Mon, 21 Sep 2020 01:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600676365; cv=none;
        d=google.com; s=arc-20160816;
        b=FNsd6LbYGIRQUMaIs2YTgoStGWfG39sp2+/Xbo9ne25m7+1EOjVNH0m4GbiU2lxEy5
         hq5qUO9x7+enPojVTP1QbU/kh1VQmXmc8bkNjylayKceaOF1YZM8HkBSlb0HS/lkBU+4
         q34ipzkH8iXe2tFf5LcBBK3BjpkpWb7plWoIPaKBpmAFpsS4qlhaC+2ekW79SwBL6Dc1
         5XUY2ourvtzgyaGl+QpltKlYVNSFCDrJJK9IuTosXtkptpEyGGs2HWCtQBh6EzP8DH3r
         Nbj0vz+ILYQpN3i5JH/hnRyOcsyc/oMZ0Wky4jcFriMXMsb9GLeePD4HxEvmsh2vCRhH
         ZXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=WcNct+5101QL8swDVrLiT+qA2HjU8MGkCyPjClnDPR8=;
        b=Fl2TASNyns5lnE2Y+buy9MM2qMDG6OY9hmD8nCla0M5lQSITynPJJLUJ9+EnaQO3RL
         2DWl3Lg2pgDACU8FJMEgtcSQCa22gai40+sgOr/rA6QC89KGqEAMLZqcjYDXelV247Pu
         YYicTV6U4VAD4WodIn2/Nf3C34rjvCbrvQCdAXylK/uQEjZ3IpX5QzH0gZYDeod0ZM4q
         Q89YK+qv8yxmamop+lnomMy67CdW9SllKFHuT8wRBYnB2QrFMyhLify55nQWgS218j0m
         mxkkdBLw397ukAaaXurIGrUnVJJKdBsozBXEFSiOqTBZtAqshdREeAAMmuRUGwm7iHlp
         njCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kJIX2uGO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id a27si600955qtw.4.2020.09.21.01.19.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 01:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-39b4a70.va3-iad.github.net (github-lowworker-39b4a70.va3-iad.github.net [10.48.16.66])
	by smtp.github.com (Postfix) with ESMTP id 0FCDE60002C
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 01:19:25 -0700 (PDT)
Date: Mon, 21 Sep 2020 01:19:24 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/756216-4ae810@github.com>
Subject: [siemens/jailhouse] b2628e: arm64: Make sure SMC and HVC calls don't
 have side...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kJIX2uGO;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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
  Commit: b2628eb1b05b04caa100f1d00fd13ff96784e6f3
      https://github.com/siemens/jailhouse/commit/b2628eb1b05b04caa100f1d00fd13ff96784e6f3
  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/smc.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm64: Make sure SMC and HVC calls don't have side effects

SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
doesn't assume input registers to be constant, also mark these registers
as output when used as input.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
[Jan: rebased on next, aligned smc to smc_arg1, style]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb9c40c5bbd81aefa0ac1f7d6e4495023026f096
      https://github.com/siemens/jailhouse/commit/fb9c40c5bbd81aefa0ac1f7d6e4495023026f096
  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M include/arch/arm/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm: Make sure SMC and HVC calls don't have side effects

SMC/HVC calls may modify registers r0 to r3. To make sure the compiler
doesn't assume input registers to be constant, also mark these registers
as output when used as input.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
[Jan: rebased on next, style]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4ae810e978a14d7db141c35f14303fdacc8885a2
      https://github.com/siemens/jailhouse/commit/4ae810e978a14d7db141c35f14303fdacc8885a2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Factor out common hypercall stubs

Just the argument types differ. Factoring that out allows to move all
stub definitions to the common header.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/756216b9d1e1...4ae810e978a1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/756216-4ae810%40github.com.
