Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHHH4OBAMGQEFRS2CHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4234501F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:29 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id p4sf57817ljj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442268; cv=pass;
        d=google.com; s=arc-20160816;
        b=bDRhrxTmOM7pThBExzoac+14TFZdKq8tKgaUnN6Vt6Xvu5/+Jwf22j4D5Q8rxiHUwE
         wO58IaIUjMwFeGEea4SwWNvNCxGWpI8uJtZ7Ee7oIBtaEelayXfFf4IDGznR7nauO998
         uAhdnWWea0n2tXQizQWHlYSBX+/PFhoSvpMZRioa3uwD5e30G4Vfys0msKmDwjnCVksd
         kKinVgBn+xXmCpWMRRx33ffe4JL54cjFbOo9aCGwGUnPsVfbN5MyU1Ornid8heITXzOh
         wH/5jwa9znQQTVxMF8gEm8C2TLCcfMI+THU9a425aeelpR9JNMfnzD2U8Cp2ZD5h20sE
         cKiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=SPNyzsKEHEVcl56HwRQcGi+yqqiMvD6KN08o9Yk2zpc=;
        b=HshJMj0WV3HSCe51NRn75Zc3J23fKJfE3he894iCgtahH22whP5N7wevtPH71iNBWL
         KL4xwRsBWzfH7PAknKy9brkC57ejwn9MPDMTqna5FRC6C9oWxibvGjMW0CJGm7ua4+/9
         8EnmD4c9NZCYoWW1r9Sul6TrXob8vQ3+T7nzaiVLvNncvl6LNsZQY8viESy00bzDrMZf
         HlSboNdpjyQqImL1fVfHpxS0aiKYSwdFAH2Eh0EeEltQl3QrmGM2eVsS28/X+nt+iyYd
         f1mF0fdJgMr4PUKm0qjpQwgpNXj6VdZw4j9l1lBbUKW5SPMjaWYS2g7H6zfc4fboc/69
         hH4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ze6l0EOY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SPNyzsKEHEVcl56HwRQcGi+yqqiMvD6KN08o9Yk2zpc=;
        b=AOc96KitwctATuD5ZWbmopDOHWAWOohxdVd2eTNQD0Uv2mY9mtAggRacj4/LfWi+0T
         vR82ywUSVZ/+WLUJ2vhRduGRxr1iWr9NUo1vvdh0l4SPhlffOYTzsjga1qohZoe628+A
         GZXTt/3j8TkPFNOYzHEi6SSd8r/qDDxJ9o1J0ZSZb2qAhyzVEDclKhymS/K8yMYN/o8N
         5fjH0xcKKQu0BiEacMyi9D2XBQctLb4m/OZ3EZz8mcbKbdO53+fcI0vMOtImZTLPlvGL
         Zp2Ji4cD4rzKf66lBJD4nURSRPzBQ9omhmN7uVMdQZGsHW06LmlwQudkbGLlOqfiCZEJ
         BThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SPNyzsKEHEVcl56HwRQcGi+yqqiMvD6KN08o9Yk2zpc=;
        b=OrMP43FttXnTz/Vo46xCJWkIzUorpACXlV+NhYaN2BvUokrvQLtddfraUNCV5eM9Wo
         zHHfXMbUMTP2n7JG/Z+9xFhoDjo+7c/DnF0D/i50V0rH0cvmqMYi0A4GNqaMyaaUaP3l
         JEOzK4b8MlJZ1kZd0bBFvPh3V45P6dsWPICs8iLYtwEAqnYKnEtFD92Mz6UcUbEZrGON
         t4RziFmS5DZquV6bAAnswclrXQyH5GE7/JfE8t9BGe/GZUBCTUqMBbc00Kohaomoglox
         XeixJXYxeD7f+o4lJlaK0ofqGK986vnzSTbrgwJbo1LrvDaUDSavkRw3vLSOFNIVySti
         AItQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RedLEMpk6/rdpcpPh3TtyTqqQZLoOrVi/96t8dobjQqQ9yEjF
	8a5SpywwzhwHkHGoMJpgmOI=
X-Google-Smtp-Source: ABdhPJxPNu25wNuPdPyh6mXRhlOC6lG1+P9oUSY2KlU9bzV+5/ANvGcScDwwDqkAiS/ZDgOAuQPZ3A==
X-Received: by 2002:ac2:5e21:: with SMTP id o1mr507351lfg.435.1616442268594;
        Mon, 22 Mar 2021 12:44:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls2658314ljj.10.gmail; Mon, 22 Mar
 2021 12:44:27 -0700 (PDT)
X-Received: by 2002:a2e:b52e:: with SMTP id z14mr720259ljm.124.1616442267432;
        Mon, 22 Mar 2021 12:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442267; cv=none;
        d=google.com; s=arc-20160816;
        b=fr3pW7Is6l5D1GwWkUG+7EkELxRCu/3l8DcL/5gORDXYc+GmL1v5DKBqVBZBp0rl5Q
         c1xtnLBvhQ3il9a+r+guczARtfN6bjcebfPCVv04vkcZhzCOTOnYOOnRXgMl+l/sS87j
         iMP3T1Q2EHR67ql3O29CfiidrVeylmVRAlmL4LmWw2YmXiFwti/Q703oQ3noArQt8/4Q
         S2cTB4TKXmvEa2itgp5GQ0xRNTDu336Ldn5oTgUsGI1G1lxieEqtQDnzS/HMiyvra+Gs
         lAw1lTG8dtB7GtCSbhAjYrOGRP/6GCOxIzIamTpkDOMJcM9XjRpK7BbJqitwqB/tbOBO
         6NSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Lzi2JsA6ZtW8oGeBzn0iB3lITF25rt/D+5fcxv2ek7g=;
        b=SKE1BLmT2ZVXL2+1Lm5AZ8QI11HSEWA3a+g2wULP6ZARUFCawxG1S61qIgwDeirFH2
         z7jvkDGy5JzuzuOLmwPdKXhB6lnUNpLEMjlR5wy15HnYoTk6xAodr03OrRLB5R0vq3Qz
         PC58HgvtofFMCmKcwwsFcJGGxL10vnBevxiGLbbm96OlUMyWb0dxbEgcg1RHvtm6Zh9E
         6fgTv0PoBchzkm0OVg1vlChFsMeLhErKj8mwzaaIqN1K29w8V/zLns0R9IhvsDXb4GcU
         7h2p2aVGFDPTpriZR2f3S4MABtCiC700dksjw5aq0Ea+/FEe3HU5NHPmISwKyXNTZYN3
         +Jug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ze6l0EOY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id z5si484506ljj.5.2021.03.22.12.44.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hB3dWHzyXh;
	Mon, 22 Mar 2021 20:44:26 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_URL_HTTP_DOUBLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 84AdV2WilCFl; Mon, 22 Mar 2021 20:44:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44h90FGYzyWn;
	Mon, 22 Mar 2021 20:44:24 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 0/9] Cache-coloring (ioremap_colored version)
Date: Mon, 22 Mar 2021 20:44:01 +0100
Message-Id: <20210322194411.82520-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Ze6l0EOY;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Didn't have much time to work at it in the last period, so it took a while.

There are two similar patch batches: PATCH v2.1 and PATCH v2.2.

v2.1 is the version with the colored ioremapping in the Linux driver. I've tried to keep the replication of the code to a minimum, but the main coloring loop has to be replicated in both driver and hypervisor.

v2.2 is the version with the temporary "root mapping offset" that allows reusing the plain Linux ioremap.

I've removed all other "additional" patches and just focused on the bulk of the coloring implementation.

Overall the changes are:
git diff --stat siemens/master driver/ hypervisor/ include/
v2.1) 15 files changed, 515 insertions(+), 22 deletions(-)
v2.2) 15 files changed, 468 insertions(+), 24 deletions(-)

PATCH v2.1 is also here https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring_driver
PATCH v2.2 is also here https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring

Feedback/comment welcome,

Thanks,
Andrea

Andrea Bastoni (7):
  arm-common: bitops: add most-significant-bit operation
  include: cache-partitioning via coloring, add configuration
  hypervisor: arm64, arm-common: add cache-partitioning via coloring
  driver: provide colored ioremap operation
  configs: arm64: add example configuration for colored ZCU102 inmate
  configs: arm64: add coloring example for qemu-arm64
  configs: arm64: hook-in coloring parameters for ZCU102

Luca Miccio (2):
  pyjailhouse: add support for colored regions
  Documentation: add description and usage of cache coloring support

 Documentation/cache-coloring.md               | 177 ++++++++++++++++++
 configs/arm64/qemu-arm64-inmate-demo-col.c    | 134 +++++++++++++
 configs/arm64/qemu-arm64.c                    |   3 +
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 ++++++++
 configs/arm64/zynqmp-zcu102.c                 |   3 +
 driver/cell.c                                 |  11 +-
 driver/main.c                                 |  75 ++++++++
 driver/main.h                                 |   3 +
 .../arch/arm-common/include/asm/bitops.h      |  10 +
 .../arch/arm-common/include/asm/coloring.h    |  45 +++++
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  68 +++++--
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 109 +++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h  | 140 ++++++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/control.c                          |   6 +
 hypervisor/include/jailhouse/control.h        |   4 +
 include/jailhouse/cell-config.h               |   9 +
 include/jailhouse/coloring.h                  |  45 +++++
 pyjailhouse/config_parser.py                  |   9 +-
 21 files changed, 913 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/cache-coloring.md
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 include/jailhouse/coloring.h

-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-1-andrea.bastoni%40tum.de.
