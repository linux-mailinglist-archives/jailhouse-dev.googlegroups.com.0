Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKVGZL5AKGQE7AYXSBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF525E1E0
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Sep 2020 21:19:08 +0200 (CEST)
Received: by mail-il1-x13a.google.com with SMTP id o1sf5535207ilk.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Sep 2020 12:19:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599247146; cv=pass;
        d=google.com; s=arc-20160816;
        b=aC4tm9pgqqdR64mqirc2Eu8aw5KK+n8HBBWPP2jVmoxptn9GMwXRMEQ4chmoN4BG/e
         uILI/AitEEj+KY55703S+EalhMk80Zh1I9q8Wv2y9bNIFnJLrkMfUyPFXXnQdApwOdsf
         WbAl6RFSjMn3yd/JpHsvcvHtx6U7Idknx6urmmNkRbLJG1g5YlJw1NlAotLr4oG9vkF5
         73TnbzEeOHDukQ2+bOTA48Tqi+4Y7q4VFX5LvIRTnKBVJGyVv74osQJteYnP3UpoqS/2
         JVhlWNzHXLR14mn18Iojm0N/CymT+64WiKDL8TUWkJ1Hyi2b7QhC452AQsrmNtBAFGBv
         EHLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=gR2ZJLeMJC0z1G+hWWC+JWgv/y1ewmXYXEgAVYDcje8=;
        b=Bc1J7Ht/5J5J3dotqEqaosZtmm8QT5EjcutoVrZmwptTD+ePSzue4a9HeOmxGJgpcO
         e5A4xlOiX5zh9OxPt1s/+awyCVj56PUtgxyQeB6bmTYY+C0B0EuGkA7oPFWXuswk1aRx
         eELqY/MoN6ia8+fGE1yz1SckrzQn5PKLMPebLqt66GuF6vCj2IphB3uTa+0vqu/IExlS
         3H8bhbhgElt/2XrfydRnp0VJCEkFDhgLLX+OqLGBqnTPV1n8nNZI+Oq4JjPb+u3Q0NGy
         By2sP66cQaPQwRUqktBESsd7PT8Fr9er62Q7Sdb5FZIG0HyoykwxZdhDj7vT9MHf6S0t
         mSaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ptIKCiOd;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gR2ZJLeMJC0z1G+hWWC+JWgv/y1ewmXYXEgAVYDcje8=;
        b=eup0UkCbIqO3Wo+eJ5b6ACQ7a63OTiikctHHOjs1qzDpRNSvzVri99R7KJ00ZFBMll
         V9jD/5Re11GUq7hxV1L5ToPWaiOidXzhf/RKC6kFHxH+n8zgqeddrbjNOspvPFspq0ng
         rYx+bv6gL+Cqerz2njm8BwCnmt1lN1BGS3Rhh6McT7bLWWlFKW4MAPIUoam3cHjoBNMR
         3tcIFEngBDWkYyXs6gIsFsfVnNTyixNj3YO9sET2f+ZCyrZirMGbWx9pacLIYIV/83QN
         MjEYtCFPlkwPnXt9YvmlXBwMjyY5yZsqGU/oegiti/i2ZPrdvFgawDt49xa/+SU3iFdU
         FgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gR2ZJLeMJC0z1G+hWWC+JWgv/y1ewmXYXEgAVYDcje8=;
        b=ttc45a+CmfwQpkNtlqyrGmomJ6Z2fWuxn613poFHNc1Xy3AOcTzK4nOCHinp8BaJ66
         3e41BNIjlTs4XyliKoZoihkrCRt4eK7yGADDPoCnIhEJavaa/DeDtb+D0As6g3EBv6IZ
         nZl7uQniBJHMHNmR6aCHobNQQGokL5NRToWVa7DDCJBZPhcC9PeItPO/p0XC/bKHQ3vm
         Up+lYuJXDrlKnGrmdwrSoDhjh5nGua0hTbQri7eCYTzbcKrb4wsRTTM0VDfiJLmz9/NR
         ydPtUqktZc3xMipGCeY4DY5FwefmDnrdnw+FV6dWvUdkh0m9fQyu36+0C1lb7Fo3Oaqz
         m7jA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533XKlZ5GwAdVQnNNsTEx3lPmdd7I9IVSKLSpDP7ChYM2VlqqCSu
	NvSgs2nZRk/O1db3+3uKcU8=
X-Google-Smtp-Source: ABdhPJzRhIWD7tIFu9L5+2Gm8w0PvF2O/wm2pM1RDCaPCSYXb9eTCND7t+WXICoLyY2ro0ksHhPmfQ==
X-Received: by 2002:a05:6602:22cf:: with SMTP id e15mr2181025ioe.114.1599247146619;
        Fri, 04 Sep 2020 12:19:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:f702:: with SMTP id k2ls1754631iog.0.gmail; Fri, 04 Sep
 2020 12:19:06 -0700 (PDT)
X-Received: by 2002:a5e:d514:: with SMTP id e20mr8673600iom.183.1599247146122;
        Fri, 04 Sep 2020 12:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599247146; cv=none;
        d=google.com; s=arc-20160816;
        b=es4ZqsREh3pXd/WOjqFfCIr3LAva6EmOzY32Pln3UReZx8nho6J61w1VPwFnGxVZEt
         Wtgj9mbcvuUBWu2BSrbsBPU113pr7Rxp8bT2EtFsX5P6j3Y6nZiLJkRz6Xu/Quv8+/l/
         MzWRFGLzwmPUlpA9vTe0mkgI1IXR679Rgxk134umYpIynmcqBkG8r2UT9iXmsb7On9oT
         b1Lyf7oyRq3IfONIdzLGEKjZ+QvBJCx6YeMpgqDkr4ufkDY+0s7Pxcdwx6MqAMNiZepi
         hM7+iP1VchvtFaD0KQlsARqIHblYYlXVQWiQjsLdt63FjlIsNWRdj7hSZMmGDGNbhk7e
         sc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=JJH0J8DJHDF/Xygz2kZRAWayFJ/Vdn85tVGfZhhXNMk=;
        b=nXWMKho/ArAvyhCiZY1eQlHdGPg7v4S7ONTqqnzCF1dTI2hOnT+GT2iTIE+L+XAQTb
         1F+UogljabOosd6k5IAaEMLnpfku0asOHBVxvmYakuG58gNeXp0s7a4ZL5CJKhU9yqgB
         jUCyIgR4zgsv2lEyomBdbUcNtRIqH0er1lnNGd2yK4VQ6CC9+KiZDvl5AHNM4lZHipL9
         0sjxiBHQJc6T9U6QkP1CoFmmY9UWU6tRkY1O7/xvMcIUiAGsNsq/RGiJBJwDQWD3QbH2
         /yYiSc4d9WmT0a2QUEzAy+2/anpbMxwNSKdoYXNbUo7YwzMySNx3TEz7VorGHuQ240j9
         RRrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ptIKCiOd;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id m2si552345ill.5.2020.09.04.12.19.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 12:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github-lowworker-c53a806.ac4-iad.github.net (github-lowworker-c53a806.ac4-iad.github.net [10.52.23.45])
	by smtp.github.com (Postfix) with ESMTP id C18B284007D
	for <jailhouse-dev@googlegroups.com>; Fri,  4 Sep 2020 12:19:05 -0700 (PDT)
Date: Fri, 04 Sep 2020 12:19:05 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/e0ef82-980614@github.com>
Subject: [siemens/jailhouse] 93edbb: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ptIKCiOd;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: 93edbb6275fa649b061b09ba9c292a0cfde18d16
      https://github.com/siemens/jailhouse/commit/93edbb6275fa649b061b09ba9c292a0cfde18d16
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

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


  Commit: 4c3c2f91cef0bcda2f877028a039392ebcb8a931
      https://github.com/siemens/jailhouse/commit/4c3c2f91cef0bcda2f877028a039392ebcb8a931
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 888df7aab8e3af1882d8417525aff5032b329662
      https://github.com/siemens/jailhouse/commit/888df7aab8e3af1882d8417525aff5032b329662
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c2856efa9f37bfa9f266bec6aad543fe07f8478
      https://github.com/siemens/jailhouse/commit/5c2856efa9f37bfa9f266bec6aad543fe07f8478
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 80a69b1ab40cf8849e00ae9604d880c4b5903efe
      https://github.com/siemens/jailhouse/commit/80a69b1ab40cf8849e00ae9604d880c4b5903efe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-02 (Wed, 02 Sep 2020)

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


  Commit: 60a12f2d2539c78131722d3f91aeb940f76a4555
      https://github.com/siemens/jailhouse/commit/60a12f2d2539c78131722d3f91aeb940f76a4555
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-04 (Fri, 04 Sep 2020)

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


  Commit: 5534d769abb42e33a3e1d4e758c350e6935ec083
      https://github.com/siemens/jailhouse/commit/5534d769abb42e33a3e1d4e758c350e6935ec083
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-04 (Fri, 04 Sep 2020)

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


  Commit: 884a9103eaa3f945705b0d1ad9e1a07fef276dcb
      https://github.com/siemens/jailhouse/commit/884a9103eaa3f945705b0d1ad9e1a07fef276dcb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-04 (Fri, 04 Sep 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 98061469d04eacbb764511d3424ba7f866247347
      https://github.com/siemens/jailhouse/commit/98061469d04eacbb764511d3424ba7f866247347
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-04 (Fri, 04 Sep 2020)

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


Compare: https://github.com/siemens/jailhouse/compare/e0ef829c8589...98061469d04e

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/e0ef82-980614%40github.com.
