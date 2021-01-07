Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB26O3P7QKGQE6Y4GWEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE42ECE25
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:50:21 +0100 (CET)
Received: by mail-qt1-x83c.google.com with SMTP id h7sf4814380qtn.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:50:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016620; cv=pass;
        d=google.com; s=arc-20160816;
        b=kp8SOTN7/oD1+6KzWjWID9l7S0Am1vJJHfIoN0qApiIwgk/Z/+NweOxwXk6IYiAu3L
         BZj9ADx2tJN1rW+z7abE9dn/T9hMHhU+NTFt1qsiDuy/6ydbwuN0HyHk0iK09mkprQt4
         Xzh4MhQSlaWXtdKDiV8CZTIM9l9yyt460B1uSNT3yd1MBJGIz8xfnZ8TN1SvbsNyJj4+
         7RIXowDZ3meyAneuISLn64A0sTDBB/3hhfnLigjveavA9lc9t8k05GAiVQ85kPzo6CEH
         hhuwVnhtuvmhkOS9kCQHfE8NDZ4zc4lRblHy/c873O0rdjWqH9jNNQsRF9o840fwacf2
         ASDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=jnqhmumlnnYD8cNM1Rk7ufQk5966eI64QR3nns0fhkA=;
        b=cw9g/Jp7f2RRou9GqqJz+UcFLKPsY51Pn8tK0vvXOHT0AL9r6UdL71iqYW2ZhSxpYM
         ab+B7fBXz0MjjTFG5s+mCQD/ONSAymyRmggBocLUhEszIl2wCQtYLydPJ1gyLQe2s8At
         +34MwZwyHBqqQpiz9Kv3kf6IxG4gTsTreaaVpnCG0DZmV6nPNwJtTB8v19c5iLx4C31U
         hQlX08+ain8JqLEVjOB8hgzPvCGsyTSwzaEYADn6BUVsfYempW0dFlicj4OaU+YBXU8h
         y+prk3OmXC94FSlH1CSB9R+uks2TjshDmSCSF97TOvqvjTxh2oKR11bMfEvnIhwxlzJN
         MF3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vEThnD3a;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=jnqhmumlnnYD8cNM1Rk7ufQk5966eI64QR3nns0fhkA=;
        b=rPvNwYmz1hg98xRFh4UE6kRHBh+obGLq6Qb1zSERMUKSfVdtpLIuYDddNao3PbUQqY
         bDFy6lvIcdR6pRnfniMRfiov7HPLZLPSnpTvRJOZvIiOAJd6FGtHSuNJs3MTBUiOiBDl
         zFP0MzLBYhhk0AcgPfvDTJcvOyGLoBMbK1bnTm7hVcCcxdL9T+UZsBsUbM98PXI+ZMkg
         Ps4H03k09CvjCVWqoYPbAuipm/SEAe3BhdIleEh8zB6b1AQextThQGcZJ3pDfrlmxPvr
         JvBONuvDTOJBxF5qGTACt1xTFVRDoSBnnAxyqxpDRQCPwOUXwx8vBecdnELXNH42dw+b
         I/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jnqhmumlnnYD8cNM1Rk7ufQk5966eI64QR3nns0fhkA=;
        b=Ak0MlGnf3Ppd83TIEosgClf3Z3tl4BnnKa8iFVKApfddpmhlEly5hfMkGyZRIhouSF
         n5DYT9nZaifAu8dzxd/XfUGnLMfu4K/51Inx/jBAQZgfOzEnhersU+kZ5uDt/ZWbJw3R
         6qHFhLa1EJQeIIhg+Pf3ufodRHNhIpMsmIsnFudtQ3e7eqO2GDKjr30Ja/AOnnEehjgv
         RiZ8VjjxHG9lxaTB7+UZdXGLnY1Hy8bGvWKDlYVJZ70Vvw1Xhlhvwfwdu9OQzJ0b4nKG
         cJlBStzJBCN+SeerEYkbZJy3WLCj1CXo61plVzrUbqFd7S7zYWzn3MsNJg4CS73U/+go
         a2Cw==
X-Gm-Message-State: AOAM532cRjdMX5vrYmePXPDKXsho733u7OnA58JX9sra792EGGErlW9J
	KDGho87lc2hiyXxPwaCDyE4=
X-Google-Smtp-Source: ABdhPJzeJ7u4P+cL66Zw0UUBkiN1ppexrqUbRZEZFBSEfO/3eYjkdSmXfBqWVln3gTXgiHb0bH3BLw==
X-Received: by 2002:ac8:4545:: with SMTP id z5mr7741911qtn.28.1610016620035;
        Thu, 07 Jan 2021 02:50:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:9a4f:: with SMTP id c76ls3435412qke.8.gmail; Thu, 07 Jan
 2021 02:50:19 -0800 (PST)
X-Received: by 2002:a37:4796:: with SMTP id u144mr8131851qka.235.1610016619524;
        Thu, 07 Jan 2021 02:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016619; cv=none;
        d=google.com; s=arc-20160816;
        b=PwFzh83G9uKV1pH+fyxPSEWCMCgFIoXyfN40csjRHIM1jXBm5xy7EbCgIAn73MRIe6
         BDN56d4qx/U6t3PGHP4exJWv5Z85F77CiZiQbq4hxELHg6Y1odHjq+XCqPfi0aejOc3N
         ECR68k+IF22PB2IInWTP06jSdhQG5RQonYezpxzCEt2h6i6NcaJOxuAmGmWrnKy3ZQMK
         NDtoeHUdDYGtXTmPZRgJ6l6RkvlYvRfj1TyqHmbLluqikHqR9DUt4fQqJ15Pfw1xaDH4
         OlqkjYAa3KWM9PJpOarR1LgVw3XoqweZNMJ+KLcm0fdjC7EHiBLrDIlXmfCsJqGEuCif
         5dyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hjwM08FDfNsHgr9QlcAxesFfT/d7WfGycR26OKtIzFY=;
        b=ph5zBgUs4y/uzNBhnf0GP1L9nxJVQOHABEwXTe2RKYLbryV4X2eyU+7ZxUt4cktmaC
         o9w+dGZBYrSmjOZvM26ek3AU16sxP7KlRsIaNZmdojzsrTDOjreHXhipl7Xu1Zspm5pk
         19GHpbZVr601h4jJ4N61nADQTOJgBeUfAqjnLtkud2aWlHAZkxfSjttd9KlRB7BlESIi
         8ScWyx/zKc/A3ilB0PAy9aCmtbgwopI6f2ncM35+qCm42r+yZiGEVJCK4f1i5+RRHkt9
         1obsBTPcqGOwkSPh+zUHulIP7la/4BJUbHVxN4RAgBaUlTfn8Xswa/lt2g70EJTqqCzm
         2ayg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vEThnD3a;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id j33si170135qtd.5.2021.01.07.02.50.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 02:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-f13cf70.ash1-iad.github.net [10.56.22.67])
	by smtp.github.com (Postfix) with ESMTPA id 486935E032B
	for <jailhouse-dev@googlegroups.com>; Thu,  7 Jan 2021 02:50:19 -0800 (PST)
Date: Thu, 07 Jan 2021 02:50:19 -0800
From: "'whbo158' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/5498cf-a49bbb@github.com>
Subject: [siemens/jailhouse] 2533ca: configs: ls1046a-rdb: add cell configure
 files
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=vEThnD3a;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: whbo158 <noreply@github.com>
Reply-To: whbo158 <noreply@github.com>
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


Compare: https://github.com/siemens/jailhouse/compare/5498cf9f5013...a49bbb0bb01d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/5498cf-a49bbb%40github.com.
