Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIVXYPYAKGQEVAV5GJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5D1303E3
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 19:38:28 +0100 (CET)
Received: by mail-ot1-x33e.google.com with SMTP id z13sf22659258otp.7
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 10:38:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578163106; cv=pass;
        d=google.com; s=arc-20160816;
        b=x5W+PBFvSHo04n8kt9BXhTJAYdlIL3fq/QoVmBhkTefWkKbC4iX9fIttxipaDzjR3l
         EtNFbphk0m1IcAvpXfYNKBo48D9USI5W9immD6ap5TkafZIhVQziLH2jESE+YvQ4X8c0
         /Rj8Oiv7FpEP5TsCrbzESO9LSHapDS5buYswBRDuTaTvat1cozoiFHkv72BQrrulNfym
         nYAFTqDFkEY8MgSuft0FxLFVLsIvPe6E9esk6DfW83+9fnCJFIEI02OFVb1q7BEQA+zx
         hjDZFqEdiBjq4S8xgdRDIh5oblbwo67Z4PDnPBmWAPVgP6dtJ+IwhbGwewTMOu977Mk9
         ZMsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ZdRrCmnm3Bzl+bU2vQGv0vHZ6Wpua6X6UJ8aJWrO8hw=;
        b=B0AGubLc9gQa0ehlJAK9wrA1gwHvM2HSFOYmMQkxFlN45bU9iJ4xwJnL0k7weXJJms
         u/+jKoUsfhPIR9Jn+frhjPQDReH1kaejiJZ59SMgimglDv+jJrhCT5yjs3/tBW2JIThh
         3JnN7szHu3BC3w7S+YcbdaTVLGusmFRHL1LH/0WNxQqHaOAp1+1EtE1r24YvKae2sVvO
         mCaVpSHJi/PL5tGXa/DaX9T4A9pqOSWnYdqCUwUSW3lsyanCSKgTwLJ0wWltIT9VNzYb
         mBO9X68KAT7oLZTlyBxRSwl76Ty9JJmgzJ3WIZ6sx70bl+Ze8gMszwrJ9Plk5UXMuAde
         qpxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=DpPpTRt6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZdRrCmnm3Bzl+bU2vQGv0vHZ6Wpua6X6UJ8aJWrO8hw=;
        b=h3GyCsqd0ruWBj4V/9sbaM6rhygAGJo2cgSUsUTYQnkVpjbWcnse3Agts/TMBI6A9M
         /IquUWaO9YRiIm0VWoP4mFDFcTc7lI9gYuA5O9bjcCBdCU6EDBo994CkIgOe1ZQO6YCj
         slejXl7fBGx8dSHt2XtJatWUuTn8uZ/T34jbSJG8pIwahtW0uOl9Kvo7f+6G3jI6+l+c
         JsbkL3IuxyfGpuYuzZvNa86TxuUmdzv9vWGgECBJloBdtXyLladxM5ZMSE6EbCO3FEGQ
         HEEibhPs6SI8xPrqgJWSVRmyvrEa7Z+PoB2xJMSZ5oyC2/bHM9EemPytn75XE9/cQzKL
         UmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZdRrCmnm3Bzl+bU2vQGv0vHZ6Wpua6X6UJ8aJWrO8hw=;
        b=Vv29acbG/8C8N5+K6eaL9T0lnMWb5fj3F+AO1K/s4dlE8ltwQ8EZri+bDfEdq9pIJe
         K7lEHCcCrZug+/LOhFGxURAhB7gusPhixvLGLWv7vsQPA3RB89/H04NjG0/Yw9qBQcja
         JKxsB4ke2yIstFjC0y+P9na3vcToPON46/KtODarD6rmAo/byt5ouyC/z8uojm/Vskoo
         sQ+63u2jXPhkF3pKfBo+TjqtqMxXHAvbHnpQp7FaZDaJS3AdmnlXOYsIn/Bv99rQ+ANd
         LncnfeaLLZrVDFZnGPybsy1AXVQQpe3n6DlRJL1P/0vnuV36USddyXzZmTqre9E60HLk
         XIBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXwWzP5hIU4jZEKyTWMsyZhyj6552xFQsKhlJ1E1u27vDqsnTQ+
	uTrz4iEwLYJsWIakvcyehOw=
X-Google-Smtp-Source: APXvYqwuL6DlWSgFe1180fnveqvGC54KCQFtNU7rTn/LpSyEvIxc0mMiZZti1QMDaNwZ4BcU2FoyJQ==
X-Received: by 2002:a9d:7757:: with SMTP id t23mr110198655otl.315.1578163106665;
        Sat, 04 Jan 2020 10:38:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7201:: with SMTP id u1ls8939022otj.13.gmail; Sat, 04 Jan
 2020 10:38:26 -0800 (PST)
X-Received: by 2002:a9d:3e16:: with SMTP id a22mr110200686otd.259.1578163106277;
        Sat, 04 Jan 2020 10:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578163106; cv=none;
        d=google.com; s=arc-20160816;
        b=m9L1QNdJCG9CaE7U2mq+ec5lC8HcPif1fK39ZHkIZ/N1G4sk53GZs4fMhDBeQ3ot77
         Si4GFjlkZwz1B9q6geqjuGfnZFjI4p+uF0moE2FGC+geuRxvsPNcqIgnVP5gKWnUDE33
         q5uZNwXj/xxYhHYJeoh49axhw4eF9zxBWw5STGgwOt8xOormjT5+xywV09i/bTR6dBFY
         kXyKyQ9oaRqBSPSX1CLsqZ2Bef+viPgyGa/bLvXLT8hpD9E9JkGpyRpYRbSkSGKY8sKc
         NWhAVJfJCaTY9DHeBRcbPlzjskgr0w0ewZl8kTbJk4QPke7vvFRXP4VoZE/Agm6vEGoP
         obtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=u7COJeDoeUm12ISOVyOtFzf8R4oof67gojGhZqNEdEo=;
        b=oG04N66LyT91JT/Yd7M+i5jpLJAy4KpqQtDCAB/GZ5KuWJkf6g1vA/to3xgUo92EPq
         57Y6Nj/pFTHrxybBe4/xnCpf3xbseV10Y70NEo/LRjiUOOxYRqEJQbSqogsKwGUYjfg8
         ooKv/VpoWoSon7eYNw8VwcdUGfT0AKqikAU63dhNnPRCibQFsIhPXIYtoabjNZLYmcOd
         3EDUg3Jy8HgqqaIZQZmbw+lgINK2AkV7KmsxUMnTRUAtiwyol1iO3cs5DL2pkdkTVVUo
         /Ry1CLZAo8zEKfakk0DKn9WFx8jlyrMYlk+oRPEMh/Lmvbiu+GLqxX/cOpuP4GM8cwjV
         MI/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=DpPpTRt6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id q188si2182651oic.5.2020.01.04.10.38.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 10:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Sat, 04 Jan 2020 10:38:25 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2eb09e-9f6963@github.com>
Subject: [siemens/jailhouse] 238496: configs: arm64: Add ivshmem-demo support
 for qemu-...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=DpPpTRt6;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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
  Commit: 23849628536124a5fd8118fac27676ed6181b36b
      https://github.com/siemens/jailhouse/commit/23849628536124a5fd8118fac27676ed6181b36b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-gic-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f696389cbb485ba7a607b5f8cf86ca76ec5417b
      https://github.com/siemens/jailhouse/commit/9f696389cbb485ba7a607b5f8cf86ca76ec5417b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-04 (Sat, 04 Jan 2020)

  Changed paths:
    M configs/arm/orangepi0-gic-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: arm: Add ivshmem-demo support for orangepi0

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/2eb09e578c2b...9f696389cbb4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2eb09e-9f6963%40github.com.
