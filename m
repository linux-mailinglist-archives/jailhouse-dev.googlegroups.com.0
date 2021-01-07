Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCOQ3P7QKGQEJIO6YWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id A520A2ECE32
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:52:59 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id q10sf4065869pjg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:52:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016778; cv=pass;
        d=google.com; s=arc-20160816;
        b=KxpdhFkGRb1ipUZS9Gf1heyj/hV1KQ28P+WKRURwJYbgPAgk4/eOa1PGZQhtIMVKoM
         SxTY1Pj+ZDZI1ifPEUqhElbg2EFK9VKRB/EKziyynM9mohwvfjwPea4G3tmLikqojzP/
         bCBI73YeLmn1R/4S9jq83w/vB06trUg2HGZ+MAwb0FxI+RO3YsEyaPXV0WdILwT3A1Lo
         ncI6waKgzvxH0rbV1oQfZiBeKu3+9SfPZRNB2+4PDkUgWj9sPa+AfIcakiMXi3c0Qc3m
         kdnSaEWTtVGn+PyYU1SyFRNbfWxtc8TZsu+QFgcJq4FhEVz6u+Ykk0ZuaU8wLAw/eRSM
         dq3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=uDjpVdT6eVM0aWbaYURw0NndL8kpGXGdcIOOvqb8q68=;
        b=OVKEYlamLnRlsscvGnW5uxFAnlQOQtICTFd1CUahl1Xbh14HczTiIvD6+cN8/QjuH8
         2DqFrTm/QlJEW3sBypzICg2jtpxQF14Y3fWDgVuv4NsJQg793gilx7QueCQTnF4MLAeg
         lgS8ggmWKUuSKBg8iSlVC4PQAJyomodwWL8Pl2UCYuKsG4cyfFgalS7R594R+xIynZP/
         GvdoIecZoPj8MqHkmq76oAykQtnoV69K3bh4sSM0toYPqL4wAwX5tx/Xizi3PMRp6mDe
         +vlwvpQNPVq/iPlPlRn2y4cUMszTHL85XO9AfrUdBtONdy+dgxltz3EPFgP59UnVMwLg
         ptKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XvAkLZlK;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=uDjpVdT6eVM0aWbaYURw0NndL8kpGXGdcIOOvqb8q68=;
        b=GMm8VOjyE1HtqrZhd+o2ff19EGrBvwozPv4nNZh0oODo3zFSiaFsNjlih6w/x+w9wC
         putZgtwJ0QSsoGZq5WefWtqeRgio3PWTTBCisqVsNy0ND5aXO5Sp9L2FYeRSXOdUuUdr
         n9gAI9kCV33EnH6x4YPitTfOdSLhyfPu3RZtiwXDPSiBrC0ann/+rw9x7RbOu7rtiZ/d
         CyzW2C6uc+i1PCWsiGUZB4BiE2ihdSft1tEUtKvwpRcmqlWtqaY85lfiGhfbPtkvZpKe
         yWE0x9VXvEUGjsmGllO6vuYXekMmW4EkMGl02ahSiaL1GnLMt2a04BtggI/VrG9uP9gj
         8W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uDjpVdT6eVM0aWbaYURw0NndL8kpGXGdcIOOvqb8q68=;
        b=iwEZTAysiLeT3Yl46sZe1bZIQ2k8ivdONFBuv4+wbHG1y7MaoKtSnaSqsR619nCNku
         pfiRLqmWbogVRx4WeC46cxP1iv2r/vyYz9LJWcjISIe+0nhfiZ9OkP6Rp7Sqvi1VMgyG
         MFe/2etkZV7o07vUsgEas1uEKOUcBj+MZCBDRJ+yv29CiaIUnIYGbbVWzs/ZvnY5xnxn
         5n6bE4JzQmeGt7ByjnICgt7zHSSLs6jJSsshXtXvpO1j1+Iw4PcTYYhYkXq+ZzhN3uv0
         MEZL3MvZMvxhcK9uYjAf5Kf9ff3UEs98UXhZfjZol76ZcmrL2vv9BMUZ2rUTMK3Npktv
         WyKw==
X-Gm-Message-State: AOAM533aYbZgdoKmbHjVnYfm0L1oI6dRqZDjZZISrRvh4ThJ+QhTUlTh
	VoK2Uurk8HEpJo46Z6pOVec=
X-Google-Smtp-Source: ABdhPJzeSqpFbrq+S3ssJ+yjhIknuIN5a9jpqurrcJWg4re6uuYs9htpErmpWhNZurNxTyzHooFAbQ==
X-Received: by 2002:a17:902:7489:b029:da:5aed:8ebf with SMTP id h9-20020a1709027489b02900da5aed8ebfmr1620452pll.35.1610016778200;
        Thu, 07 Jan 2021 02:52:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:4704:: with SMTP id u4ls2631900pga.0.gmail; Thu, 07 Jan
 2021 02:52:57 -0800 (PST)
X-Received: by 2002:a63:1220:: with SMTP id h32mr1262544pgl.309.1610016777381;
        Thu, 07 Jan 2021 02:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016777; cv=none;
        d=google.com; s=arc-20160816;
        b=CT3Ir03YULP7DN3l2rU91osUa1m6eI3rmrkKq7CJS1RrbL7gt76JGn2zEbu70Q3Gwl
         Wgk3NdHd6Q5D8h/kGfhw7m3UHi6DvNf/TJfd5/NhX9t+qlLJtdNwgLr1ziP0eTJETChU
         FdLQ2VAXGv3zIFrGvAfndywzCxIQZTK/6i2wtgx5bgxm6V6mF0cWXXh4K7t8E+BsBT0q
         MgPWUDpKpwRSSnTOVKHLcVOxBd/OUg5TNrZBktMOfJbNotCQbYqVz6IzSnR+12Q36lA/
         cAikvlKarhcZm6fIWeD+/WdkYd3S+QWBCdA5QFulWNGuhJjKgIGBYhUonYE+hkzBqeyh
         Po0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=mCDGIDZBpvhI7VvcknpZxrqpROWzxNkXZ27PraNJ954=;
        b=H3qUnfIC3EkJX0Q8Jd52VnfshHQD1ZlVewy4DX430tbvkTUzhGRHIZBUB8i/cYjmzh
         7GfvZu56UgHfxVw3KfAGN8Opr2Z/xUxDLTMOBra+qQcwfw7R7f6SxrrS7EaR0slZg2Nt
         NhytZ7zj7CyVxopCqseFexNbCmDJgO6+SarcWmXsJgH5u3Vd7/czrHQT+CxZUs8XApMY
         iQCctGgRGYYBPUKFKYhcfj/IpFlyxBWY6V7JPs8xu1IqQ85SLVPkbZXIUpga63GbLRmD
         u+U4Hud6iSvCl7nmhWumwnae1N+ZTJSly79RBGGZGStKP6GnkQ4UQs7lt2upNBGal5p3
         KYvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XvAkLZlK;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id d2si419255pfr.4.2021.01.07.02.52.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 02:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github.com (hubbernetes-node-3d54f4b.ac4-iad.github.net [10.52.113.21])
	by smtp.github.com (Postfix) with ESMTPA id 91F856004FB
	for <jailhouse-dev@googlegroups.com>; Thu,  7 Jan 2021 02:52:56 -0800 (PST)
Date: Thu, 07 Jan 2021 02:52:56 -0800
From: "'Peng Fan' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/beb3ae-b91751@github.com>
Subject: [siemens/jailhouse] e1e43c: pyjailhouse: config_parser: Enhance
 parsing of sys...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=XvAkLZlK;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Peng Fan <noreply@github.com>
Reply-To: Peng Fan <noreply@github.com>
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
  Commit: e1e43c088f907c8ce740e046a2d5c573c44eb590
      https://github.com/siemens/jailhouse/commit/e1e43c088f907c8ce740e046a2d5c573c44eb590
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-07 (Thu, 07 Jan 2021)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: Enhance parsing of system config

Parse PCI, IOMMU and architecture-specific resources. This will be used
by the config checker.

The SystemConfig constructor gains an additional argument, the target
architecture, which is not yet used by the config checker, thus left as
None.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dacd5095c75e1b2b35bf1f3706960a7c1019230a
      https://github.com/siemens/jailhouse/commit/dacd5095c75e1b2b35bf1f3706960a7c1019230a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-07 (Thu, 07 Jan 2021)

  Changed paths:
    M tools/jailhouse-config-check

  Log Message:
  -----------
  tools: jailhouse-config-check: Fix error output on hypervisor overlaps

Initialization of idx was missing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 659055b1171ae155e199f3b4b7547864ca1bedc6
      https://github.com/siemens/jailhouse/commit/659055b1171ae155e199f3b4b7547864ca1bedc6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-07 (Thu, 07 Jan 2021)

  Changed paths:
    M tools/jailhouse-config-check

  Log Message:
  -----------
  tools: jailhouse-config-check: Detect non-intercepted critical resources

This adds detection for missing interception of PCI mmconfig space,
IOMMUs as well as interrupt chips on ARM/ARM64 and x86. This helps to
reveal a broad range of subtle mistakes one can make in creating system
configurations.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0c2d5000688b5cc4e1da4b37dca48f56ea9a846f
      https://github.com/siemens/jailhouse/commit/0c2d5000688b5cc4e1da4b37dca48f56ea9a846f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2021-01-07 (Thu, 07 Jan 2021)

  Changed paths:
    M configs/arm64/imx8mm.c
    M configs/arm64/imx8mn.c
    M configs/arm64/imx8mp.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  configs: imx8m: remove the physical address range contains GICD and GICRs

When enabling Jailhouse on the iMX8M platforms, the stage 2 translation
about IPA->PA includes the address range contains GICD and GICRs, which
should not be allowed because GICD or GICRs should not be accessed in
the root cell. In order to solve this problem, remove the physical
address range contains GICD and GICRs.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b91751cc3ce5f9795d70da2ff198ada1ebe7ab31
      https://github.com/siemens/jailhouse/commit/b91751cc3ce5f9795d70da2ff198ada1ebe7ab31
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-01-07 (Thu, 07 Jan 2021)

  Changed paths:
    M configs/arm64/imx8mm-linux-demo.c

  Log Message:
  -----------
  imx8mm: fix ivshmem flags

The inmate linux should have root shared flag set for ivshmem region

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/beb3ae8a6435...b91751cc3ce5

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/beb3ae-b91751%40github.com.
