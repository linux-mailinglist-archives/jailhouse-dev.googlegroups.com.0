Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRWD7PTQKGQER5I7NIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC63BFAB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id v7sf5103296wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207814; cv=pass;
        d=google.com; s=arc-20160816;
        b=jewffC5No5wJqFGpEN30QzGZw3gX110S4wze210pmOHpBBSrRIUbe4n9B4837QK6vP
         n7anSM9sSoVdY1ENZxVoaNxz6IJIrH5irn7QKAbQh/Lml06PsHa/64fC/cbpbgSSddgn
         rSCvSsRRpej7Ky3lrHVnQvxKKgMh4klt+CCu+HJxyYm3p9S04nB+N0bIpJWtPT4QhSkM
         gIPBXFmLXD+/AYFgq+kq8weVrt6Ms/8osaB6A83YsYmZ7yWym87E3nwH2rY/GbtmC8VP
         H9aZmwrkBkq3jXk7m/sFhJET6kjjQHFDcsQ1zbLGgFgIOLieGSnpYsymvsGY/zNLjkV5
         cmvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/V+HStfNbyiSVzs6821WMRuiwnoeybfIVZGIXjR4QkA=;
        b=r4JBy1oHKw0l69ScXriB/faT0QgYBmYkyE1CwO+o8Hd+v/tqOVxypbX55YyPvAB+Wx
         8JvkbU9Q4CrCIo9JprKFKqBwVSePWU+RGT2N6Ll0HtXnr8CRk3w6nO3SB1NLaOGZqUPF
         bIyq/scsMD9P7VX1Y36JgC9hceIiL5Qivl1wZcmPC1FzHNqTLL1hBn0jAeB3Y5pxTB6S
         elXcXPLkXm2N4zE7CXttDgK69gd4HxupbzZiPi43tu/dFw6rbR1OmpRSLyxASN4bhsT4
         8nYpfTYQ1zXht//XZWsLplYs6L2ApRLNksIM2uFcex7Kl3leOQSoduweP6e2B1KWw0FB
         96CA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/V+HStfNbyiSVzs6821WMRuiwnoeybfIVZGIXjR4QkA=;
        b=GrJlOB2GBn6A16vFbSHnidvhq1/jdbdRfuvxtThmAJ/1SWrbasL6BAS1/kBPNWpiQq
         J0i1VT+jSAkCUeRJai9SUTU11Ch4oB2jAcdj+ZWo/YI5J5qSD84z5exH2tjxe1MYtwpF
         l+nPYgxAv2Kx0479d6mc79XnFqiNPPrmzHwM30MtoeVzh88WANMHY4drVCM6in0hVXh+
         OJh9GxFA682Pie3dx0/m63f6R4Vu1AQKRSiLjwjE4katY5DKbjVNX+nLg5st1l6bVld0
         8AgtHoRg7mq4b1Mib5t20/1bYJZf1HOfz7HFq0n2UkMH59/Aumjt81M2yPNbcAD9G9iv
         l++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/V+HStfNbyiSVzs6821WMRuiwnoeybfIVZGIXjR4QkA=;
        b=LhKSsDht+jze+UI3HUxQqoADbobYtaNEYj5QCvLjontajz0FMe+ZQs8Rnka9jywzU4
         PJfkDHlpZgAYO70KNDOyA5s1TcWeqwJ8ivmRff+5qvuK3RDeQTT+UR9w1BlnL0e9L2DK
         eEpa0yCWTW5088XwhP+bgqxP2i1NcNKsTiWGQ3D8OjIHTlVvwAZJHotHaOHy0ILz6H3T
         nCuqZ2f4rA4YQiEVZ60r4lFTwjcWgC0OelhhJztjM9Fsny8O0rvYym+hu4Wl9nETj1aY
         XEhRSD8lp/sB5nLY7Tch/Fk187LA2Fy7ChnyRMUTAUTLWqTm37yY6u7oEzB1Ikasnxkr
         EH3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWlKoTYEZaa+6gRp525dlEcRYOhGtfGSBeBpCrmmldZPjqO+d/j
	G13RlP0cVSZF1xklJDBnLJs=
X-Google-Smtp-Source: APXvYqx3KQ3hsEiM4tN4uJhVydRbS/UraeIrW0tTjhoiL9ZCv3a7oVgDbXXT6G52LYNxkJ0hprY1Ew==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr20197603wrl.130.1560207814584;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5301:: with SMTP id e1ls4044574wrv.13.gmail; Mon, 10 Jun
 2019 16:03:33 -0700 (PDT)
X-Received: by 2002:adf:ea44:: with SMTP id j4mr33190954wrn.123.1560207813974;
        Mon, 10 Jun 2019 16:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207813; cv=none;
        d=google.com; s=arc-20160816;
        b=og2D/6Y7goGigk3qgP2n4ssNfokRs5FToJshNT83qw8JFiMsaoA9utHkd0OCVA2lDh
         Xd6UNBLAcYITNTEb7cfiZxWx3x5FTqbUhf0t54vPx6z93vpN7aDmCthihrgbCa6BiMeT
         PEVydOcKsjq2uzAISR1AeVG2ngPbv+VYq9OU8QBQ0BJ4K8In4P+spyk1mUVoF79QHgyh
         Deu6eQcb/KffjrbbTQuP9hR4o3tlGFqDO3kSZhTneN2AoeApxvIFucYoMZ2JaA474VMJ
         ImwrGw4szsVuwm9ffEck4F27TeRzeAim8iJvcKH8+Z3DRihxELK7io8hqMrN8eqjuIyz
         D7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=TcmktFkJo98hyTsX7srbS6RMA0zCoXnOmAG8WDrD/BU=;
        b=YjvTJEzXrxGyVnYbY2KOCtRKtzEhqjEbzY00KPbwbt9F33hMGlS7xp2yJQN5w7lVDC
         Ppf3FqJR11jCzcE9kgzkgWa0S8upELZIqR48ABYawXgTdc1aqELzUn0ngHvLtFOt6CXM
         Aj+uNVMH2G/MPWOfaPQJ1tjMTuHVJUAPh4o6+fpTe5R0bJBt7/QwC0YrhyFUdg2wYalV
         QsXe7V50myOJ7Tfcx+psQZ1IbplHrc+ReNC8R9GY+NeiaAJCeWb8Lu9G6V0GdOFpTbjn
         qYiUxq/p6sZcSI+edtwZdPT1TwVAcGphd9pXJlWzihjvaOiZ21TZilYxBXf+BnesOP6d
         zT1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h10si517582wrv.3.2019.06.10.16.03.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wP2mj7zy96;
	Tue, 11 Jun 2019 01:03:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 00/10] x86: enable SSE for inmates
Date: Tue, 11 Jun 2019 01:03:20 +0200
Message-Id: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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

Hi,

x86 32-bit inmates are broken with recent gcc versions: they will very
likely produce SSE instructions here and there for some optimisations.

This lets inmates crash, as SSE needs to be discovered and enabled
before it can be used.

The solution is to either use -mno-sse (for the hypervisor and inmates),
or to activate SSE for inmates. Let's go for enabling them, as almost
all CPUs that support VT-x/SVM will very likely support SSE.

Though unlikely, SSE might be unavailable. We don't stop the inmate if
SSE is unavailable, we let it continue.

The actual SSE patch is pretty simple, but I want to avoid duplicate
code for header*.S, and I found some other spots where we can
deduplicate 32/64 bit code.

  Ralf

since v2:
  - Address Jan's comments
    - arch_init_features now has a valid stack when being called --
      remove the naked and noreturn attributes
  - Fix the x86 inmate stack issue
  - Fix some other bugs that I found on the way (pm_timer_read, missing
    timing.c on 32 bit x86, erroneous mmio behaviour (already merged))

since v1:
  - don't stop the inmate if SSE is unavailable, let it continue
    execution
  - Also activate AVX, and discover some other CPU features. Report
    availability of features in a x86_cpu_features struct
  - Add a common interface for simple test cases
  - Add a test that runs some SSE/AVX instruction

Ralf Ramsauer (10):
  inmates: x86: use correct types for pm_timer_read
  inmates: x86: Don't compile smp.c for 32 bit inmate library
  inmates: x86: use a valid stack for secondary CPUs
  inmates: x86: rename header.S to header-64.S
  inmates: x86: introduce a common assembler entry point
  inmates: Add string.h
  inmates: x86: Add accessors for different system registers
  inmates: x86: discover and activate SSE/AVX
  inmates: introduce test.h and test.c
  inmates: x86: Add SSE/AVX test inmate

 inmates/lib/arm64/include/asm/sysregs.h   |   5 +-
 inmates/lib/include/string.h              |  40 ++++++++
 inmates/lib/include/test.h                |  21 ++++
 inmates/lib/test.c                        |  28 ++++++
 inmates/lib/x86/Makefile                  |  24 +++--
 inmates/lib/x86/cpu-features.c            |  98 ++++++++++++++++++
 inmates/lib/x86/header-32.S               |  25 ++---
 inmates/lib/x86/{header.S => header-64.S} |  25 ++---
 inmates/lib/x86/header-common.S           |  56 +++++++++++
 inmates/lib/x86/include/asm/regs.h        | 115 ++++++++++++++++++++++
 inmates/lib/x86/include/inmate.h          |   3 +-
 inmates/lib/x86/inmate.lds                |   5 +-
 inmates/lib/x86/mem.c                     |   3 +-
 inmates/lib/x86/setup.c                   |   2 +
 inmates/lib/x86/smp.c                     |   3 +-
 inmates/lib/x86/timing.c                  |   8 +-
 inmates/tests/x86/Makefile                |   7 +-
 inmates/tests/x86/mmio-access-32.c        |  60 +++++------
 inmates/tests/x86/mmio-access.c           |  84 +++++++---------
 inmates/tests/x86/sse-demo-32.c           |   1 +
 inmates/tests/x86/sse-demo.c              |  92 +++++++++++++++++
 21 files changed, 567 insertions(+), 138 deletions(-)
 create mode 100644 inmates/lib/include/string.h
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c
 create mode 100644 inmates/lib/x86/cpu-features.c
 rename inmates/lib/x86/{header.S => header-64.S} (94%)
 create mode 100644 inmates/lib/x86/header-common.S
 create mode 120000 inmates/tests/x86/sse-demo-32.c
 create mode 100644 inmates/tests/x86/sse-demo.c

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
