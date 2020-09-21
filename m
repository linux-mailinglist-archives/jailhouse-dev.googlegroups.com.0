Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBV64UH5QKGQERWBYOGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F7271E9C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 11:11:53 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id j35sf12446348qtk.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 02:11:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600679512; cv=pass;
        d=google.com; s=arc-20160816;
        b=oLxT7YUYeNfe60+l3OLAeW/SYP5IWsicYjtRfgzI9+FpmJTXhLp87L7pafAYTxrZZl
         Y7BXYr1yAEg5Vx5Wt7m0jl0ByDXgmTtY4mSOtQTw0D93s5Y7gSfUV5H4ROEqErSFPQTv
         3e7GDTlNWm1i2Tmyk1Uc39sRM9SvgXTkyy5vuLgDwLQTw07rAOVIMgHFqjjOCYB/J+9e
         gnpRUol//agSJJ82PHZKVdEMd6Lj2u+FfoHiBldHf3sQ4+fS2lv5yBiO9CFK1300IkdN
         v5GxYD+/H1E2n3Cr4HRr5zJIVr46xVegRREWHiCJNdnrR3KKXiO8tWl4xdo1PEwU7E7m
         15Ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=p4wgJPwpFkFfjnGF/i7vCR7c8eiLSUyHBXrZHTttgVc=;
        b=BdzDErMqwUZtY89tDBSaHvayV9uGYBUR/jLH+9soP//u+f+vxyyzbrSgRSMndKj/Fy
         oQBCLY+ErSx9LRiFua5kMHf9eB0grlr7FCWWy2U2p+nb/KV5ChgZhutyMBDqAh8AGtKD
         2sttO26U7ojVIqQYkerByCQ68npc66UVjMWVA35f/1mKHr0rtBtDvuaDc8GSY1L0LiyL
         IDc0WT4xEt42ZYNsqCve87Mves0lY2HSJnsQigJeTEYEmDoPuJdKnsHh2H7GVhXiye9S
         r/h725oU1kr0cKRQi7s/WmO3uIZr9FT+hSwirN7xgPE0/Mf0NtovqKLgGhYUp1tV2/OJ
         Xp9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JnJjRGM5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=p4wgJPwpFkFfjnGF/i7vCR7c8eiLSUyHBXrZHTttgVc=;
        b=RlKrTEWmQ8WJK3vR1f+QuQuaMYs5GrwSZzxRwAvtE++wPNnhiCeSfDRYYRBGKF2SNT
         H3IRPJcZ/q2bEFQ/Vb0clE/JnAS/pbjxDn1vecdF8uDKYWivQttWnvtYq957Afall4N8
         PQrfkopk2tSpL4Sd03qBx6LWgcD3mBRp7v5ZHtCs5xhfhBSU0qix3FAviBRiVPvuCXxU
         VbuczbyGrP8frHIbIZEqsaZS/VLMeNJzdHOfStl7OocxPU3UZXNWIS/o84opuyWBc9wJ
         Llzq0I7cWi885rYY6ZvvSRydUANiMZxg9DyujSLw55guIAPmFzfS4Nb6dWN3FlATJOkD
         vJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p4wgJPwpFkFfjnGF/i7vCR7c8eiLSUyHBXrZHTttgVc=;
        b=CcD7F39fnys8xDRqVyda6kLPSBMMtCInWOFuaSN5Qdrv91oz5lPuWD/VhRjNW8jwo0
         c16cQy1ACmkCcoqg/kJHq1EYrPbz0+W3GYXz2fLMoJfzSc7OiVS2qQeXpaTQmu+/QNL0
         PKQfo4dg+a84OWFojIThEVRkEqBr+HJjlTOYl/jhE4KcHXot2R7lYyxkD2PZPGU6oTcg
         0/SgiZkSgSTAZ8vUTCasTXO1VPRLwnHjuv2R21NQ7LeGq2aRX8hd6+mc0fe8q921fCaU
         Am3ko5CTMk947vjbTjnSw0UMRIzsXB8zKFA4seMKkQfuAQ/xl0GbsJK11eL8cG77CcRW
         2+Ig==
X-Gm-Message-State: AOAM533YQ2iU4TvMsSQDzCs/Uim+ZLDiBRiVDUjbbytXyVfWtVaSmxRZ
	gLjNlknKtuZeDhf8uOYOkHk=
X-Google-Smtp-Source: ABdhPJzjs2N6fODEgsG6E4zr/gE36r210kkdkxR3416/umv0OnnBFux7UVJXcciYEZJvYfyGw22cEA==
X-Received: by 2002:a37:aca:: with SMTP id 193mr45486834qkk.149.1600679512063;
        Mon, 21 Sep 2020 02:11:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:3405:: with SMTP id u5ls4946073qtb.1.gmail; Mon, 21 Sep
 2020 02:11:51 -0700 (PDT)
X-Received: by 2002:ac8:3714:: with SMTP id o20mr46717994qtb.0.1600679511480;
        Mon, 21 Sep 2020 02:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600679511; cv=none;
        d=google.com; s=arc-20160816;
        b=LMt3E/HcR8h68g1NnvvvYn2Z75p/Cif5zehMZJHQC+suwxVGnNuMgan9hmdEcdfVUV
         VRgHUxppiOXv/vLy3gam9Ux2Wa1bbuLNfy1wL3wegdOeNtdOLPwnFHG1NVNWGGzvhxd0
         1i4n6Heeb3J4y1MCs3DyvqfCNUtUeTuQj7yhFQX32zWukgnyAfWxIxpt1bG3+JQRXShl
         Zu1y3kfmtzpGj37q/Hoi3pIalwf1PyFkg3JWFohWYWxs5LCrzMhTqs9xLOvzKwop2kci
         jJg+cj7VKyEc1vGfRFvm9p891WF6/HfNUCbjHGOQVVqdJ1HT3To4/9sgMZ6pljiksGCf
         vGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=t/BfQ6h8jsTvyQET5YwRAeyyzBCsS9rDlT0JkK4AOro=;
        b=rsxqUZaLballBTn1gyyjFzQ1tf7mDTWnd6almDwwC7okkqYkcBM27pvuPwlH6W6/0Z
         E3iSosy0YugKlzT6PBII0QgdSiFs4otz6rMU22b7Ow23pbCEtmX7b2k2dE1YVJ2oEARQ
         L7sAqsZlkNifnh7+XuMq8NmrCV2Ps5oFvBi/B+/mDMeZAOClTYmO5FeqEOZmmQCLF7vm
         pEEjPTFQMpbGqbHP3Cz4hHaHncJd6PYJxgNkWBzEdbgyIS5Sv1hEceqHPm9hhxz+zZwr
         REQ6SkdJxC9kY3Jdv1YXNdLy0s5hb05cP7BUD9iLXRZeSKQdO5+59reRPlmXIw8Fy7Y0
         0LfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=JnJjRGM5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id k6si596162qkg.1.2020.09.21.02.11.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 02:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-1ac52d7.ash1-iad.github.net (github-lowworker-1ac52d7.ash1-iad.github.net [10.56.25.52])
	by smtp.github.com (Postfix) with ESMTP id 520B19026F9
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 02:11:51 -0700 (PDT)
Date: Mon, 21 Sep 2020 02:11:51 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/881ff3-068aa1@github.com>
Subject: [siemens/jailhouse] 5d84af: arm64: Make sure SMC and HVC calls don't
 have side...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=JnJjRGM5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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

  Commit: 5d84afa48d1634983ccc1b69e7de2bed96826947

      https://github.com/siemens/jailhouse/commit/5d84afa48d1634983ccc1b69e=
7de2bed96826947

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





  Commit: 0abce56ab02b59f96e508723b34558c94d05434b

      https://github.com/siemens/jailhouse/commit/0abce56ab02b59f96e508723b=
34558c94d05434b

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





  Commit: 754870fe7cfd978cdd72dc027f90995268091035

      https://github.com/siemens/jailhouse/commit/754870fe7cfd978cdd72dc027=
f90995268091035

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





  Commit: d448a0f372070d27ef128205a14fafb19e73e8a3

      https://github.com/siemens/jailhouse/commit/d448a0f372070d27ef128205a=
14fafb19e73e8a3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/mmu_hyp.c



  Log Message:

  -----------

  arm: Drop sp from clobber list



This gives



  warning: listing the stack pointer register =E2=80=98sp=E2=80=99 in a clo=
bber list is deprecated

  note: the value of the stack pointer after an =E2=80=98asm=E2=80=99 state=
ment must be the same as it was before the statement



with gcc 9. Obviously, this cannot be fulfilled in the given case as it

is one of the purposes of the assembly block. But as there is no code

after it anyway, it's safe to drop sp from the clobbering list.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 068aa113e63f4d6519087c0f5d40b4e20f900bed

      https://github.com/siemens/jailhouse/commit/068aa113e63f4d6519087c0f5=
d40b4e20f900bed

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2020-09-21 (Mon, 21 Sep 2020)



  Changed paths:

    M hypervisor/arch/arm/include/asm/sysregs.h

    M hypervisor/arch/arm64/include/asm/sysregs.h

    M inmates/lib/arm/include/asm/sysregs.h

    M inmates/lib/arm64/include/asm/sysregs.h

    M inmates/tests/x86/sse-demo.c



  Log Message:

  -----------

  hypervisor, inmates: Make spacing consistent in assembly constraints



No functional changes.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/881ff3a27244...068aa1=
13e63f

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/next/881ff3-068aa1%40github=
.com.
