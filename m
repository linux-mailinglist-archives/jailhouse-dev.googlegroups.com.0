Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMMO5TUQKGQEFNRJ7LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96C76A75
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:13 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id s7sf11725031ljm.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149553; cv=pass;
        d=google.com; s=arc-20160816;
        b=tSciw7t6oVzHDcjOF5whGjLjMC2ImGwfQDzI2L/QlavaH2SXs4Kgs0PeVdRuuRxSR9
         OtmBvnoSxv+w7RaK4a/TBDzoiacWt9oaUINA8oFzf+W38dU7ZBPBNXNY4ApkgWbe9qC8
         xO5qE8qKdN76/SAAlRY5tV6kc/VCHQc2nnYFhCNb0SMO5PM70uEEUeZaMOXHsZGFb1wg
         aUExoY+BTrci/TmIoqMWTJODFnDwPddh+mcvZbjUH/EGjBCoKvmCfWSbLRQYcZwUsBS6
         PCgkduiMcDyBxUtq+EOObGlOOMiLGcernRlQfhVfirQ/hS4PNnn48q1mc2ZoDoTzvgU+
         kxCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=A2mKJhzVrMg7ghAro5cXWsI9pPYp1GVVUhhmWMCbE4c=;
        b=b6LmU8HhccVniuGR3qz0DQylSTHx90G323FN0S12EzZ7Pw5rqKtsdafSuMbsXOX7KW
         ehVP2OOGvpozKT2kn4+PYJ7stHP+2J2hRKHrc4bXqDS4BdwjeAw8ZG0k1iMtpZzhMRGa
         nWEdVVQ/KMabyxsdqcfps8n4KcmA6Hgdt1lr0U7McHJWI3X+Y0ndGIIPCAeVZuhRMjlD
         drirwyzwF8hv/qTg+w6GkFUwmMFJTxfslbMFvDi91vigx/MVN/qDECKMb5rbjNEjM/3E
         0zXpZNLANnkIAQhpdy80h2GxzO3jdQOkiUGAHQK8eAPDt/1xEfmXX0H4Ea/5EHSJDxAB
         H3/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A2mKJhzVrMg7ghAro5cXWsI9pPYp1GVVUhhmWMCbE4c=;
        b=ZKzS9r7ldpTvp7w+lbh5VSyZyZj0QhgKpt4CmtaKMgqXvNyg2lH1rMIUbJ8lo5TFzp
         aODB1nQA2QcNHDA9s8AkAO6l9IVNQDRbhevNilyncHMar28Ckl2Z/szcWCs7PHJktkV8
         STGRKMrnlsG95GCKKtNi7BCXIDr1vJxZl+Z2PXk6b6U5cN3ZksoMnYp7wIzqv9/qOFOV
         VSKoXlZ8mTwsD3oLzL9koZAQzxiUQPD3C7xQ/JKXTRy81pV9YbLil1wYRRX7oxlYdRCE
         qPQEoQbH0KGOWBT2kUezPgIU/eWqM4E6gLfRCqsHhJtOcY6eidLfRe7u0eC7bGTaJ7ir
         89jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A2mKJhzVrMg7ghAro5cXWsI9pPYp1GVVUhhmWMCbE4c=;
        b=OB9gipHO6BpOQ1IQmaL+0MIVK1ixpxNoV6Vigdekdr4qEZK9ToOVAmQBtJ7kJESTaO
         8orHv5WhO8/EsvkJjDJJW5GpTh2VZgN30xlnpB9bx1Dyy1uGnnz24rMskHDETRB8z5Gy
         1/ZOiFRUt+cxUpVaCnxyS+WhN67wGiEPg/PolPhyrWjNydo+8j6V7sQ+/OWhbLRPJi0l
         iN0c69Fa8qd1maEmXOc76eNA+lg/iN5i8cFzcvxXmW0KX4rLFY+tVtB/N0B/GPxx5KBI
         OlW+jHFqAhePZAGTQqN92n1C/r2bQHHfoMPKfD2cree0If1bZdbHzQ01UERwzHWZmCqJ
         62XQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVHjaR2P2CWtizje/JCDSqqHF3ZEsDmKpXaocHzXEqdqaWRObr1
	P9IhUhxbjO+lYaO/uhLdrTw=
X-Google-Smtp-Source: APXvYqza7crZNiQDZ2Im0P5EDJIuMsLGd8Jhepk3mIcXP0GOWrbibHYJ4ThIJHvemkxAoo93kXZfxA==
X-Received: by 2002:ac2:454e:: with SMTP id j14mr17986291lfm.7.1564149553377;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls4445685lfl.3.gmail; Fri, 26 Jul
 2019 06:59:12 -0700 (PDT)
X-Received: by 2002:ac2:47e8:: with SMTP id b8mr29008007lfp.84.1564149552739;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149552; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt0crCn5DsA8XYKP7ppqcEMqvMcdsU+KC4c2qLDXjcv0EXHkDoUF+xXKolFiC1jBKx
         lEnOUID5xhA6TO4ES44JkHNfUuSbKPsmXvCthUb+B/JWudz3zquHWa00BLNn3gSbY0hC
         kNCzFjuSww0qyXCa8pxupGwqjv/j0j9p5OraRHgbELcDwE/52+/7B5oiXgbkdq+5b2xL
         ogDDjAW7RRPPDWxPUrQGkPzDyRqIEWyATUs/NGp8ZgDoYUhT6Fzr1UzYdluDZDASdQ1Z
         +/y7tD33WvO+jHxyX4Iv1zfgQPpIw7HWeTFgeMfKvyPnGk4dX3YF0F6aScc7Zabr4Bxv
         /Jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=4I3pVli2raRvCtMOGT+nSpv6XZleZ2NZWD8yxEBoyVY=;
        b=LKvn3DBraXmME2O/oTTEVpSM8NCGqLovqXLNePho6wlLQzM7lmSN2QI3QtVtqrQ9KR
         CjxOlQxDzJEhVcaOynCmXMBx4OFnQ43RbdCCOc0B80HMhmZ3DZ2J7OrwaJImtL2FGYfe
         Wow2hPt/FGaRNBjDExHI0nMSJ30/ORKpdlpklYKIyJOwfU1xcnRZuVjNrbcwT7y0Auo0
         aqUoK5kt1h57sQuzty+q2GE1BpizDwugEXlCzc9cZYrRkbHK3vYw+WQY1GaoIG/XPY+j
         xUlcXVrB+oF3uUg/P9Y3YtbZgu5t6pBpe+tqyyearA3haDQHvWXKyispruMNHMJlevE+
         WkCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s14si2986207ljg.4.2019.07.26.06.59.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g33YL9zy6p;
	Fri, 26 Jul 2019 15:59:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 0/5] x86: convert pio_bitmap to pio_whitelist
Date: Fri, 26 Jul 2019 15:59:06 +0200
Message-Id: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

Hi,

this is a follow up of a recent discussion: Let's convert the pio_bitmap
to a pio_whitelist.

It supports readability (no more bit fiddling), writeability (no more
bit fiddling), reduces the size of cell configs (per-config reduction of
almost 8kiB), and generally, it's more Jailhouse-like than the
blacklist-like former pio_bitmap.

This series first cleans up and consolidates a few spots, and then
switches to the whitelist. Logically the series is pretty straight
forward, still, there's one little trade-off: vcpu_cell_exit. We have
some more complexity there.

But hey, look at the diffstat!

  Ralf

since v2:
  - Remove .pio_bitmap from ARM64 configs
  - s/pio_bitmap_size/num_pio_regions/ in jailhouse-cell-linux

since v1:
  - rebase on upstream next, respect integrated changes
  - refactor jailhouse_pio_whitelist to jailhouse_pio
  - more consolidation!

Ralf Ramsauer (5):
  configs: arm64: don't set .pio_bitmap_size
  x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap
  cell-config: introduce pio_whitelist structure and helpers
  x86: pio: use a whitelist instead of a permission bitmap
  tools: update config generator

 configs/arm64/amd-seattle-gic-demo.c        |   1 -
 configs/arm64/amd-seattle-uart-demo.c       |   1 -
 configs/arm64/espressobin-gic-demo.c        |   1 -
 configs/arm64/foundation-v8-gic-demo.c      |   1 -
 configs/arm64/foundation-v8-linux-demo.c    |   1 -
 configs/arm64/foundation-v8-uart-demo.c     |   1 -
 configs/arm64/hikey-gic-demo.c              |   1 -
 configs/arm64/imx8mq-gic-demo.c             |   1 -
 configs/arm64/k3-am654-gic-demo.c           |   1 -
 configs/arm64/k3-am654-uart-demo.c          |   1 -
 configs/arm64/macchiatobin-gic-demo.c       |   1 -
 configs/arm64/miriac-sbc-ls1046a-gic-demo.c |   1 -
 configs/arm64/qemu-arm64-gic-demo.c         |   1 -
 configs/arm64/ultra96-gic-demo.c            |   1 -
 configs/arm64/zynqmp-zcu102-gic-demo.c      |   1 -
 configs/x86/apic-demo.c                     |  16 ++--
 configs/x86/e1000-demo.c                    |  19 ++--
 configs/x86/f2a88xm-hd3.c                   |  27 +++---
 configs/x86/imb-a180.c                      |  27 +++---
 configs/x86/ioapic-demo.c                   |  22 ++---
 configs/x86/ivshmem-demo.c                  |  13 +--
 configs/x86/linux-x86-demo.c                |  16 ++--
 configs/x86/pci-demo.c                      |  16 ++--
 configs/x86/qemu-x86.c                      |  41 +++-----
 configs/x86/smp-demo.c                      |  16 ++--
 configs/x86/tiny-demo.c                     |  16 ++--
 hypervisor/arch/x86/include/asm/vcpu.h      |   7 --
 hypervisor/arch/x86/svm.c                   |   7 --
 hypervisor/arch/x86/vcpu.c                  | 100 +++++++++++---------
 hypervisor/arch/x86/vmx.c                   |   7 --
 include/jailhouse/cell-config.h             |  28 ++++--
 tools/jailhouse-cell-linux                  |   4 +-
 tools/jailhouse-hardware-check              |   2 +-
 tools/root-cell-config.c.tmpl               |  22 ++---
 34 files changed, 175 insertions(+), 246 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-1-ralf.ramsauer%40oth-regensburg.de.
