Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZUDUPTAKGQEDHL4VJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639010201
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:16 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id w9sf2952082wmc.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660710; cv=pass;
        d=google.com; s=arc-20160816;
        b=qD+ue4y6AsioLHUUui6o3poCIoHCg2V6pwv7JEHNYwctM4mMtUTAMXLqM8pMGXVLSb
         p35s6g8G6PjtXMqprau5prp1JsldUYgKkm1SBAE6gok+zvf7oI3GiE9jOpR2o96PjAFZ
         1LqlCw3WXnBgVjb89WhJ2eu/x4XXfNAUYHPEj0gEP8t0rBPQuqh5cTrkWL62rsmwqIvl
         Db9SxpcFqZqVNS2wrdTqsQI1ttOJ3Oo+S3YoHvYlEYeRT5T2irqQ2dfQc+PAK+k6/MaO
         Z5U4oekec+6DjfYYKszfTzaw1J7UJ2ipGKfsShodzmNKT6+NbACfwiHk9MIA5U2xoXaU
         IlLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=6TH70EKUUzejrclUlQvX+BVr2+BkcDqSoDj/RfNiC9M=;
        b=BSF5RvrtN8rH7sJ71+4loWsdv1v69WedFAhUJq89V8K/N1oAR0phWHktD7o37KscL6
         OdbdhmXZU8cqwOLxplfWMTddx34EqhVaoGzhkUGmwXTuRW6rgYjcK+YYU3S00nt/JWxE
         LkDAncrS/I1pRH2rLU2qMELYjCqFtsglrnqP4CPXQFowWz8yIBXZxQcGeQjMiIxUiJ/Y
         FnkLJLusIzSbq+bfv4Dks+50WPgvRi8/kvB5OL8y05nGudGE4VaX4PNWe7bKcelNmvO4
         pMkePCyaeN30Ma0dfZiVKkuFffm1+KT3bcUOBCiqJwUTaqGjjwiNlcgvQEHUbf0kcHQS
         FguA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6TH70EKUUzejrclUlQvX+BVr2+BkcDqSoDj/RfNiC9M=;
        b=epYIk2vZnSHIpjEjDeLhxHDEWFDQG+s3mDJrKLZa0uEJGirZN0Z4DtctY8aZxluSgt
         OZhyrGyOHs7OKj4X4DiLAwNC3BKh3xcmSFGkk9tHOuVl0BfgGx1so+lGZeqaZSlBImWl
         9C7nl9QhsX6WCZs45G+Hj196Ru2ACD7oaCjLmmuOxKQtUn6x3PyznkfJgsempLAYxre/
         0NOiW8a3Hp5S4v2JyjjrVk682xUBqQEP6OdHeuI5eQg5jOGFb1zHtf9icFFtzQaDLDtb
         BjIIb67RtOurfkpAmRZjhA39vM1Jrpa3/A2iAouEXMIMfwY/+nfrQFaCrTRM2h9yEHW9
         bxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6TH70EKUUzejrclUlQvX+BVr2+BkcDqSoDj/RfNiC9M=;
        b=gAecBUQcwZdRPscrc1g9Kum9LLni0TCwalH3uiJL5lrTtx6JgEboQOaYGYhkYtfeDa
         q+Fy8F3QMy6yWFM6SGazi18A83bHz3kBv1u1ROFP9X+jJZb1WU7tihWCr6j9ZHGK9R75
         4RBpKqPs02zyTedPgnj5dTowCGucsJCgyLmdiY6Jmmo9Do73rL/B2ggmffPP659TZIM/
         S4TI8y+UMyLzA7ucDs2DceIP/Jl5D/2w8SRsw+tACC3bFTDeC5GXKZvUQno5wCVCAm6O
         3rhdesPmXSwpxzypXBPKwh4TExzsHLfiG2mwz5d8VSS18+4xBiOZfTmTUw9H6zu7URZ0
         NHDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXn2aHu/tIDN+O2sptfeRxWnz43L2YwPZkDOYqxf61/SPS6Z28/
	J+cI+BCDI8i4CWhCYDbBLIA=
X-Google-Smtp-Source: APXvYqzuR3IAaVnhXwiuv9IaCFKqDooecFNESgUJkDbBLq89gqrWSpbbhmGd9cBuH7xP6AWiPwYbPA==
X-Received: by 2002:a5d:4fc3:: with SMTP id h3mr5424026wrw.54.1556660710776;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7dc5:: with SMTP id y188ls876445wmc.1.canary-gmail; Tue,
 30 Apr 2019 14:45:10 -0700 (PDT)
X-Received: by 2002:a1c:f310:: with SMTP id q16mr4806107wmq.102.1556660710217;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660710; cv=none;
        d=google.com; s=arc-20160816;
        b=sFWg7EXJPYia9bIWDp5ux6W1ez1qF+T9jezVryJ6tQrNfg8nfhz/Iuhhy7t2E+/Nze
         /K2IKY5tPnFtx8UpfFV2ybtmLJ4fvMbapHTzkvSPvfV+GyEXK8m2U4OuG0naV8xyeSK3
         +vGCzE6kZut249KvhB64dtHIFOlvX0uPknItqZq6cAVfB0saalj/mA0Iq06KGDpX0guQ
         cT/DyZUlbIh7ErcLub2BDhHU/B1B3N5jmRtdsBeHsGmEnXF+ZhZgPpY5fyx9J/vqKniX
         W62EFkCSvYPM37yAQawXeqFGpPbp0QoNyVGE8ckMjwLT2bLSXehaFIZpQn8KxLZh2L4k
         /iYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=AHaMHu2B5cTPykLJArIK1XD5KiA5kfzSwfPkxBtWJTw=;
        b=qHg1D8e6RDIc/mZit/pd7Hr6MOgW6Jupn26BQXaxza+3vg4IbK340+nuz4HvXDUcXo
         +X1BJq6ILJJp7JLBdWpK+GqOb4rB4nL7dwaG4bHLi0Ytu3fyFlRz1zu4xM37wFZZIJZJ
         WhANXt4EfaYVsFNnct6fSPx1IOaQ1TiNYROP/Oaq0HFY+DTUO8RDNfuVgvTRKIjTRIc9
         sOtp+b2LNDbEw/LuOGkTtYYDDp5FbD1hEfJxJN4EB2GJ3V1+mM2JlD1g8i8pJxVcF6Vi
         Rh60TIDDczCo62Eu+P2NZ6BLP6DuZBpI0gwmjn/NlDn+F23cZ83sa2SCKMlnnpmds+I2
         Bo/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id t1si157623wmh.0.2019.04.30.14.45.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6s1SPvzyB7;
	Tue, 30 Apr 2019 23:45:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 0/5] Improve pci caps config structure
Date: Tue, 30 Apr 2019 23:44:59 +0200
Message-Id: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, SINGLE_URI_IN_BODY 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Let's use speaking names instead of hard-coded constants. This series
first adds definitions on C-side and later improves the config
generator.

The series can be found here:
  https://github.com/lfd/jailhouse/tree/pci-caps

Ralf Ramsauer (5):
  configs: define ARRAY_SIZE in cell-config.h
  pci, configs: unmystify magic constants
  pci, config: add more magic extended caps constants
  pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
  pyjailhouse: let the generator produce speaking names for PCI caps

 configs/arm/bananapi-gic-demo.c               |  2 -
 configs/arm/bananapi-linux-demo.c             |  2 -
 configs/arm/bananapi-uart-demo.c              |  2 -
 configs/arm/bananapi.c                        |  2 -
 configs/arm/emtrion-rzg1e-linux-demo.c        |  2 -
 configs/arm/emtrion-rzg1e-uart-demo.c         |  2 -
 configs/arm/emtrion-rzg1e.c                   |  2 -
 configs/arm/emtrion-rzg1h-linux-demo.c        |  2 -
 configs/arm/emtrion-rzg1h-uart-demo.c         |  2 -
 configs/arm/emtrion-rzg1h.c                   |  2 -
 configs/arm/emtrion-rzg1m-linux-demo.c        |  2 -
 configs/arm/emtrion-rzg1m-uart-demo.c         |  2 -
 configs/arm/emtrion-rzg1m.c                   |  2 -
 configs/arm/jetson-tk1-demo.c                 |  2 -
 configs/arm/jetson-tk1-linux-demo.c           |  2 -
 configs/arm/jetson-tk1.c                      |  2 -
 configs/arm/orangepi0-gic-demo.c              |  2 -
 configs/arm/orangepi0-linux-demo.c            |  2 -
 configs/arm/orangepi0.c                       |  2 -
 configs/arm64/amd-seattle-gic-demo.c          |  2 -
 configs/arm64/amd-seattle-linux-demo.c        |  2 -
 configs/arm64/amd-seattle-uart-demo.c         |  2 -
 configs/arm64/amd-seattle.c                   |  2 -
 configs/arm64/espressobin-gic-demo.c          |  2 -
 configs/arm64/espressobin-linux-demo.c        |  2 -
 configs/arm64/espressobin.c                   |  2 -
 configs/arm64/foundation-v8-gic-demo.c        |  2 -
 configs/arm64/foundation-v8-linux-demo.c      |  2 -
 configs/arm64/foundation-v8-uart-demo.c       |  2 -
 configs/arm64/foundation-v8.c                 |  2 -
 configs/arm64/hikey-gic-demo.c                |  2 -
 configs/arm64/hikey-linux-demo.c              |  2 -
 configs/arm64/hikey.c                         |  2 -
 configs/arm64/imx8mq-gic-demo.c               |  2 -
 configs/arm64/imx8mq.c                        |  2 -
 configs/arm64/jetson-tx1-demo.c               |  2 -
 configs/arm64/jetson-tx1-linux-demo.c         |  2 -
 configs/arm64/jetson-tx1.c                    |  2 -
 configs/arm64/jetson-tx2-demo.c               |  2 -
 configs/arm64/jetson-tx2.c                    |  2 -
 configs/arm64/k3-am654-gic-demo.c             |  2 -
 configs/arm64/k3-am654-idk-linux-demo.c       |  2 -
 configs/arm64/k3-am654-idk.c                  |  2 -
 configs/arm64/k3-am654-uart-demo.c            |  2 -
 configs/arm64/macchiatobin-gic-demo.c         |  2 -
 configs/arm64/macchiatobin-linux-demo.c       |  2 -
 configs/arm64/macchiatobin.c                  |  2 -
 configs/arm64/miriac-sbc-ls1046a-gic-demo.c   |  2 -
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  2 -
 configs/arm64/miriac-sbc-ls1046a.c            |  2 -
 configs/arm64/qemu-arm64-gic-demo.c           |  2 -
 configs/arm64/qemu-arm64-linux-demo.c         |  2 -
 configs/arm64/qemu-arm64.c                    |  2 -
 configs/arm64/ultra96-gic-demo.c              |  2 -
 configs/arm64/ultra96-linux-demo.c            |  2 -
 configs/arm64/ultra96.c                       |  2 -
 configs/arm64/zynqmp-zcu102-gic-demo.c        |  2 -
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  2 -
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  2 -
 configs/arm64/zynqmp-zcu102.c                 |  2 -
 configs/x86/apic-demo.c                       |  2 -
 configs/x86/e1000-demo.c                      |  4 +-
 configs/x86/f2a88xm-hd3.c                     | 56 ++++++------
 configs/x86/imb-a180.c                        | 54 ++++++-----
 configs/x86/ioapic-demo.c                     |  2 -
 configs/x86/ivshmem-demo.c                    |  2 -
 configs/x86/linux-x86-demo.c                  | 14 ++-
 configs/x86/pci-demo.c                        |  4 +-
 configs/x86/qemu-x86.c                        | 22 +++--
 configs/x86/smp-demo.c                        |  2 -
 configs/x86/tiny-demo.c                       |  2 -
 hypervisor/include/jailhouse/utils.h          |  2 +
 include/jailhouse/cell-config.h               | 48 ++++++++++
 pyjailhouse/sysfs_parser.py                   | 90 ++++++++++++++++---
 tools/root-cell-config.c.tmpl                 |  8 +-
 75 files changed, 199 insertions(+), 233 deletions(-)

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
