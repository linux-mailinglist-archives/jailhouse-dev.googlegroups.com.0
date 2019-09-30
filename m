Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBOXFZDWAKGQEUXLAOCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A4C2574
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 18:52:11 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id z21sf14410480qtq.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 09:52:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569862331; cv=pass;
        d=google.com; s=arc-20160816;
        b=wDgnG4eQ0bt+mmpOiZ6fEB64FqifwcXInk667WZJoQbfSYK1ytj+JEXKCqVQpBY6ua
         o1fnXCMBOv2LvHCuAo+aKusgSxTrL1p4o50yWQqdkeqJ7hgnxMXWqmtK9J2bXpr5GDiC
         Ix/iU6WPp+GdReUOxj+Xh5mVgnlL39+tJ1LOFUo/xlSoOrLOhOohT5fONUXh+a7cqjsO
         TzFjfLh78G6Pr1siNIHhrjrpBVw7aK5ayYSGH+wck6RXG33Gvyf7rqt7KpIRh0dbOLBY
         CNQUH2tNSd8krCOk9Lw/nHDhvmmXRyBBiECPBGdf3avM1qHxshSc0TflxM9fYzdpQdnj
         cpkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=fI+5qFUMMUih1LWfAoyodu5MAkWnsJLV6R7IwS+oL1A=;
        b=dcnfJc0irk7LW5YmG/fLnP3VRkaoHxckrn3+gpEC8f4tf8byGqu98Z/ysbZD11VpqM
         F3yhQTh+9+fG60n2kR4cugyAPlQQUdB45HdyuCjBdKp2G5glA1v01RH/VaecO8sk3NsX
         6RHq5I8sk8ZzioL9vy9P8kAjpYQqJYkD9lLDX9OerDYags3ik1gzLh+Ig/0UYMLkbq9P
         V/T8FbW6h3v0905xi3YRGJBY01fq+teyyDmZTPus8ZHMHKFMaMORQ3btAm0V/dvMZfFD
         EXzBhBDWqmY3IVPtkioZ9m44bmcCo/f9jdF2QA4vB5rklTFkum6eYW3VQc+QeqICjuAK
         2uyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=A8uCs4X0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fI+5qFUMMUih1LWfAoyodu5MAkWnsJLV6R7IwS+oL1A=;
        b=AkrgnhtFgDSBynSoJraxmPVBczo8oNcL91RNyd6Yz5l5TZa9ZCKyzyuPg5g4kAGduo
         SSyZmqD5fQYtL/t2qE1AGA2x6VVHWMWJpz/EU5A6J6+TxxkMkjROU2MJIqISgXhDcQHm
         Q8OfGVrDIV/i9AsCyyWFgwwRk7Shiq9GUIhNhMAo460/l+Un2q72zyVL6S8Z4DEXOzY9
         uWaTYIzH8c29B54KyLzYjAo1sukFIJB5RvZX3Vsm2tMw3YZzkufbSvQf/Pur5yRRBFJS
         xZxuV4J+Xo8IREpxvbXRfRYV/QKoguCWuR/HlIIBfoAGI4pQRlqVEANIa/QCJbhstesJ
         A1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fI+5qFUMMUih1LWfAoyodu5MAkWnsJLV6R7IwS+oL1A=;
        b=QebTULciorwdvulXqcsI+q2uSD5PpwqtVqWen5JnNbl5eLTWVrQYtvMEQ16+eW+go3
         vHKJ1FK08iObkspDISaSDC2V89g6aNWH6BRswgF/mqQvzS2GDKCld6+KLIG9fuAidm7j
         X1mB8l869Ti2O1nGeMHJ3NTKtbh4wUhBJH0R6ue4/yws0lnnpNEtvpeS/54XoDgi0EA7
         LNR8dmCqvXjWncAijxwz3jGzw7XhQMbh0AuDlkpMixsRoFEfcVLFAZXIgT2hZfdHFuNs
         rM62+CI1KGZZ/2+u0kYXplGadMQQZFc5NwkAIY4U5HJjg2Ek4bMVaiHIfX/XPETY74EC
         wOHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUQlhkewx66CyxD5+UsV0i7LR2X6DtWmyUF2w+hBknozAeiX33l
	SAQ21tgQLmP/HbF6D9F53Pc=
X-Google-Smtp-Source: APXvYqyYmb20LwtFoiX46cgNe+R1TjUm02+W4VJbp0Gaa0DsTEsc7DyH5bdZoEaXXdVMH6TNBlet3Q==
X-Received: by 2002:a37:6554:: with SMTP id z81mr1038710qkb.107.1569862330923;
        Mon, 30 Sep 2019 09:52:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:927b:: with SMTP id 56ls2530884qvz.2.gmail; Mon, 30 Sep
 2019 09:52:10 -0700 (PDT)
X-Received: by 2002:a05:6214:114a:: with SMTP id b10mr21041547qvt.150.1569862330480;
        Mon, 30 Sep 2019 09:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569862330; cv=none;
        d=google.com; s=arc-20160816;
        b=BeVvsRWxys/F+cTVSBbf8ms23N+JHQJOCK5d1jVeJu9y9PhGDGuZ/O6KDTS9V7JH29
         j1lRAxnrC3rJnFW+Ku21KLeBs35VpJgF9zqJHSrWFkfS40O3EN7nHqmlS4q4dd43MQoq
         LU89iXc6tZ7YboSadNUeqXyw7QvHoKUo6FEA2Q0hooWGL8NQ27xWmz3dnwipdXVmDqAZ
         GBtafQNBh4/1U6yYDXF4LUeaY5eVwqMacthTBwIhbv6FhMiUgPPbfeYLed6UdWtepgNY
         xOt86JLm1WCpTa/kd4WKHaaB2j+rCH6rp3txJkzC2p+ibYwzSuIQIHeCSnFKkCEWbRS/
         LCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=hFKvrHk00dTD/BL4IGafo7bAsNCsUFc89JDmCo8l/gg=;
        b=R0ei7OAhq9xhxxHpIw5ZzlY9I6qr62JAB+SjpQaf8mSx4U9KxovxIhns8DfBMDzHdr
         ygdGvNzc11vWNGIaKeRbiyodhVwvLKmOeYDGVF76JfoD3TSvx+Yp6jKY7Li19WtnQmTY
         EHDlGuqR7jsslcNyRmOO7H8EEsNdnpJRITbAiR2TntcG36kUi2sYTRRrXTbFzUbbY4td
         R1QCcuU1xkMPkVF4MuyqjoAhSTuk6xHV+ryp1sGtGBfkB/kgNzfg3AC2XIhELGJMAvFD
         ciH+YcxF3YdJ1HdvV34+Iqh39EkoML3ZO9thp2i1VF3I0XIykCdIZdsQfyOxdI64LpSH
         3a4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=A8uCs4X0;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id c78si571158qkb.7.2019.09.30.09.52.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:52:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Date: Mon, 30 Sep 2019 09:52:10 -0700
From: Andrej <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b66f75-edfe64@github.com>
Subject: [siemens/jailhouse] 4c7214: inmates: Add support for %% format
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=A8uCs4X0;       spf=pass
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
  Commit: 4c72146d788461c30269aa29377c51712f6c3c57
      https://github.com/siemens/jailhouse/commit/4c72146d788461c30269aa29377c51712f6c3c57
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmates: Add support for %% format

Needed for warning-free output of the "%" character.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: edfe64fd80ee568d61c759d77396fd134715ede4
      https://github.com/siemens/jailhouse/commit/edfe64fd80ee568d61c759d77396fd134715ede4
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: Remove superfluous definition and fix linter warnings

'vector_size' was set, but not used.

No functional change.

Fixes: f6fef92ffaba ("pyjailhouse: sysfs_parser: Add more precise length of some extended caps")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: drop style conversion of tuple assignment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b66f75c353cd...edfe64fd80ee

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b66f75-edfe64%40github.com.
