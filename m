Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPNIZP5QKGQEVKHDCJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F327BD1F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:29:18 +0200 (CEST)
Received: by mail-oi1-x238.google.com with SMTP id k7sf1186636oif.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360958; cv=pass;
        d=google.com; s=arc-20160816;
        b=eUKMXgxPin+TSyIzVZ+toft23gcpRpmY7XyK1oLvK33pRYRcHcW6jbQMSB5G3x+Klh
         8TIKFYiJ6ltWDOqORfp7iP07wOMTjzkYaYFHTW6zauyDNFGNZUfGZtTbVM0RPw7XOKIp
         pUjmn0AgCumQrw6hd9xrgdyfeN3FBjckZr8DNndjugk+N2au7ArF81H1Lr0vGBcV3JpD
         dgxjk+dTdThE9cfwXwSspOBe/VwJBqoY6WIOb4MVz8/JBG5oxDh7Q+mLwc20PAspNtwy
         qnqpfuXEhGnEcZ0Lm0S+76YrScTP09F9IWrpAxi6wQsgcd+q7jdJWFrLo3zHu8fWZu3a
         wUdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=3E1uo62gqTFi4RG5jzl8VFjNMQnQmBdNZutc9yA4ftA=;
        b=MW3+//Ysb7KZrSLyYOM6zxoTnMzSTcPzoicBwSRLCm/uDKjCtWaScH8481+rcRnc8t
         ARhosfdVq+YLQbwYohOl32oNmh0eN7YyFmlsn/SdKy7oxcDPsNe2B9i1IoDtbTIwHxUq
         W/CVKyS+sgTM7kUQbYgd1RgrmKckbgF66P3LPMNv3jZCpzGCALXeN4dmhbfkXirT52DP
         mtHQzEVbppgSN3CLt8YRzET43CpghzKcQvtd40PTiwPW9zFGWnJtAF3m9i8m3d2CaBFc
         20NdwcMyzY+cgMDWIcS0HJ2k0CtVwufGcSXHW4qiEe6ZViR0jX0qAuDPiG++6EV+hiFx
         lycg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zx64PtFc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=3E1uo62gqTFi4RG5jzl8VFjNMQnQmBdNZutc9yA4ftA=;
        b=O+o+cSCt3xcbwr/MToNRlW98B54VtsoWdzg2ubDlxO9YL+cblxaW7i6adb+xIzqu+b
         SmqBocFlm35z/WTpB+f0md3Uy/tLeO8eBUPQy/oDpPabB31qcYGYCM7atg7RchKnArmb
         D3bb9qcM3Maxpe1K4Jb1T4L6TG/cnsdxXMbn8Gu3sf+vlg3AlOm/oopgWg9zhYSAVKna
         YOH7sxlTEadk6SibXOka6FjdVTqTiey75CDFRKNzEx9ttx/z5uPn8CwF44hJmjMJvIXS
         g1mXZ7Zm4pT9HjYp8NLdJEzJCGSvhtYbB57liyoqGZaM6zbkJC4Jwapd93lTrIhE+9L5
         p1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3E1uo62gqTFi4RG5jzl8VFjNMQnQmBdNZutc9yA4ftA=;
        b=MYVzGlGUt6Xw7YcYMYadmnuUVTVtYgHIgGJOz2UnE2LiUzjabX/7NAkHIGKbKKADMy
         NiAi8msTQpP7OV3S32Z/Pons+9HpxKp2abB/Y+jlODzBrKXKRIToSzMOznuz6TjO8jPZ
         y6ebjv3lc66b9qbIdy6qENgEKS5hzdyEnVhiyZnGHnaKxoHhcQpug7PDjY7+YKdBmH2/
         iNDTgDKQoV1EJhtoV49VTuTzJBVzcjLWnDB7rB2M0aGisA9lRMQbR37Tb6b10WfA+Kjm
         N/6f9tAcXRZKpmQEHKQ+i8WKrz0S67F3kyiD11ftjpakIiECzuLI2FBeF7l0N8tPM2XC
         u+IA==
X-Gm-Message-State: AOAM532Msx8YZSmR72qAPK932pL6HlZDBX4SoepCWJOcya06sOmpCFUZ
	1ZxZstg3ud3lJ7mxvLeto68=
X-Google-Smtp-Source: ABdhPJyYcnU4JlT+nGORl1MSHoBz+UGrXUrQ3YRzqBRZ98vI9xgTdlyH/4h2i7OxikEojxTQIBrKTQ==
X-Received: by 2002:a4a:4910:: with SMTP id z16mr3467086ooa.41.1601360957875;
        Mon, 28 Sep 2020 23:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:459:: with SMTP id d25ls860096otc.7.gmail; Mon, 28
 Sep 2020 23:29:17 -0700 (PDT)
X-Received: by 2002:a9d:7489:: with SMTP id t9mr1749156otk.277.1601360957338;
        Mon, 28 Sep 2020 23:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360957; cv=none;
        d=google.com; s=arc-20160816;
        b=pLYws5QIOG5aCpyTo9hyt16qpzxEOYURB0qSBMteom3zd4MKjBl6i8PZcfxTzdXEhJ
         6+4+QPxCZWYYfrB9mSM+cnmla4/uOZRz36iRUiEr85boSQUoiLpY+RzQ3lGzSay1h88K
         v8LUjrrf7/ofR18CFKu1gp9e/UDtq7r5n88HVLwI2B9P0Ih0fVzwQrqPjyKcjlWL/VfL
         0q3GvIgM2R0SljjwYbMdmht3gW1E/NFIamR16a9gD0iWddM0C5q45Rgr0060ECywBmhg
         8+yxWxDOviKhVJcXn+gmuNSVtNe5qTkSQANmVsNHzPe9///NtFN9BsjZgROC94wealGV
         apyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=n8tt1X/XNRe7aFLaZR20YBnC/FSbcWnSzPEOW7llULY=;
        b=RTsYiUjf/Utws1luuurFLbpZIxtO8EHAbdwu+X2Wwz4qDp2PTzVUkXZRGULQ/lKtUe
         U314a3Lbweo9svVLAjitDwx6/ZxCkWn4QQ96SYB5Y9uLxaBqqQB9he4tTMZTx3Rz6v3o
         dS69muDctiy5LyncnSB2C6atpqp67C1jb1G2kdq8e9c5WS8ZGV5CCQ1v7ecXjJVwahhX
         OdZLEMRsx3jH95tIk7DZP98mqVlJRltPIqYi1cyPVQAMhovIJeGL+dEwma/5N1LFyG4D
         zJUfr9SqpCt2zOv+guE53gF06aQ0AqmoOHXHV2sB9YazwyzNWjYJ0pqPBaQjYPz2qUeN
         QRKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zx64PtFc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id l15si410256otb.0.2020.09.28.23.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 23:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github.com (hubbernetes-node-34872bc.va3-iad.github.net [10.48.111.61])
	by smtp.github.com (Postfix) with ESMTPA id B34765C0024
	for <jailhouse-dev@googlegroups.com>; Mon, 28 Sep 2020 23:29:16 -0700 (PDT)
Date: Mon, 28 Sep 2020 23:29:16 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/d5f4ec-13c360@github.com>
Subject: [siemens/jailhouse] 017849: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=zx64PtFc;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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
  Commit: 017849c053d6deeb6c8ad73ba9c78dd4cbfe52b6
      https://github.com/siemens/jailhouse/commit/017849c053d6deeb6c8ad73ba9c78dd4cbfe52b6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

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


  Commit: cfa14c2cf25baf7362c8c17bccb870e25f9b92f7
      https://github.com/siemens/jailhouse/commit/cfa14c2cf25baf7362c8c17bccb870e25f9b92f7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d879ab5c499557bba37d265d700ab2f3c1731e66
      https://github.com/siemens/jailhouse/commit/d879ab5c499557bba37d265d700ab2f3c1731e66
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fe7b84e53f502941eff25689354e8c86f989959d
      https://github.com/siemens/jailhouse/commit/fe7b84e53f502941eff25689354e8c86f989959d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c9e53e144917df626cbea302c0c10d91d5ded2cc
      https://github.com/siemens/jailhouse/commit/c9e53e144917df626cbea302c0c10d91d5ded2cc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

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


  Commit: 3922f5f7d90792ff59c97bebca85e18e3b0436e1
      https://github.com/siemens/jailhouse/commit/3922f5f7d90792ff59c97bebca85e18e3b0436e1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

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


  Commit: da4d75195e260cda57429b5bbe94ea6fd4bd2b27
      https://github.com/siemens/jailhouse/commit/da4d75195e260cda57429b5bbe94ea6fd4bd2b27
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

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


  Commit: 2c6e24e8c416af70607e6c3316e087a03e1480c3
      https://github.com/siemens/jailhouse/commit/2c6e24e8c416af70607e6c3316e087a03e1480c3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bd276444603bf348041ffe04babacf1c57420881
      https://github.com/siemens/jailhouse/commit/bd276444603bf348041ffe04babacf1c57420881
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c

  Log Message:
  -----------
  arm-common: Improve PSCI documentation

Describe what happens around CPU_SUSPEND and use the official symbolic
return code. Also explain what is (not) returned from CPU_OFF.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4bf9cdd663a670a2faf7991906f3d1d7a159cc5b
      https://github.com/siemens/jailhouse/commit/4bf9cdd663a670a2faf7991906f3d1d7a159cc5b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c

  Log Message:
  -----------
  arm-common: Handle SDEI case in PSCI CPU_SUSPEND

When suspending the CPU while interrupts are passed through, we cannot
simply call wfi as EL2 is not receiving interrupts as wakeup events -
the CPU would starve.

Factor out arm_cpu_passthru_suspend to handle this case by enabling IMO
and FMO before calling wfi. That ensures that EL2 will resume, and as
interrupts are off in that mode, the events will simply be carried to
EL1 when clearing IMO/FMO before returning.

For ARM, arm_cpu_passthru_suspend remains empty as there is no SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 13c360e08dec34c916093f60cb2e5eb8a3c19947
      https://github.com/siemens/jailhouse/commit/13c360e08dec34c916093f60cb2e5eb8a3c19947
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-29 (Tue, 29 Sep 2020)

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


Compare: https://github.com/siemens/jailhouse/compare/d5f4ec3db4b3...13c360e08dec

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/d5f4ec-13c360%40github.com.
