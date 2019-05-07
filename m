Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWEUY7TAKGQEM72HTNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A9169F3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 20:11:38 +0200 (CEST)
Received: by mail-io1-xd37.google.com with SMTP id b9sf13519114ios.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 11:11:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557252696; cv=pass;
        d=google.com; s=arc-20160816;
        b=kSZ6aTyVQ3iGqA76S7mj9Rozx0630D0R4DfcV4Kan5PIzwHSuT/UIImay1dDugMTKl
         6OFN2shaVGQrq7U/tq8FcdwCnAXr0ehSJ+g1eyhTH1fsf6shPuW059kwNejcP+Prsy3Z
         semJCMI+o0mvcArTu9pFRljj1LGPHETUThQkcQhpxgJGeiFTumKe1VPw5cSaPccHiOlK
         8LyTvinf8YbPtSxTW8rAu2qV5kVKTCEk8WJXdlV0IUKgBNnkeWOzFcrQNBA8UeNPI+f3
         /uq7xOhhsX9zbLLTeuYQ6zFzv2TdKDh4t5vaR8CPhd2hehsTSgAzyuYkj+oXw3MTO8+Z
         3G9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Ov7uuXTlXZHg8ZLqTivpmSh5HwuijXnRw9zmkNsRhvo=;
        b=n219s0x8d3LsZsWTY8zfrJ0S+RumfKeW0ieIpmj8PPW0EA021WxHsvDiMhTuIXsXE3
         EEXSZ61pvdSyRoII75gP4E0FEA9n9CBjplH4rQZzPnDQvWBIz69QmtX6w/yRyjCBf8SJ
         JjI7s7NvoUKluzmvAHwd7OyU8mdO0i6e8c9fHC3bicMAQfrX+wAZF8Vk9kdPBnr59cuy
         EWnvlBbI0Rirc9J8e4Hpzr5gknSLFXmAMW51Y/MD0yZ/CZKicsBb9owuHVR2whuH+QFQ
         kCVGdbeOXjwGgwCtxO2+meq9khIeX+MOa81JY57SvUBpv/GlfA6Dya4YepH8qW8W+VAt
         +a/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=cRzkYok9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ov7uuXTlXZHg8ZLqTivpmSh5HwuijXnRw9zmkNsRhvo=;
        b=N/PQhunhSYGRHiZvtzb3SSN5D0xjhSPOk97vY3t/ldedx0gfkcdUlDQxCLEJw6hX8+
         bDA+aKZf0VqJtb8Kk7gC0r1hyY3YhOb4UEc6weShrhXftd8Jv9B1l+2j2yC/DXpjcky/
         jBxmdps7ngJi3ckTp3vv6A8YWzatlyyxeTAx3883Iqw4nk2pJaQDpOBEEozHXcQyZSvj
         iNfcbUDVGdjtnDBJusMD+xDM0/HHaAXo8sEwi/0HKBb264f9jzUqnaBe9xG0Y4VeJhE+
         UIQD8tTSjCTFADAEkOD7DDTdhM2t1mef37ynwqcvmWACmxRSxJh7QH07XoPLarEAmH9d
         PbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ov7uuXTlXZHg8ZLqTivpmSh5HwuijXnRw9zmkNsRhvo=;
        b=nFuCJP3iOXEIRXOTxULYO4sdT4T2OuxAeUynYm3Sh4FZMFIMlQaakyCMMbfxt6KRO0
         NfterLxyccoTK2Y144M+WBSQCyf20x3rSYRHu8FhSi8TM8ulNiIz5uOqyZrNK+B8Zy95
         tqZSnZqH2OqiEfAG5cAVqBgLJr/bm7XYZAloAOPXrvzRg9fTxinzDmsIF1PW7MX5jDkL
         iDtvB/5sLHE+DTjE9UBA+XeNAbLIVxLaI+9zeDwra6uieT3zaeOlg/J638jtSxE1ULrz
         GarYGCaNOykaOLNWhDP6i5AV2ofU/PnjZYK9fIhYXcyD/eh4vsS42dSxDQUm873lctY8
         CFNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGoQlNvaTF6ZYL78FX2RrAf+4Uny/foRjHLBzHiYT0xbzV0Dim
	kSn7pGQodpATqFDlIaEBqiE=
X-Google-Smtp-Source: APXvYqwx+U3UNCKZVKG2glxTjqWgSBon/rKKaWjg3SuL6DF0EMoE1TfxLiwsz+JpGGnmYDotbXtXqw==
X-Received: by 2002:a5d:9f07:: with SMTP id q7mr2222907iot.247.1557252696682;
        Tue, 07 May 2019 11:11:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a24:5a95:: with SMTP id v143ls6056ita.1.experimental-gmail;
 Tue, 07 May 2019 11:11:36 -0700 (PDT)
X-Received: by 2002:a24:7dd2:: with SMTP id b201mr26245202itc.93.1557252696031;
        Tue, 07 May 2019 11:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557252696; cv=none;
        d=google.com; s=arc-20160816;
        b=nbMot+LJawnrstBDnrr3a0QxP33kdPi4M9qsybI0GCqEm5DVlPDPC74OVpTaZiVvx4
         OOPKDPAyW4PHw7lwfGHn9AF+dWFky3zPxfoY3L4gIDdne8Oq/QlERYoEeDHahlizV1gZ
         Vq07whKEFQvTrr/3zikaf+ZnOVG+6kLdkTZ0X5PV87iBtWqq/veafs6gm5PzYH0EOikr
         0KekAGchIVfq+65LpkcTYEHZ+7miGokLitCdkrGQaZRZ1EQuxg+v0GFARcPmMPBDD8OY
         paC1ODvKC9r7n28q6E72KbPoNIlOy62m/Uw1eIaDKgCSm8HKf4WWS4cQd8HwKI+Xpc07
         9Wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=WcSLAKChp8U5rYfhaHEq4tDkh5j/NKATx3yZlci+Azk=;
        b=jSk8QxRsu6HyH9HX4/3gq4NiNkX5TYjaT1mQ/oFWcVsyAbi/8usZ2V5GlHdUXaDpYx
         2TTwa4qoobX+YyEwSX+jSDEgFP7BoLlKs/0rAKxBkG/iFRNXssfOn4vh2fd+gJgRmvrG
         AQREUudehmhvEfcJgauRKEOO8mBIQNtW8aYWOagk/eWsOJuXN3P4zUZqwjkxl/hV1rmV
         HgG6MZCOkHS7+pKne/5HyrtOiO+rzkgKIRIMDg+T5TeVjGmSoJH7Bp0my/5ARQFS8Zec
         lBlhwK/WC3+CHI94ijM5ml+5xU34sysSQN2Gd7VxEssLyodZLeCIpk8KWvR3rNPpqqMo
         U67w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=cRzkYok9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id j63si298734itb.0.2019.05.07.11.11.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Tue, 07 May 2019 11:11:35 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/557fa0-7fa3f9@github.com>
Subject: [siemens/jailhouse] 0d5bf1: x86: test-device: rename comm_base to
 mmio_base
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=cRzkYok9;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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
  Commit: 0d5bf1644a276cb6b51a54b9b565e14c83a236f8
      https://github.com/siemens/jailhouse/commit/0d5bf1644a276cb6b51a54b9b565e14c83a236f8
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-05-07 (Tue, 07 May 2019)

  Changed paths:
    M hypervisor/arch/x86/test-device.c

  Log Message:
  -----------
  x86: test-device: rename comm_base to mmio_base

the name comm_base is misleading: the adress is in fact one page inside
comm_base. Guests call this page mmio_base, so let's call it mmio_base
as well.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8b8e460bd6c9d199c2477ae4faf6e4d2562c8e88
      https://github.com/siemens/jailhouse/commit/8b8e460bd6c9d199c2477ae4faf6e4d2562c8e88
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-05-07 (Tue, 07 May 2019)

  Changed paths:
    M configs/arm/bananapi-gic-demo.c
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi-uart-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e-uart-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h-uart-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m-uart-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-demo.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-gic-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-gic-demo.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle-uart-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-gic-demo.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/foundation-v8-gic-demo.c
    M configs/arm64/foundation-v8-linux-demo.c
    M configs/arm64/foundation-v8-uart-demo.c
    M configs/arm64/foundation-v8.c
    M configs/arm64/hikey-gic-demo.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/imx8mq-gic-demo.c
    M configs/arm64/imx8mq.c
    M configs/arm64/jetson-tx1-demo.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/jetson-tx2-demo.c
    M configs/arm64/jetson-tx2.c
    M configs/arm64/k3-am654-gic-demo.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-am654-uart-demo.c
    M configs/arm64/macchiatobin-gic-demo.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-gic-demo.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-gic-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-gic-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-gic-demo.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/apic-demo.c
    M configs/x86/e1000-demo.c
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/imb-a180.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/qemu-x86.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c
    M hypervisor/include/jailhouse/utils.h
    M include/jailhouse/cell-config.h
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  configs: define ARRAY_SIZE in cell-config.h

instead of defining this useful macro in every single config file.

There's only one quirk: ARRAY_SIZE is defined for hypervisor code in util.h,
which we can't include in cell-config.h, as it's GPL-only. So we have to
duplicate the definitions, which might lead to redefinitions of the macro.
Hence, surround the macro by guards.

Also remove the macro from the root cell template.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7fa3f90dabab0fd194e15eb9c2131b0176ea6002
      https://github.com/siemens/jailhouse/commit/7fa3f90dabab0fd194e15eb9c2131b0176ea6002
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-05-07 (Tue, 07 May 2019)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: debug-output: fix typo

Shoud obviously be 8250.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/557fa0de3f99...7fa3f90dabab

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/557fa0-7fa3f9%40github.com.
For more options, visit https://groups.google.com/d/optout.
