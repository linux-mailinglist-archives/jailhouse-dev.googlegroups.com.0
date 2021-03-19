Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ5G2GBAMGQE35GC5VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C234169F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:53 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id o21sf13072802lfg.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:30:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139048; cv=pass;
        d=google.com; s=arc-20160816;
        b=n6eJzGeB4IdtJ4eVpobsS0kGVqhHu1ekIVyzZA2rLYEMQUJTNDGRggMzdYTqsfYTSi
         f39SvmR/8Qj/qFZilDiS2WptBMgPjI2OW4+N8HfK0fKhjXRY8LN7hpu5Aa4v6W0OxHUx
         Iv7aMP7unIaUQTUWbm8EGgRm6NzJpwtqJwD/5lqh3vXwYycPfWX21f7rD9mNc/0f9dns
         kghep06WqaICpTSl/n50r2VM+GNelz318vV0DnowdcKRKVv/lTAkB8wMG3qWgfuTw2xQ
         5Rpgw8ViIi0JdJ0s+hY4xILl/P6lEHvyufOwGgKGRkn3IAwuUQ35R1OwYM3WziU94YeM
         odEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=iaKux+mwWFz63Cr6RKsQH9OPfMhO5C4v/CAo6vq7PW8=;
        b=irW+0vhZ/ChMiKwrGreXXGBMdiM2bjXXFabE5OFcAd6ZYvpUNVX4kUOrNTTJLedMZd
         QPE3B5i5bQlO8zkn3vXWNe7i6Qzcn0cddGmmx0DiScg6FOjVYgPqidWNGftLDUMruHji
         bMygJBY3EwVKLjEEeBUzSSsD3LX9j3usQ1k7cC2UtGfdC+Dt/uaV111aLkTN7Hvynz3n
         FZDpN3JzlQEiX8a7NcZKwCJEK34KyQgyVB5m1TxMP9rLqUu3BngqsDfPMJE83d6iyC3H
         gdtTt65/z2iFgDejVAy1mqaLZuadUfAmXQ70h3DHgtOyWrr5p3AuRuI/VDb0B+sUxCfa
         GOOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iaKux+mwWFz63Cr6RKsQH9OPfMhO5C4v/CAo6vq7PW8=;
        b=cAbaHLOzXYVdfXhR/oR08EQV6StjIczsFfzfxgy2+YgkQJL5IPyKtDkYLAygmWPit9
         SaF4g45VdACpbVoWUSJW8fxP18PkFkuUnBS6CM66mscVmdlqpVoSUjUydlc9vuxQJy6A
         /uxpKlfGjx38Xq7N+/QTshgPL1j/FDITU4+VKzCP3y+fFKj2PXSc1HlLOvfxJnPdzJEf
         HOKnYgJr68/H7x5e/8wIx+j1obEae82JVbyJivZvvCiyQCIFPwgPTKKqVe8nN+eapIjX
         F8m3y7DrTzLyaUuQ37ht/bZNTWGXVtzxP9A7GIe4VQN/7SDxIGb3b0ys40F9F/2yGvPo
         dDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iaKux+mwWFz63Cr6RKsQH9OPfMhO5C4v/CAo6vq7PW8=;
        b=AG7Po0i7+VZNEseqBtGqYfYhCFq6vY7qrxshRsaqnikT8TW3SBw/LFc5HcwFRJaO9f
         fV17YXob+pf3hiqRWhh5XVHkbXPo664s4B+NXgOt4nV7aVgDiupaUmX2FH8aoIR1lw5/
         BP6sS1CEhkbHHwfApL63relcK8Rjs57aFV/K58Sjf1HQVBZ9063TuZL4NxSYC9OxDvNR
         JmLG9xbD6EYd9XddeAsFJS+xvviCDhliHVt7fbx4PKBqqD/O/oVAM2jYFJd05vwh+dtQ
         JYerBEsvEu05R/HiOhvg+FzFT0Xm+JpNKhPA3VZlTB16gmzGbrRmsTzoiiqpZlHO56ck
         z7Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nMk6y2wWUt2MBiN/ibO9zobFIHcoRdvx0TnpB8sk6tYxdkP5O
	Z24TT65nmqHKTsSc7waQPZ0=
X-Google-Smtp-Source: ABdhPJwaWc1tapDhD+MhwCUEhUkH5yINx7CNhjy4gjcQGyHaMXARr0bbv8wTLyzUL9vHzoixy/hd8w==
X-Received: by 2002:a05:6512:ad0:: with SMTP id n16mr29724lfu.205.1616139048129;
        Fri, 19 Mar 2021 00:30:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls3690862lff.1.gmail; Fri, 19
 Mar 2021 00:30:46 -0700 (PDT)
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr37612lfm.25.1616139046688;
        Fri, 19 Mar 2021 00:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139046; cv=none;
        d=google.com; s=arc-20160816;
        b=XdYa5CXhK/s6JJ0xfa5imMxSlqY/XS0T27WjOehlRE6kTxsnjduF/HXmqJ44EmDcx7
         2vsmoYy0elr8k9wOlqjkD/MB0pmmGFDoU3TDSn9Z2aVfViMNohw8LdOL6vaosIlJ8l9P
         E8V9+KYlrSB6OJsMZQc260ZxU13SB6/v2lZYyAKTFOOoyp3D+IdM2rWVJmqLGJBWOL9J
         Lnyl3SVN0HCxZdZI58nFXr5+ZbqYDzayPtuflzUGzGbFo5xkkbifXqwQ6PI8gOgzcM2d
         H+2FIV11ryOVM8Fv6qbAVHrZP9B0GPPR9nIoxinhoJHoYFWHJ+fRmEUNjhIGXUq559rg
         MJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=PMjlsA/V3SjreWU7Bobzs5BxYKrcInJoFZ664gf8qdk=;
        b=F1kHJ2/GJtVtdVWpnVsi7WSlJX8D7MobDYPq6TOj94Sbte4MCE+v6+2KH+WP5VUgnw
         FPp/2rogNe3KNYs9J8uJtdMknd5ncQkQr7uow3+OJaTZKdiNNQPoEadbFNFJ3QL//Djg
         X7HXCGyN4dmaBd3X4oDUK3h7UKpndCmovEEhTw8HXo+4ws4GZZS9WXmshwhVT2vhTHpl
         EtymtRcw5g1DxlcJvr6v9/AllXvloHI6sNoH7ioSoayIEEiDUIfTLdLpoJDszAbcA0QF
         5Bh17ZyOY+eDQM92PUffmcJGNKVAgPhFfOpE3559swR0c0hCtWWPTlQbrl/xk1v3yt9U
         decw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v26si193327lfo.2.2021.03.19.00.30.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7UjhI017215
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:30:45 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjBw004384;
	Fri, 19 Mar 2021 08:30:45 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 00/11] arm64: Enable SDEI-based management interrupts & zero-exit guest interrupts
Date: Fri, 19 Mar 2021 08:30:34 +0100
Message-Id: <cover.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Bring the long-pending SDEI extension into mainline. This allows to
generate management interrupts via the firmware provided Software
Delegated Exception Interface (SDEI). With this in place, we can pass
the GICC through, permitting guest interrupt delivery without vm-exits.

The feature requires SDEI support for the given target, and that is
currently only available via upstream TF-A for imx8. Patches for zynqmp
and QEMU are to-be-finished/submitted [1], other targets could be
enabled similarly.

Jan

[1] http://git.kiszka.org/?p=arm-trusted-firmware.git;a=shortlog;h=refs/heads/queue

Jan Kiszka (11):
  arm-common: Reorder gicv2_cpu_init
  arm/arm64: Expand return type of smc helpers to long
  arm/arm64: Add further smc helpers
  arm64: Reorder arch_cpu_init
  arm-common: Add SDEI-based management event injection support
  arm-common: Pass through GIC CPU interface in SDEI mode
  arm64: Add SDEI-based management interrupt handling
  arm64: Do not trap interrupts when using SDEI
  arm-common: Improve PSCI documentation
  arm-common: Handle SDEI case in PSCI CPU_SUSPEND
  arm-common: Detect availability of SDEI on arm64

 hypervisor/arch/arm-common/control.c          |  9 +++-
 hypervisor/arch/arm-common/gic-v2.c           | 52 +++++++++++--------
 hypervisor/arch/arm-common/gic-v3.c           |  6 ++-
 .../arch/arm-common/include/asm/control.h     |  1 +
 .../arch/arm-common/include/asm/smccc.h       | 19 ++++++-
 hypervisor/arch/arm-common/irqchip.c          | 10 +++-
 hypervisor/arch/arm-common/psci.c             | 13 +++--
 hypervisor/arch/arm-common/setup.c            |  6 ++-
 hypervisor/arch/arm-common/smccc.c            | 29 ++++++++---
 hypervisor/arch/arm/control.c                 |  5 ++
 hypervisor/arch/arm/include/asm/smc.h         | 16 +++++-
 hypervisor/arch/arm64/asm-defines.c           |  1 +
 hypervisor/arch/arm64/control.c               | 11 ++++
 hypervisor/arch/arm64/entry.S                 | 18 +++++++
 hypervisor/arch/arm64/include/asm/entry.h     |  2 +
 .../arch/arm64/include/asm/percpu_fields.h    |  3 +-
 hypervisor/arch/arm64/include/asm/smc.h       | 37 ++++++++++++-
 hypervisor/arch/arm64/setup.c                 | 27 ++++++++--
 hypervisor/arch/arm64/traps.c                 | 10 ++++
 19 files changed, 230 insertions(+), 45 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1616139045.git.jan.kiszka%40siemens.com.
