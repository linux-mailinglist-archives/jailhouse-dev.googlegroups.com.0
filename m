Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBDUSU2JQMGQEO5LUU6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C6511CC7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 20:18:55 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id dt18-20020a170907729200b006f377ebe5cbsf1582985ejc.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 11:18:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651083535; cv=pass;
        d=google.com; s=arc-20160816;
        b=a1VCjYh3keNA+UTUgQJuw39JPwFPIh2sS75rjz1pfZ6KliGZQDsHaXGwsLGb7TMmP6
         Pe1vM1TWq3apkoI479JkabKAkTopIE0dFi4WLoOV+rvDzW1vZnfmxJgteTPB2JNH5S0v
         WA6otbKElLo4ARnt+sKtXemkm+Ze4npBpeAoShmJRHHwCHBgJhJmetKot/trgVKw7lYL
         BxrlScaP0aO/VGgL4Up1ZLSGrjgMyRDYflaj0B1PdAEkctgDmGwm1UiFH2ZBJ/RouOYB
         vf0iFP7idJ58yn2f1S2aTawN1CVrY08HvS7HSgbRW//gmklttTo3l+Jpg19u25/bRFD1
         UYSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ajQJEI5/Dz+td5dR2s41G57KC42DGQSYX/Uwbb95hlU=;
        b=RbfOHm4TGrdmg2Nr3m7B+MK9a7l3wDyxZLZ/xWOXWMZFZlX46etpEYsSGkVOUL3IiV
         Y0Z58RflqhnDBi9jOKPip7YM6vAK1XA/2Alug9hSlMzAoE9peVXQuVwhi79k6qwCYHLS
         DaF/+AEEr79uuQtV1daMliSb++4T6xtPvNo4p3XALlQBsKwCulDmQfBzW/cQ4cYt6EAj
         mq9YuAQ10i5kdLEb8JzrTKB63osMWXpsojGPyqYX1/yV2LEuOqtPCHOBaM+uYdzR00bJ
         7KlT4qUOgUUPBsQVHykAOv9eSGxQ85oPddrgQ+j/6lSmfIIsDGqu5YWPBoNHzQJSc18V
         rADQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Vhflt0H8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ajQJEI5/Dz+td5dR2s41G57KC42DGQSYX/Uwbb95hlU=;
        b=c5Ar0nmL2EFQsEkaJnNrOQPW1lqHWsZ675XsRDzv2N38mW+gsUhiSa1H3EdUwqOOJP
         LxuvnhraYu0GOwzoRs9wMW+1z/0iaRUqDQkny1lAtA9uVaCxz3/chwlKwgFTu1PgH/Wr
         bJaHlF5pcquKbqX6gO4NtPtZq61Nj7BZur13UZVMyQD7mp5J2znuNB4XkymO04JBLLij
         xFtFwxMfrrZ+GxstuXp4h5/fLNGzjji/NOQOKovqYmXueyHuADWKIaFIpn0W6YtZmel3
         7Vk0pJqu7Qasc0JuCm7Iwbvvi0NvvvhUuoSvDxNwpQv6daU227hJJQ/QmBetF6a38GKH
         AN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ajQJEI5/Dz+td5dR2s41G57KC42DGQSYX/Uwbb95hlU=;
        b=E6QrWUsuqMOGn445+KQ7tTrhdgULF2N6ZtGsFoknIR1916pcL/yiOd7c35KVI934tH
         yA4ZeCRDaDJ55LQBqx8nTTCo8QuDVFsfTgGUP2SoGzPpy9FIPTH/pn2eLtlCvP4bxpgu
         Oi1iRFY+8G4iuqV1vs6Kf3gSCdx+Z6SBubJZsSuLbcAf0Bd6TW7LOM7PINUzVC+BEQB9
         9AuLorRX1tKFYl6hfv4R3rg+LtQz2be8VkDc8oE6XQh2rPWajIW4B9u/DXB800hwQma9
         CRvYzQlBbyhDJ/+hpKb3yQQGO3enwNq2Hw66IvrPamsCVSpRHXRGaHflcq17SE51jMdP
         nBRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530u0FybVrrTgHxX1Ui86ONN/qmM2GCE/Jr4SsRfc0iqiwcuUb1X
	Ds61iuWGzUXNkAOig9Gxn/Y=
X-Google-Smtp-Source: ABdhPJwbRrYdVFu/hyH1nT1D04U8InUqf36Qa/+c2wyf3HMkdsizukkbbg+NgiK9Gf0QzvywAXVZ7Q==
X-Received: by 2002:a17:907:3f9c:b0:6f0:28d1:3ad6 with SMTP id hr28-20020a1709073f9c00b006f028d13ad6mr27927552ejc.365.1651083535519;
        Wed, 27 Apr 2022 11:18:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:628e:b0:6e8:76c2:5876 with SMTP id
 nd14-20020a170907628e00b006e876c25876ls7339861ejc.7.gmail; Wed, 27 Apr 2022
 11:18:53 -0700 (PDT)
X-Received: by 2002:a17:907:3d01:b0:6e0:c63b:1992 with SMTP id gm1-20020a1709073d0100b006e0c63b1992mr28413489ejc.422.1651083533795;
        Wed, 27 Apr 2022 11:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651083533; cv=none;
        d=google.com; s=arc-20160816;
        b=jn+Sy6uTrNs0OnE6XpRHLHQk2pGhP88hiZdEZ+GIMOdjvrmMXpNxcq3wtVJehVWaYD
         Ze1hHcv8vnTgH2ZHStwIW8KE0nSIKC4jfj1/tNK4+nEjN0LtYkeFVsZ2yWXhsfJw4zmC
         SJ1mBLy8rFXVZw0NbM4mO3yj1+e4m76kjw4THUTPqxRwX9I3SiZcp3c2tAqEcv0PQf0E
         1HTN9twH7xDebux7HzA5S+GjgPvTppULdqnT+dsATQLHl5F5lbESXaLam3rZ4UqBwY9a
         +uRjDRWBfTRll56sJ2gwo0ucJu/RIsZA2MiiqXPU45woxP6F0EKKFTPd+ZrMse2X8597
         DEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5bjqrAQb8ZX5uasL962OPL2Nq+xEsmdLH0azCHAjtdg=;
        b=Z2re5jiznS2WnfHoi2IhqH+tTRqZ5CcJ2JNtqEZ6p4+4j7dhApVISY6vk1euo8qSAF
         rS0sTtcyApU4blY2cWDkk1pIq/wimUCDeZOXKInJJoizy2vjFMBEeHpiAGsfZB+9MEpy
         ByejdIBtgiacETknSA8CzxV0fhrv2v1h/8bgqTIiyk/cT39UWhcsupfChmpQ7dpnXmDu
         qmWmwKELtNeUFMzOdpJAKg1aPBH/11TCu3JLWoNQlwFyfUguvkGXr8YNsQ4jV+lWuiXy
         aX78RqEK0dF/8Awhxh0keW+eljei9niChpImedAjG87merWm6vSUdFpHOA5QxHnWh/zN
         fV1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Vhflt0H8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id i13-20020a170906264d00b006f3bbd65a19si143541ejc.2.2022.04.27.11.18.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Apr 2022 11:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4KpRpP27KBzxrs;
	Wed, 27 Apr 2022 20:18:53 +0200 (CEST)
Received: from atlantis.binary.kitchen (194.95.106.138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 20:18:52 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
Subject: [PATCH v2] driver: sysfs: Add compatibility for default_groups
Date: Wed, 27 Apr 2022 20:18:42 +0200
Message-ID: <20220427181842.2116064-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <179b997b-4830-fb3b-792d-79c25fb39788@siemens.com>
References: <179b997b-4830-fb3b-792d-79c25fb39788@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Vhflt0H8;
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

Add a compatibility layer to support older, as well as latest kernel
versions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Note: only compile-time tested!

 driver/sysfs.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index a604afa4..a5a02831 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -59,6 +59,14 @@ static const struct sysfs_ops cell_sysfs_ops = {
 };
 #define kobj_sysfs_ops cell_sysfs_ops
 #endif /* < 3.14 */
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,2,0)
+#define COMPAT_ATTRIBUTE_GROUPS(x)	/* not used */
+#define DEFAULT_GROUPS(x)		.default_attrs = x##_attrs
+#else
+#define COMPAT_ATTRIBUTE_GROUPS(x)	ATTRIBUTE_GROUPS(x)
+#define DEFAULT_GROUPS(x)		.default_groups = x##_groups
+#endif /* < 5.2 */
 /* End of compatibility section - remove as version become obsolete */
 
 static struct kobject *cells_dir;
@@ -180,10 +188,11 @@ static struct attribute *cell_stats_attrs[] = {
 #endif
 	NULL
 };
+COMPAT_ATTRIBUTE_GROUPS(cell_stats);
 
 static struct kobj_type cell_stats_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cell_stats_attrs,
+	DEFAULT_GROUPS(cell_stats),
 };
 
 static struct attribute *cpu_stats_attrs[] = {
@@ -212,10 +221,11 @@ static struct attribute *cpu_stats_attrs[] = {
 #endif
 	NULL
 };
+COMPAT_ATTRIBUTE_GROUPS(cpu_stats);
 
 static struct kobj_type cell_cpu_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cpu_stats_attrs,
+	DEFAULT_GROUPS(cpu_stats),
 };
 
 static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
@@ -342,11 +352,12 @@ static struct attribute *cell_attrs[] = {
 	&cell_cpus_failed_list_attr.attr,
 	NULL,
 };
+COMPAT_ATTRIBUTE_GROUPS(cell);
 
 static struct kobj_type cell_type = {
 	.release = jailhouse_cell_kobj_release,
 	.sysfs_ops = &kobj_sysfs_ops,
-	.default_attrs = cell_attrs,
+	DEFAULT_GROUPS(cell),
 };
 
 static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)
-- 
2.36.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220427181842.2116064-1-ralf.ramsauer%40oth-regensburg.de.
