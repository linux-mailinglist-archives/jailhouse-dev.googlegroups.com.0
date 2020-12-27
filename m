Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTGLUH7QKGQEVPUODEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9482E30B5
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Dec 2020 11:45:34 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id v15sf4403138otp.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Dec 2020 02:45:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609065933; cv=pass;
        d=google.com; s=arc-20160816;
        b=AfsnPoGaJlco3XgQiVS55R6Y8D9CZL4++NEfJe090RwHLMh9roKRvMnbF60bVaYNGq
         Xph3tabz/3wvHgo9+p6yJzTFLJSUBC8ghrgpnHdihjhqYVUsc2vc0vrpCQisJwf1L6so
         T7ELousZ50IfdAFtr5Yvu9ke6Lu7Yqiromy4VLLk9x3DH3j2xwNxSIVVqTYQrw1XZ1hL
         XfNcepHOI+Vfe2kIeuce2NSgJMvVhvaivYaOPYTut7yGzUA5zvSD9BMn9er7LHXFlHvE
         LXcNBDT89OJOiRGNyT2Lvxxet+lEnY14c4gi9zKFA+K/IzPH05cB9ArXcHA/IlL5kBtW
         Wjag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=vD3f3zoGwUtWnuetTySjy8srR1bwHbSIc6P1TBtEK6Q=;
        b=pFLDPnSXY21R/RD2HcDuGJ0XX7pLEqz95Xduyna/VnhnYuTW/jVoSnsVTU1HVc3wQT
         /FucFOXeNfRxtCtV4UdrNshH4XtUaxfajSOzouBVQQ2C3IMGJa3QdG9o5vSfgmqHD8L5
         YjucBIv89n/uIrRCMabErrVKs+DTegTpDO1Yw07T3cH3cacwrxzGvYcUyLIG2B5iXB7u
         8xZ4HxAejfiT+5kCubBq/V1R6q2x2+sDyOP9d8Gb1G6PGwrf/YHSdHNt51rPmo+lt0s5
         ff3IiuEF+IFbmVrot0xeWSTmVOxeKczzaOZ1WxT/O/3SoSBP2bvNST0KeRZ26HVSOqjQ
         gw8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="q4bLo/fo";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vD3f3zoGwUtWnuetTySjy8srR1bwHbSIc6P1TBtEK6Q=;
        b=bm9fkdFdEiD5Cg/OSTApGxnJfErq2Dsrj8XvfZew0WZMAei1aqGwfrvfLKXZerPizc
         T3WhRioQlx5V4YdiKPJC3Z5NRUBmVSm/nAxfpAoJ8wZx2sx+NcZQdxhdbYri4uHqPPmA
         0CfFvFOm2KqLFqxRmVpqHlwmw1q/v7O+zL+dEliGUwmcTH/JPGTadelpSActjZM8tX6E
         MT91woA9RCT3CrckiR5WoG5TjkTNxVxq4I/XX37z5qzkqijYeXIbmlQ7VdNFH533yZuJ
         u+zHGRjK1plXUyujTywaYmI9Ejo+iwF4mMvoZASP/XKqhajM/n+YL55cMwRF7iwNnX7Z
         SCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vD3f3zoGwUtWnuetTySjy8srR1bwHbSIc6P1TBtEK6Q=;
        b=jxlhlcWjV7bNRfGjp4ufAa7UKzB19Rac5667U08eEfVyysvKWhjX6bVriXYkjJO+GK
         xndY14nxvs37UP5nblqE0Q05OHhBFAkfM1v1dMfAEmSIKBzdcyMHh9ExnHud22LFgoM3
         fwLU4zlnOEgT9ovOk/vLlS5sC6F9TI8NZcB7+Y2FQZSQLpoN83Wi9OFLrRbTCsM+aeTJ
         OhWU19NciSjR86qhCwenAsqb5knCKhPHZk0WKmX1YMuK5fmfaXJq4H1i9HETG+3b0Kd9
         nt0a51B7PdPWZ84AnDRjvDzUsAjh3u2jspUHRS9Y2jD6mX6H/FR4kSlXEu4FCVpCqiwb
         oIjw==
X-Gm-Message-State: AOAM530W2Efm0ra57gu13G4Imxej4dKPpsNxmWT6jV1JcyK2R9NC5npP
	BBZudLm/Gm59pSyKyZ6RVLk=
X-Google-Smtp-Source: ABdhPJydAYyh2NQKCT7nIOL3Rmg/oX4ND2PqmKCDS0ZZvF31+DZoml63n4SwaVUOKg9ZWGtzrfEiwA==
X-Received: by 2002:a05:6808:49a:: with SMTP id z26mr8839402oid.137.1609065933016;
        Sun, 27 Dec 2020 02:45:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:758a:: with SMTP id q132ls7985032oic.4.gmail; Sun, 27
 Dec 2020 02:45:32 -0800 (PST)
X-Received: by 2002:aca:5786:: with SMTP id l128mr9259738oib.145.1609065932418;
        Sun, 27 Dec 2020 02:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609065932; cv=none;
        d=google.com; s=arc-20160816;
        b=qmfsTyYjnleNoxDR11FjDD9WUxOsba/6Ddp5rDxbDMMXo/pTxJO+UTSFs8Bp+J9NXh
         SWzwaFbaq+IaMcGRMHWQo9zyiVcx+1eeMYdSodeme5fF4IkUqgYNYNJsrdgcdW4Qns9I
         QSwEDD/etH6ydL85raA/lV1R0dZB3UwZD0W8f74o85kYO3/5rhdlT5IIH5pbTkvU/Ook
         HViRrz3cwFvjfq1fWR8jsP4Jy9vzETIc+miQqyLT+wHrhv2maw1OAPDrWJ3FKz1hXSjp
         CfpPYES3ZYRzy8AMiJg5K8nZZ2fVLEv3qr3fsqREgQJt+/Qx1FBs9oBlls/5G9QDMFB4
         h0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=/X2zmvmDTU/d6VVeuMhpj3p1nV/hRQk18BNuuCcuRNg=;
        b=XUE7GNGRElTxssGHpwAClCHjTtJD/wV4pQNoyKnfgKSO8X3qNHK5dcazLCPSp4XCDA
         YF1OFaPkq+lC1zn14YLieFq5hr6BU/7rkvWP08zjN66H23JM9vZGynLMJ0W56lzBCnPD
         p4N1EjPkOVbUy839ZDLb54medFNRpQRROOm4oa0nxG6V4FE0aTt32d2fGVNqDD8aNHKe
         baM9qGKdPsSgy9zGsQheet/rBzipD2gonnbvaTZMNIbHl2A8lpeDzVE9ArtBGMzlQobj
         dMq+Sn3aWCBpGeHVK1jd6l7fFJWBI0C7OqfbjLEr1flOBvPUX8JZNT2BheF0KV0zzymV
         vQEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="q4bLo/fo";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id w68si2531806oia.4.2020.12.27.02.45.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Dec 2020 02:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-3d72c92.ash1-iad.github.net [10.56.112.51])
	by smtp.github.com (Postfix) with ESMTPA id 06FD55E0064
	for <jailhouse-dev@googlegroups.com>; Sun, 27 Dec 2020 02:45:32 -0800 (PST)
Date: Sun, 27 Dec 2020 02:45:32 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d9f658-3cf261@github.com>
Subject: [siemens/jailhouse] 43eddb: configs: ls1043a-rdb: add cell configure
 files
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="q4bLo/fo";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 43eddb879307a83a4febe8ef261e1c0e8aa676c5
      https://github.com/siemens/jailhouse/commit/43eddb879307a83a4febe8ef261e1c0e8aa676c5
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    A configs/arm64/ls1043a-rdb-inmate-demo.c
    A configs/arm64/ls1043a-rdb-linux-demo.c
    A configs/arm64/ls1043a-rdb.c

  Log Message:
  -----------
  configs: ls1043a-rdb: add cell configure files

Add root cell, inmate cell, and Linux demo cell configure files
for NXP ls1043a RDB platform.

GIC base address of Rev1.1 are different with Rev1.0, default configure
files are for ls1043a RDB Rev1.1, if want to run jailhouse on Rev1.0,
should change to the following:

.gicd_base = 0x1401000,
.gicc_base = 0x1402000,
.gich_base = 0x1404000,
.gicv_base = 0x1406000,

/* irqchips GIC-400*/
.address = 0x1401000,

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a49bbb0bb01d80b932415e44dfbf5ce21829ba97
      https://github.com/siemens/jailhouse/commit/a49bbb0bb01d80b932415e44dfbf5ce21829ba97
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb.dts

  Log Message:
  -----------
  configs: ls1043a-rdb: Add linux inmate dts demo

Add device tree demo for running Linux as an inmate on
NXP ls1043a RDB board.

GIC base address of Rev1.1 are different with Rev1.0, default dts is for
ls1043a RDB Rev1.1, if want to run linux-demo on Rev1.0, should change
to the following:

gic: interrupt-controller@1400000 {
	compatible = "arm,gic-400";
	#interrupt-cells = <3>;
	interrupt-controller;
	reg = <0x0 0x1401000 0 0x1000>, /* GICD */
	      <0x0 0x1402000 0 0x2000>, /* GICC */
	      <0x0 0x1404000 0 0x2000>, /* GICH */
	      <0x0 0x1406000 0 0x2000>; /* GICV */
	interrupts = <1 9 0xf08>;
};

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c
      https://github.com/siemens/jailhouse/commit/1b4c2b27ccf2f873bc1e66e9b0182a76f1191a3c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/Makefile

  Log Message:
  -----------
  arm: Enforce soft-float ABI

Required with newer gcc as we may otherwise "gain" vector instructions
that are not supported by Jailhouse. This is analogously to the kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5a9b08b44fd429feb90abcaa4fe01b1867f66225
      https://github.com/siemens/jailhouse/commit/5a9b08b44fd429feb90abcaa4fe01b1867f66225
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/entry.S

  Log Message:
  -----------
  arm: entry: Drop broken attempt to restore CPSR

This is neither the proper way to restor CPSR (we do not return to Linux
on error via eret) nor is this needed (no relevant change to CPSR done
if we return prior to switching to EL2). So drop this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9638d507b2f979e0c46a3b557372166408f91b20
      https://github.com/siemens/jailhouse/commit/9638d507b2f979e0c46a3b557372166408f91b20
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm/setup.c
    M hypervisor/arch/arm/traps.c

  Log Message:
  -----------
  arm: Fix access to SPSR from EL2

When in EL2, banked SPSR_hyp is not accessible. We rather want SPSR of
the current mode. For writing, that means appending fsxc which selects
all bits. Reading means dropping the bank suffix.

Noticed via QEMU. Real HW might have done the intended access so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c
      https://github.com/siemens/jailhouse/commit/1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: arm: Enforce soft-float ABI

Analogously to the hypervisor core: Our inmates do not set up vector
extensions, thus stumble if the compiler generates corresponding code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3cf261b06c63f165a48ad1671596e8eb7de4a3f0
      https://github.com/siemens/jailhouse/commit/3cf261b06c63f165a48ad1671596e8eb7de4a3f0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-27 (Sun, 27 Dec 2020)

  Changed paths:
    A configs/arm/dts/inmate-qemu-arm.dts
    A configs/arm/qemu-arm-inmate-demo.c
    A configs/arm/qemu-arm-linux-demo.c
    A configs/arm/qemu-arm.c

  Log Message:
  -----------
  configs: arm: Add QEMU target

Derived from the arm64 QEMU target, this adds one for 32-bit ARM which
also stresses the virtual GICv2. Works with QEMU 4.2.1 or newer.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/d9f658ba17fc...3cf261b06c63

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d9f658-3cf261%40github.com.
