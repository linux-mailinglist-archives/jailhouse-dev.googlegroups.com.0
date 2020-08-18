Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB2WA534QKGQEAAWUQGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF092481F5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 11:33:31 +0200 (CEST)
Received: by mail-vk1-xa3a.google.com with SMTP id c23sf6720385vkc.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 02:33:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597743210; cv=pass;
        d=google.com; s=arc-20160816;
        b=tQZK3ae6MaUnXk+4gk5QyAlWAhSjMWyu+SkZ2kzNj07RKhv+LzYnBd28b0lHRxGdVm
         ooYk28DenmaDuqVF1q6Vqo5thA34RB+R39aNIbSXaucWoBz1A5dr/zrjcAk81cA7IS0A
         M2EuaST0xhMt4+ZZOr3Huk3MwyMUUHlhxfg1+R2KfBqkccupGWbaydsLO+r4v+qRruyM
         R3KH2dCJPBStvpPILRD5NFF3YpAy7b7TZh6aPKO2C/0hlcmExPr4Du5vWDCYsNtrSy5F
         cuA5JsPbE+WgIs0ME2sWRkxzXbQ2hGmEu+c6WsMMrIUuYpoGCc9Op57bub/l3cbn+XWu
         3Z9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=lzEYjEsemBdjrEezGSWA4bJKy/Ccd4HtbuiGn41qyAY=;
        b=INLSJv+LygKrIOqmXYSFroRnFuDO7b/JvOtmms3u6zsrPXVEdWZZoVTPin5VawZWWD
         WeBKKWKL9JJUMXukO5/6ucbrJn2mH/80YoxKUye51UO0OFSZcEbziK23Gki9V9ZJTWi6
         XTBez7IhFc8rtJj1AsEU2yjUb37C/t14VJScaxYs4glxDGKK1j/+ha5PwyKwYhTVwnuD
         pOX0wAJ6I4Tmk0fHCdUladwXJ+4nZjEL7ZMe7DRVAo7kPmYoaM0YOL+x1IaozY0D9lWS
         iHowV+4GYodxGLCLSlWXgRixiB0XPGiljk4b4yCRfmwhlsKL6RIMBKyMhb8Kz5Lib607
         83UQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vZgQf3Qn;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lzEYjEsemBdjrEezGSWA4bJKy/Ccd4HtbuiGn41qyAY=;
        b=dN506eveNKBswUzVIJFsb2IMJYoMZ+nuS1D0XUo1BmjS8pGew2XKD3mUDPiU4434HN
         85zkXO4fZzXJEtkAch8JQiSe+bW06BPjHc1ua0o9cOx2o7KUOY5Zx6I3rNxBqdbpAziL
         r/ICCe7MT8Lz+j1Pe7g4NioR8hGYHijs60CFq9AiC5qTopeF7MiWK0kZBp0padjAsMw1
         rPkFZawqi3I950RcD+03NX2z+aWOFihqVtNC4ZLxEopavirHV5Znn9CAXiyoQ/kidrsC
         rDYA4bMfupQHsIcbaTWTUQE1B84id2Q/h5os13Nkqs5UsfQY6Xq7yOxdwn/qffwO1qMY
         FWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lzEYjEsemBdjrEezGSWA4bJKy/Ccd4HtbuiGn41qyAY=;
        b=VwbliFUN5WtxvWxlKKp/YxPPJ5PDjuiwlJTwGSB3aQv765jXbuQF5yUH9nHKgeGdkC
         tGzvn5KjPgIOlK2CSsx8BZZxhO67loc++/96PmpNiIuojKZsLG6x454xf/y0lxSGYoXQ
         POzQ9GJEUJrhOFGtFh/FI8GHWl9/Ozl60BuvF6qnqKn59Ds5RRN7w4Pqvck60/T+Ybz+
         0Q8UNFJzjyCBjm+ig8IHUmuiZhFFGJj6v3AS7E8OK3pYsnDfZ+L4A1kNQK22b363s8OO
         xYKI5OB6Iy2O/5svj0u7i2KJSb18nW94T1U6g1ygLal2dHnRvC03dF4aukklJj9AGeee
         Z7dA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531sJyb5G29euZkngbo8ZH4zxf4+7ZPCxA35/DpL/9dmi8Oq4wss
	5jms+4t67Y8Gj2Sacz0z+aI=
X-Google-Smtp-Source: ABdhPJzhB/bQTPvluNLaF0n5/6BPvWi2SiwQyIloQFmNvpN6c91RyH3dEnvAj+o2i7nwSnUdoMERvw==
X-Received: by 2002:a67:d908:: with SMTP id t8mr10638793vsj.215.1597743210336;
        Tue, 18 Aug 2020 02:33:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:2bd7:: with SMTP id s23ls65681uar.8.gmail; Tue, 18 Aug
 2020 02:33:29 -0700 (PDT)
X-Received: by 2002:ab0:7183:: with SMTP id l3mr10063358uao.17.1597743209684;
        Tue, 18 Aug 2020 02:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597743209; cv=none;
        d=google.com; s=arc-20160816;
        b=i7aCLVM+2ehA7mhM1UyT4kvh+th4W0PKQV8AxF9Tmiq97XXBfi2rtm0X0MpPe+2mu9
         VwcEjRGHvt698WYwr9koiSvq/WSr1nEDG10SIT+LIRDP08pXXzUVyUR+IQ31znQ5NXPA
         RwkZg80W6J3neboNpFbSftxkSb5NDh6MrO1ofo43PmUXCfL3vuWR7Azv7BPnCIco0FNH
         hZahafXLj0H0K4n8VBO8RlHF5iPbd5+wo+8EuSZq6D+pnOUrRSOMFmC5o0XKxMSeupoO
         IvZ0YEZBDA/CFZaq++2oXgzmXNciS/gNpEgx4F2ItCg203rQl870AlsUsinmrvPY6o6Y
         5uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Ycou2aFOv7j5KEW0aLbI6JicVSEY/o/yEU+qnWnN08I=;
        b=uPWGqIjAbKam++CFNlGqigx1n9BdoPCaQbDovIkyBpIKy1vMaH0MmmaOndxDxo3/9p
         2wwwoUVGjah6mQQIWRXsAQ9S3E1S3tVyHi/xEFjwlekV/mK7YZ81fG5AVHGwgCqsg7f1
         tCHniVDlI0IhQjCj9OGUYgjFKeiG8hOWeEPPstIHG97eVSxFaijqEjDkZwql8axU7C7E
         TS/Vx1A7D1L2kC8528cfg+O2tk2v8N4WTdVkFLf3eCUxy0A7Z1+drWFRRLfApZKftepp
         YyDhkFXvbR8ZUTdAV8oVVlmhWTewgC6PXv6phjQNuX0+jU/rQpAf0Sbe3Ac1iPnz9Fyx
         wxrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vZgQf3Qn;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id k201si1056188vka.4.2020.08.18.02.33.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 02:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-c53a806.ac4-iad.github.net (github-lowworker-c53a806.ac4-iad.github.net [10.52.23.45])
	by smtp.github.com (Postfix) with ESMTP id 6801460001C
	for <jailhouse-dev@googlegroups.com>; Tue, 18 Aug 2020 02:33:29 -0700 (PDT)
Date: Tue, 18 Aug 2020 02:33:29 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f02a43-f34cb1@github.com>
Subject: [siemens/jailhouse] dcc62c: arm64: support inmate cell in AArch32
 mode
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=vZgQf3Qn;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: dcc62c3f365ef06c4d701a77aed9abfb204b0b02
      https://github.com/siemens/jailhouse/commit/dcc62c3f365ef06c4d701a77aed9abfb204b0b02
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/sysregs.h
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: support inmate cell in AArch32 mode

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add this macro to flags of struct jailhouse_cell_desc, and you can
use it to indicate whether a cell is AArch32.

Add "bool aarch32" as second parameter to arm_cpu_reset(), and can use
it to pass execution state. If aarch32 equals true, switch to AArch32.

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Configure the registers related to changing execution state. If a cell
is AArch32, SPSR_EL2.M[4] will be set to 0b1 which means AArch32
execution state, SPSR_EL2.M[3:0] will be set to 0b0011 which means
Supervisor, and HCR_EL2.RW will be set to 0b0 which means lower levels
are all AArch32. If a cell is AArch64, make sure HCR_EL2.RW is 0 and the
other registers are configured according to the previous code.

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: style fixes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 20015a7645ac9ba8123a3f2f10a003bbe084149f
      https://github.com/siemens/jailhouse/commit/20015a7645ac9ba8123a3f2f10a003bbe084149f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic-v3: Add support for accessing GICR_TYPER high word separately

This is needed for 32-bit guests that cannot issue 64-bit accesses, thus
will trigger two separate 32-bit accesses.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: replaced subject and commit message]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c70fb3943f09e35ece0d2b739e6d25bc9566baa
      https://github.com/siemens/jailhouse/commit/1c70fb3943f09e35ece0d2b739e6d25bc9566baa
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M inmates/lib/arm-common/gic-v3.c
    M inmates/lib/arm/include/asm/sysregs.h
    M inmates/lib/arm64/include/asm/sysregs.h

  Log Message:
  -----------
  inmates: gic-v3: solve 32-bit incompatibility problems in gic_v3_init()

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So use MPIDR_CPUID_MASK
to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: slightly improved subject]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f34cb118a0eda21d611c4bbb0f44373aa012e5eb
      https://github.com/siemens/jailhouse/commit/f34cb118a0eda21d611c4bbb0f44373aa012e5eb
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    A configs/arm64/imx8dxl-inmate-demo-aarch32.c
    A configs/arm64/imx8dxl-inmate-demo.c
    A configs/arm64/imx8dxl.c

  Log Message:
  -----------
  configs: arm64: imx8dxl: add cell configuration files

Add "imx8dxl-inmate-demo-aarch32.c" to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-inmate-demo.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f02a43a5fb3c...f34cb118a0ed

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f02a43-f34cb1%40github.com.
