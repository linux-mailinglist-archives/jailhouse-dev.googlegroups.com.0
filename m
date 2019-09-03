Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQMCXDVQKGQEAVVAANI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C0A60F0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:30 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id n7sf9884885edr.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490369; cv=pass;
        d=google.com; s=arc-20160816;
        b=oc9GUZCdUULDWRw1Ai+XF0z/oGbop9PpYAEEt7NcZwP7OUgLEQ2yXtlCbUDdOflazG
         TomEY2fcUvDEvcvjBC5RQ76ta859g4LwtmnKSpcjCZoBGOlXx4WJd/81r+4ZdL5+4g2t
         s4Ud/q2AMiJkclgVAnFjGpfqQUvRkkcfJMeOQxvPFevT68JeoaNBpHyjWayGDdd6KM9+
         Abocsoo+hetdmbgtYohemjSHX8G4A13CkB2pRcfmXjkkNJmFSKeyZfEFk4A1dv273K15
         KsSHhuvL5KfebQ/EhvbUUIE3014V9QweAU1N+lc/jfH9OPeCNvMmDo4nPLLAO9ztcB2e
         nh0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Cm4TiF+Zijk88TsN6ZJ7VXw2bChQF9DD0uSMPxrSyoE=;
        b=d4WEDnR9KIlSjuX71D0mLrQNt5Plj0JLP+sn4VLhovtrTUyZyto9ci/B/0INjLb5rb
         HOjqs6Q2ehF+VjTICvNY9yyBew8D/Hi8BtjBr0rA54wYq7/ZnTUEUXMIA1YpiDAYQiW/
         6LyCd7i9WEw7v2u3/uyyqh3qF48QtZ5N+th66z8rC0HjaszM1pYk22nNEvfxrZw1knJa
         rbg/1XdM73WMCB4fudretK7Rj0AKQR0Xq3qZ+TPLa5bLCjKJ94m0TX2Vhr3tD/Z0eao7
         EEhdYxVmANnxX9eHXarNRrsRI9wmVH20AAF6d0N6WfO1X8zIArCrH/REaKXbMddfU+Pv
         7VWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cm4TiF+Zijk88TsN6ZJ7VXw2bChQF9DD0uSMPxrSyoE=;
        b=JzZdONLK57TxrawOOV2D8gIkS6lEp3hm1TgJrhzp2Tv1EqnoeW2VLPJPVlKJV7u8+4
         C3RJs0aFDSoKv+2m1nvSz/2hqXn+ZO78nNGlfBqtZCUdgqaeceDwgcrz73hxxDibj9qA
         Uu1RlDQR3xD05gd6R4zBqlS2KWiUmxB6Tn5D6iG5nbSzmJQ6fIlAi7VyDA2iIzT59inW
         GxTVmqvle6EVpFymidcknhkCovMMM0M89w2nDcR64KQaUA1oW3QjXrjuAZIncpxhKEU7
         HQDh4Od3d0R0ze60JDbSNAjCtpRm1N1g2mc3V9WZLqP35OonnhblGweHokU9kcDoFpxe
         EbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Cm4TiF+Zijk88TsN6ZJ7VXw2bChQF9DD0uSMPxrSyoE=;
        b=WB0RjhwvDjv9Nr+mvv7IMuAza8hm5J5tr67iLiDxnCPfmIEWZu/5zGjerSC0gTmqzR
         O+QpZIWQgb9SHmmR4AMYj9Tfe3BJO9CBHvrr29HWgYRnIPvLOdpzKoyhNZbjT29GpgcJ
         PymMR/sbgSjRNsVH48tHSssEJsTf9MlFVOY94F9c9kM3JmkqZPfjLQw7GbJp4Sb5b9MS
         izM3UM38KyJ558EPnL1W/75nP7WVnJgSsRqz8vRbI+IXB6yq69OPb/EZCF4OhdW3XnLP
         RTNfjQ7Fb27tbbOk/wZxjfQwydidOXNdIaH5ytsXaiDFPqT+V9+wfN5cu40CQeZ8e2xY
         x1WA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGQNKWpO3zqhAISF9tLDDEsE7vxkicXlrxjVCZw2vp67ywjD79
	vbrCnxjJ1OIWppJhzt3A44c=
X-Google-Smtp-Source: APXvYqxFqaOnX9sjv1IfKrxsgDTKbtdoeOwixgI0xzYgctjtKzx7CquDpbsYP0437gm+7WII+lsn9Q==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr4869196edq.55.1567490369829;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d159:: with SMTP id br25ls2529717ejb.13.gmail; Mon,
 02 Sep 2019 22:59:29 -0700 (PDT)
X-Received: by 2002:a17:906:f0c9:: with SMTP id dk9mr7102049ejb.261.1567490369186;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490369; cv=none;
        d=google.com; s=arc-20160816;
        b=Offcq3S49Z/bE5mwk/2M5elSlHNUXcipjWhspQgUvEsIzgPkIJyUsoM/YA6NlhM0tn
         1nvMpTvuTH4WF7hSM/87Vp5cQQhcB4SzetWvwhK/4b3xKlyYilY7iprow9j/Q+YL9hsv
         LaB6NCh3CJa3IsvSMn6RMAsnt3mdObnSOau5HmcjSKNafOvJ65MDpiw5GRm86vbWc/x0
         vjCDHPVqnqfixzZ0HXNtg2hc+FFZ6sGCgoW7RUNN0PzbgF9gEA9lzUIYJcOdhHKSq+pI
         ByYsYs+e0j/11he2ZoMrcBMJn+eTZNEEQLXpWLSbRYp5320WrySSNpmT+zSgvy4e6LZp
         KjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=hm7aXqHUWeZtTV0TfguUmYyjKryXobMkbSxvt4cOvdE=;
        b=ku1/ppNp4SZXk+izxz7ZRmRFY9Tyow5vgBIlW0l55MAcekv88cHM5GVBcuKl9nBfzC
         c3dFNTuC1h+qeXUUP1u4oAhB3/kyAYtJw3vziwRS9PcOxJWqodHpqy9m1S+gDF+hrI3o
         0YunQHYx2Se9LWk8TGWL0pa9wbZkcWTxZAEycSdPefAxbuMJjyGummK8fBykoUSx3iTQ
         pqhUm6+y/dbyNepk6c7FWyPxhJiOZ9gl1Uy7O0LGJmuFJ3o1EZ7Ie3wCpTg/NiJwG91f
         CkND89YYm9PnRmX3kgAVY8uN1Ugjjh97NUUImYiN0CwGuo4KdgSi8kjkjjLQbghZYzAv
         WRZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o12si732997ejj.1.2019.09.02.22.59.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xS3S029670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkW010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 09/13] non-root-initramfs: Autogenerate changelog
Date: Tue,  3 Sep 2019 07:59:21 +0200
Message-Id: <39fad7fcfcada44861339d585d44b31c738af82a.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/files/debian/changelog          | 5 -----
 recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)
 delete mode 100644 recipes-core/non-root-initramfs/files/debian/changelog

diff --git a/recipes-core/non-root-initramfs/files/debian/changelog b/recipes-core/non-root-initramfs/files/debian/changelog
deleted file mode 100644
index 56f5b24..0000000
--- a/recipes-core/non-root-initramfs/files/debian/changelog
+++ /dev/null
@@ -1,5 +0,0 @@
-non-root-initramfs (@PV@) unstable; urgency=low
-
-  * Generated package.
-
- -- Jan Kiszka <jan.kiszka@siemens.com>  Sat, 17 Feb 2018 00:00:00 +0000
diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
index 5ae36e0..1e642ee 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
@@ -26,7 +26,7 @@ do_prepare_build() {
 	cd ${WORKDIR}
 
 	cp -r debian ${S}
-	sed -i 's/@PV@/${PV}/' ${S}/debian/changelog
+	deb_add_changelog
 
 	ln -sf ${DISTRO_ARCH}-config .config
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/39fad7fcfcada44861339d585d44b31c738af82a.1567490365.git.jan.kiszka%40siemens.com.
