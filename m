Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJOISLWQKGQEDAVXXTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3f.google.com (mail-yw1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D11D6779
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:36:55 +0200 (CEST)
Received: by mail-yw1-xc3f.google.com with SMTP id p205sf14075211ywc.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:36:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571071014; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fr8NQbtCd1/omEvP8RPSMlp2ro807qgRttclalXskiKS55z7LDgh7J9fUzpwZgYf3D
         J32NFP0n7A4Q6hTy+9s/BL2hcOqEBCBN66IWpMoJuZxVKpC3B3YGP3qpjEBxDSxJ/rNw
         e5OOf0AMu9fwndKu1gH08FZSZ8BKlyAEdnPBfwxz2Km/QViMLGVxvV0IUfvaBSob0t2N
         wtOTu0W7rr/qVZo6VJgsSFqAIGx4NXLXkJdN5VIxw/XqNUkaiXIEPO+9fMFi0OK9Sd7B
         fOQdTIfo83CoS1uC6Y/ENq1hcBh2c8HBP/8Pf7mV+Uji7trViogdLvjxpedaCvfE1W7m
         zefg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=iX72/2Yf5SGHGDCeTLUlHy1SuszgDqg/yUpkVsF5Ztg=;
        b=TTJtV9BOjc3ADEpgwdFlpypbWJVK5wkIIRg3XCuv7DaR6LzMa0a8eNtH3n2zgUb/YA
         OztmAxVIR8W0AybXXLIWph3h+l6ytiBQvAlMl6K6wFZEY49TYy61LsDeGghkhguDG1zd
         FqV+44MK8FC9KMn678z7bu0/zi2IzeI0hOiq8dcRefOk0ltotgM/5QMfLSgdEs5hBnhP
         GKdgFRRVQ3eKaW2oqPdj1lGdoe851AA/2J/oCsuT8oKthNF8oVNvWLB6GUL16aY0D2nk
         7U9vna6Jtq4TSSWe/a3oVDUW60d33vjspDJwLJLz27dwMMLGxXZQlke3O1eSHEKYmX5T
         DqDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=eTa6m2ac;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iX72/2Yf5SGHGDCeTLUlHy1SuszgDqg/yUpkVsF5Ztg=;
        b=Jbd5Rc8sxFJDKVvWhYjmzyLNNNEDQCxEd72mErtt5HQHRWn0IGVYaooOv7KfLYycAV
         EdHYmBdMmT9Tqp6eByBJIQpSXWDPEJWhbxplSulDI5D4xWM536D/pqz9RBTArfCwk0gF
         brJZ4tCk/n3fqHTzx+M2uajjTfUwZfjhziKnq8jA3IBzqp2xfHvKLVX3Fx92wBeVIu9n
         c8F7AhJXQ+9EcX2IWdEoEPDMHbMqliEGJoPgZAL2XlAskA9uFfo1EhAuPYzZ1Hzra/Bb
         uE7EkqXTdx+CdqFR96TgcOiDP00PvpRpyAveSw/YTv54i1AQt3UT/oQV0aghHNLvkijR
         ttEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iX72/2Yf5SGHGDCeTLUlHy1SuszgDqg/yUpkVsF5Ztg=;
        b=hvrTAUb9s5sry3WySHkGY2zgDrp1pEuOgLmVfdcGUoWDdqwtn7a8euvnjNu2uvkgx3
         E98LTXV5MqME2vrJmWDruDG9r70M2N+rpznB+7ZKmeAf1MlEd+xEtGzgRhvYyul6X50W
         YDL2/y7D5FcZlKCUYyBtJFOeW2ONajIQKRCN6aL26OtPONmaoGlO6o1oIthoXTLS2DL/
         s7RjN/qCoh4/YSF4gxgkIFv2QNGof6im1o+WNcL4B6D6aDe1NXnOdA1ITsuxQCvWZeKo
         dhkSeN3RM9Kkn/qVPorvhtV4AGmZ5HADVPCcHTLftpl3prVK2CQ/hN4QM2sIGE0M6k88
         gXJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8pZzILkQI8IXgcHBRi7TM+F3RZpZvzoDETmF65UNHObbws0lX
	Kwaus4pNE0lJ3X9NnFk5kLc=
X-Google-Smtp-Source: APXvYqzKgO6fdFJrXXU++gDfCm0kZ2NFef1FrihqL3ZV/H8+pqb+RJgadqWGfsk83ZTHWiWb8hQhXw==
X-Received: by 2002:a25:d70f:: with SMTP id o15mr21814899ybg.43.1571071013955;
        Mon, 14 Oct 2019 09:36:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:4303:: with SMTP id q3ls2549474ywa.1.gmail; Mon, 14 Oct
 2019 09:36:53 -0700 (PDT)
X-Received: by 2002:a0d:ca05:: with SMTP id m5mr14035851ywd.61.1571071013442;
        Mon, 14 Oct 2019 09:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571071013; cv=none;
        d=google.com; s=arc-20160816;
        b=0n4UKvaK8uDLQtoNNhijvAA5Mq+0yr7wyLJ3McbZZD6x56EWdHpo9CRQYYliYIQQDD
         ffjCX5Nj5fO8+yhaPDj1XcEqdjFH8dskx89koI/6lpPryk8vBMKXDL+z0RaaQUkJeY2s
         oHmhd8/Vow8i6PTTD3q1M3BqgXFPOnrPRvisG4t0PmfBj5qj5QR0GHGtgMGBk6p33MQ2
         CZmkwm1jjRCZfuWSqDn17r49NW7mz+WX4O+zqs/Xk+qMc8EPeZ0vgTacvLnbRKtbbSqG
         nouJ0pAAwpfMWEhnB35ayEj5nWU8lpkDP/62MnW8bEcAsetgEsCw5UESvKCv0gclqF2O
         sm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Pdw9VVsojzEnvny6hlGlbWNv2aMuafRJqEZEGjPZjnQ=;
        b=M32rl76TLxAwmHaJiIoemHZwbgnuXY8skAdgwkQv9F/aTdVghTrxo2sDa+qwwo4sxw
         HgDFy1833q5C1bsz+lYe3bei8Y3SN4Ig7anqIeP49kd3mD4EB99gPyUp1JfFyncqkz8v
         kiRoQyp98Mg4nRDLmHkt0USoE94gNogxmumBGg6a9EEywkRAAIiGXN1lH1IsQL05lQ26
         nYdWHmYBlKsoZlIgeEVgPWhua6jmbp22rpGcBpc1SZ4SCGTH0GcSAGJit2v4hhC5CNcG
         aQ9Fc/S/edTnfPv4UxVd06mulD6mtt/jCywlav1pZTGjm6gwpxKNS9WoOe3xAs3hHvVN
         2j6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=eTa6m2ac;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id r9si609525ybc.0.2019.10.14.09.36.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Received: from github-lowworker-5825cd4.ac4-iad.github.net (github-lowworker-5825cd4.ac4-iad.github.net [10.52.22.68])
	by smtp.github.com (Postfix) with ESMTP id 37C60C6049D
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Oct 2019 09:36:53 -0700 (PDT)
Date: Mon, 14 Oct 2019 09:36:53 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/edfe64-90e8d6@github.com>
Subject: [siemens/jailhouse] 0943a0: x86: apic: Add full support for IPI
 shorthands
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=eTa6m2ac;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 0943a095a97df22273c128b5dafe838edc1be537
      https://github.com/siemens/jailhouse/commit/0943a095a97df22273c128b5dafe838edc1be537
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: apic: Add full support for IPI shorthands

Adding this enables support for Linux kernel 5.4 which starts to use the
shorthands.

For self shorthand mode, delivery mode validation is improved. Trigger
mode and level are now passed through as this is safe and simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4
      https://github.com/siemens/jailhouse/commit/8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: apic: Make defines for masks and bits easier to validate

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
      https://github.com/siemens/jailhouse/commit/f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhoues-cell-linux: cosmetic fixup

Just for the sake of consistency: s/memregion/mem_region/. This is the only
spot where we still had memregion instead of mem_region.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90e8d6cee27ce04ffa19c2203b334c4e0f319283
      https://github.com/siemens/jailhouse/commit/90e8d6cee27ce04ffa19c2203b334c4e0f319283
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: simplify statement

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/edfe64fd80ee...90e8d6cee27c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/edfe64-90e8d6%40github.com.
