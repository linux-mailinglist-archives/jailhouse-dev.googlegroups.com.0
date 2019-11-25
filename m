Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUFS53XAKGQEPMEXT6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF3108A74
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 10:05:21 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id m68sf6258693wme.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 01:05:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574672721; cv=pass;
        d=google.com; s=arc-20160816;
        b=i/jbSfMoZOX0D/3zeMrYEok0lfH8fN1b5tIfcGmBrRGGz9vx4TtSzA9u5xZKgmXgy7
         C0Vim9DdUsyEG2rhvfbiUtIj1uaxmtuGvgJgwmK7yKPR+SqEIqK3s+DjtXL80X4oYp6Q
         ZFrix4v7rxF8NRs4yYYa5kTDXXyfKFvW7kz8N2RtNtDTWlwOaA7KPF8UtgY+S7Zyqk9A
         lavVSYic6W8SNeQP7s/AoQcpqbpdmNReQhqrIdwh6qvvg1gtLKpFRRsOqjWpRECHMlvf
         iLNgbGocZfYIffsWQrApkNxlevbrCIzZ0n+c0QXBm+KIH5fvrfs/gFgqxKkEOeoPO5IW
         F7lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=V2eFbuiJwluZ+TWEQKeG4q/Z9pwGQ0okH647Y+oGACY=;
        b=R2i00Ym85W7CU4DVpmrpyDFj4wxD8c3Mix+IbKLBxhnjV7cqV7cdwLsasBGrR6HWGR
         8541aZwvxtSIFhFtpmWzKPT0o4Z5mjYamQMKPVvLuU/5Hjt6IW3bS+uwJUIYU+8hL8Mz
         I3ih2LAh5Y0hc/a+Ub1y6J37ssGRCalMizPEpjeICGwjE7SyuPmrac3Co2VMXSoTdzXd
         JYSW/JuMWuWg+MmrFpWZD1tBPyavPCDkBHQBWiwX4HNW2m2qbsmNF1lIkFIgPFRvSR1+
         D/AhEB1g5UBZIX9x8sh1y8Y8CfPPrUpVriTfxrJLzk+n04VROBm910sPUWzzv7UQSBKU
         VXaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V2eFbuiJwluZ+TWEQKeG4q/Z9pwGQ0okH647Y+oGACY=;
        b=n4g9sWHu0ZgEsZ1E8Bzans8emBs5Iv+6fVLrLjws2tg+xdE2oYB8dbtHEBKDhd3GeJ
         LY+dYIiy5B9Yu1qvEOfU3Fg3IDpyGC4RFUeSBqnKyWhozdoQs3qmQS/GPVecYJSnqri3
         wsj8L2TSiiKq5fi9W7EF/sqQ2W1stmklWyfjtUY8dqAnd8hGZmrH2vSueDybTqqWjP8f
         E3wqRUs3qj1mFSWGAjcK/ppKtWmBCXmEzLAAfmorzpRpTShuBC6AQQtzCiGkmk1tjIzc
         zKsvfIyinlNOPfBI7AtbB9XcvMAxJceECmCq5HeFymnShNs/onzqTd0ENR7lHlONkj9B
         ctNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=V2eFbuiJwluZ+TWEQKeG4q/Z9pwGQ0okH647Y+oGACY=;
        b=Z8S+66WX0zpF5/Q7AWeTM48zyvQ0gtnzDfbTnbv2rjXqPYsRkcKngzEeROZZ7ZJUbk
         9RRdgnX9mg3X6i2Z0P3EBdZ1UMVmCZgqPGVthZoLwOktLHiL6LoLZev8lC/paF/TKmOB
         N1ZE13eBUx8lnnaVq0ITF09o+PKcdfWejkWlDvMVMnvmr1v1zPJO+aFbu4iFD6gSFG5X
         ciZ9jjEP10EuZgxpXvgtbxMeVhY1YgfjBePReg+05RMvCBZe65DrKEMG6nCCPVcc/Wzl
         4hbLidODv+ql/hIJTO3QSeN/e2fBpwwO54OpcdNN7/3ee+lqdQUkSWly7lznuKyI1sxR
         IEXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWs6gmvfrB3wP0UcMpq7o8gr3Ui8fK5PgIseJ8gWKHPeiGHcumP
	TCoEIf/84TkMs/gBySp2iDk=
X-Google-Smtp-Source: APXvYqz7ir+DjtlUxyIj+ROCtTt9FBsvvI1zJKxAHMiortbDbDKMQcGw1m+7Lz7zuPJ3/r17UWk7zw==
X-Received: by 2002:adf:f606:: with SMTP id t6mr14182356wrp.85.1574672721029;
        Mon, 25 Nov 2019 01:05:21 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e341:: with SMTP id n1ls7242096wrj.8.gmail; Mon, 25 Nov
 2019 01:05:20 -0800 (PST)
X-Received: by 2002:a5d:4645:: with SMTP id j5mr31936854wrs.329.1574672720124;
        Mon, 25 Nov 2019 01:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574672720; cv=none;
        d=google.com; s=arc-20160816;
        b=ckzsMmmMDW2BZVsyKHu+AwdqF5Beo34POpIOlkUcA+r4Zzwws59QvLDaqK7sI2Kixs
         MViJBkkynrAfixgmnOE+NAry3oxrPJeH2TTccvjearWG9dEwRZELs0CHJxXQRfkrjm7E
         awncEqwtm+/DyUCUQm0xSoF1CW6P3HQmsIepR1TLi4SzO99ADErtrY6GV26XOlOkm23O
         1TEdrd4JOxTvgpyLO9Rn16aKO27BIQYExWxOb5hLahurV7orO59bYGxowXKcH9UJdFqE
         DZ9K8HAgKdMnrlzXwdpDc9Ljmpt9Z/Rdd53Q2OtA+CoUQh884GNxrs041YfELtTAZmr6
         1GvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=5WakgXPLaKbQ37NvOad9WV8nP9tL3EoifvVkwwnFIw8=;
        b=qj/6Dep2IRc30UYN8uTpUjNTehm+JwFM3yhiDjdfbm7GVMFK0bkJMoxwrJllr/Ncm6
         Lj90PcbiNsVqZyIbzJZHajiOFLPuFk3PTk8Na/f2pYJ3WgZf5pjMMqS3QSU/UuquViXi
         H6V/8yqs6LV6FNmGc8PKQKASw4/RsK+0IIhKjWsV8P+iwaiVluci1pCPE3bqA2BOA9wT
         VOIHBe+ANgj9YuxiFJggRx/FWUbPffpCrU+bgh9KmaQ4wr0tMWeFRjVZZpYPUsyGDt8K
         TzY88avYd64Cui8I0owQehdVlzZAtYhHgnGMHv4ha0c8qoxuc69tVIywNQ7mVz+Aks2z
         C8lw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u23si220628wml.2.2019.11.25.01.05.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 01:05:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xAP95Jnn014881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:19 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.22.116.118])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAP95Ia2030833
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:19 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/3] Require kas-docker / kas-isar image 2.0
Date: Mon, 25 Nov 2019 10:05:15 +0100
Message-Id: <0e9bbefd0aee851c223c61969ea9fc7f1d958c14.1574672717.git.jan.kiszka@siemens.com>
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

As we are switching to the new bitbake multiconfig syntax, this is
mandatory.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitlab-ci.yml  | 2 +-
 build-images.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e81f1a5..9f3b9b6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: kasproject/kas-isar:latest
+image: kasproject/kas-isar:2.0
 
 variables:
   GIT_STRATEGY: clone
diff --git a/build-images.sh b/build-images.sh
index 28c3a50..bba525b 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -100,7 +100,7 @@ if [ -z ${KAS_DOCKER} ]; then
 	KAS_DOCKER=./kas-docker
 	if [ ! -e ${KAS_DOCKER} ]; then
 		wget -q --show-progress -O ${KAS_DOCKER} \
-		     https://raw.githubusercontent.com/siemens/kas/master/kas-docker
+		     https://raw.githubusercontent.com/siemens/kas/2.0/kas-docker
 		chmod a+x ${KAS_DOCKER}
 	fi
 fi
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0e9bbefd0aee851c223c61969ea9fc7f1d958c14.1574672717.git.jan.kiszka%40siemens.com.
