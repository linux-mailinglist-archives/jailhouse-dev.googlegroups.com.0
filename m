Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWF63H3AKGQEBEMNKMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id E91351EBDD7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:56 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id q7sf887660wmj.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107416; cv=pass;
        d=google.com; s=arc-20160816;
        b=TdDQTk6zNmn8CrOAJcjpyv73o33Pg/9j1vKZDJS2bPIF3vcEl1uVEiM/wl0qKfmBRm
         iTECKmk2LK62hmmPieU2fMr3SCvdTK80n7J5rNCgu21CKtDsbGSsD2zHuy4sFijsFQSn
         yLhXo08JNgzIfubhwJT6wFPzez9ZNkvryFR3k5MlUIddZGUoCvVyr3hMZFXUhcLkR/7F
         g+aol0hAeYKkJecf5SmFgrviMPwqfz7Vk9DeMoHLHMEhYSHcJ+sTv9xghKBKRRl2RaE3
         MApuDaIoRUUE+EFUvi4P0EQSEos5ssm2PMrEgwVzM4U8jhFPu3d8YWQzsc9Ia13OpEhL
         dbdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=QEDfNVqKwR/uwhWX4lkeKintnvzeOHkhqxguSjB4lfc=;
        b=KeTHlGaZ3J1O3cKoPgLsW2E+xD08qrD1fKd+wwXGE8dk/SLREztN0ltSWHeDJ453kX
         fLU/uojduxn5P2aJAphxIAaVlYZDFCzOP95uvpNJeKV11067nFiRiDNyOqtadLcogrjC
         3Yglm2mKhcxmZDXtp32izUmtdNpG0boGZD3WMxiYnDBlp6XGjNpRYkPEua/WQZr79cTa
         YhmANetd5o0sxxx/7eUZ/8Z+YN2yRNKPrWM7RLrGS1TX/TMP14NReFdReBDBZ8/Go9jC
         +u0lTWXVSb32ua2pqnzRhm2VAOf/Gu6jDt9Klmd/Eu1qwM89XIv9I0K4FWlk/N7DlFpy
         Yz/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QEDfNVqKwR/uwhWX4lkeKintnvzeOHkhqxguSjB4lfc=;
        b=Su2zCXsIVQ5qVpRga+BBJ8vmlAYpZPeLwYtGVOOZBJZWQ7ciDQ6DPPSiW5ap2gKOu4
         gLcpqaZcdJ5V4hzCZZjTorLRWTWg5mOABZZ9HBqidn4wqBLQVM+abEjtZ7/BD2qBPAtx
         zv/RUAuQsgfdadjB2jpoH9HCq2oBvJqxSEe1sY8OPPfiOV7jYjEwFRPW01ZqNlQ3Gmst
         1IQEtWLDJEWu8n3zif9r3JU9nx+VgIP+xINzgWgIMQNq0XCb6SZM6Ze5K6OvHpL3zNJj
         OBwTV/4nu+h6bte5smQycH5HfA4ySwwsHPdh0GmYYlD9ubZLFlbsU/D0T7pOhn4NXQHK
         JrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QEDfNVqKwR/uwhWX4lkeKintnvzeOHkhqxguSjB4lfc=;
        b=U0cDIYJrOD+JegBzTsZvsUtBxi1UDZfRwvysHKQPfdPnYl+yQ3KwvTHGeghA7XJz6G
         06d/QHv23fVUz0Hsck4u4d9zLIpY7zgYA5BoyBELN7DWSZ4GmObHkAU/eaf9hg0UL7tH
         V2cWgudtTgaJp+FsEdzG3dpCN9M5+VggjWID2UF03N0/0HXM0Ovla7kXDeKfdep3y+/l
         gtAhuroOu9F+95yPnh7p6IkFSJZfGkQ5hfBMNpXkqNaEvTdwzRN1SrXdkmCqBzXsaWVT
         EWGU2NUqtrPrHb2lk8Pq6GcRb6C4p7iHsx1pYDJ7br9lBCc1+ZP+jrNutg/qBCYtSgVv
         znKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Ng93YPy15fMsM2SxS5aI2ZsqrqVd9xdD2Q38916LPMqavvnKM
	Rl2lLxgQOOQOEIL+O1kjZ48=
X-Google-Smtp-Source: ABdhPJzGwzAunCxW9OM6suyYP14hMarryI08l1w99xfJENgWJ0RhftxYwaBekpdQi8PyhTrAIQvtUw==
X-Received: by 2002:adf:97d3:: with SMTP id t19mr27166957wrb.116.1591107416740;
        Tue, 02 Jun 2020 07:16:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls5088280wrl.3.gmail; Tue, 02 Jun
 2020 07:16:56 -0700 (PDT)
X-Received: by 2002:adf:8b0c:: with SMTP id n12mr28959588wra.340.1591107415992;
        Tue, 02 Jun 2020 07:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107415; cv=none;
        d=google.com; s=arc-20160816;
        b=mxIrPOLa696O/q+bO7wMt3ujs4EpGmwnYA0tT7dFFB9eU7vgmBFna84r1q5b+TJuvy
         ajXczME6Ta/uNzz4bFQXX6sQCITgLmCmdephPy2sxV1EhE1xVY2hn9iwxxsYb+oScU1K
         4A3zYiy91wb4+sp71He1474POO8lly/AiMoBCWuN6NuvsdgEFJANyeAxf8oBb/9vBLYN
         U/umczdTvLdj6Z32T9YE6bUtE8GmXWXYH657DTyXjx53Qklggi5A3/xiHmTHRkFaXLgc
         x2YmClLqfvzvIT78EKb8uBni58w50wB8BeTv0vW25hnUghYmKS2/KAx1pIycBcUgtwBK
         N+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=UoyHPCjwQlYz6xGTraPYAgQt5w9qhfY3LQpUcauxEqs=;
        b=MUF7shljpYUSwtkz0YyhyvcS7sU89WA69d5rthOpN2ekUvCd4YLX6nhbRW7uJ/2b29
         fgv4etmMkFH07YB9UKd7nJtqpxDmrWYi/qK4oW+kV+owXzBXLBiG98cydeFIeB+q8Il1
         yoTUcMLUra0xDX3hJH2Cb0Lwe4tso4LTgytd1SKZA1JOlQemNFJ3RNU8hDd2ZxU+EVe1
         UxlL9RzzhnZCT4OTFL0e9xjles1GvCrhLp1Wztcp5FBJWGBrKr7uN3/gE+5FVN+HWHbT
         Mm+1MvHEyjd2DH7ie5KLPsDkDFlDfzGD7DlvisRtErjbvwrZjyLiT79Vl4bYtuvFORkU
         jH1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id g7si137933wma.1.2020.06.02.07.16.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGtWw028708
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:55 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdL028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/15] tools: Refactor and align help outputs
Date: Tue,  2 Jun 2020 16:16:35 +0200
Message-Id: <ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Make sure the short option name is printed first. Use a few more telling
metavar names. Finally, align the short help printed by the jailhouse
frontend tool with that of the tool helpers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-cell-linux | 16 +++++++++-------
 tools/jailhouse.c          | 14 ++++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 8c07fd0c..4178d4e0 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -687,24 +687,26 @@ parser = argparse.ArgumentParser(description='Boot Linux in a non-root cell.')
 parser.add_argument('config', metavar='CELLCONFIG',
                     type=argparse.FileType('rb'),
                     help='cell configuration file')
-parser.add_argument('kernel', metavar='KERNEL', type=argparse.FileType('rb'),
+parser.add_argument('kernel', metavar='KERNEL',
+		    type=argparse.FileType('rb'),
                     help='image of the kernel to be booted')
-parser.add_argument('--dtb', '-d', metavar='DTB', type=argparse.FileType('rb'),
+parser.add_argument('-d', '--dtb', metavar='DTB',
+		    type=argparse.FileType('rb'),
                     help='device tree for the kernel [arm/arm64 only]')
-parser.add_argument('--initrd', '-i', metavar='FILE',
+parser.add_argument('-i', '--initrd', metavar='INITRD',
                     type=argparse.FileType('rb'),
                     help='initrd/initramfs for the kernel')
-parser.add_argument('--cmdline', '-c', metavar='"STRING"',
+parser.add_argument('-c', '--cmdline', metavar='"CMDLINE"',
                     help='kernel command line')
-parser.add_argument('--write-params', '-w', metavar='FILE',
+parser.add_argument('-w', '--write-params', metavar='PARAMS_FILE',
                     type=argparse.FileType('wb'),
                     help='only parse cell configuration, write out '
                          'parameters into the specified file and print '
                          'required jailhouse cell commands to boot Linux '
                          'to the console')
-parser.add_argument('--arch', '-a', metavar='ARCH',
+parser.add_argument('-a', '--arch', metavar='ARCH',
                     help='target architecture')
-parser.add_argument('--kernel-decomp-factor', '-k', metavar='N',
+parser.add_argument('-k', '--kernel-decomp-factor', metavar='FACTOR',
                     type=int,
                     help='decompression factor of the kernel image, used to '
                          'reserve space between the kernel and the initramfs')
diff --git a/tools/jailhouse.c b/tools/jailhouse.c
index 049b5bb6..215d239b 100644
--- a/tools/jailhouse.c
+++ b/tools/jailhouse.c
@@ -44,13 +44,15 @@ struct jailhouse_cell_info {
 };
 
 static const struct extension extensions[] = {
-	{ "cell", "linux", "CELLCONFIG KERNEL [-i | --initrd FILE]\n"
-	  "              [-c | --cmdline \"STRING\"] "
-					"[-w | --write-params FILE]" },
+	{ "cell", "linux", "[-h] [-d DTB] [-i INITRD] [-c \"CMDLINE\"]"
+	  " [-w PARAMS_FILE]\n"
+	  "              [-a ARCH] [-k FACTOR]\n"
+	  "              CELLCONFIG KERNEL" },
 	{ "cell", "stats", "{ ID | [--name] NAME }" },
-	{ "config", "create", "[-h] [-g] [-r ROOT] "
-	  "[--mem-inmates MEM_INMATES]\n"
-	  "                 [--mem-hv MEM_HV] FILE" },
+	{ "config", "create", "[-h] [-g] [-r ROOT] [-t TEMPLATE_DIR]"
+	  " [-c CONSOLE]\n"
+	  "                 [--mem-inmates MEM_INMATES] [--mem-hv MEM_HV]\n"
+	  "                 FILE" },
 	{ "config", "collect", "FILE.TAR" },
 	{ "config", "check", "[-h] SYSCONFIG [CELLCONFIG [CELLCONFIG ...]]" },
 	{ "hardware", "check", "" },
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6.1591107398.git.jan.kiszka%40siemens.com.
