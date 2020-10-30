Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWN4576AKGQEICJ4DPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1652A017E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 10:35:23 +0100 (CET)
Received: by mail-pl1-x639.google.com with SMTP id y9sf4090613pll.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 02:35:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604050522; cv=pass;
        d=google.com; s=arc-20160816;
        b=wIy9Di2Jx0Gtjdo3oLfemBar3Cl/MrpqVtpN+pxT6uKF3UsiY8z9zHIioIE858iOCX
         erB65oKfDW4tWuvFzz0SMlI9qAO8Qz9H2HvRUUt9o14nh8Ve4JXH3sVLgTnSfal1jpZq
         XY0GtJ79e+zdjPcK4+tgJMICp6rqbhXP6oKnPw+4zqxZdvDuOyxkRXDRY1ON2/KbYOdb
         Smc4Mad6VyukQyQ0vt24UyWmlyTCdrUg3+dViL+J0+67EcsjV83nOZS0KUHno7Xzz/Gr
         iyGoMzNfcIL4519GbDhXNm8cVe5xJl9RD1M1uZ0GTH/HLHAZYydyt8vnLQ+VQZ/0D97l
         39eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=49bOyil49DENIb9SK0uRbSJn+HWF39LcAvjKzR2yqHw=;
        b=G+msjfCNVAFzjIw31mM8jcR/FO9Ju/ljVtSpJTIYPdj8NjwSYNcf5D2IwYR+sCWd04
         IUH3OGyOxk4kD5gvvp6ZlOOPazOcQH3GeIyh6x9VaceGSPvhviyoCSyEXpudFaZEB0fu
         pIL//oUQa+8tqhcj1+dLs2wt7+D/0RlD8jf0LSNU7h8PjODkEbIDw83UoTEJK01zQuO5
         YSrpCNy+QiCJcHNO4gFPWh6DcWqlwAxUCh2Rd/5W08v4NSW1k8XCw+FpODPbmBGs2oEw
         meSoft3Oj4kCXYup34nGcitjNHwUB8tun3dX5vnQBaJtR0zIah3QUR+Z0Qlm80OdJWC2
         eZKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t4t0+PQa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=49bOyil49DENIb9SK0uRbSJn+HWF39LcAvjKzR2yqHw=;
        b=YOFwCaABygh4kpLpcnXhfAZzSEgXu5CAvw1QBa+Izaf/EkUpSsx0pweJKlFHwnFE2f
         ma7EPq/TCA3vVRZ1jymXRFeE6i36U72TWPAGjJFAQ3RNJ4gZdZg7UM0irCr3Lmd2YzuX
         83tHRjTL3nTt0YD/u+cg/XOYPlzjGCK4jy/h0G2Sg82b4EjeiIFg+fGTV7wkkYGGQt1S
         zM0LuWbrZYHXUS/yPDj6pWBQtADGZ82s3PgkziTG6Cwy+KBYYE0rv/+mWdLtYb0biq5H
         DzDH4mdsUdPEKwgo67TU17FhsajwNNCXuGc55opPeIagwFEtcU2URsoyL7qmGsdLQbCu
         jfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=49bOyil49DENIb9SK0uRbSJn+HWF39LcAvjKzR2yqHw=;
        b=LnH8bqviGdN6w9ODWUA3YfW2b33quKcf4ME8lLLKf3hzexq80l2VwJgaVT0jgldYx5
         1cAwwaDLzuldS39dHt10sZSoVQuIrM9tsJMoEu8VHx9l2TTCoLIMzhoGdRRd6hlJ0q+q
         RTS6OYpXFLBb0/UsiH+olpP0wNdU6cXhgt80YbD76s8tITV1sQ094Pe11plMOuPzM3cK
         +wRgTdBMfEhbgKyhOSslYX0621+U7pGJoy7+R3qiC/itZfuBJXuj09p0bs/OuoXH0mN3
         SfMLRbBbCmhwfkTFUyzVjhHrWbkdc/qkxO/QcUior7AzpWVkSEgvewU7D3wIAg2AbvhH
         X7pg==
X-Gm-Message-State: AOAM53112v7Xj2SwAPn50OLZZgrYW8ntD/r5lLDdZkA4pE60BkTF7tCm
	FnYah7ZrpO15ztcfXkxjIQQ=
X-Google-Smtp-Source: ABdhPJzBzxzIVHJ5CLBlvBKdKO4+xSFCrM38MXY3wb1nYGMYdNOIStd61ypqOYjQYtcuq2IXlJO/2g==
X-Received: by 2002:a63:794e:: with SMTP id u75mr1457526pgc.235.1604050521919;
        Fri, 30 Oct 2020 02:35:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7d8d:: with SMTP id y135ls2146165pfc.3.gmail; Fri, 30
 Oct 2020 02:35:21 -0700 (PDT)
X-Received: by 2002:a63:f445:: with SMTP id p5mr1392333pgk.293.1604050521116;
        Fri, 30 Oct 2020 02:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604050521; cv=none;
        d=google.com; s=arc-20160816;
        b=k7E2/ythR5MxcBoCdSUfGxxtJ6KiiOkJlfnpRF8+14ZchqJCE9vMcX1oFgcxaStJbh
         aiFKz+6y6N5owrd1OMvkqTxVI4rhFGahwjkBTpig+22iPLCI9VBjqDguTOFayzaouX36
         FNC0+2nHOGpkI3vmPr0O2dsNLwJDf5O41Gn4u4BQ0fltCJKNrqY3uNZMJuo9fjqkQyHN
         eiY/OOgSkPepeIOwh3ZmRbYPqWMLTVoJNx4DtpSLKoCSnXg9iBXGnpsgfwToyt8wDtjF
         THXbUg3PLV5yso2wph9jl/g4b3JcflqW2HBtIRfXUtgh8w05vfGv/U20IHMcP/QSTTYG
         8U9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=HCmvpbF8H3UvaB8xmtsbJv2sGzmFHDYOG3QyXuLPBhA=;
        b=03rJ8YFKvdYrNc4xd/Tp5efpzYq0ZBu3dTH6e5sNJlWBoxTfw51d2jmQOsW+JsdHaV
         FXaG24o6CZYPPZ551EmKRlWBKCL7plagzEtJriF1TOzpmRaz/SEcIPsiifJcT/MDYtso
         0QsfjQT/1z8wDyBjnEHNs1Y3f/ia0jMp7phZ+GMoSpPYFgdtV3v6TD0zwey1Wmf2vY94
         EtmKnhiLSA+yEwpyz5UhI7cR6BzyvNbX3s1DJrLcPUWoa/c3qy2DYsRs6NpmCDzyg395
         sldFqUkPlwzllM+xKmTgzOdJUte4zWNA7Mx0MEUnZDD7dEiINp8TPHt8HRSTs0mSsJUF
         F4yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=t4t0+PQa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id a6si358995pjw.3.2020.10.30.02.35.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 02:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github.com (hubbernetes-node-c174b39.ac4-iad.github.net [10.52.109.25])
	by smtp.github.com (Postfix) with ESMTPA id 501CF60002B
	for <jailhouse-dev@googlegroups.com>; Fri, 30 Oct 2020 02:35:20 -0700 (PDT)
Date: Fri, 30 Oct 2020 02:35:20 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/e75cec-2f52a1@github.com>
Subject: [siemens/jailhouse] 014031: configs: arm64: Add support for
 k3-j7200-evm board
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=t4t0+PQa;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 0140313c065ddb728d3cfd34463805fd294606d2
      https://github.com/siemens/jailhouse/commit/0140313c065ddb728d3cfd34463805fd294606d2
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    A configs/arm64/k3-j7200-evm.c

  Log Message:
  -----------
  configs: arm64: Add support for k3-j7200-evm board

k3-j7200-evm is the new evaluation module from Texas Instruments
which has the j7200 SoC. It has a dual coreARM Cortex-A72
CPU cores, 4GiB of RAM, 2x Display ports, 6x UART ports,
5x ethernet ports, SD and eMMC interfaces for storage and
many other connectivity and accelerator devices.

J7200 TRM: https://www.ti.com/lit/pdf/spruiu1

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 33e53952cb180ec02d195c408f3a6fa34d5f0c83
      https://github.com/siemens/jailhouse/commit/33e53952cb180ec02d195c408f3a6fa34d5f0c83
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    A configs/arm64/k3-j7200-evm-inmate-demo.c

  Log Message:
  -----------
  configs: arm64: Add inmate demo config for j7200-evm board

Add inmate demo cell config for j7200-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo, uart-demo and ivshmem-demo.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4fbecb507cd2142dfa7ed413151d5fe1c0e212f1
      https://github.com/siemens/jailhouse/commit/4fbecb507cd2142dfa7ed413151d5fe1c0e212f1
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    A configs/arm64/dts/inmate-k3-j7200-evm.dts
    A configs/arm64/k3-j7200-evm-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Add Linux demo for k3j7200-evm board

Add the linux demo cell config for k3-j7200-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

Add mem_regions and enable interrupts for for main_uart1,
main_sdhci0, gpio interrupt routers and virtual PCI

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f06871e080c5b01ca557ef3e81930cf3b1dc802f
      https://github.com/siemens/jailhouse/commit/f06871e080c5b01ca557ef3e81930cf3b1dc802f
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: hook-in -Wnested-externs

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f112308cc7620e936b776b8e6aafceee9dfd27b1
      https://github.com/siemens/jailhouse/commit/f112308cc7620e936b776b8e6aafceee9dfd27b1
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/include/jailhouse/percpu.h
    M hypervisor/paging.c
    M hypervisor/setup.c

  Log Message:
  -----------
  hypervisor: move declaration of __page_pool into paging.h

And remove nested declaration.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7294e0836316860bf9004b15c8c397d888507f91
      https://github.com/siemens/jailhouse/commit/7294e0836316860bf9004b15c8c397d888507f91
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: hook-in -Wshadow

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 44ddd41175a5f981397314d2843fa4ca7e0d68e9
      https://github.com/siemens/jailhouse/commit/44ddd41175a5f981397314d2843fa4ca7e0d68e9
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/arch/x86/iommu.c

  Log Message:
  -----------
  x86: iommu: Wshadow, fault_reporting_cpu is global

This prevented consistent updates of the fault report cpu, making the
error interrupt showing up on the wrong CPU and possibly being filtered
there.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: add commit message that explains the impact]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1864a5a74c557b598d03c98902b414bc5b2da331
      https://github.com/siemens/jailhouse/commit/1864a5a74c557b598d03c98902b414bc5b2da331
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: smmu-v3: avoid shadowing smmu

The symbol "smmu" is declared and defined only in the smmu-v3
compilation unit. Give different names and pass a pointer as parameter
to preserve generality of the accessor functions and avoid shadowing the
smmu name.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: refactored more aggressively, avoiding redundant array element lookups]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 048796f6ff6d96a80aa383ef1b214f47682aacc0
      https://github.com/siemens/jailhouse/commit/048796f6ff6d96a80aa383ef1b214f47682aacc0
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: hook-in -Wredundant-decls

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5689e221ad7e79205594b9f15fd0b0b11e4476bd
      https://github.com/siemens/jailhouse/commit/5689e221ad7e79205594b9f15fd0b0b11e4476bd
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-26 (Mon, 26 Oct 2020)

  Changed paths:
    M hypervisor/include/jailhouse/string.h

  Log Message:
  -----------
  hypervisor: protect inclusion of string.h

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 614c2347ea5528ce9ed42c455c544d3c09219a94
      https://github.com/siemens/jailhouse/commit/614c2347ea5528ce9ed42c455c544d3c09219a94
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-27 (Tue, 27 Oct 2020)

  Changed paths:
    M hypervisor/include/jailhouse/processor.h

  Log Message:
  -----------
  hypervisor: protect inclusion of processor.h

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0ba496ce87cbb93e6a9f9b2d94766a8b77c8cd9e
      https://github.com/siemens/jailhouse/commit/0ba496ce87cbb93e6a9f9b2d94766a8b77c8cd9e
  Author: Andrea Bastoni <andrea.bastoni@tum.de>
  Date:   2020-10-27 (Tue, 27 Oct 2020)

  Changed paths:
    M hypervisor/Makefile

  Log Message:
  -----------
  hypervisor: Makefile: hook-in -Wdeprecated and -Wundef

Currently, no warnings triggered by these two flags.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b95b6df40fe8851250d8e3bad7a46a0d99a16bc8
      https://github.com/siemens/jailhouse/commit/b95b6df40fe8851250d8e3bad7a46a0d99a16bc8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-28 (Wed, 28 Oct 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Adjust type of __hyp_stub_vectors declaration

Aligns us with an internal declaration in upstream
linux/arch/arm64/kernel/hibernate.c and with an external one in the
linux-imx downstream kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f4a941d9e0247b1aef871a40b47c48d36645f2b4
      https://github.com/siemens/jailhouse/commit/f4a941d9e0247b1aef871a40b47c48d36645f2b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Detect busy units

This avoids taking over the SMMU when Linux is already using it due to a
configuration mistake.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c90737c12d16375fae106922482284f003e98fe6
      https://github.com/siemens/jailhouse/commit/c90737c12d16375fae106922482284f003e98fe6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Makefile: remove duplicated rules

Remove redundant rules by using wildcards.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 12a42e44e26a79a36125f2c9349bc3885ceff7cb
      https://github.com/siemens/jailhouse/commit/12a42e44e26a79a36125f2c9349bc3885ceff7cb
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M .gitignore
    M tools/Makefile
    A tools/demos/ivshmem-demo.c
    R tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: introduce tools/demos subdirectory

And give ivshmem-demo.c a new home.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d845c83d937335e39105e08b5c164adab825dc16
      https://github.com/siemens/jailhouse/commit/d845c83d937335e39105e08b5c164adab825dc16
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-10-30 (Fri, 30 Oct 2020)

  Changed paths:
    M .gitignore
    M inmates/demos/x86/Makefile
    A inmates/demos/x86/cache-timings-common.c
    A inmates/demos/x86/cache-timings.c
    M tools/Makefile
    A tools/demos/cache-timings.c

  Log Message:
  -----------
  inmates: x86: add cache access time test

On x86_64 systems, this test inmate measures the time that is required to read
a value from main memory. Via rdtsc, it measures the CPU cycles that are
required for the access. Access can either happen cached, or uncached. In case
of uncached access, the cache line will be flushed before access.

This tool repeats the measurement for 10e6 times, and outputs the
average cycles that were required for the access. Before accessing the
actual measurement, a dummy test is used to determine the average
overhead of one single measurement.

And that's pretty useful, because this tool gives a lot of insights of
differences between the root and the non-root cell: With tiny effort, we
can also run it on Linux.

If the 'overhead' time differs between root and non-root cell, this can
be an indicator that there might be some timing or speed differences
between the root and non-root cell.

If the 'uncached' or 'cached' average time differs between the non-root
and root cell, it's an indicator that both might have different hardware
configurations / setups.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2f52a11d73461f64ca0d0bd36aec27e2fb4e838d
      https://github.com/siemens/jailhouse/commit/2f52a11d73461f64ca0d0bd36aec27e2fb4e838d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-30 (Fri, 30 Oct 2020)

  Changed paths:
    A hypervisor/arch/arm64/include/asm/smmu.h
    M hypervisor/arch/arm64/iommu.c
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Enable only on config commit

There are no tables ready during arm_smmu_init(). Therefore, we need to
hold back writing sCR0 until config commit.

This fixes DMA errors during startup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/e75cec8021ba...2f52a11d7346

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/e75cec-2f52a1%40github.com.
