Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUEVQXYAKGQE3EMMWFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd38.google.com (mail-io1-xd38.google.com [IPv6:2607:f8b0:4864:20::d38])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EEF129BC0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 00:16:34 +0100 (CET)
Received: by mail-io1-xd38.google.com with SMTP id u6sf10106572iog.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 15:16:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577142993; cv=pass;
        d=google.com; s=arc-20160816;
        b=EN0Tf7F5vWR3/nlFYEuPl4kOFVOmaJ8IzD+3Wegww6TSnQma6a3WG6f152VZDnrKb6
         f9odw9YVXxnG0VuPCueZsPC0VhK6kvjz+On4JsK3fKIi19A4Af/iDBGmy1pDAmUmkunL
         YuvKDDK166B6HU6nDkRXx2gXwsI8kP/Mbyxo8aH4Db4/4spWXty4tW763jX/Z5j4WWir
         IpzA4MtXdSsjYGqB2h/L0Jmf+Hhr5ryPLWvMg20wsqA1ZvAwQj4VPhzXvGkvrcC2BSih
         MLHCIbqHrepIu3WB5FlEAVw57mhtZxcyShfsOHbPLjSlyfZDJtCYaROnNc8OoW09Vii+
         lx+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=kDIyIkg1vStu4qiOsqUyesgmAT8Worv/gSmJjdhHs3c=;
        b=DJSPwf/R2URkHjow6iLXpKoUrMCyaEbyyvk1itMCXgGBB9qMl5C3l2J8RyzucRx/h+
         bHfjL0JDBqcFAp76DWn/KVMHoTzlDMdKQLpDz7kgrafEcEjVp7WgjiWijr8Rz0oP9L+O
         M85Zbu5Bjz5Tx4NrQxGyEjO0k8ePG3nnDLwVeMtVQLxkrTl3/2mzqlR7iQfE98olWJCO
         EuDdNhBjjBLJsZEp/iBPiVFKMsTo5z7gQhOyZ9TZUKK+7a1/dUxSDMAC8OvG4ESBTP02
         xt6NWjWut2kK92lAJJVPs0HwrFpABQ6eYpA3XSqHsQ8/YLY+/hvaAEOLSKUFFsxxx5K0
         kXSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jGVj699a;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kDIyIkg1vStu4qiOsqUyesgmAT8Worv/gSmJjdhHs3c=;
        b=ZYuDMo7YMVQFer1SgMZ2EDp9drF4bpuRtbIoIcVVYom7+uLn/OnDqvgWp/IpVPe5GI
         I1Qn5ltgp5DjbJNMUGdxGgIvkfEvOfq7yTUoYVYDGaNbgFc8p64bsiIr3/lc0fnW2CDy
         lupaY1T21IPHOXfXi2JEzH7N4pM8k8QffVmFrdYkaecVmD+hAnCKGPTSIYcUXpn7DdYj
         Ujpagzia7i7nCMCWgVn6+YsxpPn8Dp0HTdYRyQLElShB7gtFCOfbZVNWGM5p1Y04R8hq
         K1yE9vWXlti2aLnpXN6J80BdDFbvgr9OI0e2C+hxp/OyHVgLB+ydwbURwNTNwkn6D2zh
         Cgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kDIyIkg1vStu4qiOsqUyesgmAT8Worv/gSmJjdhHs3c=;
        b=ul7JQhBE2O11EUk8H708fj0Gqh5TFqMsCIN2E0xsdiabFQ7iMt3DZB4vHWixEcz95i
         ng/Zz5S/hb0IkxR0roMdrTgTXlhZF02N4F+LtMgpsHNfR9+DIxvsjrjbBznHaQrz2W60
         DvJTSK/lYDurij0OW/LGUX107vCtGPNgk3CHRqVOKS3qvBKg7wzVM12R4E/i5O4greGK
         YE4j+WqNPh6sVJ+RSs5JXq06M8rpsZnRl21h7/l6tSTY2rmlVndnCjfmtaSCCfRXGtvv
         OyBjHgc6DODhgT6mp/lrj01s6X3Z9a6INhssHMgD4hRcLPM0VzI6FtHrqy+WHbFM/ErB
         Hq4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/g0ikL++azbMrjkDLIwIOsZpz6VtBgJdIwmRNvaAQFtRGJ84J
	0xx4DDvJJIa7MkVpGhGqei0=
X-Google-Smtp-Source: APXvYqylsgkRolHC5HpK9FPiGESdNN98YiXSruWoJSgDBbMc/zP0BFct2HEKpd6waa0cQ/XJ9uaiuQ==
X-Received: by 2002:a6b:4e08:: with SMTP id c8mr20581957iob.64.1577142992951;
        Mon, 23 Dec 2019 15:16:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:3a1d:: with SMTP id h29ls3000684ila.9.gmail; Mon, 23 Dec
 2019 15:16:32 -0800 (PST)
X-Received: by 2002:a92:3a02:: with SMTP id h2mr28338880ila.236.1577142992360;
        Mon, 23 Dec 2019 15:16:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577142992; cv=none;
        d=google.com; s=arc-20160816;
        b=auts6ie0/IFza9S2KsfEDW25GGSWaNA8C1r67WnJyf0gIKUGIyC7gcBSqo6cNpt0o3
         PPjraUyvZ+AJ8dxUUnlM1ZT0DedHRGXRajHAwt3LWrb8v9nlox2U+qG5T5gLXKoUCX6h
         QQSsWTGSvEqUE1u9yqmr3FLymaO1wq20DUPCIsVGNldGbEhjj5cAVgzRtN857bKLRmxq
         0Za7bKm4lwLXqRUbbjJe4DLhJHvvyQO7PKUG5cff1Y+7xTh0Cre+vDqjUcC3gCSD7aEF
         qSMHwfWiHqQOkerUaD0B/nB/8oWpasqPK6t7zONYQR5xLevbP/6pbJEbKTwsCesLy+9Q
         FJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=pF42f1/Gekcb3Pxyj954kKlI/P38Yq7+BvCaCS9+Icw=;
        b=GJBFd17tqWNAjKJ3x5aVMwNt4urv26SLlTJ12/UeOTNd/vkTtiT2YvmtzyolMYMeYB
         4n548+T82ztd+4xMr/qwLzM5DhmctxPYxTQCNhcQfcQuo0p8Gb2kvMFHCit3q3hng0VF
         wkLOT9uKduYR3tCMrOL1UalIclV0nFti6O8dstqsWNCGlX1hNleDDruPP5bTB8yiASBV
         PxNmc2h4DJ/d+hSTQrTw8I+PQzH0sissqUbgZeomxQ5UBLFFa/28dv7Rtuo9hbtHEsvr
         CGsLgzbKy8BGbo4Cmw3SPJpgBZumqnrcIKa7qanr+FvPnk6AcD4GSS1h0XsMyvf4nRbz
         JOUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jGVj699a;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id k9si1040933ili.4.2019.12.23.15.16.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 15:16:32 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Mon, 23 Dec 2019 15:16:31 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b8bd4b-ad4a27@github.com>
Subject: [siemens/jailhouse] ad4a27: configs: arm64: Add Linux demo for
 j721-evm board
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jGVj699a;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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
  Commit: ad4a275be0ca2d5d4b6c6e8d932e9699ffc65d0c
      https://github.com/siemens/jailhouse/commit/ad4a275be0ca2d5d4b6c6e8d932e9699ffc65d0c
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-24 (Tue, 24 Dec 2019)

  Changed paths:
    A configs/arm64/dts/inmate-k3-j721e-evm.dts
    A configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Add Linux demo for j721-evm board

Add the linux demo cell config for j721e-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

This cell config acts as a reference for partitioning
devices across the 2 Linux cells.
This will be updated as support for more devices get added.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix dtb build for kernels before 5.0]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b8bd4b-ad4a27%40github.com.
