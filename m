Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVV2HTAKGQE3XNY5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 811FA18E7A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:35 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id z5sf1960565edz.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420754; cv=pass;
        d=google.com; s=arc-20160816;
        b=nSC3O8hk6f4urIQSBMwds1KDuc6E51X/QGzcOZ9nifNEylXqezhg4JXelXskTwHYJt
         q1x1cFUR0oAnbLVCCfzQSuxviE2bIgLbJ+Bj+yPHc2CuAKdFltikwnvUfVqrPlnDXdUK
         ARyKMJiOi+yi7N6MlShdUYsGwj1rYAQ9gRn19yaMjGGk7OXGFIvOydiHRJe6jGLOORXi
         pF+vn28JcHdBAnzNPUC2YSGGg7sK0UlU27as3MFb8D/8NUCd1CWieG5z+IMg4Fq5xLUv
         37Frxu+e9iFx8/ehyT0C8D0KIRtK/6XSMFQq8RvgtipyEJXa15YKAJFVTYYYoV0j7qvr
         AVkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=o89DjoSImbfU2qm8YeB6FbSNUee2cmXsqye/7FX2Iiw=;
        b=dkr7ToYkXFUA6tfNJm5R17FAhcTNeXggpD1Hr4hEUQHulGhGqIQBKm4e/PoEF5gSJR
         jwBfDGqIHr8VQeD4x/QZgblFPyc1JVeRVRVY/xGdzn/EpEoOg/C/VvbbdS2HOJwu3o7+
         kNrU/xz1dC0mlcEkuZIPROuhrSwyEtiDra4TSkFAugFC59aiM2XTqd+q1945zqswOu+b
         3vIN+wuUdRWfJpAHQFnZ2CyKPpOW3r6iuKtQtnKetuwHSWNQWCmh0GoqE0fcXzPFMVWT
         Nbz67XeUAKQEuB1FgvGtucN4oewXyt2SZM9OYCd+q/Q3tmKyvrpldkUXD5+ydnENeSKK
         VJmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=o89DjoSImbfU2qm8YeB6FbSNUee2cmXsqye/7FX2Iiw=;
        b=jTTvkBZn+/1hSO8Jz76nu5zf3UzX8LpzT+faHXLiKc2YaAm30CeYRQMJNDvkYeSTOs
         4S57ccjcgwzRZjpyjxEto8VOcdoAHc4ZaDnwxlc2bdE3ccmebX4Rwr9vpFNH+gJQ8YFo
         JVLP56memb0kbtNBC/Vp0VH3gJrXlBiqz3xuZGz25/ZEdZs4xPm9I72ed/Etxn06nQs6
         WPTI0Oo9Y/arU4gFcuOxXlHVAkZMR7kM24m7CodswLjm7kNIlyySmJ+g2cHYs/towGRF
         5YRzBSEBEV2+wGG+bDu/ME8kzGjin6TD+wfoKmed3cZRvcHrnhtY8UXGnRah29YrBXU2
         zEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o89DjoSImbfU2qm8YeB6FbSNUee2cmXsqye/7FX2Iiw=;
        b=qqSStCFpghyl4iFfFZdPcaxiYCvipZv9j7CEv+ifarqBCyij9GP6t9gAXczOGAZn/t
         jj1OJ3+DPIJrBWbn2VXR33kmz3IXfnIs8CVxcgHUspHaXeANyW+5wBuFBS7IYBh/yKml
         KhAQgZ7woIxsf71Loe0hMoPKQut2t8K+Dxhlsp8W9VEe7jYs97Pmnf2gKEWH1MlGqiKw
         NveULsziw59r+E6MmgXn7zthbLZSfJvAMbCKxhwyIl87JEYLpKsfal5vgVt6WUbcWIX+
         /Bg4MDOJ3fSKQpKcGIQF3koOKa5F7BVSaspFsvLfq6V/3W4LFXi177AVsLfEc5SZQhWh
         GHkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWRSvMruT8z9tZ1cEwuZR8xnihEwYgLovedVO8YzB9E8YSoIHfV
	kDkXdnOZcMNs7Du/+JmlCZU=
X-Google-Smtp-Source: APXvYqz3bscZq/6xHhJem1ms5WAoDiQIS5WCCiO/EuNNI5tkIhTmviitJsPlI7w3pGlJ12IBszHZMw==
X-Received: by 2002:a17:906:1851:: with SMTP id w17mr4294286eje.242.1557420754167;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:168c:: with SMTP id s12ls28051ejd.6.gmail; Thu, 09
 May 2019 09:52:33 -0700 (PDT)
X-Received: by 2002:a17:906:f84:: with SMTP id q4mr4231582ejj.117.1557420753707;
        Thu, 09 May 2019 09:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420753; cv=none;
        d=google.com; s=arc-20160816;
        b=HeLlWw0midszTaMD9qsYo3xn4RH+GXZO4dkL1xDZpDNwqNDGwzoF9mCDy8FSxa0/rQ
         GsTPxSC0zaC4MmaZN1d0iE1/727of5mtIF7jMIrcz26M5idknOpjXxaGhHvp7X7lYVJ2
         khfurM711iL6aRad7P2qhwmdZQaOx4492smxfer/2/y4oFC1Rls4e7anJl9N2bgvpTO/
         igHmv58/Zbw3gLPJo8pIsHPK453XjqwYrfTPPLN+r7XfDneyR+QzpYwy6ymsaKPvfSCX
         iBd+ptSEb8LCR6A2RFkGo3sbq3ImChOak58KMO+IcQJjbOYQuHGM74yPJW3XH+W+4qZr
         KQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=GgXfhFAKz4U9e2PcI+Ga++J5cvhqqvxPbMaYuFFf93I=;
        b=dmetvBQ4ClI1+f/iZFSluAAwJQvtfHo645j9/QR3iVuqMolnjToMr2B0mFDI+yOipK
         rwYPHZaLYk2914kO8gkcJyXfkzj6R3Ia5YCHyjnhbDx6O9jaRAQIFrsSeRCnFNrthmI4
         Or2zARfqM4hLeKa7kCOKXuYtjoL80wmpUcEeqk7zSckAEC7cVZZW9fJVGAO6eqgovkIN
         FCF/QUrLBrzfuOSmCrWH5+IbhinxtwOjGXqHNQljBagLMPXWqhiYEThZQTryfg1lDwNN
         vM9hquR615BcfI3dpBzcoy6/NFAcgO2HZ9v1JGcV2L61LEHExqjn9FliCvVVqJQSVXrh
         aw7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id k38si1055318edd.2.2019.05.09.09.52.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC44zpbzyBN;
	Thu,  9 May 2019 18:52:32 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 0/6] Improve pci caps config structure
Date: Thu,  9 May 2019 18:52:25 +0200
Message-Id: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164217, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, SINGLE_URI_IN_BODY 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NO_MAILTO 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

Let's use speaking names instead of hard-coded constants. This series
first adds definitions on C-side and later improves the config
generator.

The series can be found here:
  https://github.com/lfd/jailhouse/tree/pci-capsV3

since v2:
  - create new own header for pci: pci_defs.h
  - directly use the generator instead of the back and forth
  - rename __str__ to gen_cfg()
  - Shrink copyright header of autogenerated files

since v1:
  - remove the ARRAY_SIZE patch, not related to this series
  - Add a ExtendedEnum helper class that allows type-safe use and
    generation of C-like enums with syntactic sugar
  - Let make create pci_cap_id.py
      This is done in Patch 6/7. If unwanted, this patch can also be
      skipped without any breakages
  - Align some hypervisor snippets, where we used alternative
    definitions of PCI cap IDs.

Ralf Ramsauer (6):
  pci, configs: unmystify magic constants
  pci, config: add more magic extended caps constants
  pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
  pyjailhouse: implement a helper class ExtendedEnum
  pyjailhouse: let the generator produce speaking names for PCI caps
  pci: use new PCI_CAP_ID_ definitions from pci_defs.h

 .gitignore                         |  1 +
 configs/x86/e1000-demo.c           |  2 +-
 configs/x86/f2a88xm-hd3.c          | 54 ++++++++++----------
 configs/x86/imb-a180.c             | 52 +++++++++----------
 configs/x86/linux-x86-demo.c       | 12 ++---
 configs/x86/pci-demo.c             |  2 +-
 configs/x86/qemu-x86.c             | 20 ++++----
 hypervisor/include/jailhouse/pci.h |  3 --
 hypervisor/ivshmem.c               |  2 +-
 hypervisor/pci.c                   | 26 +++++-----
 include/jailhouse/cell-config.h    |  1 +
 include/jailhouse/pci_defs.h       | 81 ++++++++++++++++++++++++++++++
 pyjailhouse/extendedenum.py        | 46 +++++++++++++++++
 pyjailhouse/sysfs_parser.py        | 32 ++++++------
 tools/Makefile                     | 14 +++++-
 tools/gen_pci_defs.sh              | 50 ++++++++++++++++++
 tools/root-cell-config.c.tmpl      |  6 +--
 17 files changed, 295 insertions(+), 109 deletions(-)
 create mode 100644 include/jailhouse/pci_defs.h
 create mode 100644 pyjailhouse/extendedenum.py
 create mode 100755 tools/gen_pci_defs.sh

-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
