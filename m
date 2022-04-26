Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWOUUCJQMGQEEVCM2WA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99051054C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 19:22:34 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id f19-20020a0565123b1300b004720c485b64sf2446462lfv.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 10:22:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1650993754; cv=pass;
        d=google.com; s=arc-20160816;
        b=uImdWo5OdlM3vkgYMfSAtf/ZPmHtGMu7SfR2NR4RwfGd+jBOlcR5loO1dHzYiVBEV5
         hTMCnVWCoWezr6rroIon24OqFTEuGa+oWsy+9f0KBhY7fYXUhPK6MEClL0ZgXj56iRn2
         Di/NsRlUd6FRstfLTGgVDgHJWmRjYQVLq5hOiA6VVEa+BOEExy5cmD8JAlwZkQMn6EYX
         SlOTP6ns/ycTzaZjcZJADx61XB8eIBsf6ixzy7N7Gov/2bZWMnuXXlucMcE+uhZKa/qv
         XbzpRaIh1Jx02Dep35UclvpU0D8gXR6wzo/SPs9pCPO6vPpYCRuGkeIWa2cj1Zl5bqhG
         x/6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=gjgBxbywwIT/9kFICaOnd6sI4+sU1RF+fBlJdHyJX2s=;
        b=V2R2ta6eLPUk68EGADlBX/qQbLiHwZ9UrufAi8filc/Fv8kuTjjNJw7laCnD37Nepm
         evx8Poq9mVT/LP0y+Uo7w3veDNzbMYxw/wb2nsinZLrNMdMMLzqJv6wUu0p2hoc6+cwp
         OM+udijdHGfGI+TP8NsPJikS/V3QRMTOavAQYHbpKCbAa6aEFY7WLJKYtT8z9vKIfSeY
         nPq2aYy2ReT8eH7A9VvuFnaodI8GpSMLZTShJnNCzeUR0iVIfKhRVPZDCz39YfoiLBiX
         CUGYyc3YqQHqwRDP8ngraWnXHzdvVSQhW5u+CBKH2nyMyoCHNKUnI2Oh7HTjX2JpMG+6
         v/+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mlg6bDlC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gjgBxbywwIT/9kFICaOnd6sI4+sU1RF+fBlJdHyJX2s=;
        b=WqYW0E/G0IXa1meM5RGmyQZrynIUDGKg7iLaSjyb8mmDTt72DDiJmp0TeJOLiyEf2O
         yiuwvmGbACTKnUDJRFrFeeWokqPum0zGFBE8dVvzogNqpeYvWAdzGIDp6rsWn91dj+iN
         o0uWknhDCm8YyX00yUR7Lg4tTSOrhJhUsRYa/dNzFHRXJ06Mog5Me6wFquVLHG8qhPbS
         qpTJlymzAM8z6B18YltgC7h/lQ6sNsm/ZbIgyHYmuesJka9sPS5OUcVwrAszr4ElKp/W
         QgYnBsHcsVqMolwTfsovMxvrCtj7Qk7nPzUtVkQqjydc8Tr7mYoG3/Tt/ZBBuFlGL4PD
         1lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gjgBxbywwIT/9kFICaOnd6sI4+sU1RF+fBlJdHyJX2s=;
        b=Pqm9O9HH8hiGvMIn/W1UxFxKVwQs5DDX1SzZpe974KPIQAScTsNqi0O9Sxs+iK9bjG
         fTHVg3FhBqicH361tb5diSkMdUJPlN/dbTNhIbaIHYwJrrMkby5H36tW/uMjdEmsV4bj
         he0+tvsL9J1PFUP+ohY0hA8+5Hjjw/zj2nzsVs37Esb36IEwqwVlgWlpCTJ2AAKNu62a
         tfCnCrcehkeDKLp1vdbpGMFF9QGPTN+Mp0tlObOP8b3S2ed0RtJKG1679rEj4190h6O4
         6gAV0PRfxQg+CSPLUNXVDT7m3QqKRTofesAuwTnHr6DHhVpNL1enH2SfidZWsw/7H7hT
         yp4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531a5hddh76YKb7wYO27p8Cr/fffCytLz452XSj3IpopDSXHkhom
	qF9MkKV/zT03JVTzAJRuy6k=
X-Google-Smtp-Source: ABdhPJxWu6xRe4OsnW3JieKLmFx5JtovWoKXq2IMs39myyc+0QxHoGmK/0eXSAp83w+NsFrDbY5p4g==
X-Received: by 2002:ac2:5f74:0:b0:471:fe5b:8f03 with SMTP id c20-20020ac25f74000000b00471fe5b8f03mr11249725lfc.444.1650993754163;
        Tue, 26 Apr 2022 10:22:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls2164384lfb.1.gmail; Tue, 26 Apr 2022
 10:22:32 -0700 (PDT)
X-Received: by 2002:a05:6512:6d2:b0:472:ba9:7bb6 with SMTP id u18-20020a05651206d200b004720ba97bb6mr6960619lff.679.1650993752172;
        Tue, 26 Apr 2022 10:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650993752; cv=none;
        d=google.com; s=arc-20160816;
        b=KOxy66q2T1pwgp4nKc8+ebVrWfBPl791CByB+HEekWBGdRVh+sJXrwV3GWxnuQgZsp
         p95e3+aAhlAZeNBso1qT/Lfv5Krx0W+K9DX0Ocrjr4LuRGw6peO2cSo7t8NOazKFL8iy
         Q0Km77FXd0KC5g29li5Ph/ZVccKMBCHhSSj/kEOb3dL3bbZD79SP9/BzzVK91jLMYbl1
         SkiD0SOZ8CjZ4qHQsn8q7UaotDw6d5XWSQGeKQONLYFeAVCeQaKttbH/iB1dJZhDDw0l
         GiHzjBHkjyYqLdp7Wg0mgem9gZ7+fogU1Pg/M7u9IEuUChwJ/WVMlCNsMhNfjhs+InyT
         T1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ysHABoJdz+It+u3rC5zt2BXR+mfEe34QYmXgMxpeJ7E=;
        b=t8G5XtOH5zQEBekrR/qrsZZwy/xVC0kGUrFrBL3YhHi/GDdeiZoRm/4zoQlB0q/n+o
         dsUKTO3nKCO5aFewClRm+bH1aBZ9vJPF4iTHQQtGPsvVuhbFeEXr6l7m0cTeusHkjWxg
         Nhn3PA12lwboS8Ui92yWH7RDKYXqN8OvIwy59Hde6ShG++Qt+Y2L7sClbnARzTWYra6u
         XANHx4HMJvQ4cIEGj0diXYvYNA7Nd2HUQBz7FBoTqyEhOR5G38iROVNfD3kWYBGd8PS3
         Iy1vO7krPIF85/Z6OcyWcP8NlGIeYiedtLxEtFNWMfMn5UWJV2bgpPYUid2+X0EbFO0O
         XmUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mlg6bDlC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id w28-20020a19491c000000b0046fede34ee5si858086lfa.5.2022.04.26.10.22.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 10:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Knpbq1ffMzxyt;
	Tue, 26 Apr 2022 19:22:31 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 19:22:30 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
Subject: [PATCH] driver: sysfs: Replace default_attrs with default_groups
Date: Tue, 26 Apr 2022 19:22:22 +0200
Message-ID: <20220426172222.1910982-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mlg6bDlC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Since Linux commit cdb4f26a63c3 ("kobject: kobj_type: remove
default_attrs"), the deprecated kobj member default_attrs is gone. It is
replaced by default_groups.

default_groups is available since 2013, so simply switch to
default_groups, without (hopefully) breaking any older kernel.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/sysfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index a604afa4..f91d5ac5 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -180,10 +180,11 @@ static struct attribute *cell_stats_attrs[] = {
 #endif
 	NULL
 };
+ATTRIBUTE_GROUPS(cell_stats);
 
 static struct kobj_type cell_stats_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cell_stats_attrs,
+	.default_groups = cell_stats_groups,
 };
 
 static struct attribute *cpu_stats_attrs[] = {
@@ -212,10 +213,11 @@ static struct attribute *cpu_stats_attrs[] = {
 #endif
 	NULL
 };
+ATTRIBUTE_GROUPS(cpu_stats);
 
 static struct kobj_type cell_cpu_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cpu_stats_attrs,
+	.default_groups = cpu_stats_groups,
 };
 
 static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
@@ -342,11 +344,12 @@ static struct attribute *cell_attrs[] = {
 	&cell_cpus_failed_list_attr.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(cell);
 
 static struct kobj_type cell_type = {
 	.release = jailhouse_cell_kobj_release,
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cell_attrs,
+	.default_groups = cell_groups,
 };
 
 static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)
-- 
2.36.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220426172222.1910982-1-ralf.ramsauer%40oth-regensburg.de.
