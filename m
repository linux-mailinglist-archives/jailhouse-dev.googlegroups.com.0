Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBO4WX73AKGQEYZ6OOVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962C1E63FA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:31:23 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id n6sf4905295wrv.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:31:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590676283; cv=pass;
        d=google.com; s=arc-20160816;
        b=x71twZXoHavDM1XkxweTHBa8K/IvAGLYEwNo2OyLQJKeO5NHDGdkvBpE3JtfmWz6uS
         Zg5Ez3HJLKCy7bSEdyKab28EuiGDMyg+EtRF/kuk8LdeNK2FJV5zaxKh2DAM2qo10Mga
         69alGD/IcdvqmDJd0Wb0wR2oftaWwur2Ghn5XBtcpch88A2Ut8lMlNFbwLVv9HVEcQWA
         EvL0ZFVP3z0B+04ej3zGfCKEhQtHEeb23yYUCkCAPDmxzoemEW5ciFV/MfSnDA/Nd7Xc
         lI4jRVL0mav8Gf5J5E5N6581tIsaEdtIMOxQH+uJxd4ayFnJiGCWzXL9Q/JsVC0SzfDX
         L9rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=Z5eh8Zq2jPxXYcQF/ZlmD/2/mu6hzwOzlwA4MZ5QbAg=;
        b=h71p1vrYF9W8JIRHdG65WNKtC0MWQSGp487sYIvwAjvuFOqVjOePIepYNCpBvsLNkn
         S0m2w7IDabGYlNEYC9sog5z6KJfAjE7/dZExt37y/puQhtUo3S+duzt9QohM2uqrvbHY
         JY2dJvwIdf0sR9MQX1CiluxE4MqdpTZcbQ9sOgL/mWdC5r9hqGOe+0UnDKSDQ7LvsEFc
         Ad+urxx7yERHGkhhUsODtdDdzZTlw/1Cq+AFIn6QQHBuWKwZHZv6wRRlZl2mjFlpuCjS
         zvnmnUUZIpX5LHsmiNYBA8gI2FivI+rP+r7Rp2CeSSqYJHS0GPfczWSY6Jst9TyY79H1
         Mo8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGVgsvfC;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5eh8Zq2jPxXYcQF/ZlmD/2/mu6hzwOzlwA4MZ5QbAg=;
        b=APy40Iyo+K1tiw60EWBR7yZeEKgUo0nJiBjnTkTS3cFvEvaslNKORna6acnDySCPO3
         WKxwRvIdx1Ls5nTCHlkTFBCgyUw011LdxjDvm39ZcnZv3xM1Lf5O9rBdo/wM7acwh2nB
         OTebq2+0wl97dghFq2eoCocq/yGzsYgNz2kXLw0aIJe0XfC51gyd2FmjYy182sLsAiKG
         sT+hqbd0MqwkrfLAHmvEIV8yOxk7v+0zkMoNcW5/gsqdUniGkN2lJqR9lufCV5L+J2K5
         Ub4nAOGIJdgGuPNXvlytngw7Pkhm8vigo01vFAZjifyMyyhVtGIZ7Bf0DKynLe7GMpCp
         UGNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5eh8Zq2jPxXYcQF/ZlmD/2/mu6hzwOzlwA4MZ5QbAg=;
        b=WROZBXsi5nbkMNBX8xdULTK9bzAdhMJNl8eLsPJGhjtd8Pq2HstUt67BXL+raBJLqM
         MGo5LPzuUfHr7gjMfW8CLHURNi310UbJV/Ib8GvagfXMDWJe4fKr0Q7uFU9SaHkhAQuJ
         mk7Ody70wIEgvntL2f+F1yaw0yU4thGlzW1GXyDB5BrY74jyvEeADQo7tg55kMupQE/+
         uwutkFtBptG8aVTX/jsTIUGpHCVx2lxRWHmnqqQGDxg+RNlWL2whGOeFxzStrndSGcUL
         EbdQdzqJ3qjjhUXFYR+w1MB4LuabXj6pZ87H8ch6MtncHrJkMdjNrdmSU5cgRwduQdZb
         LW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5eh8Zq2jPxXYcQF/ZlmD/2/mu6hzwOzlwA4MZ5QbAg=;
        b=EOWnVn7AI03XOEPZJNniljZym3BjWqmZtl6NP0zyR6xdN3xp5/R0f3JAEAsuLXmQNd
         MEPGsRYWmwQH6dLwa4TVn03K5LiK13wll2L2t+4kSxXSGEJK2DDcoDLnEWRxCyL20JRO
         u8wFJdNx45125z4HrFZLWR2pDs1PmFKLoP4g9Tj+CIYYmJa8K/lFVlUeg/m2xuj3roMf
         bENw04w6trpQ1hmyo2n/6MXk3qLE4UQHMZPER9M1x16XHx0+nAMFhxRwzhyarifBo83d
         ryKvTZ28Xl4L0vYkekOQK1fnnyLV5PK6A+JuSxm+GwrgBEhhlmssl8k+AfzPPmch0Che
         SQgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JoywvNGYFNJyMSY+Vzkff18v7vQHBiCa747Kyes3fi6teJV2q
	GLBfkZwlJ+eW0mjctBmMNkA=
X-Google-Smtp-Source: ABdhPJzY135f6M1F602jWlIdVUz+tJuqHfKNKmx92xUi2DaebKoomQWudlwdyApJReuQMZZU6EVaqQ==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr3847456wmi.66.1590676283372;
        Thu, 28 May 2020 07:31:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls1147249wml.2.gmail; Thu, 28 May
 2020 07:31:22 -0700 (PDT)
X-Received: by 2002:a7b:cb13:: with SMTP id u19mr3626762wmj.86.1590676282145;
        Thu, 28 May 2020 07:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590676282; cv=none;
        d=google.com; s=arc-20160816;
        b=SixSyQO2c3GuAjVAXUADoS+v3QjLeqlmYfmoje97avWuze8uZBZpMGDiAyLgKskdXe
         0y68yupDPYZxtOpH38TMGH4EaSvvtorAujR1sDBnDavF9mURnXlFMg/ssWg8OrzEaOhC
         DHly+ujPvBf7x1rweRIdx93L6xBAa3+nZfbKKVykq7K/1LsYGOl6T8T9tigdNntc/LVj
         3q42xGgkHo9gJP9ZMYXKJE9+W4kBc6BaJft83z7Mh0okNGZBxFPre59t9VEMMJeY4I9h
         9QD1dXaZQEzkKBMGYx97LmOlhFZNO4v0m1TmdTxUQCa3JIC3eDOQcqnJPvjMlU6Qee63
         hwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4yx7letz7vCk6tKcxvIyZ/4wK0SHXp4stqN5JFC04XI=;
        b=KcpEzBS7V/q8A8mNjC1ox9s2JDQFqr8I0dvt9vXQZcFSQMzRTaBLN4oNV8Vbx2KaCf
         tb5HNVGXqyHKGO1dwKHcYUM7HZg7eI5rWbsi3fMw3IKBMoJdodwqeYTeUBZrBE0vsZNj
         u9/gCqIIIextv3yOouh/nwT0n2YFHpJONh5sqkKRUuRFYeD4HUSFo64sanXcfnDYLvQl
         2W4VnWOT2xZvyRnMb15rBc1ZJYog5tUjGVPhedo/R65HQo8UdSYqE3dUhwFCc0AcBM8Z
         FefYEDpw8hHEIqoodPZG0Y8Ow3KfsqKFGsgPdIVXJP4lNoJZGsefb2/IxuniHUSxEq4B
         oKkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGVgsvfC;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com. [2a00:1450:4864:20::542])
        by gmr-mx.google.com with ESMTPS id w126si370941wma.4.2020.05.28.07.31.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) client-ip=2a00:1450:4864:20::542;
Received: by mail-ed1-x542.google.com with SMTP id bs4so261622edb.6
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:31:22 -0700 (PDT)
X-Received: by 2002:a05:6402:1d10:: with SMTP id dg16mr3311793edb.309.1590676281925;
        Thu, 28 May 2020 07:31:21 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l11sm5061411edw.55.2020.05.28.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:31:21 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 1/2] package/jailhouse: bump version to 0.12
Date: Thu, 28 May 2020 16:31:31 +0200
Message-Id: <20200528143132.48501-2-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528143132.48501-1-mariomintel@gmail.com>
References: <20200528143132.48501-1-mariomintel@gmail.com>
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=VGVgsvfC;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::542
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Signed-off-by: Mario Mintel <mariomintel@gmail.com>
---
 package/jailhouse/jailhouse.hash | 2 +-
 package/jailhouse/jailhouse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 9fb4d599da..13a260e8d0 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 8de2406f455db07794cc750238ce57bc897673ba2b68c56fc9ae2d8079142b33  jailhouse-0.11.tar.gz
+sha256 3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
 sha256 3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 1aa7851707..6356c5a7aa 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.11
+JAILHOUSE_VERSION = 0.12
 JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
-- 
2.26.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528143132.48501-2-mariomintel%40gmail.com.
