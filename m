Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB2O75CCQMGQETRPNFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id D993339BA42
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 15:51:38 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id s186-20020a2577c30000b02905353e16ab17sf11785184ybc.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 06:51:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622814697; cv=pass;
        d=google.com; s=arc-20160816;
        b=OROSe7CehL1GxfQlk1AVsHvcLWhLHYf0/xwWbQkfI8cciZA255AQ+pH/M9NjuS3zfU
         N6IB8Hxsn2j3uyZU9Et3Pdlg92g3C4ubh8mcGZXJwjHlPZ8dQk917h93uFZhXD+e+F7J
         6ZG4xBgUNF0ErShhAcns+HCQXQuwHQm39Cflqr0sM1AHnjKT1Ppb3xh4K/umX5LKiKSp
         eTZoD0tzu2LW7pV4da4ulicZHMf1diAL/GQSmYaJpnbsEs65U/s0fzqr/E2der9wigho
         MIoO+8aKspH/plXY+CX8I71JXSfe/u5vTF5lMJ/i2XQ+yI4+52Focu2lIAUTGumrFp9w
         ru2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=3T3EtTTyGyj215T1hkPemktt2wjPiPonHXfHs4RHYic=;
        b=K9Qagtk5jT2xLXVo5iCBv0oZuK10MO/qogH3t34RbSz2X5pHhCE/ENj8nsXat/gim6
         u0wpf1j+cT7MkYb8W2+KvE0szLiAJv80Zo+6xoy47vKJrTVJ6qI1h8RVp/msl2Y6JfNj
         H/43YSjhpJVTFKYm35y8dVXnamO0Myp2f1DGu3no+TGR5IcF3HsCXtyGNm572OBPeKdS
         6Pu+p43PEUDxEKC+z6CfeZ0CNX3piXW4xa47tgRLZvWnxEl9Lga3eA+wxTx8X+JFg8R8
         phnPGifryyHtU06yoJFdAOZeZaX3hR2Yhj7ec2CZ2DpG9vftWrCyb3GHhxXa66S7JrCj
         r9Ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=gF5UdBgo;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=3T3EtTTyGyj215T1hkPemktt2wjPiPonHXfHs4RHYic=;
        b=afJytxdWFnxU/c0DxBW5ui/LrqjuW/a7O/89MR+VudKM650QJ9zrv9ZUvouyc2nhbR
         pcXmvORNTUxTPd1HaPxP5s04ceqLNNSDx1LhG19ZTsBiV/D/mlLuZ54ZhxstMU8wFwV1
         w2b4aRkQ2fgPUiirkf17ZMOg5LP73+TWDVEFdYodkpXj8wl3xsIhZOzycki5oa8hKh1K
         mTZMIgDuj2iM8btZMX8x+3UZ5xb6dCmduJ0zY1xdoDluwjlq6PJQTyxocCIfYebzxocD
         wvtEqoAHX4SPkGtRLi2eEMvrfz+xRKxFj0zK48W5/N5Se20BHNtwgwGZTgX0ACR1+2bh
         1O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3T3EtTTyGyj215T1hkPemktt2wjPiPonHXfHs4RHYic=;
        b=ni2LzUneEOCebemdd1d7E0p9cHhFUW9olkoyLwbe26td3f1TYPGYgFruWbB+K7oHt/
         j8h7QdwVUcqFIAMaEH8I7jXecwBkY+KZL/563up2A/QkfyEZg8PSonNObdERT76rEjX4
         FwfjGMTomoDhf3HDm2zq6z9uOhG9OMqyUbPDfAEJhwEXAEubsBMkVSf9ZYWWol61oJRK
         T/rSn2aHy1SBjR50cOBlSV+jmdDixxxc/jj1rZMLrGz7w8OO1sp2HUHRdMcGUC1tmpPY
         5zcu9kqSEztVIuqJrr/P0XjlG1sxOgvyIgyrd4PFkLz4xKs76T8QWVWQ38CU6qQOsgJZ
         2PPg==
X-Gm-Message-State: AOAM530yIE6q4Hk493h5YZuhMsZbIADw6+u/sy4a+HMDIhnODu8ILt3n
	LS3kavXBy0Fjtone0etcdyI=
X-Google-Smtp-Source: ABdhPJxaGLQ8HL+4X+y9foYNskNRtFnbVSKbQg4BMZWMz48Mi7CfFb2M9x1bhxj49m2qPZk9DB8gIQ==
X-Received: by 2002:a25:8093:: with SMTP id n19mr5492871ybk.414.1622814697629;
        Fri, 04 Jun 2021 06:51:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bac5:: with SMTP id a5ls3979800ybk.11.gmail; Fri, 04 Jun
 2021 06:51:37 -0700 (PDT)
X-Received: by 2002:a25:e911:: with SMTP id n17mr5551428ybd.101.1622814697024;
        Fri, 04 Jun 2021 06:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622814697; cv=none;
        d=google.com; s=arc-20160816;
        b=zNWch5j75MlbYBSdRA2feevSFk3GyDjTHvzdEI74y/eIbGQ63kj/Pm3P5jKzeCsSH1
         eBHN8MGoAA5E2Fsvq1fM12GXz78lAAEx70Sa8wkM8kbx1Bu/YNvLlDdVWGA511nZc5zY
         uk8UwIiYfm+UWrKNy8yhDqLis9Oq42kFzi58iF74HU88yC5o4thIkCoKSy6Ayk4H1UOp
         k5aaAn65Zcn4YSGiVZa9ADORUPNjaW0LW5ytRKFX+UGe1GK2LlwNuOZJlj0miHDFoIpN
         IxNc5wwDFajmk/KSWgIM32dMc14k1LXh+Av4cJ5M3G0UZ8lzTyR0JsziRusP9rv0suMy
         uE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hvbhsrbeLCrbC/Na9vdEF+DnCSdyO5lBP1FRp5C3zPA=;
        b=luOlPsqZmLIZ/5dOiAi8vP2ceArVWfaCPmKyaGQ74q8NDoOzEaDqT3gQ/Ra5RzKcTY
         lw8thtN6wsDyDU4L4WOK6KHd+G4amy42a9IKg/xxvb1jGs5J/+XrarqpLxOIX2SHFMJ0
         JLwWg37tU5D6R9fPCG64f92xVxW4X8cCM5ryVm5wCUYUKwXCzOy2mnHQ64kMwbU133XT
         7q1hd5YT//n/14rnHkYhQYquploV5dyyDvmi/n+GSN2/KLLSQa+Pi6fYDbu2vdukwl3N
         F/XOrGyVVXukIvTaDnm9/duA7/IVasxEigxGeNLW3qssaUSV2MunbsfWeNpNVg95MMtq
         VVOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=gF5UdBgo;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id q62si688293ybc.4.2021.06.04.06.51.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 06:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-0a18f51.va3-iad.github.net [10.48.206.65])
	by smtp.github.com (Postfix) with ESMTPA id C3A34340E2E
	for <jailhouse-dev@googlegroups.com>; Fri,  4 Jun 2021 06:51:36 -0700 (PDT)
Date: Fri, 04 Jun 2021 06:51:36 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/6c0978-6d9c51@github.com>
Subject: [siemens/jailhouse] 49b3b3: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=gF5UdBgo;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 49b3b33c1338a59fd333c69fffbff813990f8042
      https://github.com/siemens/jailhouse/commit/49b3b33c1338a59fd333c69fffbff813990f8042
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: 68e592b1f315172b707e41ec3c6ac1ca86419771
      https://github.com/siemens/jailhouse/commit/68e592b1f315172b707e41ec3c6ac1ca86419771
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
      https://github.com/siemens/jailhouse/commit/839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
      https://github.com/siemens/jailhouse/commit/275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 467e6524fd2f2f58ea11fa7966695cc9d4048bec
      https://github.com/siemens/jailhouse/commit/467e6524fd2f2f58ea11fa7966695cc9d4048bec
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: 4d41e47391385220c796aba6728382a5a37485f0
      https://github.com/siemens/jailhouse/commit/4d41e47391385220c796aba6728382a5a37485f0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: 482b64b129b5506065095d4e76165bd53ee87d9e
      https://github.com/siemens/jailhouse/commit/482b64b129b5506065095d4e76165bd53ee87d9e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: 31b3017324624b02a6731d9a5c6194208e7b3e3e
      https://github.com/siemens/jailhouse/commit/31b3017324624b02a6731d9a5c6194208e7b3e3e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 03d07e0f703987b8437969caadc30916aa0f9cbe
      https://github.com/siemens/jailhouse/commit/03d07e0f703987b8437969caadc30916aa0f9cbe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c

  Log Message:
  -----------
  arm-common: Improve PSCI documentation

Describe what happens around CPU_SUSPEND and use the official symbolic
return code. Also explain what is (not) returned from CPU_OFF.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f97e8528200c5800a0a2e24494b2451592e1453f
      https://github.com/siemens/jailhouse/commit/f97e8528200c5800a0a2e24494b2451592e1453f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: ee0e5c42c9baf1389481c372693cd8fab0e1cb88
      https://github.com/siemens/jailhouse/commit/ee0e5c42c9baf1389481c372693cd8fab0e1cb88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

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


  Commit: 6234762737513985d5de14d860773ca3257f858c
      https://github.com/siemens/jailhouse/commit/6234762737513985d5de14d860773ca3257f858c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: rpi4: Move RAM reservation down by 256 MB

This is needed in order to switch to upstream 5.10 kernel. It refuses to
reserve the formerly used region, apparently due to conflicts with
pre-existing reservations.

Beside adjusting the cell configs, we also need to update the inmate DT
because it now has an overlap with the physical inmate RAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9850d614a2fd97c902dadef4d20217e17ace24dc
      https://github.com/siemens/jailhouse/commit/9850d614a2fd97c902dadef4d20217e17ace24dc
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/ls1028a-rdb-inmate-demo.c
    A configs/arm64/ls1028a-rdb-linux-demo.c
    A configs/arm64/ls1028a-rdb.c

  Log Message:
  -----------
  configs: arm64: Add support for NXP LS1028ARDB platform

Add root cell, inmate cell and Linux demo cell configuration files for NXP
LS1028ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d8076d8bce49842558cad154b43f6f5c59192bc4
      https://github.com/siemens/jailhouse/commit/d8076d8bce49842558cad154b43f6f5c59192bc4
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1028a-rdb.dts

  Log Message:
  -----------
  configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform

Add device tree demo for Linux inmate running on NXP LS1028ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ecd3cf0ae00e3dc3e122b730f53752180df9393b
      https://github.com/siemens/jailhouse/commit/ecd3cf0ae00e3dc3e122b730f53752180df9393b
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-imx8mm-evk.dts
    M configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    M configs/arm64/dts/inmate-imx8mp-evk.dts
    M configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  arm64: dts: imx8m: add pmu node

Adding pmu node supports to use perf tool to monitor the CPU performance
of the inmate cell when enabling Jailhouse and running dual Linux OS.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d22033b6367bedcc2890260fc23be3d5934df95b
      https://github.com/siemens/jailhouse/commit/d22033b6367bedcc2890260fc23be3d5934df95b
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/uart-imx.c
    M inmates/lib/arm-common/uart-imx.c

  Log Message:
  -----------
  Check UART UCR1_UARTEN bit before writing data

There is frequent start/shutdown operation in kernel reboot process.
And at the end of kernel reboot, kernel will switch to use console
output,saying imx_console_write on i.MX8MM.

imx_console_write will save/restore uart configuration.
However before imx_console_write the UCR1_UARTEN already set to 0.
when restore, it is also 0. Then when we runs into jailhouse
disable, jailhouse write to uart will trigger hardware exceptions.

So let's add a check.

However to hypervisor itself, there is still risk that
kernel disable uart, whenh jailhouse is going to write
data registers even with this patch applied.

There is no good way to avoid such contention,
the best way to avoid such issue is that
use a different uart from Linux or remove
`.type = JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.

Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means
jailhouse hypervisor will not output to uart, but you still
could see jailhouse log by `cat /dev/jailhouse`

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
      https://github.com/siemens/jailhouse/commit/8a82d38ee12c3ab64b0cc95bee35a74ac9bdd391
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/control.h

  Log Message:
  -----------
  arm: gic-v3: not overwrite interrupt settings needed by EL2

SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse and
must not be controlled by the inmate. E.g., we allowed the inmate to
disabled those interrupts, stalling Jailhouse on management operations.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1423b55d303d0f27b97b0ee223a451c3e50cda91
      https://github.com/siemens/jailhouse/commit/1423b55d303d0f27b97b0ee223a451c3e50cda91
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c

  Log Message:
  -----------
  imx8mp: support virtio console/block

Support virtio console/block, the reserved memory
has already been reserved in linux dts, we reserved 2MB when
initially support ivshmem which 1MB is not used at that time,
but now the left 1MB is well fit for virtio console/block.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8f4aebd7ae665dc8011dc7070e8f978acb0de55
      https://github.com/siemens/jailhouse/commit/b8f4aebd7ae665dc8011dc7070e8f978acb0de55
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M configs/arm64/imx8mm-linux-demo.c
    M configs/arm64/imx8mm.c
    M configs/arm64/imx8mp-inmate-demo.c
    M configs/arm64/imx8mp-linux-demo.c
    M configs/arm64/imx8mp.c
    M configs/arm64/imx8mq-linux-demo.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  arm64: imx8m: correct pci domain

After linux moved to use linux,pci-domain, we update to
correct pci domain here to use a domain not used by pci hardware.

i.MX8MQ: 2
i.MX8MM: 1
i.MX8MN: 0
i.MX8MP: 2

Working with NXP vendor tree is 5.10.
Upstream tree only has i.MX8MQ pcie, since 5.11.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87aa37d4236dedd81c1c9219ef3f5e6713d42d52
      https://github.com/siemens/jailhouse/commit/87aa37d4236dedd81c1c9219ef3f5e6713d42d52
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2021-04-17 (Sat, 17 Apr 2021)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: avoid overflow in paging_destroy

It is possible for the ending address in paging_destroy to overflow to
exactly 0. For example, in a build with 32-bit addresses, a request to
unmap 512MB at 0xe0000000 will result in an overflow (0xe0000000 +
0x20000000 = 0x100000000 which exceeds 32 bits).

This overflow can be avoided by comparing the last address in the
region to be unmapped rather than the first address to not be
unmapped.

Fixes: 7cffb9b7d54d ("core: fix hugepage splitting in paging_destroy")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
[Jan: tweak comment to address also size == 0 case]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 95cb81c355584e2a6a81b5d42154f4c7555d7644
      https://github.com/siemens/jailhouse/commit/95cb81c355584e2a6a81b5d42154f4c7555d7644
  Author: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
  Date:   2021-04-20 (Tue, 20 Apr 2021)

  Changed paths:
    M inmates/lib/alloc.c
    M inmates/lib/arm-common/mem.c
    M inmates/lib/include/inmate_common.h
    M inmates/lib/x86/mem.c
    M inmates/lib/x86/smp.c

  Log Message:
  -----------
  inmates/lib: Add zeroed alloc, and update usage

Adds zalloc(size, align) which allocates memory and fills it with zeros.
Replaces usage of alloc() in inmates/lib with zalloc().

Motivation is that use of alloc without zeroing mem.c:map_range()
results in illegal page tables if memory contains artefacts.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0ba79023af9084aef86003c97a91b705e3a7c5d
      https://github.com/siemens/jailhouse/commit/e0ba79023af9084aef86003c97a91b705e3a7c5d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-04-26 (Mon, 26 Apr 2021)

  Changed paths:
    M tools/jailhouse-enable.8.in

  Log Message:
  -----------
  tools: Fix mistake in jailhouse-enable man page

Reported-by: Dr. Johann Pfefferl <johann.pfefferl@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
      https://github.com/siemens/jailhouse/commit/6d9c51d0bd819689c00f6a3c38d3099f6eb9c657
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-05-21 (Fri, 21 May 2021)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Make sure to include VGA MMIO region

The VGA region may be listed under "VGA Bus 0000:00" for built-in GPUs.
That currently triggers the filtering rule "no empty buses" - which is
actually not true in this case. Make sure we add that region
nevertheless.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6c09785cb079...6d9c51d0bd81

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/6c0978-6d9c51%40github.com.
