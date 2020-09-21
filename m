Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCHBUH5QKGQEG6GSR3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DD271ECE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 11:21:13 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id a7sf4004338ybq.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 02:21:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600680073; cv=pass;
        d=google.com; s=arc-20160816;
        b=uZy0Fqy/UTlQiBCSBxAhV4ZT9e2o6PaNT+kPerwZ+9wqsBkaWbwi9WHoJtfsPN7xfG
         0iTISozjO74/npnkP6tzPsCNX+GdOZJ59T8Uy9sQO5ykD0FSHhtKA8I5ZaSFITEu0sig
         aoB2zS5woAo0mTVzXMoSH8QrhoNCc+B4I6vNrr8UO+DfQliQi+zXk7ZJIJohmu2m1Mvq
         h5o4F2pIQo+iMeho3JmPPIf0RGq66lTawHVrreTwTIWwO5uW0/UUYMUHOC57ctnmN0Ux
         PMfy/Si0ZQX/c2QYfVREd1H8/0NfdI0n22n76diBFrmRq67yMr10PMdYGbmCbf6Xxn8w
         HgkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=BFXli0pADHgZ7Z+0/uamjBGj4c7nN0Qt3/SiczMVkQc=;
        b=ox3upwHRx8ALWHBe4J3V0FAeYo6STLkQmyv46QwGEQnUL9wtfNUYdIbK8759FwYJJ7
         iIz1YPfIhiyKEqmLmItiegsBu/5xsoTzh6SU73RiGbgY8Qv01aowOEooZt21jn6tzwA+
         zLL+5NYSnN09OWM2l5MF8V9GvTfv5W8nz59mpuF4cB/Q/Q4lbmGecayTGG88tlqo7UaJ
         WtzdQ/08vr8Dr0N9Mm9C89PYS0SLE9v8gqoBTO3MOXsUPNdjGuGprzuwuv4PL98c8GuX
         7m6TvQAGcmbX6ZSy/9PCGWg2Q6P4myFjH19LVOJ9V5uvbuINJo9Ry8GgXlXQo3tOy4mW
         0DYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=R4zooYTR;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=BFXli0pADHgZ7Z+0/uamjBGj4c7nN0Qt3/SiczMVkQc=;
        b=fyPHQJhsfEA/MywwpeN12kLqAdDrVIkxAnmE+OdagPqMni5H3HuhX2MeEj8Tzq/e+m
         7eTCldc+v2YA0INzjqlGK4K71bdA5X/Pk4DHjaSpsoGpPav1Wo06m8eu78U/hzBti16s
         4XfB7CAs7kbWH/E+n/3zgVF4pZMB6b3beqyixSlRBse/ZBSSp4AGK7nbAU8QeuGvtCp9
         nu6Xq/wnctKDNgghTsOPIZ4Tn99L2SWJRC3Z+MKeR0Ue6/0WtvBwoQNQdHbvBeHaB6G/
         5gEO/cfDcOWrxJ3tl5pnNMFX287Sk79Tzzuycp2JXhg/7wdI+tGZ9Ypctin6Yb9iFKdr
         ykFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BFXli0pADHgZ7Z+0/uamjBGj4c7nN0Qt3/SiczMVkQc=;
        b=f4zrVkKVEpq+b0UVX7mOB/5TjoP3cgRv1ony2pwatyx4djUVG9WDn6ZNBE0DQ9Flvi
         JE/BZT2mpnpauy0Z+D9uu9czCFSdeCx3MWz6WIWnSIfJDDZRObjm+hxsuAIW0R9idiC8
         9bI2DR+IjrmO5kPPqHEwEzBNaxOKxUiByAc/0uCT2ISfdb9EgSI3mjF6+fgK9v4+y6z+
         kmNiN6GEC5CDAA0XO8hTZathHzLsqjI7OT2hPEoYWtjl/DfXqGCEf0tpHqK0as7YAP5Q
         4yRiifIx1mVApKCQqXVip/5TjWjy9Ej4EYIefalGXiKeeIyYQVp/yaHVRmwSgZ7i2pXl
         rBwA==
X-Gm-Message-State: AOAM530MTn4TxZuccshMuMIGrkbn8FrTpPFQvyCmz+Lodnp1XG9mMoAQ
	RmK2sYXJwbgxcnQ/oKM3PVk=
X-Google-Smtp-Source: ABdhPJwZgCXxDh82RPt9hHJuxl8IJQpgsbLsNF0zaSlCCUXbVGwlQP00L5zxwaQltLWVC3piVIgnJg==
X-Received: by 2002:a25:b57:: with SMTP id 84mr47307804ybl.339.1600680072963;
        Mon, 21 Sep 2020 02:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:c:: with SMTP id a12ls5327330ybp.6.gmail; Mon, 21 Sep
 2020 02:21:12 -0700 (PDT)
X-Received: by 2002:a05:6902:4c3:: with SMTP id v3mr13995780ybs.415.1600680072395;
        Mon, 21 Sep 2020 02:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600680072; cv=none;
        d=google.com; s=arc-20160816;
        b=w382fgD8YDmvr/ZDjN/W14LHfW4ceAMq9Axy7kbhH5p421rRddQjIaCc92SYZ0wdMT
         HiHqhhBXLpvemSZXWBOhtGlFz9LQXOD4POuZJkv4Rio8nbkg5p4ryqTDkZOkjlQXJA4X
         zCPCltgY/P1Hrqbo0KN9Um86sadujzvha+R0iQqcl0CuA4b8HNB82s64DKjKHmpLXfbs
         suZF5GeGaFAirYUIRsE5oRcQKuMHLJjfHccbja1Ivtkv+n3ncBOINDo5E48qRtKDSyJh
         Hgx8dPrITBeZ82OBNWIxqknayt/+9hWpaOWDtjIjBSBRSwBuF/NQ9BT8GNGA3uuj5/M+
         gYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=E741ak3WXknrPNBZ7vojUSzLXwPbY6ZMOIcBhOHo3Uk=;
        b=GieG8s9vkQs04Jx0T3cnn7Q6CoyFVL9yu+ABCQl8t6KHJ3bO4Wyq9wyTZYiMR3/FZL
         JBvekb4Lm9auUgr40Qg+88vBA7jJ1XfTAuKsvvgCwVrMTthHb87B7MnCSu8rghNeYPlU
         DJ4ZVDQ6g8rUuTsfUn6yze/HIbTgVnF8O3j5hghWuqh2U48dwFRUOvNjEkbl11JhcCoz
         8bPeys69gIInSz2T1+oGRoL/aojt058P5qlOF2cbntydVJb6Non/MuSXuJzho1ouMmh4
         GK8ensyTcqQ6d40cyOrgCeqTbK1+1rJ9CvUfdpBEiWZV8dK/XmbH+QF5E+wW8ccKhXYs
         93vA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=R4zooYTR;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id s69si577534ybc.4.2020.09.21.02.21.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 02:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-5825cd4.ac4-iad.github.net (github-lowworker-5825cd4.ac4-iad.github.net [10.52.22.68])
	by smtp.github.com (Postfix) with ESMTP id 2A016600049
	for <jailhouse-dev@googlegroups.com>; Mon, 21 Sep 2020 02:21:12 -0700 (PDT)
Date: Mon, 21 Sep 2020 02:21:12 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/980614-d5f4ec@github.com>
Subject: [siemens/jailhouse] 1163c9: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=R4zooYTR;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/wip/arm64-zero-exits
  Home:   https://github.com/siemens/jailhouse
  Commit: 1163c971e98ef714235d9be0d54641ee26748168
      https://github.com/siemens/jailhouse/commit/1163c971e98ef714235d9be0d54641ee26748168
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: Reorder gicv2_cpu_init

This pulls CPU ID validation and gicv2_target_cpu_map setup to the
beginning of gicv2_cpu_init so that we can fail early if needed, before
any changes to the hardware configuration are made. This will also help
when introducing SDEI-based management interrupts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a208d69423892b2fc06c1c6ac9aca64bd2ac481c
      https://github.com/siemens/jailhouse/commit/a208d69423892b2fc06c1c6ac9aca64bd2ac481c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c2dba58e622f6d54006eec1e85e43667b5342832
      https://github.com/siemens/jailhouse/commit/c2dba58e622f6d54006eec1e85e43667b5342832
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ea2e1e2a7f4b688576d07d9bef3d7a5f1336a95d
      https://github.com/siemens/jailhouse/commit/ea2e1e2a7f4b688576d07d9bef3d7a5f1336a95d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b4473b6316e7ca3d715bb0ce6805948a1c34032c
      https://github.com/siemens/jailhouse/commit/b4473b6316e7ca3d715bb0ce6805948a1c34032c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Add SDEI-based management event injection support

This is the first building block for switching to management interrupts
using the Software Delegated Exception Interface (SDEI) which will allow
to pass the GICC to the guest.

In this step, the feature flag is introduced - but not yet set -, and
arch_send_event is augmented with sending the event via
SDEI_EVENT_SIGNAL, software event 0.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f6a8598d104bd63825740e10560cba248a34245
      https://github.com/siemens/jailhouse/commit/0f6a8598d104bd63825740e10560cba248a34245
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Pass through GIC CPU interface in SDEI mode

When SDEI is used for management interrupts, we can give the gicc
completely to the cell. This requires to skip gic-v2 and gic-v3 per-cpu
initializations and to map the physical gicc-v2 into the cell or to not
enable ICH_HCR_EN in case of gic-v3. Furthermore, injected interrupts
now have to be sent as physical SGI to the target, rather than being
queued for the virtual interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d0ca9f814ebb873e6f6c6a5b4a41ade61ee15346
      https://github.com/siemens/jailhouse/commit/d0ca9f814ebb873e6f6c6a5b4a41ade61ee15346
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm64/asm-defines.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/entry.h
    M hypervisor/arch/arm64/include/asm/percpu_fields.h
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: Add SDEI-based management interrupt handling

This brings the arm64-specific bits to handle management interrupts sent
via SDEI.

The pattern for processing them is derived from NMI-based injection on
x86: The SDEI event can come asynchronously at any time while in EL2,
EL1 or EL0. To avoid having to synchronize with running EL2, translate
it into a trap that is triggered on EL1/0 reentry. We use an invalid
VTCR_EL2 value for this and set the per-cpu sdei_event flag. When EL2
finds this flag set on handling the trap, it kicks off SGI_EVENT
handling and restores VTCR_EL2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bae7f122f84d84b97d2477d27168eb3d188c33ae
      https://github.com/siemens/jailhouse/commit/bae7f122f84d84b97d2477d27168eb3d188c33ae
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d5f4ec3db4b308bf882dac307a80129a6a014055
      https://github.com/siemens/jailhouse/commit/d5f4ec3db4b308bf882dac307a80129a6a014055
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-21 (Mon, 21 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Detect availability of SDEI on arm64

Enhance smccc_discover() to detect if SDEI is available on all CPUs on
arm64. Fail on inconsistent availability, now returning and error code.

SDEI is practically only available on arm64 and also only implemented
there in Jailhouse. So skip the probing on 32-bit.

This activates the previously introduced SDEI paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/98061469d04e...d5f4ec3db4b3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/980614-d5f4ec%40github.com.
