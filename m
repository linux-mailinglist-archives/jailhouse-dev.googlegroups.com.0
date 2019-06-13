Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZOYRLUAKGQEGJVUAGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4144CDE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:53 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id s4sf71198wrn.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456293; cv=pass;
        d=google.com; s=arc-20160816;
        b=lP3IFDwTpGU0Tvxe+QjqD2BmSy2odKliYJU35WerXw8SMArejCm6S0tLvXA+idl0AL
         eo5KTsYQ7PK+YMax8Bhp9yc14agRE27EfgJv/oiJ7/hbsYV7zaeW5bsGOaQgIhE200Uu
         QAw4ISb3R0bAEisbsUk+HnSyet4xH4+7S0TVIHZQaA5RRrtgT8cLNzCc0bD1GhVP/fGp
         SscF/dH4Ehf8vvFxlEAVY0yf3fY7dX8g/oUja3YIMCN+55qC7j18VzYKRwlJS6PwutVk
         FBlXK1gOwv2PWv0TDLdN8ahaQudRBKlDQx2tQ+gRgscwYXnWOaYreyM7nJxOwIfGkwOs
         lb/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=PQByKiZdGStLerKp5GtzHK/rvh0OACSlREwYSk+Wnps=;
        b=TOUL26XOYe2JsrLgxTNJPuWVkhxdSu8VT36YahiJLuXAVVr7eU7uiLoFKtTMVsP5R7
         8KhBziCJeOoxhj27GQxfiOZroZKjfzrqobRxPOk3Z+GiI2A5yBDFeufRQwjzD+SxTTyq
         ACdWg0q+D3zw1TVL4HyIvOjgs/Hk1R6aiP+D24C1wKtuotySTjtacNi/vZXe5EkWJo7q
         JnLJ6iXXVFf/41NdlvNumNxVw0OP36Ery4zCfVEM60E49mqpjXPVcsc/PuJ+hfK6I/ei
         10P/fCoqp5MIdPM7NyYC5Nus2u+Xx/OpKZWyY9OUu66uYF3ijDMnATwFil6Zl0TAiFw4
         qWaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PQByKiZdGStLerKp5GtzHK/rvh0OACSlREwYSk+Wnps=;
        b=eq0sBNbHEAgiU+OSEABuWPCfV7FzBPWS1FCYj7Dboqkk6qaJxSpNH44qLMIyLbrlEy
         RG2LqaRu+MkjP8mIcp9k+BtLZjwBcEGPyXjcSjIW2w4kk2Jo0EwlTf8Lo5jkGcR6Z72M
         WlqF9rNE7fOG+IcfS1th7zvvgh/ZDyhIR6ny51Hpgsstu3GqdI6C3Fdk9vUa9gVry5Pz
         gOYELQqsNpj/DNdwi1jajfa5cvBC7dSIuwkSrKEjUIlAAVkvVLMDjRdct2WjZgmtwle1
         x3WisQztudWxdnCKoM1oXEnouJcl9VpQ3Wseh2OwS+gGWpghKtGPAdLDFs0NrBxkBqiK
         WY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PQByKiZdGStLerKp5GtzHK/rvh0OACSlREwYSk+Wnps=;
        b=EEOJe8ctjssZQfF8oJ50wKZ3xx8v/ZAOf00AxlpYuoRDS2q4XkYzuDsGtck7LE45lL
         LaFuoiMfxBkLE4EIcG250j3AYv3I6T7vp7KIHY3SHHKOpypgq5/jUzvk5BwjkTZ2Hk04
         nZaavuJOHD3L9nEWZg0km4Am0ejPhwSdikMIkUud8Q16XoDG9l3UtBQNMeA7JKRKaEV8
         1aw0YcnK79m8QOlf9FC3HLyedsn+xg0Vv3OWXTnwNsT8CDz6ksPAgW/7vGSR4bx0uH7Y
         VMZc6NIjFsrZt1o8k43oc6MFn4uQRNelXRHAO2PCCvqJWrIKR/cwCPx8YjJ5GTTtiJwH
         PZrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV245obXeiBzVInKZDLhFRzqnTcK5/311BGziLo0nRayKdM169x
	NoQlZX97tVikVFm7NX1dbvk=
X-Google-Smtp-Source: APXvYqwfFlhDT5iWwL+KS6qoISX14w/jurQ7udmoXSBzjgmJiLz92wZXSMg8qTKA7l8IHwcQgnKCNg==
X-Received: by 2002:a5d:6212:: with SMTP id y18mr13322572wru.178.1560456293637;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:185:: with SMTP id 127ls2120975wmb.2.gmail; Thu, 13 Jun
 2019 13:04:53 -0700 (PDT)
X-Received: by 2002:a1c:7a01:: with SMTP id v1mr5241073wmc.10.1560456293156;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456293; cv=none;
        d=google.com; s=arc-20160816;
        b=YVChCpdJO1/ViiiJ+g539H7XnX13PEr5dCslhT+HnP3+XnUSOc+G8/FzMXfAO0zBmr
         tCUx/Caqdly9+PTWzCeXb3xj8An4f0fZDnz1d8Ul3RAQ04ogMmsw1uQd3rV5xBwnPKvJ
         bGNeoXAXA4UShobYw52SPJzhvtmbJb1KA/p0zyY5QedSXlDisUhzOay8j5X5qKMLksf+
         8uwnI0CmPShcugSdHSdELLDX/h9NY9MauHP/Xuny8cOZ3uH3eNw5SHEbuv2D+4XSYFLo
         SjyV9SqESy9ojEQnarpBUYYix+Zis9rp+W6W4CetQiTWNp45mn3dVL9lbzznZ7x3o+7y
         eNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=TkP5uqfuBRfk0jIbJKcJFxMUr2TAJeTJCmqv0rfR92I=;
        b=S2Yg84Uv43Iy6sJcEKuZyfXlOhpVpUOQIMz8nMwuhI0X28/MByzYLhJ2rtAkLOBP/E
         f8yStsb89/fkDJjH9zzREStijap+M9oly2xmC/lGDevehFSgfGHv1VaJfAwwxEjBb7GN
         4WIf+6zid7xX+XBliwqyof8k1jVZQuPaeyCKumWEyB9kXXX0b5v8E7JbrgQYfdaBz6xJ
         35Ki4velxts+/EyC2fd5PQpgXAGGBduZqNjaqYu0gmz9cze2Nq1lyr62ocUj5dqafHT7
         ssS2Js+ASd230rPnSU9rYcGp0liCdSXXNdiDEgvFLnM6xvQfXiMfMeIPPfz8Sj+LVvEC
         9irw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v11si68883wmc.0.2019.06.13.13.04.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvph3kSQzxxg;
	Thu, 13 Jun 2019 22:04:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 0/8] x86: enable SSE for inmates
Date: Thu, 13 Jun 2019 22:04:34 +0200
Message-Id: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.183316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

since v3:
  - The series is getting smaller! Rebase to next, some other patches
    were already integrated
  - Adress Jan's comments

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

Ralf Ramsauer (8):
  inmates: x86: use a valid stack for secondary CPUs
  inmates: x86: rename header.S to header-64.S
  inmates: x86: introduce a common assembler entry point
  inmates: Add string.h
  inmates: x86: Add acessors for different system registers
  inmates: x86: discover and activate SSE/AVX
  inmates: introduce test.h and test.c
  inmates: x86: Add SSE/AVX test inmate

 inmates/lib/arm64/include/asm/sysregs.h   |   5 +-
 inmates/lib/include/string.h              |  40 ++++++++
 inmates/lib/include/test.h                |  18 ++++
 inmates/lib/test.c                        |  28 ++++++
 inmates/lib/x86/Makefile                  |  24 +++--
 inmates/lib/x86/cpu-features.c            |  98 +++++++++++++++++++
 inmates/lib/x86/header-32.S               |  25 ++---
 inmates/lib/x86/{header.S => header-64.S} |  25 ++---
 inmates/lib/x86/header-common.S           |  56 +++++++++++
 inmates/lib/x86/include/asm/regs.h        | 113 ++++++++++++++++++++++
 inmates/lib/x86/include/inmate.h          |   1 +
 inmates/lib/x86/inmate.lds                |   5 +-
 inmates/lib/x86/mem.c                     |   3 +-
 inmates/lib/x86/setup.c                   |   2 +
 inmates/lib/x86/smp.c                     |   3 +-
 inmates/tests/x86/Makefile                |   7 +-
 inmates/tests/x86/mmio-access-32.c        |  16 +--
 inmates/tests/x86/mmio-access.c           |  16 +--
 inmates/tests/x86/sse-demo-32.c           |   1 +
 inmates/tests/x86/sse-demo.c              |  89 +++++++++++++++++
 20 files changed, 498 insertions(+), 77 deletions(-)
 create mode 100644 inmates/lib/include/string.h
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c
 create mode 100644 inmates/lib/x86/cpu-features.c
 rename inmates/lib/x86/{header.S => header-64.S} (94%)
 create mode 100644 inmates/lib/x86/header-common.S
 create mode 120000 inmates/tests/x86/sse-demo-32.c
 create mode 100644 inmates/tests/x86/sse-demo.c

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
