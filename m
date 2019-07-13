Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id B26DB67BA4
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:42 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id b21sf10521137edt.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041442; cv=pass;
        d=google.com; s=arc-20160816;
        b=hviQMwMQXvNgeAsAbvCMbzdMsskPShFNqXaNpYV5nqVPX5YjVCXwG8Sjmhx2UBuiC6
         iKdFLbtdCgoKIhd+6kEk76Zz2mr5W4ruB1PrzFifsbWabE/qhUIqq0O8hQiKtbgMXLyR
         9uISG0VUfCz3OuAZIJ0HLxERBOx/PgPxmOY+cu/4iu6Y7tlAcggVMGlcuRYlP7Rq9RFr
         21EvzMpvjDlmz19q/OsZZNTGklyJ/pcYlJPAz9oKDwyEc+w9uTmVQmd7Uo8N2Ztzageh
         SHhX3KSFTmSwyxve8/EZ6r2JoMQIFqWMOfRbNu+Un/BiQSAaKOEpdMTUazA2TEMHCXdi
         61xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=JMeZHDj2t0Wp9hhALHb4xwGB7UJvpeiTEpfN0weQR1Q=;
        b=yRmQns5lalkPfFWECoDuPkG0yFoPrKilucjfpjCk5vdaNt5AAJgnX7KVXYkvXoGEDv
         8TuLY6k4TarK1R1aOu5VtWfuAsaXbftutaQA/cm9c0SwG6rdEL7jBT0xoydfI9nwqz7P
         oRhKLcp0bhK2JkKyGb1ZrD/ky4UdPg53K4nYk75WR6HuOtG/srp9Ue0cvUIEOCO+Eu/2
         FAZcI08y2Sj26rBBDxAvEnzNwiLXZrvl940t4AboEHYQQ+icRZKYZi6JUJ7x0f6hdHH+
         0r6zjFkW+aGjSQRj6CbA//PSwF+YOpiOltkJrItvQ8M43DMuyukoQyfCL2fkDKos7ITJ
         2HzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JMeZHDj2t0Wp9hhALHb4xwGB7UJvpeiTEpfN0weQR1Q=;
        b=FoL4bfFPQdLUd6GBr0OKGpB+IgvsTMjJBJpZyzIxmIEJYB+gO+jRgZzeiQYVdzMBRo
         EMX86PjPby93AP6WyDjePcrtWMCxzkjXTv8h1JDgJv2vFZrOThxvxwC3JMHodGg7r+2+
         p/EliODwFJfACZIgjkTjZwNdShmM4wjKYNhFPG7xBqkhbKAcW2nGEi+CwbkxNolYddXN
         NNdXnEN0bOEu/2t1vHsqY8wmmROdxcG8rLBM8gMZFDRNWaEL1xG3E6Ewi0jwyQAUiSSY
         NeXz65BHHmAX2IAAQEpR2Bp5HPUmaWqf+mdNo81PXxOv7ud48o+Cc8qMNDwvL5deEm3g
         ARbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JMeZHDj2t0Wp9hhALHb4xwGB7UJvpeiTEpfN0weQR1Q=;
        b=QZHswuJp2G/oYez04pen2gHx+RhPyZE3KNA2JZrzA8UrdoUo5P134SrQC81PQSuVgA
         7JN6xVpyFiCoItBJeawDoNpUR2fmrDPCPLcmRqPPNERP+lcmQwU5jHGdsP5i/6JID/Ok
         9lzcS9i+gHBTh8HBUnX1hvU1Yh0Wt92qUUHEKxzvCEScVXLa7HV4DQyMOybzBymdo+uL
         lQAdrbrS9ck0RUhTVQK7r+kpoanAGSQqTWTIfTFo1suHbPEOzoF1PuGw1OSre+qfL9lK
         DO2W3SAqlH0hTucLK8Mo2PRTtk3vARv2UuunFn5DH1T2AVoGRdLljqj5JWatZTJLZYGo
         I6Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW5BnMjBGJiNvexj+PqHcPl7XUv/X/Csk4ivD46Cugsc7HjsofE
	d1zAMtrDJQahU7cJN3zMatY=
X-Google-Smtp-Source: APXvYqy5FXk6TIBwhtRXK36I1plS5aIhtyVlLVmb9f3T2OJGJk5hVrwB55jspgCJo1ij4zejnEuHhA==
X-Received: by 2002:a17:906:5859:: with SMTP id h25mr13615240ejs.202.1563041440548;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls2740575ejr.1.gmail; Sat, 13
 Jul 2019 11:10:39 -0700 (PDT)
X-Received: by 2002:a17:907:20db:: with SMTP id qq27mr13455382ejb.30.1563041439597;
        Sat, 13 Jul 2019 11:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041439; cv=none;
        d=google.com; s=arc-20160816;
        b=EO2hWoOQopuYkp0RVXiF/vPaqwsmfn6Jc3FbxBs7awM8AymJ5eckCzeTXK+qMcVOZZ
         ntEOOnieDGuTCYO9h1nmMXBGbb2h+VgtJ5QjHmCzLOLo2prhixxRICRSUyT5wuVn+3Za
         iZq3xvgs2xyEjmcnpZrNm/8I4CiZZfHbJu8cbYUzIGZVIsisRZ+BmqRIpDdOHbit5skU
         ewTu+8GwI8+3DUe5GDKDQtDoe4KskSLCTLFT5ecQ2tU4hpmY1ZSNS+KWHiHgl65BY71u
         +H96C109EFKKe+uXDTd//Lejwxr1PFKQHDePhvlNgNji3hfuM+72xMZhtZlBcPxiArU/
         yhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=lNDzF+B9ZI2MEJ7o+i8HrgYRg81FYzepKJJFSzFcWT4=;
        b=D5UacICuQraHWzp8IQxhJDZF/S4IMA8mrQS+6SAdjkkJCeYN8t9lleleV9HkXfBqZH
         e0G/j/YXSRRvINa2ZEdOHV0WGKVfM0mImzMIlgID12vqYGkr0+uSBjaXJd99iawXwgHu
         9ONVY8dEdbod5SSeZk5vdmZbvZjGij52frynnKVkhF7EEWazAykR29yxxIhfkwrX5hcb
         i12btmTVWl5rwUYfTEP6XBePX4QuJO5i1XlzS8fd/Xn/3v2XIE9uMTMqIF08FsI0Rjv+
         DCBP6w5jPSvthdEuPlnwYB+LFeonHLvm+9Zqnmh0+EVv/Abkqee4aybC6K1lAUA+5DfI
         /xqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id a41si745556edc.5.2019.07.13.11.10.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsB72sqzy2b;
	Sat, 13 Jul 2019 20:10:38 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 00/11] x86: convert pio_bitmap to pio_whitelist
Date: Sat, 13 Jul 2019 20:10:26 +0200
Message-Id: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
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

  Ralf


Ralf Ramsauer (11):
  core: bitops: fix type of clear_bit
  x86: use definitions instead of constants
  x86: use the variable io_bitmap for both
  x86: consolidate io_bitmap allocation
  x86: drop vcpu_vendor_get_cell_io_bitmap
  x86: consolidate deallocation of IO bitmaps
  x86: remove superfluous statement
  x86: simplify check if i8042 needs moderation
  cell-config: introduce pio_whitelist structure and helpers
  x86: pio: use a whitelist instead of a permission bitmap
  tools: update config generator

 configs/x86/apic-demo.c                    |  16 ++--
 configs/x86/e1000-demo.c                   |  19 ++--
 configs/x86/f2a88xm-hd3.c                  |  27 +++---
 configs/x86/imb-a180.c                     |  27 +++---
 configs/x86/ioapic-demo.c                  |  22 ++---
 configs/x86/ivshmem-demo.c                 |  13 +--
 configs/x86/linux-x86-demo.c               |  16 ++--
 configs/x86/pci-demo.c                     |  16 ++--
 configs/x86/qemu-x86.c                     |  41 +++-----
 configs/x86/smp-demo.c                     |  16 ++--
 configs/x86/tiny-demo.c                    |  16 ++--
 hypervisor/arch/arm/include/asm/bitops.h   |   2 +-
 hypervisor/arch/arm64/include/asm/bitops.h |   2 +-
 hypervisor/arch/x86/i8042.c                |   6 +-
 hypervisor/arch/x86/include/asm/bitops.h   |   2 +-
 hypervisor/arch/x86/include/asm/cell.h     |   9 +-
 hypervisor/arch/x86/include/asm/vcpu.h     |   3 +-
 hypervisor/arch/x86/svm.c                  |  38 ++------
 hypervisor/arch/x86/vcpu.c                 | 105 +++++++++++++++------
 hypervisor/arch/x86/vmx.c                  |  35 ++-----
 include/jailhouse/cell-config.h            |  28 ++++--
 tools/jailhouse-cell-linux                 |   2 +-
 tools/jailhouse-hardware-check             |   2 +-
 tools/root-cell-config.c.tmpl              |  22 ++---
 24 files changed, 222 insertions(+), 263 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
