Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBE5N2LTAKGQEIJWLEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3D19416
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 23:07:31 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id f187sf2969268wme.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557436051; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2XtFgnkIv6Py7Rnbept5K2K/sWO5PNRLiLSvdtJTK+f3yNX8rhQTjruVnX6OWG31y
         2AkX0GLscFPZYK2oyG1a0E+er/FIUaHwSrHnmNcNvoojWvmtQtjt9t51qLW3r7Az5FSm
         vUegdDnvgAf/NalEflLnycJ/Hr8HnBxZzx2kvpcoyJEu08DBAfhhwYuH+tEDGqg1jDBN
         or+r/sjrhrB6VeJP04CD8rL1+nQgy1p1UWc3ku07uou/pdj+K/dv7J9mDpDiJMvVEFnb
         54Bo6j1Xh84gSK5YPmXWKmqh1XdtmPsnY13sx7G/JbKOXDDmNjAUXEsS9w5qhjWACPPr
         QzvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=OTSL7CqaXXzA8MC8GxLNz5qNSY1yRCtxhUJX8P13Z/A=;
        b=TnhX6iwF6q85K/wrDeOLM2PkTRmnIpnSEnaJFqPkNsGSfWYVhEzFuC6Jt57ek+daeB
         L2BAJafW7odj7WxX6UiNDWIHCdLN6+slOehk21SojOp9EGqHCY+0OLjgweM9lMQVeKYe
         ghQZZ5gN5kTHSF2ljCmdYD5BWKDn/tnmhoWIRC3gmJsEpoA2UT8ne1FTG3Yc7O92Vr7P
         wnmUSEnoSHLCHtE8invaAo0WUNzcNl5PvyRKf+g1X8DXIPRG5KmRfKQo0GrU10rrNNlS
         3PF5zq4GOR7nObIHEfLcsGSbx+nD01/sksc2wgmL31oOUBUstmzF4vBO+uiTMfhwoVtq
         uQNw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OTSL7CqaXXzA8MC8GxLNz5qNSY1yRCtxhUJX8P13Z/A=;
        b=o0GESacazXxCddnMjFwWUMlXxsrD2ZXeDeYUMK95jg3X0c5TmXtMgPpbtC6s11s6Ry
         B8/NXF6d4C5DMq3oo1/C5F0faVwvv51sZP1lIDs0kV8WEEFXtABqpRVfa0ygN4g/g9Om
         aaFojwc2bKsM2gyloteFS4m2dr3ICvjvYYJXA3/UcRiBoQtMdl9R8NqfRoHZSLJP7Ni7
         if9TqoJAe9Z+cmMKuxMtpgSGkm4x95+Olfo6GJl45N/jSXGIhkHAIj3vVf5VRl8oM0G/
         DRAvnVtVBD/paAw7HstyYZv97HIafVawgZwOM3p6XIQbsJRzEu5r+/n5Od9b/HGcD0R4
         15nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OTSL7CqaXXzA8MC8GxLNz5qNSY1yRCtxhUJX8P13Z/A=;
        b=uYZxJP+bv+hAq61TEIflFBlxZZ+Drozs8stbvYj5TA/2aWawIFKMy5DltUMCDfpHbZ
         jERi2oy1pM+KfehHykH2MoyhMYONePg+Dg2oPoVImRYav0LJC2M/PgOA9rYuA/ztbUM7
         /1GGIyAbezoy0oj86FSBXeC1mS2ffnolnXpVr24wuAPh+RzHOglYZPU8Ie14JfNzrDDV
         6QZ08cC8Mdy8emp2VESIBYZO+25OUK6ShBqiea/Q93rkiVM9pmG0R9kAV+yC0eNmY2n4
         PtgeRx/MKNFJmRtOxlFZOSYqhqqxvZw+LtSrB4yz22FaHdjPaw44j8Zb1+10Ol5ctp9Q
         Ai8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2Z6NpciBb44sRAMnGQzkbGXvUMFSpFkHMMtqt0v3vWzJrcwV8
	eKtazqaH4ZdsfZgcHioyops=
X-Google-Smtp-Source: APXvYqxJuOFW2u7TMCc3mMYRnOpulrqN0aRz/oKl1+DJcbX8Wc9qCVllkzivThEY9f/cUCCOfWcbzA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr4714562wrw.62.1557436051195;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8184:: with SMTP id 4ls848652wra.5.gmail; Thu, 09 May
 2019 14:07:30 -0700 (PDT)
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr4895716wrv.223.1557436050714;
        Thu, 09 May 2019 14:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557436050; cv=none;
        d=google.com; s=arc-20160816;
        b=yoYNm2+Nj2hmPe49tBXHIsjjesoxeaubeCcgkuKny3KYnTqm/IzOhpRMXkh+0Cq2LI
         EQfvcRjtnIqGORxRONssgB67y1EYQU2q2Re6ZqIdmVWYKe+kpZEbDXCg1DOpR4ujlLWq
         m3EaTJKZlCTsOenRLJ8KVvJ4lsCyVsWULTxjaIgbUkW5FLvAVM3XGsuWVkz89fJushGL
         GfYfFGE9w+Z++u2dffGmI1R5yqUDHcX1Zspmg/8YhSDYzX3wQ8PN4yi3aRjG+/cXAkGP
         S7/7mwlJg94dGaUPqJqzsTqpTW0zSsmsZlSoiJ+RNxQuiVoc2hDygqp47yqTQmP1jZ9d
         lNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=toqEWsIVbyM86wb6XCcEDkREG58a2a0Xr5CDBvciGCM=;
        b=m9eEJzCIXFpueYBf8cWKs3qjd9TrCJiezAnCTOUeR/x4ZTaZblEQnNjZyhPhJ4qsui
         SMDOf/IK7bret7ewk3tF9nbbWncuACUvd0DB1my5kTYOzhb2MkDUkhNbN4DbolL01ZyX
         2/tvqCxOpu9B2PMkzYGQakHDgNymm/gX1lsBciX2qS430NBEG6fT/LFKhdXh0ofkYRpu
         ePeXiaIcluqGORyXMjVRWPEriSwo5hX7FD28IdhIvLgNiA65qZCBzrcZ2blbqUJBH7+R
         TMG4o///tx1wDJJWLOQfXxb4lyc7OiZSobZbvCLHtM8/jcDoIOh0vOQ0Yes19NLj1AJX
         67fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id 207si1041444wmb.2.2019.05.09.14.07.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450QsF5RFnzyB7;
	Thu,  9 May 2019 23:07:29 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC PATCH 0/4] x86: enable SSE for inmates
Date: Thu,  9 May 2019 23:07:22 +0200
Message-Id: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.205716, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

Though unlikely, the lookup of SSE might fail. In this case, we need to
stop the inmate, as we don't know if there might be some SSE
instructions once we hand over to the C-entry. There are two options how
we can stop the inmate:
  1. cli, loop hlt
  2. set cell failed state and then switch to option 1)

For the moment, I chose option 1.

The actual SSE patch is pretty simple, but I want to avoid duplicate
code for header*.S, and I found some other spots where we can
deduplicate 32/64 bit code.

The first three patches are preparations / consolidations. That's the
reason why this is a RFC series -- consolidation is a bit tricky and
needs review.

Tested on a x86 AMD systems with the following inmates:
  - tiny-demo
  - apic-demo
  - smp-demo
  - 32-bit-demo
  - mmio-access-32

  Ralf

Ralf Ramsauer (4):
  inmates: x86: consolidate register definitions
  inmates: x86: rename header.S to header-64.S
  inmates: x86: introduce a common assembler entry point
  inmates: x86: activate SSE

 inmates/lib/x86/Makefile                  | 11 ++--
 inmates/lib/x86/header-32.S               | 34 ++--------
 inmates/lib/x86/{header.S => header-64.S} | 37 ++---------
 inmates/lib/x86/header-common.S           | 76 +++++++++++++++++++++++
 inmates/lib/x86/include/asm/regs.h        | 54 ++++++++++++++++
 inmates/lib/x86/inmate.lds                |  5 +-
 6 files changed, 153 insertions(+), 64 deletions(-)
 rename inmates/lib/x86/{header.S => header-64.S} (86%)
 create mode 100644 inmates/lib/x86/header-common.S
 create mode 100644 inmates/lib/x86/include/asm/regs.h

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509210726.23168-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
