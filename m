Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBI6JT7ZAKGQEV2T354A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4CD15FE66
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:31:33 +0100 (CET)
Received: by mail-vk1-xa3a.google.com with SMTP id i123sf4468804vkg.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:31:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581769892; cv=pass;
        d=google.com; s=arc-20160816;
        b=orFGiFEUq5IpMyTK8T07XZDA4iOMs5vcu0LknR1JPSBoifZGxdFEGcVpm8yXadTVFN
         LJQfFaextLv9L61jYb6zebo+tX7vdMSTXzHLZxcZS5CKgo9PnbEy5Pi4KH3h/IkG6xKu
         MZdF97U+uBaq2nVVOhu14rLCh6qZ1wZjfYjd1OtMWXtZ/Tge4tfa0Y3m8M34P2ZRjCNr
         XMEZVKpCaoHq3+ucMyZv5yTRrpRwWDUlKomFb80lv/zhmyuuz+CKirHBbhjaM46OgRMC
         4umetcVnPUnkA5Z2kulgP5Og94LJi0Cm2BFTyTEYDF9jHVSwptUFjTg7MW7tI+EYV3/Y
         n+fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=i+hYRIq19kuhCJZ1A3K3l3iAqvXR0uZt2k5m+6x/kNU=;
        b=zyqzmUow1foFQ3w9Hahd/mqhd1wm0EQVCxefQt6KP98WiZK7TaHBa6kwAuql+bAH9l
         GOLD3mliLw9SUDKxbtPBmsFF2iuZqwOwXGsl1hoPHIrtN3U6/2YfmDa4pTAAPP2NxV3X
         xRZp5RmAQ2MG6s9Fi69zIgQz3n9QMLDKKNEgJoz1Vy2TsvDeaLimkUaPHIPP6xXg/UFu
         00UkXlwmN+6NIOHLbI0perpheXjg1CckiTtqfIhLD+DkIZVA+drYAOehxiUEG8ItZm8P
         FIzj1583XUu9KoZbxzap+r21iaD2l1/S/Vt0dybs5ODCNkkfaspe8Kl3ekVQ3g827SMW
         c0ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Z8Q+Ecnn;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i+hYRIq19kuhCJZ1A3K3l3iAqvXR0uZt2k5m+6x/kNU=;
        b=pgsUsOJzKcDx+QdAdYm9D5FHBmqbbjB46pm1G629SP2+rxN+QgFpbedMPM1E4HbAh/
         sBma6BmFVpLblVkf27X9K2AbefEsbOJesfVD8BYDa9+KsVHkHEUPd7jYR/3EZlJRoBUT
         m1hnmhU4y0kMgoRLlojCNzaY4SRSl0/Ez/AaxSpiL5iFI03f9SZSu4JyykbMxnKbfCE3
         lov7sbkK1zp6vzy8NURqddJFmp0EFUT0UDjl1s5chGkH2o8qTv5Wt7Vim9h9PezS+482
         Kd+XTM7MeyDGmQ2gezvAy2IsVD8OY9exwQgGMcPzC7HQOJoRMtOWd8r9/s7jyVc8PBHD
         Hk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i+hYRIq19kuhCJZ1A3K3l3iAqvXR0uZt2k5m+6x/kNU=;
        b=RKPe720HOdF066zNHn7ljjiutrT0Qq4CK05J51WmPk2aV4KA+rK0DCDLJijmwJPI4p
         ot/AnpWbd7ZWx188HKXILpeISBWxIFGv9dfyUFxJoafN+iVJJm7lt/Elr+gqlBHaCxtL
         bUO4d8Xo+J9HlILLxWhuMlxWLnUW5vlZ0PJeTzy4+iIGizWnaKLlcwu8tcHeHD3vZH78
         ZB7h/YCETAO4poe7wlFiQEwhi5hkHyW1PV9cZHQUwBw4gfUrjiHsy8mQ9loW476NarO5
         5cxj4Z6J0i5o3jFEc0+JKtN4O/wmVp/gAijIBATtvrczd7bxDFnYZKQHzFQ39QMeUVuG
         XkSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyydbB+CSZcw+QdfSHu6BomZNgHU8uikHlPm9nPK1lTuK+UlZA
	7RbFHZa/6ODyuB93qvZxD6M=
X-Google-Smtp-Source: APXvYqz33cIHxyKMA9OaT5aoSFaEqCEC8j2yBiQ8ad/fuphQPANwKGWaE037uFam8CwZ7a+iwm/oUw==
X-Received: by 2002:a9f:226d:: with SMTP id 100mr3853367uad.107.1581769892013;
        Sat, 15 Feb 2020 04:31:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac5:cd2a:: with SMTP id a10ls258620vkm.4.gmail; Sat, 15 Feb
 2020 04:31:31 -0800 (PST)
X-Received: by 2002:ac5:c97c:: with SMTP id t28mr1668273vkm.20.1581769891420;
        Sat, 15 Feb 2020 04:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769891; cv=none;
        d=google.com; s=arc-20160816;
        b=n6D9/O/q2FBt5zCPy4w/BsP6q6+I2azPi8U7xhBP1eOYCg4Kz7slbHSA+x4cHG59Ll
         JO4Pujj2+4CFjvAlKXQmMvhIV8ZJDVDqJns4QQafDiRN7cws+2o2hGEYE+ocFXWfpoOL
         r5DeY2TRAPw8VRkCZWkceK4q8yj5ze8HFiDesI538wNF24BkrlVYh6Z52gxlA+RWH1Hh
         QUbMW3E15r36det612OSl2BguOtJXshRDZr+Y6HbEBk8v+UNk21ZAgVVd0JlsFxMkzeN
         c4ojInAmhVdns9dR5r5U7v8XQHN7Qzr89K6iZpokWD5gcASN1yE6ZrqLo4NgHj51nF7A
         aO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=PiEV1yI/EH28n/Uj/slVPTyOxbkZWZA+ioVRNphpPn4=;
        b=xpA9HOqJmXbS3hDNVtVnKUh6syilufieYCoi6LqDQrCeMf9jhBlYjwq/9gCk8QhygR
         pQxKvmbnps3nVSYhl4T4z+dQfoTGeQV2mEgOioAT4ebzf99KbjKo3yBE9KT5kXf9meWN
         tmG3hwKqPQfqm55IsqflygP6U0WHABKPDARx3Ua7VVq+rXV3wniJ8evrBguVv/HDSb0C
         bkrT6c4TvYwx2Qm9z9C+KwT6AL1pUz90lEOngdN8NRKbEWjtQerZ9PjDz/sZeHh/uMhL
         6oM6fKp+0ZDwR1Mo/4J1iyJqBUCGm3mLrODZWyZBL2jWcSf0mR7HaUXp52KbI67pTm6Q
         93fQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Z8Q+Ecnn;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id h7si452399vsm.1.2020.02.15.04.31.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Date: Sat, 15 Feb 2020 04:31:31 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/a519da-096ee0@github.com>
Subject: [siemens/jailhouse] 25787d: core: Reorder CR and LF on debug console
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Z8Q+Ecnn;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
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
  Commit: 25787d78f88b97819c8769e296d4e1edeca68647
      https://github.com/siemens/jailhouse/commit/25787d78f88b97819c8769e296d4e1edeca68647
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/uart.c

  Log Message:
  -----------
  core: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 096ee03151b45c8ff0ead2da1cd605be74fbceb8
      https://github.com/siemens/jailhouse/commit/096ee03151b45c8ff0ead2da1cd605be74fbceb8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmate: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/a519daf7568d...096ee03151b4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/a519da-096ee0%40github.com.
