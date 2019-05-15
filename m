Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMWG57TAKGQEIYUJ53I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-it1-x138.google.com (mail-it1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F121EB8F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:00:19 +0200 (CEST)
Received: by mail-it1-x138.google.com with SMTP id k8sf1833653itd.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:00:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914418; cv=pass;
        d=google.com; s=arc-20160816;
        b=l+a06lv+TccbyCwnJsLehssAKkRxzb/SIjiiGeHPfuPLZA6TQ2a4tYr+IfSZ12OPNA
         CAPiifI75pj5wTVf0zaYxjdy5NU+nGRXJx6WaGeImlt/WovvNGAT1lySUF4Jf6D3bZbo
         ZD0PThidoqSf1uKcvC3/pKLUSFsK/1u7LdEoIGL1MCJ7dhAQLY607T5OVNUGXEDX1tdR
         y5KFgPII79RIawduj2HlGjR95Xzu+/9yR0e3jun/wJ1oxk3rJUrxerAI7B9U27Ft8dIc
         tY3rr8gMI6shIDF/dykMkMBolUx71N0uSQj2FHhGgNUVzEoYrv+MWY3+5n5LMsSqutys
         mh9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=VKXADYzDpGTeDxDtWmTLRvcrsZhJNRporDDmXdOwHMA=;
        b=eVgup1Qi4mYP1AmIZkAl83txcI0ptwE1f7iXNarcT7eS733Z3OV9oN7fgHKMz66AbR
         jh2aMMXDXXcc15QaLyOvmaduNJpW42i4QPZDi4xrglyh3/kKIFnLwbVYVKCkYmIGB4JX
         2wFiK6bMySxCu+5RGw0kxZclX2JQAWhm8mn0LH/tWAyQKC97oBUW9oOpSFJflFkcFTVs
         3kQfHYilUGQ9nZ0lMYcXM7BWqtzcxUAH2FmLEmdzXAeO9W6XSscu55AUej+CxquvdPeL
         /F+xPe0zAi1BfTvfUpnGpxHO1KDSeQtJKH3ZfXXCfEkt2i/Ft8TlFCcY/EDnnoG9U7vq
         HS8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ayf5Koah;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VKXADYzDpGTeDxDtWmTLRvcrsZhJNRporDDmXdOwHMA=;
        b=KMirymWZib1h2Px4B0KMOpDBs07cDC6HVAIIe99iM9fZB7NbsVdDLbbDXRLpYTtBxa
         23eNQ82i9WAQJ5nosWya0Ep6waUj246+I8+3Xm44wNMvaftvr2bxY/dbBOaNiSEIkOEv
         8TktQAGQGF4yNaTEn09q1QK9viwutm05OxRfexr+5uve9COj1hSO2FLtfV1/7RG1Zcom
         Qi2kjpkEmZLuLQQuKWBhAhDpWyDKzJ5q3ywj/48UwudEHK7cKBHLZ+VhvZelfFwkjBDz
         6KvfLJFMyTK0yJkxEgme/0qkdN/BgCZkeBTbULPU4T5AhNpgsgYD6bw1fBXVbA+f1hB3
         bohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VKXADYzDpGTeDxDtWmTLRvcrsZhJNRporDDmXdOwHMA=;
        b=PhF9v86spiMHsmfmSqK/VeE2pFkIMZi2GWWVrfQP5rz8mbXPvB0gieJltX1z6zKq95
         aVtafknzPKyZsv47yPZWrhveAm93p1vx0iY2znzV/9MCdhLFoqKkZ8TK6Sh6ow0hTrUV
         ZSvZjJXYivNOqs+LasvyJ+LA7/Wip2S78Ak2J76zgaO+suhVuunzzNU42WBI6qeozIrl
         yUTYfexwrTYGsQvwMvlZ7ttqKledji9EtJ/3iWXSUTcK1op2rigeaCh297hjUKb6LbpJ
         cKLTJsrxhg0S0xE9msn7wLI/KAKHJq676JLf6agBxIyMFYZgmftPit4mmT41v5IiPej0
         xQVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUj/2uI4NJeqe3+kKeXbMSLXvmMFhIbgsiLJhHkJSMovrjJGih2
	jUZAidN6al8ZpvbqpnkzdG4=
X-Google-Smtp-Source: APXvYqw6z5YOLdZSi545AUGFf7HsO8RNAFNs+ymyUNWz17Ex+060bDlecBq3/FyzaoolY3ueTeg+lw==
X-Received: by 2002:a02:a1d6:: with SMTP id o22mr26377697jah.102.1557914418440;
        Wed, 15 May 2019 03:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:4015:: with SMTP id k21ls320521ioa.11.gmail; Wed, 15 May
 2019 03:00:18 -0700 (PDT)
X-Received: by 2002:a5e:9505:: with SMTP id r5mr22941766ioj.285.1557914418011;
        Wed, 15 May 2019 03:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914418; cv=none;
        d=google.com; s=arc-20160816;
        b=SH9kYZBSCSqgc3iti2oKHmOOqERwkKabYYLgC2AuR0W3QpFYn69KwN5n64PMizTd7p
         X5IOoQalBWNMsRS9PDyYbPMjZdv8X/gZwOv7lPKlsFNFJa+Cc6+SboTJVsn9w9aNHi+l
         8NOrvT+L/uc/oiDBI4+0TaTkFVMu9PnQfq5wNU4k1gfKzrErob7qCTukCn5g9JrRVW1E
         cK9+M6I++PcRGJW1ePQXxr2j1GOBU5JRCXandX3//It/33E7SqPdjG9sVR+dYxxs3Nge
         NM2guvt1O32jNKBh2PGfw/3QEKog5X/ZEtpzO9Cz+MorfUczP/RdAnXheOEMCYIumcNg
         oSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=UtqWdCFaf1JtphjQjbs8AsOql46Km5NT410kRcTasZE=;
        b=Vt7F/Il6epciA5boYdW8esoeYASTHgnPUoTzHVoyedqkA/Mvs/e6wqa8z6HbVqhDxv
         doWza/D3BwiW7cODYrdEWHUmUnJ/83ba/hz9lgZk/tlz/2F4SgRGtbJ38o2ifIR4Ngrf
         VtjwB7yBwoBtLhEBPepw+ue3kLbfngjZjUEa49RHWFXsovC4Z8PYvwr79WWhECHThyUs
         DKAOMa0SnhD0nH7U5Bp6lwnYNrX5v4GMKV2p+tKxMd8pRc6jAozL7h12nZq0jJ44zw0f
         PtK+suzgaFfoP5Qo+oqkpxL0sdayXsmbn4WOqmm6ZMh8qXmNNcnvOeV/R6/MTYA/iRjW
         NPsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ayf5Koah;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id a67si146048iog.4.2019.05.15.03.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Date: Wed, 15 May 2019 03:00:17 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f27a6e-69941a@github.com>
Subject: [siemens/jailhouse] 2c86f3: configs: x86: Make Comm Region writable
 in all con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ayf5Koah;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.198 as
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
  Commit: 2c86f31e947394b14aa23f1ac5b2672b1e0a8044
      https://github.com/siemens/jailhouse/commit/2c86f31e947394b14aa23f1ac5b2672b1e0a8044
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M configs/x86/e1000-demo.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c

  Log Message:
  -----------
  configs: x86: Make Comm Region writable in all configs

Since we report startup or runtime failures this way, we need this
permission even when not actively participating in the message exchange
protocol.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
      https://github.com/siemens/jailhouse/commit/cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/int.c
    M inmates/lib/x86/setup.c

  Log Message:
  -----------
  inmates: x86: Register IDT during setup

This will allow to share it between interrupt and exception handling,
both being optional.

MAX_INTERRUPT_VECTORS is introduced as public API, defining how many
interrupts can be registered at most via int_set_handler().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bc75ae95de6346013d320dc85708aa737457de84
      https://github.com/siemens/jailhouse/commit/bc75ae95de6346013d320dc85708aa737457de84
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Refactor interrupt handler

This removes one call level by directly dispatching the target handler
from the assembly entry and also doing the EOI from there - micro
optimization.

Also limit the supported interrupt range to 32..63 so that exception
handling can be established for the first 32 vectors. This effectively
removes the possibility to set an NMI handler, but those are not
supported by Jailhouse so far anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d51321d5ed55d50057666d0af7c5ce1cc89d6621
      https://github.com/siemens/jailhouse/commit/d51321d5ed55d50057666d0af7c5ce1cc89d6621
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Add 32-bit interrupt support

Fill in the missing pieces to enable interrupt handling also in 32-bit
inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 69941a22af559b8e3afc7cf078cf774e4593f79e
      https://github.com/siemens/jailhouse/commit/69941a22af559b8e3afc7cf078cf774e4593f79e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/excp.c
    M inmates/lib/x86/include/inmate.h

  Log Message:
  -----------
  inmates: x86: Catch and report exceptions

Add basic reporting of exceptions that are triggered by an inmate so
that we stop translating all of them into hypervisor-caught triple
faults. Reporting is optional and need to be enabled explicitly by an
inmate via excp_reporting_init().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f27a6ec96016...69941a22af55

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f27a6e-69941a%40github.com.
For more options, visit https://groups.google.com/d/optout.
