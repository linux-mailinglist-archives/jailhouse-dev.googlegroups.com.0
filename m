Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5ENQXYAKGQEIC6KLXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93b.google.com (mail-ua1-x93b.google.com [IPv6:2607:f8b0:4864:20::93b])
	by mail.lfdr.de (Postfix) with ESMTPS id AA410129BAC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 00:00:05 +0100 (CET)
Received: by mail-ua1-x93b.google.com with SMTP id h10sf5410041uab.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 15:00:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577142004; cv=pass;
        d=google.com; s=arc-20160816;
        b=d2kkkWrAjhF5SNppx9Bj4degQcQ/2tjVJKoQ1Nre2cDWGW23o9l9ujeQwymh3l8DbO
         jXCAmEQdGa/cGchyXOX65MZO+gktGkgJl/HCUmemwQcPuhYTc6sx7qmNA1wdoYAd50Ix
         0+STU0u4o3vHmCAarWhHDMKfbgyRUoyK0arXsvs1Uud0w5hR6eD2Dt0wpHlJP6RDECxw
         YF9zqG57HfHygc8LxIaWw6v+gGpArLIwXvkYQDe6jhuze9hDxfhHvETajYGIBfjGp3Vo
         RRekLOFTuWG/yec5rT9UoBynKzcgJjHtez7+6sn+z1TlPCX1lveHWINEVG6sJXtU+rCV
         bGxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=CjidRsmt4gTPjdL8mK0D1oas0wTaq3VnHwQH7jfVmdw=;
        b=W/31JUcxSYpJGWrBASdu892eHs3xUmfzz0CyGb3X94oODtsNEqpSji0a05EuXbPJpe
         GKf3zcpm+xlRZ+0t2blXjMZOCECn7u4f5l1dhK4z22AAgxCF+VpLC/RKUktGj1Nmd41v
         RDCxSD+8Pa7YiaXTGPGYRNYNxoZf5qphcBPfdzBkR10H1dif6tcdsO/EShhGToAU2ewV
         sgzHziwGJ8CboL/5PcATyju44BJz4pCBGWyhsrxWQ3Tpizoug36ewzUHrPIoMySkC1a2
         1oaWX3rx3sBbuqES3B4LL54B8qqSEEnslfdUX2ecKhSRqoPU1AlMOvJ6f494lRdMEwm9
         JgvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="HKtaUS/o";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CjidRsmt4gTPjdL8mK0D1oas0wTaq3VnHwQH7jfVmdw=;
        b=hNEN4QJM2d16mQH6Eu2B5nCzWG3b3Y4d1IDGAkMouLhD2s24AWUsJ7q9xUT5Rzs216
         peps/1QeoPOoACPvoKO0uoi2jcEza3PdD6OA6WdOxo9HDmuMTsInu4u1UIgvIneyVale
         7TVLloTZKY8AnCGYsRLApvOwgUY1psvgRZV63Wa6mFPNPPLpdTanV1qIMtj1NVtzgYdM
         wI7rh7L4kc3YCsrDOItup1CmwqJNXzwwNkqexevBRLMI+0tcokUcBqUnMJsbt792VFyy
         mu+5+003PwK4bdpSG6S8/NaH8i1mxeb388tDQCG5pZU36ryyFdwzOROOQ/Cgcj9xmmkl
         89KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CjidRsmt4gTPjdL8mK0D1oas0wTaq3VnHwQH7jfVmdw=;
        b=sfeKZGRmIGd3biZTBWNc4Dltfuo4f6rc6+rfjhyplN86xwjHJrH7/nytHU+u8ASGpa
         RoFKTTSQoAwooxMomwqEOytzqE0OHpZIs1bjzPqG7hgqaIw6s1hI8h5k21HE66wfwEXd
         I45T4E2P0gfXKurpajoDpkXtjVXkDCeZhRQEQ444BAlvD4rtO6y9Mj7Z0VUJ7k0sCop1
         lfeymYFrklzRveeQWmmYua/5Ehjge8szZhZaWlniFXGE4iPqTr/rIDcjKKmcElY63Urn
         6ZCPgYdtbGeqRCyfCVdNbwY7+0S4/CX+e+baJbJOp2CWlMxCiIBsiCYVVb4bI4nYKwMT
         V+JA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6e0T3SmsHS56p6QDcwytYBGdvSZ4xcfdf7c7Seyxo/6DoR3tl
	eh/Wgv7Zk30glTjJJjh6Kbw=
X-Google-Smtp-Source: APXvYqz4Ms36K4i3erR7DCIscYJQgcJ+sHVpSAurQ69skvSATNkKX0VN0u1zii6iWxkwwWxnAfRu4Q==
X-Received: by 2002:a05:6102:242f:: with SMTP id l15mr17803392vsi.107.1577142004537;
        Mon, 23 Dec 2019 15:00:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:3308:: with SMTP id r8ls1027680uao.4.gmail; Mon, 23 Dec
 2019 15:00:04 -0800 (PST)
X-Received: by 2002:ab0:2856:: with SMTP id c22mr20056840uaq.50.1577142004027;
        Mon, 23 Dec 2019 15:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577142004; cv=none;
        d=google.com; s=arc-20160816;
        b=TaI9Ob+1xLWnlgZchUX8ZjEQdJnvuBIOONNrDDy3UplVxx0LHvrBgmkv6/OUyJtJf1
         HpHwEsuWodbI3r5QhvCWGtX3n7fqo9p5LyANVGlVSjJEfwc0rZLGWhzG/boBnCe+WCEe
         lNqWV/bwP8TFnoEHX6IXAuFI0wczXKGaCUf+4t13ZD+3Pm31ICxPxxd/0UZVPlAD2XwI
         LwaPCBek3MZMghFOYTCqlEciCCgchysdg2lO5b3wmWnM9y1Nk1Azf82aVD/nrgdfqxpG
         h6FyCp2Rkn3VfRyYHdj9Ld08+k4ZcF8ZBznz5ub6otz+jhwTWDqtDc0aj5qbeqfLX6wS
         CW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=T29gEtTISPuANiJUjUjf8SFWNTbcUpKFBuA0mspbWsM=;
        b=U5ZptJ0UGnTlXIHGBoLBZgPng91brksCF5EUl4ist7RRnspvhyk3A3TmBUQvh6Q6Pe
         6sJwwU0TBF9x5o5CeGGYPUfPJpp/N+FUcn3eYTw1uKKNwQd2KmrdTRWjB5oE1gdqrDih
         /rVJIPiFfzvh8JFcS5+UySsLHa5hHm6WvdnhvnLsIo7Z9RpAHRrZSJxAJoAE6Dr8RnH7
         ydeE8ffLoUZ7GGP+Ldn0xXxm3PMjOmWbPIxsYcEgE6DJtvJO94eLB5v7Lmqh5uXaIG6c
         XLUEKVDgkAUriAq3CElUx786nZ3pfAjamuVR+rM58ZDX5AXtiqmF9x69pTG8GJXQCGqo
         S2qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="HKtaUS/o";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id z14si611286vsf.0.2019.12.23.15.00.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 15:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Mon, 23 Dec 2019 15:00:03 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b5ef54-b8bd4b@github.com>
Subject: [siemens/jailhouse] 5acf71: tools: gcov: Fix missing symbol when
 compiling on ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="HKtaUS/o";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 5acf71718a86682e35f23252d12f5f463bdb19dd
      https://github.com/siemens/jailhouse/commit/5acf71718a86682e35f23252d12f5f463bdb19dd
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/gcov.c

  Log Message:
  -----------
  tools: gcov: Fix missing symbol when compiling on newer GCC versions

Starting from GCC 7.1, __gcov_exit is a new symbol expected to be
implemented when using GCOV.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f6778139a403e55810553f50aa84b68d428ddcd
      https://github.com/siemens/jailhouse/commit/0f6778139a403e55810553f50aa84b68d428ddcd
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M tools/jailhouse-gcov-extract.c

  Log Message:
  -----------
  tools: gcov: Adjust Gcov counter count for GCC versions >= 7.0

As in linux-5.4/kernel/gcov/gcc_4_7.c.

Otherwise the extract tool will access Gcov data using garbage as an
index and segfault.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: more precise reference to kernel]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bbad2a6d9f90d6e3ee6bc97fc6b829ab30583d8f
      https://github.com/siemens/jailhouse/commit/bbad2a6d9f90d6e3ee6bc97fc6b829ab30583d8f
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M include/jailhouse/console.h
    M inmates/lib/uart-8250.c

  Log Message:
  -----------
  inmates: uart-8250: Add MDR quirk for enabling UART

UART is disabled by default on TI platforms and must be enabled
via the MDR register.

Add a new flag in the jailhouse_console and apply the quirk
as part of uart_init for 8250 driver when this flag is present.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 86efa3d44ed9d4726d3d4ee4472a826b2e2c5e33
      https://github.com/siemens/jailhouse/commit/86efa3d44ed9d4726d3d4ee4472a826b2e2c5e33
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    A configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: Add support for k3-j721-evm board

k3-j721e-evm is the new evaluation module from Texas Instruments
which has the j721e SoC. (aka DRA829) It has a dual core
ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
storage and many other connectivity, graphics, multimedia and
other accelerator devices.

J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf

Add support for the jailhouse root cell config for this board.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 60daa4be4f8dbcf9a6b38b050df14231404e3192
      https://github.com/siemens/jailhouse/commit/60daa4be4f8dbcf9a6b38b050df14231404e3192
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    A configs/arm64/k3-j721e-evm-gic-demo.c
    A configs/arm64/k3-j721e-evm-uart-demo.c

  Log Message:
  -----------
  configs: arm64: Add gic and uart demos for j721-evm board

Add GIC and UART demo cell configs for j721e-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo and uart-demo.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8bd4b4153336f048ec2ff1deab91530cadfa474
      https://github.com/siemens/jailhouse/commit/b8bd4b4153336f048ec2ff1deab91530cadfa474
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    A configs/arm64/dts/inmate-k3-j721e-evm.dts
    A configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Add Linux demo for j721-evm board

Add the linux demo cell config for j721e-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

This cell config acts as a reference for partitioning
devices across the 2 Linux cells.
This will be updated as support for more devices get added.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b5ef548cec66...b8bd4b415333

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b5ef54-b8bd4b%40github.com.
