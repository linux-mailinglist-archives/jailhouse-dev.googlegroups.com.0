Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIXGTPUQKGQEVSF2QAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 0994B65320
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:19 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id b135sf1320859wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833698; cv=pass;
        d=google.com; s=arc-20160816;
        b=IAes1c6F9kUmanIXinxPmlZDsnAUcznyc+/mKaKdqm8SiKz+aanVne/9Ud5k4Tv2Z3
         NNoXG3osuG+ApA1sb7zTWYZee/b0KFjnRzXqNc5tlFyf8FGEqNczKC3uhdrvX2Pk8XHn
         VwD0GEvz1O4XwNsmm5K0u1MXfVJnyeIwElkMAw+2ZcHDeH2xR8scU3Gf+DgJ7+SbeVc5
         27B89Pddy4UeVo/cePDnaRoTZ0xOZBKDsgp7en2YSanyABYJM8KYVQtMf17A99jSYs8p
         4sbHJ+ve2ZBdXx25qECWEOlvzcH5N0aIRPi+/PH6rJcCrBKBViKPxSO+1/7CMKx10R1F
         LW/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=N9rcSOfcktH7ObLm5wPnloHZqyGndoD/S0Cnif26kZY=;
        b=f6qi8wkETpwYG9HY1v1iCwC4bMfBTKY90wyJbXO/gF0xhwx91aII6NQfDghKekx6cS
         oXLgFw60UdI5mIBct2ProLXLiutghXDDMUoQZyTIF+tFcSYZFc76AY8i1DIcbeUzH0dI
         VdPLvWyLYlgrZeDqCIvbm8PZZPF2i5hTI6gTmKgH8G5OgJtAvzw86PQCFMAVd73Gwp+P
         XhzGxalMlSkQQ+sDu/FOl2oOGhF3UfYaiPM1l3DDsBeuS3JUWh+DMB9o8axTgbyPv1sZ
         KpY+mWBiw/oQjcx0AmFziuQW8YRr4jgXlKCJ4rKHqoRsMFZhMIxqMY8IoxJYXccUSOBg
         gC5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N9rcSOfcktH7ObLm5wPnloHZqyGndoD/S0Cnif26kZY=;
        b=nIx88g1fqZAgzxKFyV6uNJoRx4+sbsLJFwGYvzUibN7WUqNEXM0/BYBVJAabMOvKBX
         5mZOzPhWMpbajgpiZaYpgl/went0HCFRxQ6kVNOfBFPkO7AH+sau82oy9VCuDkOJC8Jq
         DaoNi31HSllo4m+6eiK1MXoD3dF6lW7/iuH9ZwoYZ4yaIHp+3v085mvzwdRuxB9jUI0i
         Y/GB89hxVhQ+wbwYvEVbln525dvlf/tzh79G3twsqRQDifo2k2ZUG9siJzhIlhMQXqvc
         fWnIMlcdAX5cn0dAwKT9rhNbws1kjI6z0/fPkySk9+4tTI7TOw0opA224GzBakWoL6kP
         +1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=N9rcSOfcktH7ObLm5wPnloHZqyGndoD/S0Cnif26kZY=;
        b=UOWiPlCHxrMYb8P05HEmVI0r8yJRHcS+S22Hs+PtTwyhZCyYDLiT1AOe9XQRZofuiy
         IPiShgA7mbbp4WHJikfEKv2n84QvKTpblbMDyterqRU19U2AMfE24NLOJQyDQqB2Ph2K
         PgkKjznF9DL6gribAO6SYEefQcw9PMaL04ru98qQDE7vuy5tdo0TKWsqf+sHQPFYup50
         6QrhYWrnTkEHgXqOHGd4g3MWda32a1IgFqwMZ5V99daw0sSnJCLHq4MPpfvTdJZ6dLIe
         n9y6g+V6IqcQI9CoAu+y/cozF6nnub9vicIFpf2N6ysHT3Li+quOerC9Leh7PI9wTMhO
         NcWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXlUkHIEOaBkIGCI4y6Jp7MAkO5GpfhHCVthO6PpGCsrrCK26/h
	KWtjxoYIWvBfeEG50vY9beo=
X-Google-Smtp-Source: APXvYqzS1t1sOhZusB2dDZ2QmfjXv12GZwZCbpPtg54zNMk4abe+LQGwXrcM1r3PP1QHw7VniKafrQ==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr3441729wrq.78.1562833698739;
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b50:: with SMTP id x16ls1594391wrw.10.gmail; Thu, 11
 Jul 2019 01:28:17 -0700 (PDT)
X-Received: by 2002:adf:f104:: with SMTP id r4mr3631066wro.140.1562833697888;
        Thu, 11 Jul 2019 01:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833697; cv=none;
        d=google.com; s=arc-20160816;
        b=CImy2ziAEJ4m8AM6JDY4apk74gq7WQO80rsepWHqcLGXhojELiz6MJ27qc33DbhmnH
         4P5n6o1UEcDG386kK+jcKQk/fgIaSIxV3RJ9FHEyXUEu061Dmj18HsCIfBfA+twyqVj5
         V8vv4w3fXOe+OB8jYO5GSEHcD4lp0sAUcHdeurDCNeBbGNka8gXuCph6HiJFsh8Vu2GL
         AY7KxbO5HoAywtTwozcAn0JZynMIztqDOKfbDLb8UMImF5MsOUo17/jucNgAANBEeUS5
         wgYjh4/WT/Qsg6eshnFOruPaPDxRVE8V/J1ZEIalULpnQWQkr+D+lz/XSQMd3XIMkYWz
         jCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=d1uao+bvK6ak22amBr0QnXvsS+icuwFDZ935DaDCVIQ=;
        b=hCFrQz3v8cxF3btScircrFO3qyBwJg15yN8/ysozWMf+KBjixtbPMvgVxCow2lRumu
         jIrL5QqpqSisRi4MirUVzrZdX4aCmffAuam7/5u3o8v8mVrqjaMU804DT6NvsYoBkwWs
         KsMxplhrZaflWBhPcTNqU2fAOyLgMCmxX5LsoOTl9NdwkGu082FrQiV6BnNmztI6Qejg
         ++ehMwUdKvoYuWg1ReM6lM2CHT4q3Abp2KEu05bKwsbDWDQ6Z9OtuPTkcjtFI/I+eJTP
         JCUIWnD3V9222ucayN51R4WtwA3Pv3nYjN9SHonL41M5N3Se1NjtCzn5yMNRIgVlVOns
         N0TQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a10si298534wmm.2.2019.07.11.01.28.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B8SHMW002894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7N010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/8] linux-jailhouse: Update to 4.19.46 and 4.19.37-rt20
Date: Thu, 11 Jul 2019 10:28:09 +0200
Message-Id: <7673e3e3d6f25f3708c7e2a32b1d649ef6bed067.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...ailhouse-rt_4.19.31-rt18.bb => linux-jailhouse-rt_4.19.37-rt20.bb} | 4 ++--
 .../linux/{linux-jailhouse_4.19.31.bb => linux-jailhouse_4.19.46.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.31-rt18.bb => linux-jailhouse-rt_4.19.37-rt20.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.31.bb => linux-jailhouse_4.19.46.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.31-rt18.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb
similarity index 72%
rename from recipes-kernel/linux/linux-jailhouse-rt_4.19.31-rt18.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb
index dc3b4f2..a56aa50 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.31-rt18.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb
@@ -13,8 +13,8 @@ require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "af562654d758b89732e5c74d13a5f92015ea640b40791ac49a57ab06b84efee5"
-SRCREV = "78ebcacff183f3f0bb0045302131a6d3edae724a"
+SRC_URI[sha256sum] = "ca6da44c47571ad3ce911eb92a0174422dd9138f8c70ff2fd35c2a0b7613adfd"
+SRCREV = "64415ba5b24165b1be91bd0533fc9e8ca35f1aa0"
 
 do_prepare_build_prepend() {
     cat ${WORKDIR}/preempt-rt.cfg >> ${WORKDIR}/${KERNEL_DEFCONFIG}
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.31.bb b/recipes-kernel/linux/linux-jailhouse_4.19.46.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_4.19.31.bb
rename to recipes-kernel/linux/linux-jailhouse_4.19.46.bb
index 88123af..1f3469e 100644
--- a/recipes-kernel/linux/linux-jailhouse_4.19.31.bb
+++ b/recipes-kernel/linux/linux-jailhouse_4.19.46.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
-SRC_URI[sha256sum] = "e63412cea4350b038634a870b229abfb9fc64bf82201bb5afc1cfcabb87bea0b"
-SRCREV = "ef906c3f35f5b53cc6cb3b9420a862d9f16e79b5"
+SRC_URI[sha256sum] = "1d714ffc990de74f877a0cb3a57c897956583346a55e172f669a1864b36c08ca"
+SRCREV = "f402f1d439cc0a2aeeb480c524f722c32e25fa21"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7673e3e3d6f25f3708c7e2a32b1d649ef6bed067.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
