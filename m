Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYOIRT3QKGQER2JTDBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D471F7405
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:44:51 +0200 (CEST)
Received: by mail-oo1-xc38.google.com with SMTP id a15sf4142469oop.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:44:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591944290; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bq89I7gKWLWxqeezXW11/g7bWcCXMBNmnvEBkAKa7iXbXeyNlorPaPFhSz7StJz4vM
         DbQuJ97RpXE/W9g/c1cAsXIr0zrG+IFY+cRg9+J5m1Yt9gGINKJ/SvL48O5TsTZEDJEz
         oyQvQiQToZJLrrGv/S44iIskpSVtZG/YlBhDqnTrzY8L6y92yG7PbFJ8ouERcOCcc37v
         +nhs282NhV24JiBCeu6JhHnVQHVJnd/J58Mu5tZWywslcABcJTMl7P5+21bk4OzW/2zp
         gGwF4jHx5ThwK3AG2SPa3pZu3l0l0AYa/bfO6jO9AphCCAKszlgQJ4yr0MiEJzayDgSa
         TVww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=L5BYH5r+xTnIgvoeuN1vNTRRUdb2yys7QIYAJoSSRb8=;
        b=M9ZRIrXjuoZlFpaDyPuVRlaybkosFLqB/ARTW9W6MXLrbPH4fs1Jh3Gm2u7AXNXptL
         YG7WfmG9lfpib0kvSFCCs/BKEte0/SuhboONSoY6aSSD1/TA5wUqBBQKr1EEtFTFTM4a
         YGwqQnBHs3Eg2KPxIugWV/4Htbe/dKH2gmWTxAoCbS492rAZWTfRMlHk5B7rf6HxtFEp
         jOSP5xK6x+beC2B6cioq/2890jZBIxouaFZruHNzZemxL3+SKg7fNqzJWUtlE78e4tur
         zev84FyIeqegotJMiVsv0Y4l/fQiaUEQ70fPbhHCdzfTSsUagUK+f70dkWCoXi4+MMkX
         F6mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=T76A4ElM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L5BYH5r+xTnIgvoeuN1vNTRRUdb2yys7QIYAJoSSRb8=;
        b=md3uM1Ln5y7hz95yH+T8U5INU1W+qRMH9yuktvnxMYAGilnktY2Mbrx06auk0unyfA
         IUyODg6HNv/vCNPaM/DKmBEgjsq0+z3d9IImclBtDX+7VcGGmvyJSgN29AARapQhobPU
         RASxj0KEvyTYMKLLQIcwYL2hmqKAT9JfIQ6FI+sOyEJiZUVAlKdamLogt6xe8Ry0NBu2
         ttRceAg3a4NIPkgYkfEsZmXY8WGyEXaqGij8vz81d2ldOYNHylRS0Wq5gtiyoiHY5Fid
         8mdvyF7QNUlxs/nvLjPyKyBWcoxByBqcpiU4nEvMx6Dx1F6P6JFXT2v2SqJGG2f/Tmrn
         Hb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L5BYH5r+xTnIgvoeuN1vNTRRUdb2yys7QIYAJoSSRb8=;
        b=oItjiY2LjRePP/yocjX1YMII5bBPWTkHvB/5F3ybJSMn4bC+K4VCiVN2TPCjkWVkg8
         wxD01onQBZrWvn41VbC7AtiEcriN3M7X26BggGK2QfHhehAAaH0zOeFls2rP7QSE1QsF
         rXFrBfFEstNIOLduA0/KduhXFt2qDhRXnGeMV/kojbAVezzRIXn98MsaVpYoaiurIXum
         uBrhtCW2Ahz8+5hixTQuXB3sn4ocp0zEcLyUk//oG2oGW6SVwi8wIq8TF7WZ+t+iwek/
         nAQjsOtL0AYnE5I+jebMLFdpfJAlJ61+6AbvJN6ySzETLscJv/NfEglbPgWfHl44umW7
         PmIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/1Xv9gFFehBWEVfo1aH+sCmF3t6A/5pD5+M101JP1VTUY/mBQ
	4o2u1VWsQZg/gO50ElRsqV0=
X-Google-Smtp-Source: ABdhPJxARHU+CUY8qN8urY3WLFM2CziT8Uoj01VPpZlETZ5+Qe2Ab8qgjf97ZWT0L6K5R8sdqblp8A==
X-Received: by 2002:a05:6830:1288:: with SMTP id z8mr9076455otp.226.1591944290023;
        Thu, 11 Jun 2020 23:44:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4808:: with SMTP id c8ls1003455otf.7.gmail; Thu, 11 Jun
 2020 23:44:49 -0700 (PDT)
X-Received: by 2002:a05:6830:17d0:: with SMTP id p16mr9532110ota.148.1591944289588;
        Thu, 11 Jun 2020 23:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591944289; cv=none;
        d=google.com; s=arc-20160816;
        b=eka+IpjTEfbfn7YaE0ngdKdHEc684ugcYZ6bldrgWv/EHIiLSesmLyrYhupQO0kK9o
         686O51g7Ysz0FRFrGGsQ8mh9kWFW9mqEs2oe7J5HC+8y3Xt1OFbv1oI3PGcq8nEbrKuL
         RGylglT3/PEoG+uDb645JWgju9L00u7FFh6J8HHHMipU6Rw6mFpY1j2hISI0y0snr0hL
         GcLxmIKeGiEqbtwOY7FEinnsZFYjheb5X3EVub57cQFfBINE5PEA9iZizlYmpAfFlR9Q
         9JloygykZCVj249LZ/wg2Kytr3RlvdA+YvpO9AT977zyyZAxWIuSTgj/aks1lT8ZfdIp
         p7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=jmHYqG6shmc6Tgemj/I5iGKynuU6Ph+2svbW5cJN/uk=;
        b=mgbQsPPuI6CB6U/XQTq/aPbjZscA4ckf9ySkhRGTaeHvmd1J/LNZnX2ZZ5UWzLE5RZ
         Lgnn46QHZXb1+U3Ofw6PJlgq94BlCZwD2m0jMe5HklsNAtu0/pzGrpo1/FOaA4XfaCZh
         NrTKiJFpTTbg+GfZlOmw2hrH2/1JXv4bWtbXVZegE7gjMt9wK/KD3XPgftqUgXqrxTAg
         aC5lI6HXRmehSJbF4WbBLH/xG+Ywr1hdBYRl0f+fB0+vuHY6dK16MmSPv6WOZClKKJoH
         mX5azDLnHxCdfZc70R2Ds/JFViSd+3og7UxpE8IJa83lrCYU8bA3jIoM2IkScyOu/FFy
         MGXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=T76A4ElM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id u15si407775oth.5.2020.06.11.23.44.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Received: from github-lowworker-5825cd4.ac4-iad.github.net (github-lowworker-5825cd4.ac4-iad.github.net [10.52.22.68])
	by smtp.github.com (Postfix) with ESMTP id 383FFC602BB
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jun 2020 23:44:49 -0700 (PDT)
Date: Thu, 11 Jun 2020 23:44:49 -0700
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/870771-8787b5@github.com>
Subject: [siemens/jailhouse] e7bb27: inmates: ivshmem-demo: Parse target from
 cmdline
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=T76A4ElM;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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
  Commit: e7bb27a71d1ec6d2f68e29d354bb70acccd5c8bb
      https://github.com/siemens/jailhouse/commit/e7bb27a71d1ec6d2f68e29d354bb70acccd5c8bb
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M inmates/demos/ivshmem-demo.c

  Log Message:
  -----------
  inmates: ivshmem-demo: Parse target from cmdline

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix ARM targets by avoiding division]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8787b55d3694134077c7ab924c270de5d6fd60f2
      https://github.com/siemens/jailhouse/commit/8787b55d3694134077c7ab924c270de5d6fd60f2
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Fix memory overlaps

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8707714bd3d1...8787b55d3694

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/870771-8787b5%40github.com.
