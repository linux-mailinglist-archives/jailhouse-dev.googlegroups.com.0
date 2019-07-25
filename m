Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPOF47UQKGQEMSNIUOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5B7552D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 19:11:26 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id c12sf10864701ljj.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564074686; cv=pass;
        d=google.com; s=arc-20160816;
        b=lFVDe2pv5J+6orVy7NgHMJj81AkNEmjjE5jk7E/osu5DgkWIL8M7rUmh76k830WZAe
         Hrt3UzDZHF/OWMMf0b2ngZpA9vsw1l/fVhCimhNtS3RMUGYdCBBnMMozIAheYCclA2o7
         IVMMwdWf2/HfwGBmYlRHoml7rKADc88NoDGnJW8NAZKKX06Xt2H3kR7yQkn70tnjxxxG
         b3bwF3jokpP7OQjhoVd271ldVadQ1AFc6KAF8j6n64oQHt/0223e0jsrvQnB3LKE6czl
         1FyGzqWaorqYTsCTU4z9QrOxw3E5q8MIn5QwJN/HdVLr9fuM0MZDoXPDLpNd218PmwiW
         V92A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=5eSDvT8HXcjNye/T2wKO+H0wn8lSvYeHLPfvdbUGBIQ=;
        b=Czgbc8x/JEtESz9+IoquvN1B6bGYKF+okOpCuro8XUR3atNRb3LCt6UyCtG6mlB44E
         MIElV954Ao8aSI1nfp0Ia3S9UrCqJ+KNXuqQHhCT7C3lFABN8OVTzQyA3S2EHdXWl25b
         hdWDcY0KiHg8mDFWmD00rJ0qzmfSfSTHZvlevKJo2sXTxzRzwSCNPhI2qVd3FdjULGFs
         RrVUrdbiPQQf9My7t960KQlVwCC14bxTsCt7Ci+N3KdCiDHllVwOZYhv81P1o6GbyfYP
         oUnfRoTKO7IdRnRK8pSW9vXCf9PTB3YOsLV8wr1OhYNFZzj0LQzZ70cYsEGhceEMLEPn
         VBbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5eSDvT8HXcjNye/T2wKO+H0wn8lSvYeHLPfvdbUGBIQ=;
        b=dmQmUmfhxuuAJ3hbLKjRadrCnLx21osnVa4DWhACYu8qmkhDFxTseHQ/tutSxqxvL7
         uaEsLYv90UDz3pOaPE56Ab8UFEzgtJai56Z/BSBC5msqIeETokdvp07lmpvLbi+OwDHY
         p8Sfa4lzjTYIs24VO0hcNX/N/S5t/XH2/zZgRb7+pw07u5lZIr4g/5wMcAP7/n752Jqw
         ut1LvlS2D2YagEfDnYi1gKKEOfTwkfVAKQm/JVfjlc02WyuoQi1Y6b4QBry8M1AzYT9E
         YOHjz5pQx6wqWiBtNdTK96Mg+H3RYerHSARSqGqpN4qBs59Z4OJ5pt2vwxxVv3ywqDrz
         TBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5eSDvT8HXcjNye/T2wKO+H0wn8lSvYeHLPfvdbUGBIQ=;
        b=GJJatyYdYQbC0dpsLOhJ2lZydtT+ytT/es2gvbC1bjQH0YVHHPpZdLRRV+GuHgeZKC
         LRcQkKiu4ge10LV3Yem8WXbNnmTIfAGXbNQ+UX4NUDQwLglGJ9OTeWaPBrpA1FRVFgE7
         IRQiyNqmGZGS55KKgsR+EyldCEPjnKUTVR4VvAMwTag3H+3LDMxk5BYphiLZKKb9xh48
         rB3iOklvNd6q6INxl1+JP0rHJ9hVh+9RIToxu43JStShDHOg9TLh7GuMLgKyyUw/C7u2
         /98ztt883Ncj5nXzFtfDEqX8WV5NIvT+jQz20Uj4wqOWyEKf+qISu/Von7ZI++Ou7RFL
         sZsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgIGM3heW9jZ5MmBLI37PzJkFnpewZG1W+pCwDyymD6TlBpby7
	+Dd+EkHUrN54DMLKloctRe0=
X-Google-Smtp-Source: APXvYqyEyBBwramNs96jb7PxG0VDeLdSOICs3Lw2jBbQEfuF0OKchtYDZ8xo95Ua4R9xi6ShfMKyhw==
X-Received: by 2002:a2e:8559:: with SMTP id u25mr46407286ljj.224.1564074686019;
        Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9dc8:: with SMTP id x8ls5806334ljj.2.gmail; Thu, 25 Jul
 2019 10:11:25 -0700 (PDT)
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr2255927ljc.123.1564074685419;
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564074685; cv=none;
        d=google.com; s=arc-20160816;
        b=CzCk+e6Q4GOPeufo/IxdGZp6Lr7skeHZAJp98rKhprPVxfQbLmGl8CMRlCH9EYwHf/
         HHfCHc5gEXS0p3GQP2aNbcQ8IfTXSn4/oAniC1GcUp66lUZWqIEWDZaXwJ51QR2mu7FC
         7lE+1y1CMUJV8zfmjrTUNjiMuzsVCNlTMdUq/YzoKNKDDksOzwpBqoa+A481GAQfIcfD
         39awuxe5KmNfrzHThl1RoMFk16Nn5/CvIVjqXrG2kdDSmBDxPZ2fotpcdT3EPM3lxh5C
         RNkHrNLfMG4vZWOx9nAiJA+9EbYtwXIVgiGJ351s0dLmigBAVIfFWVj7k3magQa9zOjX
         6S1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=NB2OPlgr/FtiJOHuvDqC3ENBNtlbvndVP9MfwWSLkf8=;
        b=vKYKeI+objOdXh5YkG9Z9ZXQTld6bt94f9cA3rQMdIjATZsCTToy0YG2/hMenedtA+
         8yCx1NFD1QiTsII7FH6H2PFjn5Vy8HpsEFEkabOM7si/i2QfhpP7FOD2BBDo3B6JIC6f
         tS8Zh6v+n99vusuzYugfzmUsywmxqrgAsdwTbrznzhyhxbMi9cmeTRvjS59j4K+Yq9Xx
         5d6TNbOahuIGqeSFcIqswydt0bqc/LQM2iiSnWSAnkJg/Hcr2k6geEmNBrIyyeJk9XQ4
         aJdXk55YRWIvoH+OObKUq/DZN8ui2YoTKBkHaW9hrfSKGIj3Qo8c61QA7i7trQ6pvUc9
         7QVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h11si2661832lja.0.2019.07.25.10.11.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45vdzJ3ZCpzy5s;
	Thu, 25 Jul 2019 19:11:24 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 0/4] x86: convert pio_bitmap to pio_whitelist
Date: Thu, 25 Jul 2019 19:11:19 +0200
Message-Id: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.25.164815, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.25.5630002
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

But hey, look at the diffstat!

  Ralf

since v1:
  - rebase on upstream next, respect integrated changes
  - refactor jailhouse_pio_whitelist to jailhouse_pio
  - more consolidation!

Ralf Ramsauer (4):
  x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap
  cell-config: introduce pio_whitelist structure and helpers
  x86: pio: use a whitelist instead of a permission bitmap
  tools: update config generator

 configs/x86/apic-demo.c                |  16 ++--
 configs/x86/e1000-demo.c               |  19 ++---
 configs/x86/f2a88xm-hd3.c              |  27 +++----
 configs/x86/imb-a180.c                 |  27 +++----
 configs/x86/ioapic-demo.c              |  22 ++----
 configs/x86/ivshmem-demo.c             |  13 ++--
 configs/x86/linux-x86-demo.c           |  16 ++--
 configs/x86/pci-demo.c                 |  16 ++--
 configs/x86/qemu-x86.c                 |  41 ++++------
 configs/x86/smp-demo.c                 |  16 ++--
 configs/x86/tiny-demo.c                |  16 ++--
 hypervisor/arch/x86/include/asm/vcpu.h |   7 --
 hypervisor/arch/x86/svm.c              |   7 --
 hypervisor/arch/x86/vcpu.c             | 100 ++++++++++++++-----------
 hypervisor/arch/x86/vmx.c              |   7 --
 include/jailhouse/cell-config.h        |  28 +++++--
 tools/jailhouse-cell-linux             |   2 +-
 tools/jailhouse-hardware-check         |   2 +-
 tools/root-cell-config.c.tmpl          |  22 +++---
 19 files changed, 174 insertions(+), 230 deletions(-)

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190725171123.9266-1-ralf.ramsauer%40oth-regensburg.de.
