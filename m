Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7A55B9BF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id y8-20020ac24208000000b0047f9fc8f632sf4695400lfh.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335620; cv=pass;
        d=google.com; s=arc-20160816;
        b=mApYdyAhwV506ghZG2UOFswaBL/OCXmgheUCmJ4Ql2d0Z6rNTFtrKNk0Usy09Ks+3a
         CRCO8gUOBe6ee72VlJnlxN4MPjFyaJXmwOgNxt8JrDEPTnpdiLMYR+nMEh9QUbMRkgEz
         qNj5j+Y0SkOTjVCgnMhP41BVDFN0PBv9rB2jVK4pADkRg74yRdS4Al3QWkZGJ9XVBKqN
         bqvaSOdrh945xh3woNTRV802LC/htifHmYLrzEg6beeVLG4zP1J9wxPnnbxmCX7OYFXn
         j1UmA7+2EjE/NcN0UfG8DyMQzj8WsHeQTHSep9h2RG6Ak2q12VWBBb2E4lepqoANW8Wh
         /ITQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PmJcAxmNzZPMXCvrOrqe9kCzXpmaXnaf99TJy97VTFI=;
        b=ZcY0xu7ZwZuIB2b6huZWcCxEA/OXogwmjNg9GeRru7jI1pBPB1Sd/SICfg+b8Evxzl
         rrE68A9NePFCYPQRWCqPUe9KlXR44TQxtbQWBBBLyae3teuG+ETaVu4aOt/pQ2emLshz
         Phq/+mTJeRHRg19CihQZ3TM6VU6qOht2LpDz4zh97jiqAz73kAGzmH3psEgow89F41B1
         3hJnvnU+QLcWesn+4mdKrUl2vIi13xpvrUzoH569L8mzZRDOXLRABvbmyqgVRxdC257L
         h9Vb/YFH9FG3a4rWovhi4crW6vTkHItpggSsovAUWjyxZvb4KZ/j45j/0lhHxG3VjJ7c
         GkWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XNmibwgW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PmJcAxmNzZPMXCvrOrqe9kCzXpmaXnaf99TJy97VTFI=;
        b=iZiFE1/AIoy8tzFgrvqKs1zNIgoqbMNSPLGdd+W0tZFiHz9fePstSFiBfBmiud1Vc/
         /FDHyKkRUGHmb/G3XsO5H+JQFrohlSCABjuJYZKy5Aj7YWgm1+rMUusa3shb9ix8qTbX
         f3Z/zDNfw4NRnDzxqVqdJfOeH3T9FmP692hhZOm0li0+Ko5WTLS+CBkZwAecrRNnbdke
         7sG2ovAp9Vc4QBjTYazURUcIoQf5UGZjXtLbHodViSv4FGmzrQqVZI5IXHvF1VqcGQ8B
         +4h4xgOTa/X/qMNusvNvg/QtIDS652Y95306wSZKz0eQInd859qMSM1Gq3n5ScRHdNXE
         Itig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PmJcAxmNzZPMXCvrOrqe9kCzXpmaXnaf99TJy97VTFI=;
        b=v8dz57tb/rt0BtweeFP102UwjHsJSh2ci3G7iU0zayPNGBHXR6Y806CTDWNL0yszra
         xSgwE5fK+PngcSTzM1mVkVwYoPnqwT/dOBCv/FI6tgh2pDmdFBWpCaemJZr4rGgdaIgD
         aQpoIGH2GR1U88tQdDVir1U8zduqUIvUO/cBERfICgxNWbVQta4zauuXnpStmkdtUSg5
         CN3XymEQ1DiK2Handttre0QEA4xCYZKyqZ7bvRBXXK2/HkYqi7cR0BCKdF7jPxL8Bxy8
         Gt+iVUv4BVKUgQMQ6DtqXikD44yK9uUpgXzwpQzyxz8WM9wxVMKvCICn9Y5HlvWhBzdb
         LP+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+DN9ZpAH1IxB8/WNiJVo2TEtBB9KwLbLB4mD3NXNozHxhDG8gO
	UKiGFXzkC8tQLOr0v4PKeIY=
X-Google-Smtp-Source: AGRyM1tFY3mIncc2bFLyh2yEmgwwSMAebPoJXOIClBiczzD5t9vx+YOR2jKjqls7F2jbTmWIfySpOQ==
X-Received: by 2002:a2e:b1c8:0:b0:25b:b93e:b07 with SMTP id e8-20020a2eb1c8000000b0025bb93e0b07mr4212257lja.277.1656335620227;
        Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:99c6:0:b0:25a:89ff:c693 with SMTP id l6-20020a2e99c6000000b0025a89ffc693ls2203633ljj.9.gmail;
 Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-Received: by 2002:a2e:a911:0:b0:25a:53dc:82b2 with SMTP id j17-20020a2ea911000000b0025a53dc82b2mr6582650ljq.341.1656335618498;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335618; cv=none;
        d=google.com; s=arc-20160816;
        b=CSK6MDJCEnbWE2dAt1whQ4L4DdQde2Izg7NBFvSZbcLWJQ8o7T+UuMBsPIu41dR80H
         vs4i5GwiZ8ZfHEeh4BjxkUX61YjvcKyJdr3g/8ONdmu9IanQdLnAdT3SweOqtdKapWuV
         mt6qXxchQTi8UATsqnol1KJsGdKPhvYcB545vLtLgnor4mOk4GBqTQQ5LZ2K0paK0m4R
         biFXy5GWwxEfUxzVXmodbqXZL0v0lGO+89r6C3W3ybMGbaf/MrqZrD0lZcOBmq5p8rOE
         1D09FHG0SLfync3PoOj/gJjNerkmKc3otwX582FOUHVcGbXnC0NusDEYGU0B9Ij6in3s
         +DXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lo4xuiONycwEK35gR8pIIk6qEPh2dc+q7UPMYqJPg9k=;
        b=1DQIdO/jCH0yFTYHHiUZxLW5oRicFGNZJazOEj/MrmgIVYhmMa6IMzLy25Tj4zTMQm
         oqb27hYDMC5SueDJb9pbKYgtmmw7c64HPR2GnNb2nVjmz5wwV0J2jiOwUFEtLhLYdVCP
         bnsDUaMERmZTd7bgoHNW1R4LvdGbTnRRJID2sk4IiYOx4FCBLxUhYbwZmbJIS+hfIav+
         azuK//vKLRu0CIzwSIbF3jaA//jPxsSk/+ZrbjGgArSmyAgWdpNgG08W06oFobjU6XbP
         rGGfbWLOJoOVbGyw/SLCYaKEDNM93JWqeRQ5/U8/wHO+2i5+e6OCq3oCnY+gWMRNirxx
         VDLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XNmibwgW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z14-20020a05651c11ce00b0025a7388680bsi276740ljo.6.2022.06.27.06.13.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp815Mzmzy0c;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 11/20] core: Move cell_init() of root cell from init_early to init_late
Date: Mon, 27 Jun 2022 15:13:20 +0200
Message-ID: <20220627131329.3659-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=XNmibwgW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This is possible because no one needs the initialization results of
cell_init() early. These results are more precisely the cpu_set bitmap
and the mmio subsystem setup for the root cell. At the a same time,
cell_init() will later on benefit from having all CPUs initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 91f1ae1a..7f7cf041 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -59,10 +59,6 @@ static void init_early(unsigned int cpu_id)
 
 	root_cell.config = &system_config->root_cell;
 
-	error = cell_init(&root_cell);
-	if (error)
-		return;
-
 	error = arch_init_early();
 	if (error)
 		return;
@@ -168,6 +164,10 @@ static void init_late(void)
 	const struct jailhouse_memory *mem;
 	struct unit *unit;
 
+	error = cell_init(&root_cell);
+	if (error)
+		return;
+
 	for_each_cpu(cpu, &root_cell.cpu_set)
 		expected_cpus++;
 	if (hypervisor_header.online_cpus != expected_cpus) {
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-12-ralf.ramsauer%40oth-regensburg.de.
