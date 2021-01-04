Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRWDZP7QKGQEEIF4CJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC82E92B1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:37:12 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id c2sf24855569qvs.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:37:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609753031; cv=pass;
        d=google.com; s=arc-20160816;
        b=VAqL/5Eh/0KjTo6Vu5mc3pmjuXxVhyIqtlKDWjZ8HG+tQE4lS/noLWe2y4f9uxRPL9
         COnsiyWg7CeXl4PxUVZj3OhfAV2eXFoG5dW4wNy1xehzqkMPU0XKOXBbK930Q9cTeAkQ
         8N2/Uyd/5ga7yZfPCcOG8r98Gisp3DoDqC7Ov8/cpRyZNK5fWu2Afd/FMDf3hhjb/pFr
         IRpGkD3yR+IVUERaencG3P5/t6jEQehYC6Pa7jRnUvaVL9lbEP3E74vNUttrIKjmReWW
         HMKhDNWbH0RytQBkxiHnO+WiCIxOnDJGc4F3cf898dHAR8lMcqcMrKWbGvSlwHQn0fGQ
         nn1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=jWckBtZwvdETAPuP+bOVXFne8bk0WX6/J2WHFLRWX9Q=;
        b=ez26BpZqAxe06+gNPNRtLh5PnQEsHLp83ld0k64OEDLywSX+eo9z8R5YQKWMjk9LBN
         vyZLhlLggjP9nLP+lo1NZ74V4PlnoOQ+5kTMRg4KtBh/EL1XBNWAh6J/EY71vx3UUla8
         UjiWrZ9oWQ1mIFYxikC9YysraC6Dg7QC9y5D2JiAuPQ2+VDQpGb+kEZqqLtBllCymf7D
         xPLn1ETFezR1VXwEO0Uff08lYP/cR03WYXNuP3jttPvB2rS9bbjN1LZVsqPer0o4aVzj
         cwfIEX7riAxp9S0aSxwXzu21djdOKu67DUemNhhcLYTpixPw7bn7QwenX/3eruPc4wf+
         RpeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XN8h8l+S;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=jWckBtZwvdETAPuP+bOVXFne8bk0WX6/J2WHFLRWX9Q=;
        b=OB1bu7egC+oNWt0cE/74JwhOBXXDPnsD+zzAcGfmiOqc4+ZYENWGkrEWXcokwPmXv0
         AcmVGZWUTd54FCcfQMcP4r+kY8+WCrI9hTW4psAKCXJc1DkRiEJPYyc4kG5xXhWP/EN5
         DaOBZzISOYXb9buvY+eKN3IK8UXbhl4GZNDjjblHM9PmTaqrUrcHzYO+Lereju+1VxBf
         tMFzDpIN4SAy8+ST7ygNXL6l9k0kjsUaTUZFXJWKDDt5R829VIlitDeZBHZbEDbqdAJ6
         mHkMGIqGLlcAxKq7IU3K7raWU3DadtFl1T4bcebnkx1rxRFo2ROmmotTVWXy8WZP24SC
         Jl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jWckBtZwvdETAPuP+bOVXFne8bk0WX6/J2WHFLRWX9Q=;
        b=jlZoKRbFCjSzzMi07VM01XhmwCuqbQA2AHc24aiehW6o2qT6a+NZq7Y+gYiTxt7gG6
         1sQCiJlPMsFAV/tsmcUgvBifhElDtdGfprVJrkqhfuiu7JSWbLvNUb8fxUroDG/ly4/e
         ZMYRdOUbxxOikF6FKWPvknJJrfg0p0AUHbnmlpd4W+/x+XDH0SrMMRITUyqBsIhYkqcE
         TBuE0By5X/5ci9ScAzpDhH/VFIVcjWOQrZ0lUtT/Ma66q9xYdo4dSLZtx8Ug7HoWHV1v
         ObubkKJiGg0AVgONvSH/1nP8tj/ivHMLQprkEtM/FSn6sOjx1vS5d/ii7V4rYB7OlTBE
         CD+Q==
X-Gm-Message-State: AOAM532BnoL2PJtHy2xg95CikGZM6/zdp8SAbO5US71JXX+LcnYf5rbA
	EojPWtWsQzYiV/pyVZF5N2Q=
X-Google-Smtp-Source: ABdhPJwM2Zh6mncknn8pTqqdGmGwLe9iG2nNDsSmiQLOKoF5fFr77aTQ9xxlRDdoOWF9onDD3Tr/kQ==
X-Received: by 2002:a05:620a:147a:: with SMTP id j26mr37073773qkl.190.1609753031156;
        Mon, 04 Jan 2021 01:37:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:3824:: with SMTP id q33ls26403531qtb.2.gmail; Mon, 04
 Jan 2021 01:37:10 -0800 (PST)
X-Received: by 2002:ac8:7954:: with SMTP id r20mr70510474qtt.78.1609753030673;
        Mon, 04 Jan 2021 01:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609753030; cv=none;
        d=google.com; s=arc-20160816;
        b=mCoviBUY8U57Ghv0sAg1RtN/9wT2WIRcWSL+L4msQfbLvfhJ6ooNgoR03GmHuSzcu9
         JzYcECD2xo9ruaO63FwUCymHazFznGv/1jzN9HR3sxtb+Xz9xAKeeTJt2PfgTLNC0wzK
         h5DlczP9QHp3ZmI8aGCGNyhmWF0E5ZuhMuVg4xWTqyAdmPK9X67uM7bEemOGCTwZXyzH
         BRjA7J4wWVucBkg1NVTJJi3R43igfgVDMqAuiai9nlUKI71wZ4WDHOn1aInJfnIYpeG2
         NmCer9dvJVIfMENMS68+1q6zF4FpWIZzU5WC4M/Ofiecr5H1rkWcB4SOsnza7jISotRm
         vEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=kNEZJcwPkOgyTPkDTzYAoGia8Tz3KAUFi2SgQhY5NtQ=;
        b=jHs9yEzNmZFa7CDV0lryyYlG3HTc7+MIMxy+zJBAbyZ3d6362XjbohRBaonawWtxtJ
         2sK9aV0dqacrUF9XNRTLnkGNgVfiF1pD2fEvOZ9x1DlUV8qDBCmjl0OfPgSX5pMhqrql
         vpOjqKKBapIOls8OcYNwFRGanN+EZ+H+hutUHKxPQmeuO7A7uVLJeQG7Lj9XE5mRCH0R
         sSQZl0Uq91e0xOZjyg/U1GEYW5pFoYvdudFN5r/o/fzpIzk5JdKqJ7W/CJZHHrtdbJqb
         J513MA9GrVwdzU1qQwMZS8Ifrkjf484jE9+C04wl6QcKnvoDd+UtrtqMsXMGERqfL7nb
         SBlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XN8h8l+S;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id i2si3570227qkg.4.2021.01.04.01.37.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 01:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github.com (hubbernetes-node-ccb57e1.va3-iad.github.net [10.48.18.68])
	by smtp.github.com (Postfix) with ESMTPA id 729FBE0D6B
	for <jailhouse-dev@googlegroups.com>; Mon,  4 Jan 2021 01:37:10 -0800 (PST)
Date: Mon, 04 Jan 2021 01:37:10 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/5498cf-b93e97@github.com>
Subject: [siemens/jailhouse] 2533ca: configs: ls1046a-rdb: add cell configure
 files
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=XN8h8l+S;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 2533ca36e8ca8464687d8ea062986994de0cf043
      https://github.com/siemens/jailhouse/commit/2533ca36e8ca8464687d8ea062986994de0cf043
  Author: Jiafei Pan <Jiafei.Pan@nxp.com>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    A configs/arm64/ls1046a-rdb-inmate-demo.c
    A configs/arm64/ls1046a-rdb-linux-demo.c
    A configs/arm64/ls1046a-rdb.c

  Log Message:
  -----------
  configs: ls1046a-rdb: add cell configure files

Add root cell, inmate cell, and Linux demo cell configure files
for NXP ls1046a RDB platform.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
[Jan: fix up CPU overlap between inmate-demo and linux-demo]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af8a664fbfa5972c8f11100774c98d3e55a22740
      https://github.com/siemens/jailhouse/commit/af8a664fbfa5972c8f11100774c98d3e55a22740
  Author: Jiafei Pan <Jiafei.Pan@nxp.com>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    A configs/arm64/dts/inmate-ls1046a-rdb.dts

  Log Message:
  -----------
  configs: ls1046a-rdb: Add linux inmate dts demo

Add device tree demo for running Linux as an inmate on
NXP ls1046a RDB board.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1dc6b9c0aa354fb0c26680708fc6802112d88ca0
      https://github.com/siemens/jailhouse/commit/1dc6b9c0aa354fb0c26680708fc6802112d88ca0
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    M configs/arm64/imx8qm-linux-demo.c
    M configs/arm64/imx8qm.c
    M configs/arm64/k3-j7200-evm-linux-demo.c
    M configs/arm64/k3-j7200-evm.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102.c
    M hypervisor/arch/arm64/smmu-v3.c
    M hypervisor/arch/arm64/smmu.c
    M hypervisor/arch/arm64/ti-pvu.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64, configs: SMMUv2: Separate stream ID's mask and id

The SMMUv2 allows filtering bits when matching stream IDs before they're
passed to the TCU. In this way multiple streams legally get the same
translation.

On boards such as the ZCU Ultrascale+, the master ID needed to identify
the corresponding SMMU stream ID may be dependent on a specific AXI ID
that is set by the PL (and could be IP specific).

One single fixed mask to pass to the SMR to compact multiple stream IDs
before they "hit" the TCU is not flexible enough. The use-case is to
compact similar PL-originating masters and have the SMMU behaving the
same for them (e.g., they're assigned to the same inmate). At the
same time, one needs a full stream_id to assign e.g., different GEM
ethernets to different inmates.

Update a stream_id to support two different interpretations:
- for the SMMUv2, provide an explicit mask_out + ID.
- for the SMMUv3, keep the current single ID.

This commit updates the SMMUv2 / v3 --including configuration--
accordingly.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 297ac264c0f4a4e163b77ab8942780cc1f5f6c61
      https://github.com/siemens/jailhouse/commit/297ac264c0f4a4e163b77ab8942780cc1f5f6c61
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    M configs/Makefile
    M configs/arm64/k3-j7200-evm-linux-demo.c
    M configs/arm64/k3-j7200-evm.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: add Wall and fix bracketing

In combination with Wextra, Wall enables additional checks such as
Wmissing-braces.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3ad66a08f2e14443581acd77740d3b41d3a21e37
      https://github.com/siemens/jailhouse/commit/3ad66a08f2e14443581acd77740d3b41d3a21e37
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-12-17 (Thu, 17 Dec 2020)

  Changed paths:
    M configs/Makefile
    M inmates/Makefile

  Log Message:
  -----------
  configs, inmates: Makefile: remove .note.gnu.property section during objcopy

It seems that the .note.gnu.property section is interfering with objcpy and
causes the "JHSYST" identification to be removed from the .cell.

Removing the section while copying the .o fixes the issue:

objcopy --version
GNU objcopy (GNU Binutils for Ubuntu) 2.34

readelf -a jailhouse/configs/x86/qemu-x86.o
...
Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT, SHSTK

hexdump -C jailhouse/configs/x86/qemu-x86.cell
00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|

objcopy -O binary --remove-section=.note.gnu.property
jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell

00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.........:|

Maybe related to:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


  Commit: 5c5cde20c9a855224aef052d9ad34a60fb98bcea
      https://github.com/siemens/jailhouse/commit/5c5cde20c9a855224aef052d9ad34a60fb98bcea
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Account for SMCCC versions > 1.1

We must not limit support to 1.1 exactly. Anything newer is fine as
well. Required since TF-A 2.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a
      https://github.com/siemens/jailhouse/commit/4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/percpu.h
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests

Jailhouse does not need this workaround as it isolates secrets via
CPU and, thus, cell-private mappings. However, guests may request
control over the workaround. As it is per CPU, we can grant access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b93e9798b6475bd75ba7ddbfad2f58905cbe0090
      https://github.com/siemens/jailhouse/commit/b93e9798b6475bd75ba7ddbfad2f58905cbe0090
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Forward all SMCCC_ARCH_WORKAROUND_* feature queries

This adds full support for SMCCC_ARCH_WORKAROUND_2 and ensures that
there is no deviation between features reported before and after
enabling Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5498cf9f5013...b93e9798b647

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/5498cf-b93e97%40github.com.
