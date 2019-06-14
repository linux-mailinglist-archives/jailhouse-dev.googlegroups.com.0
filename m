Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIOVR3UAKGQEEWHLG5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7304601C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 16:09:38 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id 5sf2151587qki.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 07:09:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560521377; cv=pass;
        d=google.com; s=arc-20160816;
        b=NY+LSKo/3pP65pZKGGExPypRe4ygHdJ+ZI8IGbrINwc6YuAUebQruGzdPVdF39m1en
         kuu5yPSuTekR8rgY52XWb8aM62vZUcwlSgEiNc0P7Ro1kzm3xq6nEDHrp56NBvfJohuC
         QPyAsTsSRp6va6IXcLFbob3+iVc4TL21Z6Cd6pkA1Fo6zsPHiU83noNFHm9ryN93eRvt
         NveqP6saks6V/v2rH/ubnKxg0UnZsrO+uNT3iVVfAxBl6RDwuU9A3ojn2hW1rh27Juv/
         MdOj4ilNsVHTzTadj8v92YmgZwZEHIp624Qq5CdqzB46x4s3LhCKfKLEXMijXJo52Kbi
         z9jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=uQCX7WkCi46tAuc2I1ooRn8h7Q5mB1a37C3zy78Fh2A=;
        b=ZTWNEArtJdtjPiLSgWlshfEpjFm0Vwp3IjdgHVykegBfnnZiW2v8JKUdtCGKs7fVGL
         3jBbj6SewrWyRvjVIJZE+HeH2mXrSI8a2hRKJBzuAD4wSWgNLEhMW72po15CZDRnzMjT
         BTxKpCsnlk2W7V07/i/rn72U/xBOF7sApnO7E92Ya46qPtbsw+j3P4NFb5kHKQcUSIB7
         6cByjEC01AYZhl+jPrYv+JN/VoAjn8SVi1asRnpgJwnhwqTgHzkgj8LIPnTyRuZRJuOt
         466d0l5QQuM3B8bpal7jkqdrU3on3EF5xCPFsBSUws+coICfCfqDHT5P0A26fnPgG0F1
         4F6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kAHUuU5B;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uQCX7WkCi46tAuc2I1ooRn8h7Q5mB1a37C3zy78Fh2A=;
        b=S9GKDkP1eADAYIb82czBB82cuZr83UQNhtrFXIks0WV0DyHYHZtPq5PfWAyh55FMsc
         ITT79chdI5EPWg7lMhH/M14TKOtPHSsU/sQ/Qg1jB7WS8R0KpHHv/u+50bGmkNrLxp3T
         czE9/Q3GWSinTWh71spv0QFmYp6WZn3S777Vkfy4+wTFSdPCfJStq8KArNnV4hpKhYvI
         dKNkqjV3YkUg4ls28eXFGTEH6WtHPnIp2EHd3HvmrnPROYCertEyrDRaJOGlYEeqwU4V
         MEigYPsmVLry3NGjAHloVb2eleuOoJYQkENDFHcpTzFSMFe9R+FY7MCBXlDPC7SCsrd0
         qkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uQCX7WkCi46tAuc2I1ooRn8h7Q5mB1a37C3zy78Fh2A=;
        b=pqpitZqTTEp1zMEkTtFq7KwPNV3lBHpyTJ5/i/S9dn9MlLXy61RsM4H9VK+CZKdw5I
         3oyOvcuPeWKreeYvY435/jXsLvSU/UR8uZ4nR6DoOuOc3EsyDeP4qPa7X35ZYa2dyaYz
         Eu6jb5jZNaNImuGqurqsArd+a2K1xcvM0E28kUX/Zo9ZClt3kq7hbUT4jW67j7UdQmLv
         XMpqXN7yG4xSxsEX7GSfQAHDwYAuBpoEQnM0UcsUHOnGs8s2S0etl/udLZ2myqZSQJYh
         rXxUjJt1lzvdQOgDWgRGiOuGJr4VdjeBuVYwV2IoOjx9nlYmbrSjmkU6oeuuNMCwiNeZ
         qB3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrt2/W5/kK5FmKZcGhThcZj0dCqk76P2aqUkZfFRzWUvmGs2c9
	z0OBeCE+NXR+dIV+PjE4ajQ=
X-Google-Smtp-Source: APXvYqxxucb7Ho54JUkJdVlalG6aoBEDKMlVD4mis8b5HaayERij7WRkDyjkWf882lT50Rqq0ptp5g==
X-Received: by 2002:a37:9e4b:: with SMTP id h72mr74320253qke.297.1560521377257;
        Fri, 14 Jun 2019 07:09:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:34a8:: with SMTP id w37ls2519827qtb.13.gmail; Fri, 14
 Jun 2019 07:09:36 -0700 (PDT)
X-Received: by 2002:ac8:39a3:: with SMTP id v32mr50032088qte.262.1560521376934;
        Fri, 14 Jun 2019 07:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560521376; cv=none;
        d=google.com; s=arc-20160816;
        b=GxeYxpTfGYeBMfzmPsyIGoO1CPVBCjrZqbMricsSqkbC1vlCJiuV/jvcTgcnANKT3R
         q/b3xer2m5FKBvul86h247Fsp+lW8nvuSVNF9l1c4/3fX7k29el86aRGTzgXIJ7fZKkG
         UaVc/nEaO3ldaX1SyMH8oOamUalH+DVPZdeQLZP1vX2jFL21THSA+QgQbPqODEkNEADE
         oSdN8fgJ2A0Y/JwAIeBMv/5bqPasP7Xprz0cOffZqwtquf25KlE+4CLPivSWULL0tCdO
         I5LBw6LxLdo2J85rRS7EjT1jKXoDG2pXdz5he0mhEBjrqPv9jO9VTAf9T29hrJ08UpdB
         YyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=IMFspgw4u8jBShBfdCB1asd8DP9BeQIa80yzvKH7Y78=;
        b=o/Au5oKfRkl6Qm61a0wrfnAEgUoQTMu1efLYRiMvub3y7JUQ6uRJDOLk7I/LtHmyqG
         jgp/847wuy+T2w4hUG0Jp5M8oM6Uf4WTQfVVlREPO4fQhMGwsDkFURfZ8+BaKLUqR5Uc
         Qa0qiwjfxsC8z5i4tcCBlQxlzMtlliw9ZZdZeAKOIN1bWxL1u/14GlKeT6+iYmIBcati
         RWmo/E+QU4/k/vriZXd3l0Mk3sFdbvWy78i85oolsc/vuWzh4kcVRXZI82jtQ+A4GGjV
         s2smHcqI6N+uiLbScXI0J/cuaVTNHV1J350AcnEU0JqC7fltULOGFEehhPZGXMUWMiTq
         aM+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kAHUuU5B;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id w79si131073qka.3.2019.06.14.07.09.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Fri, 14 Jun 2019 07:09:36 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/23766c-89f09d@github.com>
Subject: [siemens/jailhouse] 43b1a3: inmates: x86: use a valid stack for
 secondary CPUs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kAHUuU5B;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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
  Commit: 43b1a38ade21abbbf3cce72e039967c010e0cc09
      https://github.com/siemens/jailhouse/commit/43b1a38ade21abbbf3cce72e039967c010e0cc09
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header.S
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/setup.c
    M inmates/lib/x86/smp.c

  Log Message:
  -----------
  inmates: x86: use a valid stack for secondary CPUs

Woops -- we shared the stack across CPUs.

To fix this, let the CPU consume the stack pointer held by 'stack'. In case of
the parallel cell startup, only the primary CPU will consume the stack.

After setting the stack, the consumer will zero the variable to signalise that
it's ready (cf. ap_entry).

Even if we don't support SMP for 32 bit inmates, align 32 bit header code, as
well as 64 bit header code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 28c9c6114a64a389a6456054c79a4e07d2f563f0
      https://github.com/siemens/jailhouse/commit/28c9c6114a64a389a6456054c79a4e07d2f563f0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/header-64.S
    R inmates/lib/x86/header.S

  Log Message:
  -----------
  inmates: x86: rename header.S to header-64.S

The 32-bit header is called header-32.S, so let's name the 64-bit header
header-64.S.

With this, we can also simplify and tune the Makefile a bit. This makes
life easier, if we later add further 32/64-bit specific targets.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7dd41b56131331339ef7ec873dd51895dadfc147
      https://github.com/siemens/jailhouse/commit/7dd41b56131331339ef7ec873dd51895dadfc147
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header-64.S
    A inmates/lib/x86/header-common.S
    M inmates/lib/x86/inmate.lds

  Log Message:
  -----------
  inmates: x86: introduce a common assembler entry point

Early startup code is equivalent for both, 32 and 64 bit, so let's
consolidate them.

This patch introduces an empty start32 hook that is empty at the moment.
Later, we will use it to enable SSE, which, again, will be the same code
for 32 and 64 bit.

There's only one drawback: We need __reset_entry at 0x0, but it's now up
to the linker's mood which files it places there first. Enforce to
linker to always place __reset_entry to 0x0 by introducing the
subsection .boot.reset_entry.

Additionally, tweak the Makefile a bit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7079c583fbbe4220769a14459785fb108739fa44
      https://github.com/siemens/jailhouse/commit/7079c583fbbe4220769a14459785fb108739fa44
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/arm64/include/asm/sysregs.h
    A inmates/lib/include/string.h

  Log Message:
  -----------
  inmates: Add string.h

We will need it at another spot, let's share definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b74b055f8e48c927b49157488fb9d3cc11d3a3d0
      https://github.com/siemens/jailhouse/commit/b74b055f8e48c927b49157488fb9d3cc11d3a3d0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/include/asm/regs.h
    M inmates/lib/x86/mem.c

  Log Message:
  -----------
  inmates: x86: Add acessors for different system registers

Add R/W accessors for CR3, CR4, XCR0 and implement CPUID.

And use these acessors where it's already possible.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: adjusted indentions of READ_CR]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9fa3e85ba24d5f6006a38b77a652b7d49404936d
      https://github.com/siemens/jailhouse/commit/9fa3e85ba24d5f6006a38b77a652b7d49404936d
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header-64.S
    M inmates/lib/x86/include/asm/regs.h

  Log Message:
  -----------
  inmates: x86: discover and activate SSE/AVX

Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
hex2str or cmdline_parse routines). Inmates aren't able to execute those
instructions as SSE is not enabled and will crash.

Enabling SSE is the same code for 32 and 64 bit x86 and straight
forward: Lookup SSE/AVX availability via cpuid and set according bits in
control registers.

Simply call the routine before calling the actual C entry point.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fe27d3c2c81ba54699af3ce32c1c4ebd0bc4bb22
      https://github.com/siemens/jailhouse/commit/fe27d3c2c81ba54699af3ce32c1c4ebd0bc4bb22
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A inmates/lib/include/test.h
    A inmates/lib/test.c
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: introduce test.h and test.c

MMIO access tests use the same test pattern. Let's share the code.
Later, we will also reuse it for the SSE test.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 89f09da9bf234f695b138bcf1d40c4de055ed68c
      https://github.com/siemens/jailhouse/commit/89f09da9bf234f695b138bcf1d40c4de055ed68c
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/tests/x86/Makefile
    A inmates/tests/x86/sse-demo.c

  Log Message:
  -----------
  inmates: x86: Add SSE/AVX test inmate

Depending on availability, this inmates executes some SSE/AVX
instructions, compares the result against an expected result and exits.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: replaced source link for sse-demo-32.c with makefile rule]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/23766cddc2c5...89f09da9bf23

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/23766c-89f09d%40github.com.
For more options, visit https://groups.google.com/d/optout.
