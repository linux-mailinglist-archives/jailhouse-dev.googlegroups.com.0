Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUMLQTYAKGQEM6ZFWZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA11299CF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 19:22:10 +0100 (CET)
Received: by mail-qk1-x739.google.com with SMTP id m13sf4727658qka.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 10:22:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577125329; cv=pass;
        d=google.com; s=arc-20160816;
        b=WCELPTb9PmRNje3gx1SBkLVb7rw8ovsurszQ6LyizTfXzWABIPKIrVc6aghQsg5W8H
         rXjeyYMW4Th0dIyL+nbLplD/u5Y20Owqmdx29cNkgfudcoX9BT5YdIu03UNu/SmcrdvU
         v/YL6k5p4qtaGndO1KKlJy/YSjDbciAC6SuACRLkzRBLCngsIm9Gu87R3xjsTp2y7nOe
         +BVFNw9JCqWWGmkXNV6ik3Sq3l+e849CjhlG1mUsLEzjMioflvsA6a+pj/Er8DjwAeQ1
         ts/D4h5s1FV8yRZOEVy+B2nF6SpN3jBD/JIi87pVjsxoBW68uhpshBP6Nel+o0Rtm0VM
         59WA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=yK7U+0X/OZMRXFuBc/hGT6FWuh9WtDLkubPYDn8IC4M=;
        b=DlOO+1l+KjbC3Xyra45B61LKzuScqLPR4iswS+7JYdphYsg3e/Ezqw7BaADNqF2lmM
         9Y24v+B0uLBm1glxr4FuH/oU+Mk6/lyPN0x0hf39L+DhFQDUt3j1K2akj/oAcD5d0iqV
         2YApwBLgsSroaGHdT5qTKfY04giPI9Dg62+/S5bZPBb24Hw8xkmnfSeyot0P/o6WRiAB
         QSHxPCxbsu67dEbkh58UKepmghDPGlQN7YNztfdtnC61M/fH11AnAv8qQCLzjH91Hkzj
         CYNgHXXRmVUPuQ5STFcW0I/Qy82pcrdRueD9+4rB/8ihggCwU/JH1FJdQY+6KJawJbeM
         +Kjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YjiMCqay;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yK7U+0X/OZMRXFuBc/hGT6FWuh9WtDLkubPYDn8IC4M=;
        b=URClzACV24lIDZeVB5mXogwEFMtmTFyM/fcxka7uR3oUueulJWkWxweYtZjT6aJLc4
         BCbtgpLYuO+zgHKXNYVoaQm5warxqp4AwPkAdJ4j10Eoxi55HcMauJMLM/bqvKK0mGI3
         Cy+h38xNTyDoY+wOvi1U27SeFzgHb2T7INO9lxTWoYCT3i49varGw5RCzZeNtLeeevp1
         i4VZknlPDontTFyDbSMKw7b6J1Ia1/uzR1HyQHUzgHnnPrlwZlroMeL8IOIkXaOJZi3V
         H6ovJzquUvDbdcVTR/jdqUFXUzz4NGww7pupuH+UjxYMfxvO1PYBcWnKRS4z8iX3s//c
         npCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yK7U+0X/OZMRXFuBc/hGT6FWuh9WtDLkubPYDn8IC4M=;
        b=fMVqyvqyfbT3kbYvi6w7UitVmHWiApDD1cjPEM87ai8GLx4Ng/y3H3RjgEZdhop0i7
         8LU/10B3Q3wbF+8mpUUMADhSMIuHsbOE6+9/OrHYbo8h4/vclXiQVIN+8IslMsr08PR9
         ec9z0Duy4eUCc4Pui5jYsWWOHxWfk/FwAHu8uhKaiXHJDrHfkYp/4SfgK57iqGUmrxck
         XvF6+x8a7ufNoYgNvoYeznNoF9tGVQzKDtpz2eQpo5O8Kx2+RfmpWTVYFp0lezRk9npy
         v4R3KYYyMTGb+pDb+/8DDLyHt6kM+DDO20gQeFPh/LZFl2/c7pmR3S9Ftpa/lovyrolE
         RgOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUM4mYNSYeSINCDvHUmfQhXdh7P1s1hZxpImDGp9KD9nM18wRWo
	Li7ENYZLPESygxdD6GNvQIE=
X-Google-Smtp-Source: APXvYqx2qFQIJfl3D5AkBqWvHczDFIJVrnnY98aHfLsyLJD44OZS8eBWsSDF4iObGadDOG1yYsfJPg==
X-Received: by 2002:ac8:16ca:: with SMTP id y10mr24930533qtk.340.1577125329584;
        Mon, 23 Dec 2019 10:22:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:ab3:: with SMTP id ew19ls2740348qvb.16.gmail; Mon,
 23 Dec 2019 10:22:09 -0800 (PST)
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr25046145qvb.130.1577125329082;
        Mon, 23 Dec 2019 10:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577125329; cv=none;
        d=google.com; s=arc-20160816;
        b=k7CCsEwaNnYW95M8R0LcEGbLEf+OfKTXJiVjnHXvvVmkSmzBR+1rJCp3PAzP7R40nO
         LmBrAi/JMQhnvdh95t/ngJSFNfszUIN2o92LJOGx6srBwT3YkCO4Rtt2Eps8l84Tk8Za
         GvkxbYHjI8F89uisDX5ypSzMRJenakCjHVvdQJa5I1q1+1bUctmbDSUW+wAJWkGh5sqK
         ngOGvUCi9bcmHf911CBkz03QuPgN+frzS7wbconnoxkdQMloCV2b6QPQswMV97buFKHj
         TnowpT27NuZujSQRPiRsA/eWq6XZl5RXoqU2PQRqmGomdHo2ssyjfXhEuSZ8FDsNsSQr
         BuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=iJ3b8mZLSj1sunotM4M8HRhk4MUW8RaIfDdB8vLyYFY=;
        b=BMlqSHXp5hLuq/WF2KDPmmJAPFoUN5VrUfJjtliMC3AF+7iR4DvsK5neurVQ1c+5bp
         hj+2nIC7KjeUzqmjH1uQ+YnIVefha+G2l3QvfTgxWazIgSe62CX2wIwILODkAls/Ai8N
         bGj1RYSDLm9BIMFQn/c/2j/m8kSISLgGBdy2N0O/YwJFxnLjFml8/1PFFuCAcGg0Woja
         S9Q0Blwz+cnQbBhIp0b23k/rk/FJe15AkX+eJs0UUgIIeQtDaMY2D5od5C0zQgBG/5sv
         OdGJgMkUPCQdzGqrY1fxsjKrPdaElNNY5G8oyYi5fVXLXqDL1X+TPShf7s5ZKk+bgCTH
         mnfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YjiMCqay;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id g23si814825qki.4.2019.12.23.10.22.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 10:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Mon, 23 Dec 2019 10:22:08 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/cd140c-b5ef54@github.com>
Subject: [siemens/jailhouse] c16ed3: arm64: Document why spin_lock/unlock have
 memory b...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=YjiMCqay;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: c16ed30bd64efc9d7a30745c333de9adc80b4a13
      https://github.com/siemens/jailhouse/commit/c16ed30bd64efc9d7a30745c333de9adc80b4a13
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/spinlock.h

  Log Message:
  -----------
  arm64: Document why spin_lock/unlock have memory barrier semantics

This makes it clearer why we have no explicit memory barrier in the
spin_lock/unlock implementation, in contrast to the ARMv7 version.

Based on research by Peng Fan.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 940e194f3be655cc56929c70b3f7fa61cc89abed
      https://github.com/siemens/jailhouse/commit/940e194f3be655cc56929c70b3f7fa61cc89abed
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Fix barrier usage in irqchip_set_pending / irqchip_inject_pending

We were missing memory barriers before updating the lockless ring buffer
of pending interrupts, both on producer and consumer side. At the same
time, we can remove a barrier that is already provided implicitly by
spin_unlock on ARM.

Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0db943d9a2541f6a4539bd12377c778b1b6024d1
      https://github.com/siemens/jailhouse/commit/0db943d9a2541f6a4539bd12377c778b1b6024d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm/include/asm/processor.h
    M hypervisor/arch/arm64/include/asm/processor.h

  Log Message:
  -----------
  arm/arm64: Populate memory_load_barrier

This abstraction is currently used for mmio region updates. There is no
reason why it could be left empty on ARM. Linux does not do that as
well.

What Linux also does is to map a write barrier on ishst. However,
Jailhouse has no abstraction for write-only barriers, thus cannot use
this mapping for its generic memory_barrier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f07ebffc91fdc37ba7760eac353338c759f563e4
      https://github.com/siemens/jailhouse/commit/f07ebffc91fdc37ba7760eac353338c759f563e4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/traps.h
    R hypervisor/arch/arm/include/arch/asm/traps.h
    A hypervisor/arch/arm/include/asm/traps.h
    R hypervisor/arch/arm64/include/arch/asm/traps.h
    A hypervisor/arch/arm64/include/asm/traps.h

  Log Message:
  -----------
  arm/arm64: Refactor traps.h inclusion

Rather than placing the arch-specific traps.h under at unusual place,
make use of includ_next to pull the common header from the prioritized
arch-specific one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b095585b1c3511c1fab42b9c7bf4e018f8faeee
      https://github.com/siemens/jailhouse/commit/0b095585b1c3511c1fab42b9c7bf4e018f8faeee
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/gic.h
    M hypervisor/arch/arm-common/include/asm/iommu.h

  Log Message:
  -----------
  arm-common: Fix some stand-alone inclusion issues

Pull required headers to comply with stand-alone inclusion rule.
header_check is about to test the common headers and detected these
issues.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b5ef548cec668376ca65492dbd2dc03d9e8cc489
      https://github.com/siemens/jailhouse/commit/b5ef548cec668376ca65492dbd2dc03d9e8cc489
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M scripts/header_check

  Log Message:
  -----------
  scripts: Let header_check cover arm-common includes as well

We had a blind spot here. Just make sure we do not test common traps.h
because that one is only supposed to be included via its arch-specific
companion.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/cd140c5a6d85...b5ef548cec66

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/cd140c-b5ef54%40github.com.
