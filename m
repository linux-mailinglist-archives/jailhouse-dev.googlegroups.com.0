Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCUO3L4AKGQEBHFO7TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEC2278B1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:11:23 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id x37sf11730374qvf.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:11:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595311882; cv=pass;
        d=google.com; s=arc-20160816;
        b=lR0pkX6uJfGIa28LtAjnuwlUQCJeAjre5WmDAwQQYVmYqN08wCqsMTcgQUdodyp531
         UrVg4EYSnSGTcL3evOm0QaKLvlLdEW+gSARd/0ZtlX2Vwp78OjNcWAFL5fmyskVGkXwG
         RqKfDYzXKg5ZKeLnaupfc09hYKsTDbHJtpVIE4EPaJ95l0QSiAtAoB8uRC9uzxmiojur
         Z4bMVuhZJ40I+8YVNtE2dSXrLay8bPo13bToiwMUlMX98SmjVq6+JXZsc8tdenzhg8VP
         PwI7N6TyWYSi97UF0fbuWJJaHZjUgevdfO5wahqklDdSZqd/E7wlGGvCDilCaQjiAbvF
         WyOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YDtte64vz0G3Igz/mnYs/cLf0QrMprPTgc/aRP7IbYY=;
        b=H8VodJQgZQxrRR6TLBET9MspSrzgabRDxxH9vBNl8HviwltN3u6GhpnPbm3+6CSfl3
         kkumhvqbpybkDDDdwNWxqKuyKhRpBTXXikQYt1J8UkvQR2hee+2whHcbcthoyp3eElQB
         DXzI10xWNhfzh42FzLqeK4dgnv4AWG6KcyDt8nUA1UVFt0gzzQJnf/HkZaDFE5AMKcU7
         D97kuxhQB45nJm7be79HsGaAM1h05ajJ6opOrVyKYlhiGcVStrKT1lnkTIJxWMyRUpgF
         a5FOcl5FwJwIze580twKvMjnUSB4Cwxbqj8WRCi4SU7C+diNkWOJhrvWSep2CNXWGWdC
         ersA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mtMmZ1be;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YDtte64vz0G3Igz/mnYs/cLf0QrMprPTgc/aRP7IbYY=;
        b=h9gaSaVQN1R4d9vdE13khUzjK65ZiBM10PEoJEt98DP3eYEMY1nKlYjuplMztYy8Fe
         wX7sxHHMxgz94c8fV9qpF4Zx1NxlYpHLBE0+nlhNu1XqVx+jkTn0HTZR2LYximtW4lY8
         Xuca3nybQciI2bnjpU/mDwCQG/qARWzkcK/RB3GMdSvQBdm5Y2Aglxv4Bbp0Eq7wr2Eh
         sJjJffMDzehdlsUg35+e+ehL2bMPD7H2IBpHYXY38Mh0uiLjbNQnIFZ9sOos3TsHAvKb
         A4S1sTxFupjprexsMuQzRNDbR/48ju6u+b74qfI0dZ2Ye0r3AuMBFbAleWubywShWAJw
         HCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YDtte64vz0G3Igz/mnYs/cLf0QrMprPTgc/aRP7IbYY=;
        b=jgPnWgSAyb277r+fHOoUKUZEHAdvOZR3yVOAnwR1dylv+PMk8OPoayrv7uxIBHAFli
         6qmD386KkrP/+JQQBEr/NGi4yQuDSD8YtUiyrQHUab7v9uELSBkbrrVOc8stiRNlzTKq
         /ukHnjadO/RQeblPKLcX7e8sN7VSaYO93hY646vUuPF3ubb1SYGh6EJvlAo0NUoqwOmo
         HA2c5kWg3xzyFpD1rQN6JiuuquDBv5CnBj9yCerTBEnG6KtMsDzQt+BxWGZhmWcRFdeX
         o5iVHkUhKp2AZHUD3bqbxYBEB86kIidWVbNPYlhFtEKwRAxiDKBO5D9PAGS9mRpgsYM4
         rp9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WseJOFTLsOigMEWdaJ2tSKAlq+CBDUbOPXa0iYOz0yfgu205z
	QeLGsRIQAHGqjrR7QbIyDjQ=
X-Google-Smtp-Source: ABdhPJyH+RoX7ADP5/dQcakG5x0scDgiU68/lHXC44ly8qTSADwGvcXIMH3G8QqRIBZv6BBLtaEewQ==
X-Received: by 2002:ae9:dfc2:: with SMTP id t185mr7226832qkf.49.1595311882233;
        Mon, 20 Jul 2020 23:11:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:5:: with SMTP id j5ls4788252qki.6.gmail; Mon, 20
 Jul 2020 23:11:21 -0700 (PDT)
X-Received: by 2002:a37:ad08:: with SMTP id f8mr7372043qkm.96.1595311881800;
        Mon, 20 Jul 2020 23:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595311881; cv=none;
        d=google.com; s=arc-20160816;
        b=0/ndZBrbUPZaf/bYHWxPeihGEeb0e10Zc0ptcAPhTojW7Bn0O6HbEJOt5hG28Q2KSR
         +4VoOIzXM+nEvqImi++cW6yjiEbsdzRrczUur6ixVcmPS24E1uDEPjD6ydpVDzfg75VS
         htszO/B/cx0U8Wybm/3pQAY3XT5FA1Es1RfBkolVqHXvxVV5QwVsWXE0FUA8PzwDoN0o
         riU9uReLPlTDbVgLlYzI5X6ZIZJVOPGaReL4rmeQkSvP1+/dMmScUbqfHhENK5UW+Tg+
         xJylOQH3AZPBQS0YXn8v7IXDbWfE9eYCgMP4IOys9gWbWMczO1S4J3fEgo5HupVLsz0N
         z4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=AEw0hOIxvIkeTafyRYyXngl+en1WNVXMhPMJbSCCY90=;
        b=bT/jKXVQIzO3JqthjJdUdxbD49FVOyjdYlp3mSirfKN5nPr+6BdYeL/QxjT9rgl9db
         z0k2DODzYV5sVdivzui2F8gelz0TYcVtVI8wSdWJ4AOQ9RcsBusK5rsv1ANWdN2cMLOK
         bu/UlvO6oqJOWIawEIHMar5MYGd9U5Ja/cCKspzc/E0khuxvfTPMtz/M5gZZVhJvOqgJ
         nmTbsXk2gaujV8LR1xH/E/DpBeSkA5lWh9rC0HIrNHNKxy2up1z5vYLW8wFkvJBJ1K+c
         lgt5L8w9onIwPsoXICAHSj4SC6soqs1jm0c85OstTDO6ZR6t1FasC/w2W1BEVKbiL8WX
         4PLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mtMmZ1be;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id t55si1019277qtb.5.2020.07.20.23.11.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github-lowworker-cf59896.ash1-iad.github.net (github-lowworker-cf59896.ash1-iad.github.net [10.56.112.26])
	by smtp.github.com (Postfix) with ESMTP id 98E176E1E05
	for <jailhouse-dev@googlegroups.com>; Mon, 20 Jul 2020 23:11:21 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:11:21 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/384720-9b4efc@github.com>
Subject: [siemens/jailhouse] ade323: configs: qemu-arm64: Move virtual PCI
 host out of ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=mtMmZ1be;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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
  Commit: ade3231483b5e5b16800f48b56e2e2c45ab67a8f
      https://github.com/siemens/jailhouse/commit/ade3231483b5e5b16800f48b56e2e2c45ab67a8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M configs/arm64/dts/inmate-qemu-arm64.dts
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: qemu-arm64: Move virtual PCI host out of flash region

QEMU puts virtual flash between 0 and 0x800000. Avoid this conflict by
moving to a real free space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 41d858e9584d59931b54a1946b7c3265b6ba1cd1
      https://github.com/siemens/jailhouse/commit/41d858e9584d59931b54a1946b7c3265b6ba1cd1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c

  Log Message:
  -----------
  arm-common: Write VTCR only during arm_cpu_init

The value of VTCR does not change while Jailhouse is running. The
function that writes it so far, arm_paging_vcpu_init, is called on every
update of the pg_structs of a cell CPU. Writing VTCR each time as well
is harmless but unneeded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
      https://github.com/siemens/jailhouse/commit/9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Refactor irqchip_send_sgi interface

Pull the setup of struct sgi into irqchip_send_sgi, avoiding the
duplication of this logic at the callers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/384720216c2f...9b4efcf4cb3a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/384720-9b4efc%40github.com.
