Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNVR4D6AKGQEWEL4OVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2629AC8E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 13:55:20 +0100 (CET)
Received: by mail-pf1-x439.google.com with SMTP id f15sf857404pfj.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 05:55:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603803319; cv=pass;
        d=google.com; s=arc-20160816;
        b=YHjGpCvbcV5g1EHPs3i2fv3M/zpeuguzbS+vLI7qHCFnLkdlA5L7OjYeFKV/hUu4pG
         P6EHhTvVzJ1jSJnF4QICf5DpZre+Dzq0yMET278k82zUHVsvPYbE8j2fzodYe5Tb4LYX
         lkoIUON/xRFuIEe4WGt+ce9DbpiRL92SO8lOQdJGw9WE/voSEmK2+22D5LmEKEXFVhjk
         iRdCPbizNGKKuZ2RTLSAQSQY/1ArF9StghAs8UhdxL1llKt6U26+B5icDN3ITubpWwgB
         9YpOSbtPVv8qAJeaSOYUKTIu59WcfeVCY4plngHzRRovxNSJAcm+Toe9oPanhaPT9ziC
         2/bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=E+GWiEE/0vBea2KZ/SXXyU08RjLLMM9TQClicMpqjbs=;
        b=IHD8or6Vyl/JzWp9eKmwcB77jEZaFv2EBWQ5xUNtv3ctqXvPTxWIpWgPxRRHe+vpYb
         APZ0EVzJYS1qWo4b+vxaglHBSX95lWGndKU8K0tpYjiM/9TmJQH3mUWHUHnXtxlJMRfl
         hNisld8OOiqezwrKGuNApliZkeAtLXfW7+E+kn/+KnDut7LjZQ520l3RmbqUfjdJalXA
         QOB/OOxrZ9kgISUOH9+eMvMNJj6KnZk4QYniK+uNoqU/xRIASSas4x/DBEPJwYb6tKZ9
         sIYR0QbRcQEcpzoO2+7z/Rj7L6460xU0pstXriDw+gZqbA2SV1Iv5ZcRjCfwnvKVUSIR
         3MgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Bw5UjTkN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=E+GWiEE/0vBea2KZ/SXXyU08RjLLMM9TQClicMpqjbs=;
        b=ganf6l7QsX2SKhwO4P1I8xjOXMKFiOX+nIp1d9KaV+PWhOfxM2In/gTkHTtg9mD9LA
         I3j7bvHhUANuI/8P7nMR77AG/jKNruhIb94d9AXk+tW+ke+VOZveKwFJ3zsgcQIWnVpM
         vf4WCKz4202Zc8PLGbedzRrAQ/0DMc+41M42ljxBQ7lpmJsRqYnfDyoRmfOc5T/FdYdc
         +bdaW+z8fSgXxVAH5jjKNiFyeHxSaJrZ851X0FUvpZOm5LawizlMgkx2/Z2IbTLWYgt9
         i+iYOMtF/pfrPfgkvfKAtJkfyZqaxKZMEnyJernZ/q4drOw4y9WRhJ+kD/XoOTSQbVqI
         y8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E+GWiEE/0vBea2KZ/SXXyU08RjLLMM9TQClicMpqjbs=;
        b=VLiKAX8ziuPPPxEbpdJf4zcrzn+yPUckgeVYopE3Wty67lo2okS7yho6xdNHTMo0ag
         ZhoFxyxy17JLzly0Nw1w5m+oIOFbg0e42X/eVk/w9WSB1a2PBGQtImdOh9ETOM/Tbkjo
         F9poRb3C/ao2DE3c++594e7rytoRQz/V+bBHd+At+YKroXJBr4IMW26QidHGnREaM8Cs
         JauL0igatRs36F1HLyX63OhTeUF95Bf82CCJf81cz6a8AFbV4DvlhLIHNTA8cCe1V9+C
         iE7dPXYhXpjvfvTzu+k+QNA9ebMh0I376kto+dxj6IdiOpA+OSfgsL4kN85KgJjMsows
         zmHg==
X-Gm-Message-State: AOAM5321MW1NjqGw4Ns8JcDWa6hmoh4YJuCNhKFiC+N2hK+ZLsZCZtvs
	katt/qNzqTIZ6YIFMkMcyQk=
X-Google-Smtp-Source: ABdhPJySXCnibAngmZmoHdQpSDMO/Z5naOKDQ8O1EUVEY8PGt/J2xE7mDkLcgaGUhvjJcKz9YUH9lg==
X-Received: by 2002:a62:ac08:0:b029:163:ecb1:ea2b with SMTP id v8-20020a62ac080000b0290163ecb1ea2bmr2158937pfe.63.1603803318753;
        Tue, 27 Oct 2020 05:55:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8b8a:: with SMTP id ay10ls702105plb.6.gmail; Tue, 27
 Oct 2020 05:55:18 -0700 (PDT)
X-Received: by 2002:a17:90a:1181:: with SMTP id e1mr1960554pja.77.1603803318040;
        Tue, 27 Oct 2020 05:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603803318; cv=none;
        d=google.com; s=arc-20160816;
        b=V/+8Y4zj0L0BFdib/Kkxwj/8NM3oR6187w5/92waNzIxf46Spj2sC5eEUc/C+7zQjE
         FNli4cRp4cet3vPB0PhcNO8MpQHUC/wlr8QhxENRVr0T5+Uu3hLG7NK7O8rQUWgkvo0b
         PioNyMT9RrGyIqQsnYeyU8WTSI2Sq26DuwPdfUFMAIIAnyUwb5/fFmeNJfTochh6Lo16
         4lraajR2yz2ol/UMsvNTSiRcO1rFmbCaq8wwjQZFRTDH+KkIuWBlYdMBkUYf3+Y4PwU+
         kj2ifK3c+qIVGFMgpO2I3KYifUhjI50VNISi4i5plYiRi6xbSsKn7XRvB0uUmXBGa1AU
         9SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=3sNAougnNTXkM0UIVO223f9QBTXxeFcXxm4VIAWDgDY=;
        b=QDOJ4z8DmifSV7HUn3bDfXdwRO1qJlPFpE7uuLKfvoWtgzaH9Tbtga/El6SAem2FFt
         JxbmtXtwy1m8Iwqczya1Ole0QrkGfMlCcDUdomyITET3fWEFmmqEVLxHA/owaQ6VQ0/z
         +WJVA6eQ1BxSuMVh35FR9TqjnYeKtPMgH4HY9manqdaqP5+HEIP6m2si+ADDUDz4pbuh
         XXiaed8Js29d6qu3BOmrmuRXONjTmufWH3I5OqRAxmUA6tWGp5Xa87OitUJmJh2/aIxE
         WT8jQEI6fw0vYo0GX8cYVTTOXZ/Tm2qKEGTJRBvBUM0CxKiMrgor6bGO7IOFTnw7NthW
         jSmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Bw5UjTkN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id j63si79965pfd.1.2020.10.27.05.55.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 05:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github.com (hubbernetes-node-8f1f80c.ash1-iad.github.net [10.56.122.38])
	by smtp.github.com (Postfix) with ESMTPA id 3A2A8900FD4
	for <jailhouse-dev@googlegroups.com>; Tue, 27 Oct 2020 05:55:17 -0700 (PDT)
Date: Tue, 27 Oct 2020 05:55:17 -0700
From: "'Andrea Bastoni' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e75cec-0ba496@github.com>
Subject: [siemens/jailhouse] 014031: configs: arm64: Add support for
 k3-j7200-evm board
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Bw5UjTkN;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Andrea Bastoni <noreply@github.com>
Reply-To: Andrea Bastoni <noreply@github.com>
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


Compare: https://github.com/siemens/jailhouse/compare/e75cec8021ba...0ba496ce87cb

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e75cec-0ba496%40github.com.
