Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUUYQXYAKGQE5HXFBBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19C129BC8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 00:23:00 +0100 (CET)
Received: by mail-pj1-x1040.google.com with SMTP id 9sf675440pjn.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 15:23:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577143379; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZZD1BQ52Y0gOdukkrOqBw9WBza2Wa7Ez3LfL1MjYlhdXaRvQDXV36H7BXdEW253KmE
         4Q5D+isFl8NP4sFRbUH6GY+fJlQ6ORhnJrN+MXiY47QlnmosRmdw2LuDLPBCqKYPizb7
         yQ6VfFiTxW0dCnmwG9hHPrA0tG05X74Hdx2j65E5QeEar1eN2z/uPBS/PwxwZLB1augj
         2xbOJ0y5cU2tvcex0V08dKAGOLIIHlJOEfXezxzvqQtz7tLiCjXsqG1Fq1cE/ant+6M8
         PQsfuJu5oO+lQ7fxDpKXujrftnwzFXKCU6UidpwBsBH7KCbEXH5/qebtiq0dzABjeLy+
         /UxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=USM6lQnVt5EUD2lcY7F04t1jATNdLxLIaJBvJUKkowI=;
        b=k20RexeyVsiaIN70npl2FIXQ2AD2X/8s9/3JV51bvIzrplgU8TJ1MK8Fwa12hDV/mU
         aVkgNMYmCnar7z9MgXxgS7hcfckn8nc6Yh6xSTD53azTVPmBjl3jCMg8Hs8TH6ioiKS/
         nu56+iBPpYQuwm7pZtV6jXZRWPplwaC/6fLeNevG59EekJM1P/G9kQvw/yRVRfhU5MP1
         +1SnSbsg2hFfO4jq49t5bAa6U5fdnf4mrdgsCHkDD4/NYLlRVj6pOHPND/UizFZPgPtl
         cv3T1uiIObkmvesmyYfjcxvBpN8ZptMTQSP/FTg2dgFxzUdXucvM16ALt3nkt+sh5tuX
         CRvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="z/+vaTmq";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=USM6lQnVt5EUD2lcY7F04t1jATNdLxLIaJBvJUKkowI=;
        b=WkL5IMEL9QaG+x2C+rCqSGO31oVpFn6I39uvNtLnJP9nPiqqOeLxWqpB0wvQaKnZl8
         uiFiiRkfUcu59yWDLJyEVwqdyLSdRaoy/MrkjNZGJgqry4mgSoZSkkeHKVn5iV3jrQS3
         8FJYNnqdIsvS+SodMIXh0+i1XZEMXc9LrMaSRj8JOvd4VXmENo6CiKNXQx3Mi10WmfqC
         QrdBIDDsWe8RYBuyVeF65235nKhtg7VosjsuHnzHgmv1qWT6zY44yeJTKBaX30qu5TAj
         P8KDu5HyGLo+on4wWFqUR3MiTYQQ2pzyDJ1Tk3vbxuLO2O/EUQ+35NPCtt7tTV6ZBZXk
         wFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=USM6lQnVt5EUD2lcY7F04t1jATNdLxLIaJBvJUKkowI=;
        b=ZRUNiAfvb1QRbK0ZDE+hUBgR3HXY8p8RIQa3Vi49Dmn3dkvRQiKwDSGTcNE4e10myj
         ef1LNAthpyXg47vHAf4YKXvI5Jex25c17dfOXqY7MqeHdYe6ZAI8hlSwQUaewe1KcOxX
         qypqFMyFuQtT6wzlo/P4aK2n994ePuo5oHl6vCjtw0My5URBfp/Xqcl+IvU5yZ10h3ot
         AjsERbh+FzMAR9sc4HYShc5+/2nIJurwEPxaI8xNiqtG1r3b07bYOYIRTXoaLSWKZs32
         nMnhqTDzpPmDWEWJAl9WI2eWJ7t7qAxo354HR4aXsh2p1hdyIA/j/SsUfXjRW2YO2j+e
         hNLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3klQJfSWnAF+ss9vQUua3paL1vqQ0gR+jmfyRR/PqpU1wxKx6
	y7zZFzGuCENgDpR6IBUAE7U=
X-Google-Smtp-Source: APXvYqz6dBubiBqw+rgX6tnkGUv8pIwbnYribExPoBZVcFOKhKUEn3p9NFGC4q0Qdjy3R1QRdAsudg==
X-Received: by 2002:a63:f551:: with SMTP id e17mr33413430pgk.162.1577143378963;
        Mon, 23 Dec 2019 15:22:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:81ca:: with SMTP id c10ls4977214pfn.12.gmail; Mon, 23
 Dec 2019 15:22:58 -0800 (PST)
X-Received: by 2002:a63:2355:: with SMTP id u21mr33288934pgm.179.1577143378345;
        Mon, 23 Dec 2019 15:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577143378; cv=none;
        d=google.com; s=arc-20160816;
        b=NzGYH7SGND/2yTtbNuPKZH9iThjg6lLZajE/usrsdgOhZUNiAqCZRyemG4ajqQFWp+
         akTy6L652I/8oxPlWdxsjOu191hyXxkWemKj+N6pXXWq3PK/IhJFTqfQDncRJCw5jX32
         E8ssbtdGG1/d9OqMV4NXOScOBSCpWAq+7nEBRmETcqDw9+7QnoVPkh+rysHzhsE1fBjP
         t7fybQMKYIe9rgruB86WY/ORZj1VCvonQE52KjcUDrzyIrNVC0EFdaXLLToJLdgEgdyZ
         xnBbtS7aU8TTJbypNt0AW+WlZ+zq6k8kqrj8OCe1cnVlS//hF3S2uM+rPR3H1CK+NWGv
         eglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=a85Ig5aJ48DUekiTC7ztKVnVAPQqv3EHBMweB46Mz/I=;
        b=EvWSROxVQcj/uB0yVCkaZUcXF21veZNW79nvhXD1lOMcEqI7sM7SjNNxKxohynSuM4
         szrRruNVED+4Rea3vrYlLYV7Z2PLqE+cyG8w3KPXQFbjvccPYVANr9VOlT14JLqyhkEq
         eZK7qBckiAcceFnQrQAdRbqPj4DDroxvQzXKhgj1RT9mcFU8uyZ+sEyxUoUWFtlHoh42
         B/N8uLoqHNeEoAuO//kzobBl/e9eGU/aR+GJuoLi9lNnmhIahfmZ0y4n0ycEij71iJNf
         PyAFCl9V5Vy0627YZ0ZOMn1v2TdcymL3TmHSLOl5um4YXg9FpOiM71Z+YLS4FdsJWKZK
         xrBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="z/+vaTmq";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-6.smtp.github.com (out-6.smtp.github.com. [192.30.252.197])
        by gmr-mx.google.com with ESMTPS id w2si691348pgt.2.2019.12.23.15.22.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 15:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) client-ip=192.30.252.197;
Received: from github-lowworker-28f8021.ac4-iad.github.net (github-lowworker-28f8021.ac4-iad.github.net [10.52.25.98])
	by smtp.github.com (Postfix) with ESMTP id 888121C0EDA
	for <jailhouse-dev@googlegroups.com>; Mon, 23 Dec 2019 15:22:57 -0800 (PST)
Date: Mon, 23 Dec 2019 15:22:57 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ad4a27-f6c4b6@github.com>
Subject: [siemens/jailhouse] f6c4b6: configs: arm64: Add Linux demo for
 j721-evm board
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="z/+vaTmq";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: f6c4b6d9062fce637edcb13fbe49167590ec2715
      https://github.com/siemens/jailhouse/commit/f6c4b6d9062fce637edcb13fbe49167590ec2715
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ad4a27-f6c4b6%40github.com.
