Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33113D7F3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id j13sf9073502wrr.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=UZB3SykaRcMn4bE6rg2ZtN9Omn3840ug7bYcfP53G9yL1DPlND8K082zPgEBn95wnS
         1x27nmSAPO7Peo5qqxZ6UhhSsY4qyhgXTQ1JpzPSo8PKUpuI9YRm1qxV3XNkI8uKuOdM
         EoTf8qo5u16kBEyFp5A3cMKilTl3B6dq7Tmz8R/pLtaKNrjFMTILhrkxZzzW5f+JbTMs
         VQU+T4kTXar/b/8os/Obczc3lG/tO78d85YPN9yopjIsiYF9cF5ghqZop3I7XqQfyV1l
         QaMsa2fd100CgoK3lMMM09hvKka62Tz21eWaRrfsG9gEIt2YJ26SQTYZsUIVjj9s+AG0
         EXcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=GK3lrZU1sSoz4CzrEybbHBs+N6qHkZ+txO8i6Aw1MM0=;
        b=vJFDmDnZ9iBZ/Hys0GzEZZVl847QZfUfxQsgozwBppieXsk/WZKeZC5VFhGtjNmuFv
         K465xueYHGeuxmfyU7kMkeY96vTFHTcEYpuLm8pjtKE3Oxita3DQqEsgMGTs1pXRCSom
         dsOFQlPOS3uIDDuBD9dIa6vMUDY67+D+QKLPbgyTP6gKG+F725U4XkbZtXY36oodDTyc
         vfS6nxjV6pSeZa+Y8wpT+pLh1+d6ftsY1+hRURownxM6Hq0xgDNiY+OIuQoYQJX9LvTb
         HNLFme1H+LJByU1nq0D/OhglTA8f6H60Y/PwcPVLU7l/MO3ZFahsQG6sa5laLbQH1HJH
         G59w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GK3lrZU1sSoz4CzrEybbHBs+N6qHkZ+txO8i6Aw1MM0=;
        b=ofBBQRZzO2a3QLm6vb+q5P1tynIyxSJPbiBwq/Uqa2A6rMs73KZNyd/Vj0ZPZnAY4E
         YY8mPkUc9Fs9Mi4+AftZhe7ul7f12Qqg3hr2VPPU9USDliKJzBzqB58HLBsrMeidgKsN
         l04LXp/zuf2qeMci3k36cs5hE4W8EfMM5ewUaRo/1kOvewiuBbBXSp2Ps2aacTmFDi86
         NnBncJzKkfKz8qC+z2m04nIGCudfQuKKQrSASp75I3UilWxTQdvJ07zfjf0SwkgZa5qw
         8d/cGCPUYBflukbjShpcxM60V54wuqUTe4wHRTkJAr8+U8qOwa6Axa7i1oTnH2ubiAFd
         kO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GK3lrZU1sSoz4CzrEybbHBs+N6qHkZ+txO8i6Aw1MM0=;
        b=uNGawMoOoxHwQE2io4PUe2ln97OAMqjFQSZPG/b7HIAsx1e2TmVf4mWKBDK7FnpuiI
         etnAJCFMNbdzFabkm6SjlmmM28068VZRZLpr7TfkbjBCqBnDrkAgCc5YVSoX50bO+iu/
         1o3vx2BNSeCBTrV/3Um66c2SOo9hQG/T0V6Vquh7C/XoS8K/zm7yWNoGlBS7UofCAeR/
         URMO967twbLVm/pubRyhUxawSr/XQ+4yssWXTdhA1k/31d7ttTUqV+eMqLCVocTh/8Ya
         oOAVs1Kn0pwnCkOz8WgqYKZ1WjsQSfnHh1U4ddNMD4vAdTAzaYAWZYPK1lblsD8s/tBF
         FnSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgR8Zmj5MEmxrLTV7w/PfIBz93m2lEjmIvrJdyI6eeTkzsf4Sh
	oPA+pBPE5rW/bTqvjr93oHs=
X-Google-Smtp-Source: APXvYqxys2e1u5XHYnA4AfTY9GL2Nm69bZ3xRmVctIwJkGHVr2HkMC4jV5CeNP9MfNfSzvT5PYSSgw==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr2533610wrn.140.1579170890342;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls7787656wrg.10.gmail; Thu, 16
 Jan 2020 02:34:49 -0800 (PST)
X-Received: by 2002:adf:f70b:: with SMTP id r11mr2688984wrp.388.1579170889347;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=Hh1O6yWmQfdsyqDT9wF3YOL/9PRoJqlGAmgUX21j7bttwi6yA4t2eHn8ZbC1zp7Xn8
         YyALGQoRhrsA0lC8vJv9QHZhuB26OWO78YSIcWao3GyXmXjl5h7pabTDTz1IKLYWWRDX
         QhtBQqcovMLFHpPMbOoujLuS3aMWD45S+2VwbLXzuqsMtJMPqCqgv5LEO3vt+amJsghB
         NRR5TfXtJV+U2L88KuAjQNHb9N40aMjsMpTNGh0ZT9oZymoHoCpTlIQh9JUrACy1vT18
         2AH/cd48jhPfxq2Sjrh9u8PVrWT+oyjQ369HK1xjlJXytAyOwSikFXEy17LGSsM1cSTB
         A+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=2ClX28l3DJm2/UDqf21aaTBkPWIx2d+Ib2rCjTB465Y=;
        b=cX569S/NxsjrrgWHUPwFGR5e1hBrD95PCkv/HyGIgWQDM8b8IcLMdWWk2KZi+0xVtb
         AQt+uOSqKjRGL/nEubtO8LhNxzMjXX1/x+1/ac3nPSbxhQur6qQRE3ZVJRlv5bv+P5A7
         hncYnC7WXBcfFruMMpoUIBapDDqj5dI+T0Pe3f+5bvVJQrgKv3KEvictkU6C3DvxBrXa
         sM/IJ+ZhlraUmrzTvbAutWMhcNPv9Om5w4Vdq+OLt7jaQbO7KmaozqSV2lM4X4+7FUwE
         6UItHiXrvvNtlWvPHD+XEnn9yVLjLOZoV8NRiyyt+4mn9WO1DxE4Kv3brTkShYK01rnC
         VcgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y13si868215wrs.0.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYmf1032059
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:48 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQB031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:48 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 01/18] Drop PREFERRED_PROVIDER_u-boot-tools
Date: Thu, 16 Jan 2020 11:34:30 +0100
Message-Id: <6cb12962b8a0e763852e801a73f0a643fc4fb6af.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

No longer needed since we no longer build our own versions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/macchiatobin.conf | 1 -
 conf/machine/ultra96.conf      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/conf/machine/macchiatobin.conf b/conf/machine/macchiatobin.conf
index 0b6b869..733960c 100644
--- a/conf/machine/macchiatobin.conf
+++ b/conf/machine/macchiatobin.conf
@@ -18,4 +18,3 @@ IMAGER_BUILD_DEPS += "u-boot-macchiatobin"
 IMAGE_INSTALL += "u-boot-script"
 
 PREFERRED_PROVIDER_u-boot-macchiatobin = "u-boot-macchiatobin"
-PREFERRED_PROVIDER_u-boot-tools = "u-boot-macchiatobin"
diff --git a/conf/machine/ultra96.conf b/conf/machine/ultra96.conf
index 022024a..5cdfebc 100644
--- a/conf/machine/ultra96.conf
+++ b/conf/machine/ultra96.conf
@@ -19,6 +19,5 @@ IMAGE_INSTALL_append = " u-boot-script"
 IMAGE_BOOT_FILES = "/usr/lib/u-boot/ultra96/boot.bin;boot.bin"
 
 PREFERRED_PROVIDER_u-boot-ultra96 = "u-boot-ultra96"
-PREFERRED_PROVIDER_u-boot-tools = "u-boot-ultra96"
 
 IMAGE_PREINSTALL_append = " firmware-ti-connectivity"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6cb12962b8a0e763852e801a73f0a643fc4fb6af.1579170887.git.jan.kiszka%40siemens.com.
