Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXH6TTYQKGQEUOPBFTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BC14441B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 19:13:50 +0100 (CET)
Received: by mail-oi1-x23e.google.com with SMTP id b5sf1489410oii.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 10:13:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579630429; cv=pass;
        d=google.com; s=arc-20160816;
        b=waazgNQ2bqAI1PdJD7XQ5ukXMXqjguLnG8C9f/c13Ozolhl/w2j6pgcs3qtwWXkCTv
         9GCWs6kpTwljsbYG11/b9GdNIFM4ZuSXbWSfNza5Ch3/I2oVsYWHnBs0/kvoQrH/YMpA
         e+1eu/AIuDfS0rmm9jDT6aihAZN/Yl6LDT7a7/bqxAHMIrvjAGQ6GwE98oGbbX+6cZRC
         s8IIPaapbnpv+tYAnvwyYhXlUPAjf5ZSS1IdqAHVzLOlFxsBotaBhQ4aP2XIUt2brr1/
         5TpsJPVS0EM/BzVo9oW0G9/R1CFUWu3/McoUTdDFc/tDi4/z7IAAvbJ6j/X+43yiJFkL
         aMJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=48F6pMIbO8xElJ3SEk4i7yYeorftz2BfN4ZeL6L5b7k=;
        b=LJk1QUqatlwNdkAK0B2EjJHpmMWLJqMsW4lF22T0MeE9K1apxS7KFKxE/XCZl7Cq91
         so5mRC9mClwVTZ4sKve7R6YQZ6ws0T72ZkONrhepRSqYB8TNTrS2CksIa/PIk99v8dNj
         9mLiH/DXvvE4ifvg/tsqdXeVpU8cP5dV4L7CpMdt5prfNJxdw1QLGUW29Ue58+p9brAf
         bOoKOeFhTbEks1cjI2m3N0PY11VNn/0R2LSgzix32LuUuzTgBkV7JKb5pHj+Sq2t5pEt
         mXKwDtyZZ4CBMNndS6zCirDF0NZyp0jNiFw0KAPFGNTwiNXWYdDpvbyIVtJDVbkKzpp5
         kCkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IhaGpsKj;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=48F6pMIbO8xElJ3SEk4i7yYeorftz2BfN4ZeL6L5b7k=;
        b=He1f5dNxg1mQ+TNSlHZ4U6D+tHZGLffHYadKvpovTwqDPOdPdYIajs17IvymPiQ1Ph
         QXsjHzz9yGwBqpn4lvF/z06tIwpc3UGnUIWgaHz5nHB9vzb1SW9X89GMJ2r/5RYfoZHN
         i4i9jFIe5KX5k+uYu7gQQPdOzNOdJbaEguUySqf93mSEfyk504e2ls5BLjqULLzQZac8
         H31oTNHkWrnHxeqEQhzcQoEL2q7EWbsOYwM0NT+vLTDJNX7GedgygfqaR+2cm8LBxiv2
         g8C+5K29bXgRmItb2CORacW/iWOtVa51D3MM1x471/vB8O/BHJSfAVLgEtspxI9UCwW5
         8s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=48F6pMIbO8xElJ3SEk4i7yYeorftz2BfN4ZeL6L5b7k=;
        b=IxjzY9yK11Rw0DIvOL9rAaA1XQWZtpcirlejddurXxi+thdsHdunu5/ihywbzjr7jm
         Pkd7gOfMSqKnWY3wYx7v9wRuy/x1qiZCmBYSCfCEZMyRos7b7U7E3NsXrWjfzPiEqyr7
         kvovtyzxlyq8UhFIAbs49zJPJTTpCkPWv+djOY+42/0vHMgTKdHddoq0walS7HOFEf18
         fmEQuR3cGTMY3oWPj+2SB8qXZoBJ4hgZ7qm5zkf7EeEVHiK2sMrikjQMJjQ4NiPpe1/V
         QcjMf+TDsLvekNTgLXc8VDTrauYNfYrUVU2dhpHeHkR2Ne7PBZHrxuabzKWvT72Gfo4+
         ozeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXY3bVcpcI1mcueR9TlqwsEhXRnZhD4PQWAjmGw5oXi00ocF3oc
	9V69HadBqp6EViRvMP7iR8o=
X-Google-Smtp-Source: APXvYqxrU03IbWGAbQX0BF4EnstZ27kjdX+bh+P2N0sbLiDfrQCAdQILZEAkjOW5eMogaJk/fdjVFA==
X-Received: by 2002:a9d:7653:: with SMTP id o19mr4374787otl.118.1579630428950;
        Tue, 21 Jan 2020 10:13:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:a81:: with SMTP id q1ls6449507oij.12.gmail; Tue, 21
 Jan 2020 10:13:48 -0800 (PST)
X-Received: by 2002:aca:4b06:: with SMTP id y6mr4037673oia.81.1579630428048;
        Tue, 21 Jan 2020 10:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579630428; cv=none;
        d=google.com; s=arc-20160816;
        b=TUYTxKk1XMhD19G0eeM7MilqQDpt50jKGaV/Nk6oouih6qIUXp2POP6okjPL1RQPnP
         5PSo/yejaaODTS18n6Rg/PfBmuuiLGDH94aTEVPRZReUlR5XKRSgEeS3GO+NEqFYbSN9
         cv/2tEmy6dqFqUWSrxgFVNIu03ZkOlL0IChdsucfxjM9s/FaPf/DmaNGpKxqpW4mbiah
         nEIDGsitlKuRiTIj7JUbdR1acuYE7YoDLONkyWf4dG9DGTlQFEKRAeqYFZmMkeTYyrjn
         ACo1mm7gx8nzU0RYtMarqfbB5g3YwfrANAmIN6A9kdG5Tse76rTDc4YKh4utxDWO/Eso
         Q3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=c62/pWXpl74to+izt1yETNAYlEdOUH317yJy1f9lHeU=;
        b=Xse9rSays8omMi6aWImh6NZI4IiVMysZeY5V5Mlk0E0MhqmnDbKXgUuRc9EYEtSMAu
         KdmwRvTXGnn4OhAjBrLQT2i6pvL5bB8Cm+9XcLfY0CRw3RYPgLQCkcOTkHXLbdl+WtLT
         G0q6lbH8OgQVxCTkXb8jVkOZEGvqCq4k5bhcQEk/1SnTkE4lOfr5RoW/udK+Je3thGr5
         JwvH79MD4UOuY929woRJtMCOBaCutvA7mlLzOZRFIjTdjirNLLPRxBDUeAzqzLEIslL9
         T2yANrIl1gfE2w/fgAnFNBU9PBdtRT2c0I59a9WVI8Tl0nuLRpYJwHJWawjbzv45+6GP
         5Svw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IhaGpsKj;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id a21si929185oto.2.2020.01.21.10.13.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 10:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-45eca55.ac4-iad.github.net (github-lowworker-45eca55.ac4-iad.github.net [10.52.25.70])
	by smtp.github.com (Postfix) with ESMTP id 9AD198C0FE0
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jan 2020 10:13:47 -0800 (PST)
Date: Tue, 21 Jan 2020 10:13:47 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f27064-3954ce@github.com>
Subject: [siemens/jailhouse] c4024b: tools: config-create: Adjust template to
 latest ch...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=IhaGpsKj;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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
  Commit: c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
      https://github.com/siemens/jailhouse/commit/c4024b68d0d17f6cf6d55a0b61845511ed19e6f7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-19 (Sun, 19 Jan 2020)

  Changed paths:
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  tools: config-create: Adjust template to latest changes

This was forgotten in 3fac413f0647.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a6d8decf371dc5560a335ab9c03781e3f2387dcc
      https://github.com/siemens/jailhouse/commit/a6d8decf371dc5560a335ab9c03781e3f2387dcc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-21 (Tue, 21 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c

  Log Message:
  -----------
  core: paging: Refactor paging_create/destroy parameters

Change the coherent enum into paging_flags in order to allow adding more
in the future. Rename the flags parameter to access_flags for better
differentiation.

Use this chance to align the names and types of local vars that are
forwarded to access_flags with that parameter.

No behavioral changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3954ce65fbfdfabeab6bc12073a9f81928508176
      https://github.com/siemens/jailhouse/commit/3954ce65fbfdfabeab6bc12073a9f81928508176
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-21 (Tue, 21 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f2706433efea...3954ce65fbfd

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f27064-3954ce%40github.com.
