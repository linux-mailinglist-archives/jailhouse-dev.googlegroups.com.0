Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUNS53XAKGQEJ4DH3RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD30108A75
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 10:05:22 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id 2sf6285469wmd.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 01:05:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574672721; cv=pass;
        d=google.com; s=arc-20160816;
        b=uTNQK3vXJo1hjyadnfJy9Do1T8JxFRHMMiCBIcaf2EN4qJkaQgRCXUTAWodNpZrNXH
         9pGbvkaFVmRCKVRTMZs6oBvNOinGVNGOSGcZZ+HJYCKP1kZauV5Nf6tCDkWgYtUTbRDc
         ESzrzPjCRYibnitfQVjVKH4hG4/HTTcKc/AjQkcdXM9+21f/j8pmYtZv98tkYwBo2rs0
         iH3Z1tUP6neITc2uiPuuC6f5gq8fSAXFKe5m7/nQ9tcvc0CeqxcP1nC0jS5XGogw8ATe
         a5k3oWX9/KWelRCbVjXu20Dtkw4gs6lJLzCpearPZnQhBewKC3YiT2G3iVpeicP4qYLI
         d4KA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=grfnHvHwVbyVVLEvR65+sWCifdRAyoLIWkurReHQvRc=;
        b=IND59FyE5GsAbzaCpDjn1Q3QT+F2lMIUCA6XqkWBFQGbmTsQYz8qUYD/fuJoRInDJw
         DykFCzHWSRhDS6fTekd1ZQZ2R9p+gkEe9QoZpwjO1/fGuBziv8di9xXai64SgaFNRMKb
         iuazTqoyhr7Vmj/QNWAL23iBfsid+9hjj2tHUnH1WigJMSzJBqK7Sa7IkcSOl+14jW5S
         muWrh+H1waq9dFuwxFW1obsVbU8BLT3fDvn/gs4MZTGz5mRMhd6Hu3H+AXnNK75hR53Q
         K2iVL1Z3aEUOsxiB40WjTUSYS+T/wvpPY0qfGAG+Mzf+NushNWYcltwwUleWxj0SAc0g
         5aPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=grfnHvHwVbyVVLEvR65+sWCifdRAyoLIWkurReHQvRc=;
        b=Ut6TSJiryQ2xEoD8XmKqyJXOI5mWeWTz/oe1Jxhf/jb8WGPvC5yEBTNHAj2kLQfB6L
         6eT/BP1/IcC5yDpkHJRUizTQ1JifMCMSgxfCVlXCzTPFMstOAsRIeJoGRwi5rENO/k/9
         wwZDbiwnKHtOofnGrjckYfwDLypVTI4cFbp9SG+qkghtnh+o33JuU95CiRlEO6mHeNys
         mUt8inhHl1w5sbMOgIvnGH+UjCcwaCKXvMNp8zVnR9IJitmpTb0Ppu3QFOYnwUnJ+Z4k
         OUMiKlfg+jGAUlCA5nd2QcxsFsuEa0upKNj/Nr2U4n540v8QLkmwoxT1cNQ8dFYOZIPP
         NfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=grfnHvHwVbyVVLEvR65+sWCifdRAyoLIWkurReHQvRc=;
        b=R1RYEdGwN5jWnX7J220XGsAkWvZ2EbMvNbQ55hgZCegEWWSIgKLJqtaTVgQbLXMGhy
         JIKC/zU7QoiSJPPl1IuhVqdxB9MRWwwPOV9/w1+fwxwNRCJRCjRZUif/GelGWbTeTnKE
         fhyAdThozP9ok23daRtA82WL5CWISGWRltGUtmgjBR8OZOwDrLJgaeWZZgOdDwGluYT1
         ArxgiZ//maQJ/xNg3t/XGF1ODa6VBDdLCs7lOnHNo2uLvEnArq8EK2mc2NyC+uk/t4TY
         t9ph1N/H+fGPjtqVAWLR0wXwiyas59y91rXZEtLYQxICTfqYDjyH0/n8/XDTi+OZcNKG
         FRHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWuNsHK396pyQeDvl9releMLJlMIMaucNZ0MYaRnkBYDE+SXu9V
	iGgVBqQndw9bnzMR/kEyI2E=
X-Google-Smtp-Source: APXvYqyL12dM9poSC5qDPj32EqxTVX1Y/0kxJvhcIAYcEVx6iuAO31ghYowGTd/+rMAky4DzrjEZFw==
X-Received: by 2002:a05:600c:2919:: with SMTP id i25mr27041132wmd.158.1574672721709;
        Mon, 25 Nov 2019 01:05:21 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ca52:: with SMTP id m18ls8314555wml.4.gmail; Mon, 25 Nov
 2019 01:05:20 -0800 (PST)
X-Received: by 2002:a1c:b607:: with SMTP id g7mr28568746wmf.94.1574672720760;
        Mon, 25 Nov 2019 01:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574672720; cv=none;
        d=google.com; s=arc-20160816;
        b=mLwj9ttiXuPI4itiTbr5nH2TsUOncqEfENgS7drbwkHxGYNIyFPhLk+036ubX/eSRK
         Uj0t5LlWwi2+lu4We5S9U3e0N8S4N9rJTsJ7QtN/gm1JGJxRU3+dOHd9F8ZP2WX5ktSh
         uJAQVF4lEPsVKJPozS20rWbnV7tGL+36xN7/Bs/pA5IpT4za/39/V9xLkoW5elvQ7zs4
         CmIk2zEWeh8fbcVwySXXg8danwWM8qHUwoOvsHIwQipbtQNcHtYYlG84axm8aq1ASM+5
         yt15Od5bsqL8R3ixxAap2foBoEJKQr/pCPtIPG71x6kslc9A1ybjwOFXSHa3DGbecaAA
         baAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=MsuNtA+KN8o0aeKAZr3Fnqafsls+N2ob7+PEQiWERvs=;
        b=KpZcUmTs/WMZabW3smr7wMtl5H5IhOKeE40AsvvSnEspHyKg9HaRmP1DsojXH6Zh6E
         uCwvof/9wjeRN4VsCHuwibBeUnZNHQS7os3efxcMBq743UgkfQQkwYzKtnOfEXebBvpp
         2RJhgebt1hDUX+MOXSAMSF4x1yw8zvybBzgb8FqnSlXFvllkS0Y/KLbacB3b926ZcroL
         1Tk1fWmsH/ItoJYqG4LFSlgujtzIZhy90NX8pRq9POp+nY04T7/NTeGfmvjRGCIBbZFk
         D2bm85yW3iUmL7LZLlZzBbGLMH/RQqcufi1QQ2TsK6+VlJ1DHmauZRg5OCB9XynuDMxN
         R+jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u23si220631wml.2.2019.11.25.01.05.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 01:05:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xAP95Kor014907
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:20 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.22.116.118])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAP95Ia3030833
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:20 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/3] Update Isar revision
Date: Mon, 25 Nov 2019 10:05:16 +0100
Message-Id: <320de823e450f84299cdb2efd9a7236a093c6667.1574672717.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1574672717.git.jan.kiszka@siemens.com>
References: <cover.1574672717.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1574672717.git.jan.kiszka@siemens.com>
References: <cover.1574672717.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This brings bitbake 1.44 which changed its multiconfig syntax.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml  | 2 +-
 build-images.sh | 6 +++---
 kas.yml         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9f3b9b6..9c94802 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,7 +11,7 @@ all:
     - export ftp_proxy=$FTP_PROXY
     - export no_proxy=$NO_PROXY
     - while read MACHINE DESCRIPTION; do
-          KAS_TARGET="${KAS_TARGET} multiconfig:${MACHINE}-jailhouse-demo:demo-image";
+          KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image";
       done < images.list
     - export KAS_TARGET
     - cd ..
diff --git a/build-images.sh b/build-images.sh
index bba525b..21bd36a 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -38,7 +38,7 @@ while [ $# -gt 0 ]; do
 	--all)
 		KAS_TARGET=
 		while read MACHINE DESCRIPTION; do
-			KAS_TARGET="${KAS_TARGET} multiconfig:${MACHINE}-jailhouse-demo:demo-image"
+			KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
 		done < ${JAILHOUSE_IMAGES}/images.list
 		shift 1
 		;;
@@ -75,7 +75,7 @@ if [ -z "${KAS_TARGET}" ]; then
 		if [ ${IDX} -eq 0 ] 2>/dev/null; then
 			KAS_TARGET=
 			for MACHINE in ${MACHINES}; do
-				KAS_TARGET="${KAS_TARGET} multiconfig:${MACHINE}-jailhouse-demo:demo-image"
+				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
 			done
 			break
 		fi
@@ -83,7 +83,7 @@ if [ -z "${KAS_TARGET}" ]; then
 		N=1
 		for MACHINE in ${MACHINES}; do
 			if [ ${N} -eq ${IDX} ] 2>/dev/null; then
-				KAS_TARGET="${KAS_TARGET} multiconfig:${MACHINE}-jailhouse-demo:demo-image"
+				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
 				break
 			fi
 			N=$((N + 1))
diff --git a/kas.yml b/kas.yml
index f322b88..72d5348 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: ff1cbbee954184066baad814ec88dd736aec447b
+    refspec: 29d3f050659e10292a2fc3fe500381b860a65335
     layers:
       meta:
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/320de823e450f84299cdb2efd9a7236a093c6667.1574672717.git.jan.kiszka%40siemens.com.
