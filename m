Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIORXPYQKGQE4B5HFAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA714A547
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:54 +0100 (CET)
Received: by mail-pf1-x438.google.com with SMTP id r13sf2524895pfr.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132513; cv=pass;
        d=google.com; s=arc-20160816;
        b=ycN8zz5zCmMLDJk0+gdzY2lmnbf35EBjO+oFlzCvgvlkHSDWFJMarMQTEiwBVGBPa1
         H7Uyiolbs0An+5GPo3rlUm0mYwwpz+yn7vO9QotkmedXp1ObHLN2AmgPz1CFB95MqGrQ
         JQs6rnNawKr9JqgYobhBdkLAocP2QeDn42y7gLZJWE/d7MC1WdKOwho/Imgc1hZBlzC1
         MWReT9ctx/xe6aGjjFjiP0aHoF1phY8nO5ax5w4o7PvlBWXLDqssO36aGH+jq/63h277
         Yg8rwXiWbPn9OzfEExa1oGPOB2Z61xDKa6P5ihN8535ynMQDVynuYZX4DCChRIZGY54j
         GBIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=JVuKGgITUlM+0Ep5/c90TFyrm+CSawLgUkPkFfWoVlE=;
        b=FbJUpa8PDuSx2xZXNtGUb1oyWd4liZeyyjatDwMiYzTRGb6BqKibXQm4wBIRvRpq9t
         wRb80qKcVlt/PpRccl4KD7naVeG5lxwKiuMWHJEXeyMok4VDLsYepjDdAyUhl617ic5O
         fSRF4n8SAuYzbElQEYLQ89isJ/wkkcVLfWS2h8JQ/JVp41jxQubhV9hMdRK/vKuKG38D
         urzDgBInc86/dJOLdAh3bxLQqayX0txS+pWqIc6lsw2O4jVbFB0RWt/TQMNqrLD5/7Il
         9QRGa7tzlUP/VvXwpnv4xzRXKTyqMy54E+NHVOBZtvR0ElOAe/7WKw8rnrC8IDnDdUSo
         ilhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="X6b/Ssrx";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JVuKGgITUlM+0Ep5/c90TFyrm+CSawLgUkPkFfWoVlE=;
        b=dtbjRFtL+kkkqr57Edbez1gYRmU4SZ3mTzbEtlTDYzP08VtR0F6LCEVKwHWQfZ95En
         zt9h+Q/QScARE3I/joF2eieDuxuo2LgfN3Z5B7Z8wElCmgwuvBpsCeBKz9rwsaazSfJB
         aN0QxEevLtnNKahaS0uvv6moyy30YmqvnbulJEUl7Em1OWbH51m2rzmRHRhdCdMZTwwP
         nFnHJPBJa9e1oH69EUPMP40kUhGg6qlJFgSthemP2yQPsVqWJMbA7S2pXerlTvyC/nyx
         wnxjO84yuV8V8kF1FdbpRS9fRVpBT/jGjdc8fCR3elPgVt8wWETgF7BpkfnX8btNZxPw
         FG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JVuKGgITUlM+0Ep5/c90TFyrm+CSawLgUkPkFfWoVlE=;
        b=ejmhyUqbCIFIXCy5FlO4mEs+CONoKP/0oBewIp5942xkhOuk3w5q1XwE34SvThMQVD
         RWJGCQqEISxslvutf+ylRWgVLFqshrWpAuL5qoRb/AaCzyMV/Cv6NuCLb8qOl+xul65c
         t3VRYfjbIS6yFFLjSQwC1g5Z5z1b89t/d9Hf75L4Qt5e4NB5/+6LrKC80/CpGjglkEz5
         fYhLll7TPcgbe5cCwNIQyxbjMxFbie/hCpbzN6m9G0l9SVysN2law8Cra9l+9J0kmwn8
         ANQXohRfP0vwBo8aV6fbbsUG9GkaXJqCnEowlJWKwi53fy9D0G6lsN/d9v0sNKFzcVDC
         JnVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW12Z3Q7qaHTkbw+nswCDCtW2TCjhlyIU6/rzp5HxMzuHvrnvUF
	98FSexn+uryMJSa1OiR2NRU=
X-Google-Smtp-Source: APXvYqycyubHKY/HFEDPulCz5mI+3wqynzm7+lKZJox482tnSVmpJJrkYso7daVMjhWWVkQyETh20A==
X-Received: by 2002:a63:2842:: with SMTP id o63mr20004527pgo.317.1580132513460;
        Mon, 27 Jan 2020 05:41:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:6644:: with SMTP id f4ls3858701pjm.2.gmail; Mon, 27
 Jan 2020 05:41:52 -0800 (PST)
X-Received: by 2002:a17:902:bcc5:: with SMTP id o5mr15125156pls.115.1580132512783;
        Mon, 27 Jan 2020 05:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132512; cv=none;
        d=google.com; s=arc-20160816;
        b=UGLmm6XfY8tIhqTiTlbmnHVl9JahPoKSd98e0ZQLTeb+5ymJavPfljhHbhnAwdRrdb
         cHknbbEyKoDBDAFqA5/snkWRpopXrL31hRaqbYes20/KyhAJfQZbQuhiq2AYcCs/obwO
         wUn8iZRNKbLy8SqXY3bQ0kefp7CMuC/OIk322ZaUbDQbbTPPC9mZ7w4I88Uq3jGiJATZ
         /bL3YN2GpIHBS7UWhpi0MsAxA36QdKTLvCqUndPmQts7JLsvYIyd6ea419XdgpZLVYqP
         I8niwAIorvI0wnpC+C+m69d94TVVq/nueyPg3hIsFiVc4zB4jZyrOemzfxlr6XZyj4Dq
         4HsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=stJt6bDR8q+FvnM6/DYXhQ71ynE43qQm22a33i5JeUo=;
        b=cFjbxbDsSanSg8FCKt3o45bNk5sJZf7R4zrrpEqYk2OOcmihgzpQS8BT5V2elcLAa9
         ogdFOwLt6w9YgMb+kgBjOyX+YpF/znRS58LPAYNSqQ5y2WSb/NIcUV3PjBj+Ch1Bo+XE
         IAcqO49WF/xqBqTNhxwTasydXfuDXNy6uNZAsznjjLgDB2Jk/DJZWIpnE2rweKY0GGEc
         fvnzJ/HQhZYqep7zxyPwqW7XsMoS/ZB87EH60EwSgdQ4CNXVsI5K/N2ipVzQqEBfdujk
         bwdUl6hxoVFIRpZ++ThYCGzs3ARYcY/VAYS/jGIw9L968i9Q1PG7xG/ebep5Qt1O+vmQ
         b7hg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="X6b/Ssrx";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id x13si873714pgt.3.2020.01.27.05.41.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-3a0df0f.ac4-iad.github.net (github-lowworker-3a0df0f.ac4-iad.github.net [10.52.25.92])
	by smtp.github.com (Postfix) with ESMTP id DD60D8C0043
	for <jailhouse-dev@googlegroups.com>; Mon, 27 Jan 2020 05:41:51 -0800 (PST)
Date: Mon, 27 Jan 2020 05:41:51 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/5ea603-2c8fc1@github.com>
Subject: [siemens/jailhouse] 8ff901: core: Introduce
 JAILHOUSE_MEM_NO_HUGEPAGES memory ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="X6b/Ssrx";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
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
  Commit: 8ff901900daac91c3721f88e221883b56c74549f
      https://github.com/siemens/jailhouse/commit/8ff901900daac91c3721f88e221883b56c74549f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm/mmu_hyp.c
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vcpu.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/ivshmem.c
    M hypervisor/mmio.c
    M hypervisor/paging.c
    M hypervisor/setup.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region flag

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involves on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

PAGING_HUGE/NO_HUGE is consistently applied to all caller of
paging_create, using NO_HUGE in case only a size known to be smaller
than a huge page is requested.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 78fc409a3a5288d800de94ec0847beb5430647b4
      https://github.com/siemens/jailhouse/commit/78fc409a3a5288d800de94ec0847beb5430647b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  core: Tune comm region's flags field definition and documentation

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6665ba4a7bb1884cbeab01df1f1203769a42dddb
      https://github.com/siemens/jailhouse/commit/6665ba4a7bb1884cbeab01df1f1203769a42dddb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Pad comm region to natural alignment

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: da42249bfb6543bbba67a0f6b604071a21a8a490
      https://github.com/siemens/jailhouse/commit/da42249bfb6543bbba67a0f6b604071a21a8a490
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h
    M include/arch/x86/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  core: Mark jailhouse_comm_region as packed

Ensure that we do not deviate in alignments, even if the currently
achieved natural one should once be violated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a66f29e51f7162f352ab1464fcac2f212aa92201
      https://github.com/siemens/jailhouse/commit/a66f29e51f7162f352ab1464fcac2f212aa92201
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M Documentation/hypervisor-interfaces.txt

  Log Message:
  -----------
  Documentation: Update hypervisor interfaces specification

Lots of things changed since the file was last touched. Add the
hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
with new statistic types, and extend the Comm Region description with
the console and non-x86 extensions added meanwhile.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>


  Commit: 2c8fc1423cc14775fd3eddb19d40218959360cdc
      https://github.com/siemens/jailhouse/commit/2c8fc1423cc14775fd3eddb19d40218959360cdc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M TODO.md

  Log Message:
  -----------
  TODO: Update

Add an entry about VT-d modernization, refine the SMMU to-do now that v3
is available, and drop big-endian - not relevant on ARM in the
foreseeable future.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5ea60323214f...2c8fc1423cc1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/5ea603-2c8fc1%40github.com.
