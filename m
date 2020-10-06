Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO7G575QKGQEQ4AXGPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C262844E9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:56 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 26sf2429180ljp.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958715; cv=pass;
        d=google.com; s=arc-20160816;
        b=h8GUr1AZW3SS3UKgz+5jfm/5Q4nMulkRWtf34J94pO9BW6Mlg8vxW9w8e//RR2RsUF
         w+bPjFvYaedVPTxpOfgTUV0aYQoOdkRLmLviw++8njuf9eCcmpveb1CX59q2YQPtitey
         u6G447wtjIHzwbwgcYszH3MyGsR2Cir2Kob9RXZSHaX2j1ZU5Dfbj/0pyie0ONN/UeDh
         zoXEShMzNDOaQyRYGOd0xDQ/8kxCuyoJQ0s8pS7HnPys7M0/w3jLED/BB0u+kR5uB2wU
         di4rwKqsVJ6UTooEVzvSO/xcNfnQzdAupa7QLR/t7+RBHg7lmYHC7N4nlf6AKslVCX71
         zQ7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=fQU5CSG0OC+jO1SQBBUpcNqdK4/Mp9VHXFmAwZyPehE=;
        b=l5zExwNNUvtjLRrjeCqOjFlhDeNpjotA3ddxgUc6H6mSrvkfEEFEgQ2tZA4nmjN4Ft
         grFbb0ZUBHSF84EqHWrIR14IIKUwYshK7+KemNyMkSWT8uy78tU5Nt4k/KikVwaY5+4Q
         jyzKV5u2YWx8HLRdacdNBDWMWEIeP7DSuYMKH4N9UoKJXtp+FGNkjbqydjHROjH+3CpE
         LkUR5YXUEthoG2fc/KgUqVc0T7KbV32ampmi0jCZQ9Oj8LEEHFDfMT+XEBvZmJw8WPk7
         Dqg1X33DvT1grqv7FZMTWJRdXLotMvGzOzJ+1g/nR/jvuGs4MFwxKVhyYiYFuP0HoV18
         /r1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fQU5CSG0OC+jO1SQBBUpcNqdK4/Mp9VHXFmAwZyPehE=;
        b=sFJouJfry3HbxAwDCGqrAyLJThf+WyhuSlYJrmTAbQMC7qE4y8pXpLwOtlS2Xu7Ugv
         0snuGMzRI9dJx5swGE+WLpyySpNcciHX5YzeWacDn9DDpBKwocQNO8sVQO4KxTwKg6dV
         LM9OcmGYI4FWrpNQy0fzBL5TJotU2iCLUvpek8uA0AQRG5dJPaAuwHsVUTnn6W3VdZN9
         vhXue0QBttxmJGcEENyXEne5Wv+x8ShW+62kACPpBQa2VTFVaixhuGouo7p5BU2UZQji
         uze3DE4OdqZELRDfe0UdxX2z6jSI9dsa/rgCxmfia/uI3cts5Y6/noMu3isYeSS60EU9
         hC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fQU5CSG0OC+jO1SQBBUpcNqdK4/Mp9VHXFmAwZyPehE=;
        b=s1Y0fNsCX7PKW6QAtDNSR4Qx53yLqF62+upiCb7yt1fj5OGbGdQ2qBe9EXMZ5RRIB9
         6xqW+hUiqrjZ6J7I5cxyUNxrjKcE25OZ7M0lN+EKmKi6j0eDClE4W/feLIO78Y6nABdh
         v9SIebY9fgA2hy7t91XAXOwOsMMqjm0MLzgBCqRJgn2xJMOEC5vRtKlV/0q60yMstHxF
         0T19Vc41mxvoZxv+bjmJ6MDywHVLCBodVjm7Vg8xFJ+lECWvwAlG9z/KpdPvctNeVAp3
         ZBbFr5oujaDa/ljjf9JDdboRiquzxmBhXFMK1wce0ngTHXFlFEffxS0e4zi6qckIfDi0
         v7kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AfUZ56R6JFsHBawX1A4CbFugojb2GWp0tiNhOWzln1AQcjgSm
	kU6tnggQ0zKO9I0KU4KEX2I=
X-Google-Smtp-Source: ABdhPJw1LVqB0giG5yXA1DcYzMxnYguKscKHCxd31WJ96TU0gSq+HVkTrLmQgjJAALl574WrsEycdg==
X-Received: by 2002:a2e:b4c8:: with SMTP id r8mr1080523ljm.37.1601958715715;
        Mon, 05 Oct 2020 21:31:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1281798lff.1.gmail; Mon, 05 Oct
 2020 21:31:54 -0700 (PDT)
X-Received: by 2002:a05:6512:2101:: with SMTP id q1mr875945lfr.157.1601958714574;
        Mon, 05 Oct 2020 21:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958714; cv=none;
        d=google.com; s=arc-20160816;
        b=gFuuRE2Rr5H8FvHtqraMfJkA42Gp2GyKtnSK3ql7YQq4u1RHFHdiCGkwyuL8jmEkJz
         rVe+1yG6EaspPiH1Y/pYC6GNsN8wV9G+67Psiqx/VoBeMTTrecrnSyaKEn9103usjwx6
         XEZpXvGFP6vdKyNLcmXgmBbcpCY5F2BPdQWq/lpM3FhFdNsdK/Q7CdS9kv+POPe4lXuT
         23BM74rwHde14NuEZr9HR3SuWer+f+XbSoWm6gdlEy9TvjVBNa7xJY3imIMSX9W7OJb3
         wNh6vfQReXjJFPPjcuSsi9nev4OvVw5LWB7TCDClk7N44fuHFaGld3kpoGh/dN5fgEoo
         e9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Bs5/JctsqJCI3GT0OSbjPRRKp9tXObapzotbFlWfQMM=;
        b=AzDypiRHZ23CVKssiQog5m72ve+oM5ZcQ7WFPfUwfMUai2PZu6/nQXLjzr1BT85tuM
         FY2VJkbd4bhOQ0BQitYlUXwZsk+czKMBxVXpty6iDgTZX3toa8uhBlaQWz+ydOMWyUIL
         GCa5HkA7zb7zW0gOEWjvXzbYzjFZneHsoox/mHTce65CTvljg6mH2Rrypnqa5GEg46K0
         rfaS2zzmewfpHCeNVzyW1Fb0WzE3v/19WdFr0YPzZh0Gsl2v5gZ0VwHFAE4HHGpEYoyp
         F66D+e+b9HJfWxQm96LQoMFsHhT2eoeGWUQPNkNs9bfVYNTpcOCZuQESJJB35iRK37XF
         tymQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q20si63007lji.2.2020.10.05.21.31.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964Vrl7028644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7w008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 12/19] pine64-plus: Disable initrd
Date: Tue,  6 Oct 2020 06:31:27 +0200
Message-Id: <18d0e5b2c6686e10abe4d10d2785f445e1703ec9.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Aligns this target with the rest and avoids that U-Boot may locate the
initrd in memory that we reserve via mem=.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 wic/pine64-plus.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
index aacca04..307e355 100644
--- a/wic/pine64-plus.wks
+++ b/wic/pine64-plus.wks
@@ -11,6 +11,6 @@
 
 part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
 
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active --sourceparams "no_initrd=yes"
 
 bootloader --append "rootwait mem=1792M"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18d0e5b2c6686e10abe4d10d2785f445e1703ec9.1601958694.git.jan.kiszka%40siemens.com.
